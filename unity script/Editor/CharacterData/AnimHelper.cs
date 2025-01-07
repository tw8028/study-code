using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using System.Threading.Tasks;
using UnityEngine;
using PrefabTool;
using UnityEditor;
using Gameplay.Unit.Data;
using Sirenix.Utilities;
using NPOI.OpenXmlFormats.Vml;
using System.Xml.Linq;

namespace CharacterData
{
    public static class AnimHelper
    {
        public static GameObject FindDisplayPrefab(string nameId)
        {
            if (nameId[0] == 'A')
            {
                PlayerInformation player = new(nameId);
                return player.DisplayPrefab;
            }
            else if (nameId[0] == 'E')
            {
                EnemyInformation enemy = new(nameId);
                return enemy.DisplayPrefab;
            }
            else if (nameId[0] == 'N')
            {
                NpcInformation npc = new(nameId);
                return npc.DisplayPrefab;
            }
            else
            {
                return null;
            }
        }


        // filter = "name t:xx l:xx" Name Labels Types
        public static IEnumerable<Object> FindAssetsByFolders<T>(string filter, string[] folders)
        {
            string[] guids = AssetDatabase.FindAssets(filter, folders);
            var paths = guids.Select(e => AssetDatabase.GUIDToAssetPath(e));
            return paths.Select(e => AssetDatabase.LoadAssetAtPath(e, typeof(T)));
        }

        public static string[] GetSelectFolder()
        {
            var folders = Selection.GetFiltered<Object>(SelectionMode.Assets);
            return folders.Select(f => AssetDatabase.GetAssetPath(f)).ToArray();
        }

        public static IEnumerable<Object> FindAssetsSelectedFolders<T>(string filter)
        {
            return FindAssetsByFolders<T>(filter, GetSelectFolder());
        }

        public static void TopSurfaceRandomPoints(GameObject go)
        {
            int numberOfPoints = 10; // 要生成的随机点数量
            float upDirectionThreshold = 0.5f; // 法线Y值的阈值

            MeshFilter meshFilter = go.GetComponent<MeshFilter>();
            if (meshFilter == null)
            {
                Debug.LogError("未找到 MeshFilter 组件！");
                return;
            }

            Mesh mesh = meshFilter.mesh;
            Vector3[] vertices = mesh.vertices;
            int[] triangles = mesh.triangles;
            List<Triangle> topTriangles = new List<Triangle>();

            // 遍历所有三角形，检查法线方向
            for (int i = 0; i < triangles.Length; i += 3)
            {
                Vector3 v0 = go.transform.TransformPoint(vertices[triangles[i]]);
                Vector3 v1 = go.transform.TransformPoint(vertices[triangles[i + 1]]);
                Vector3 v2 = go.transform.TransformPoint(vertices[triangles[i + 2]]);

                Vector3 normal = Vector3.Cross(v1 - v0, v2 - v0).normalized;

                // 检查法线是否朝上
                if (normal.y > upDirectionThreshold)
                {
                    topTriangles.Add(new Triangle(v0, v1, v2));
                }
            }

            // 在向上的三角形中生成随机点
            List<Vector3> randomPoints = new List<Vector3>();
            for (int i = 0; i < numberOfPoints; i++)
            {
                if (topTriangles.Count == 0)
                {
                    Debug.LogWarning("没有找到向上的面，无法生成随机点。");
                    break;
                }

                Triangle randomTriangle = topTriangles[Random.Range(0, topTriangles.Count)];
                Vector3 randomPoint = GetRandomPointInTriangle(randomTriangle);
                randomPoints.Add(randomPoint);

                // 可视化随机点
                Debug.DrawLine(randomPoint, randomPoint + Vector3.up * 0.5f, Color.red, 5f);
            }

            // 打印所有点的坐标
            foreach (Vector3 point in randomPoints)
            {
                Debug.Log("随机点坐标: " + point);
            }
        }

        // 定义一个三角形结构体
        struct Triangle
        {
            public Vector3 v0, v1, v2;
            public Triangle(Vector3 v0, Vector3 v1, Vector3 v2)
            {
                this.v0 = v0;
                this.v1 = v1;
                this.v2 = v2;
            }
        }

        // 在三角形内部随机取点（使用重心坐标法）
        static Vector3 GetRandomPointInTriangle(Triangle triangle)
        {
            float r1 = Mathf.Sqrt(Random.value);
            float r2 = Random.value;

            float a = 1 - r1;
            float b = r1 * (1 - r2);
            float c = r1 * r2;

            return a * triangle.v0 + b * triangle.v1 + c * triangle.v2;
        }


        /// <summary>
        /// 合并 prefab 中的 mesh, 要求只有一个材质，并且合并后只有一个 material
        /// </summary>
        /// <param name="go">cloned prefab</param>
        /// <param name="texNames">shader 贴图字段 [_MainTex, _MaskTex]</param>
        public static void CombineSkinnedMesh(GameObject go, string[] texNames)
        {
            SkinnedMeshRenderer[] parts = go.GetComponentsInChildren<SkinnedMeshRenderer>(true);
            if (parts.Length < 2) return;

            // 获取蒙皮骨骼
            var bones = parts.SelectMany(p => p.bones).ToArray();

            // 合并贴图
            var texGroups = texNames.Select(t => parts.Select(p => p.sharedMaterial.GetTexture(t) as Texture2D));
            var combineTexs = texGroups.Select(g =>
                {
                    var tex = new Texture2D(4, 4, TextureFormat.ARGB4444, true);
                    tex.PackTextures(g.ToArray(), 0, 2048);
                    return tex;
                });

            // 合并 mesh uv
            var uvGroups = parts.Select(p => p.sharedMesh.uv).ToArray();
            Rect[] rects = new Texture2D(4, 4, TextureFormat.ARGB4444, true).PackTextures(texGroups.ElementAt(0).ToArray(), 0, 2048);
            var newUvs = uvGroups.Zip(rects, (uv, rect) =>
            {
                for (int i = 0; i < uv.Length; i++)
                {
                    uv[i].x = Mathf.Lerp(rect.xMin, rect.xMax, uv[i].x);
                    uv[i].y = Mathf.Lerp(rect.yMin, rect.yMax, uv[i].y);
                }
                return uv;
            }).SelectMany(uv => uv).ToArray();

            // copy and combine mesh
            var combineInstances = parts.Select(p => new CombineInstance() { mesh = DeepCopyMesh(p.sharedMesh) });
            Mesh newMesh = new();
            newMesh.CombineMeshes(combineInstances.ToArray(), true, false);

            // set texture
            var mat = Object.Instantiate(parts[0].sharedMaterial);
            texNames.Zip(combineTexs, (name, tex) =>
            {
                mat.SetTexture(name, tex);
                return 0;
            }).ToList();

            // create combine
            GameObject combinedMesh = new GameObject("combined_mesh");
            combinedMesh.transform.SetParent(go.transform.GetChild(0));
            var smr = combinedMesh.AddComponent<SkinnedMeshRenderer>();
            smr.sharedMesh = newMesh;
            smr.sharedMesh.uv = newUvs.ToArray();
            smr.bones = bones;
            smr.rootBone = go.transform.GetChild(0).Find("Root");
            smr.sharedMaterial = mat;

            parts.ForEach(p => Object.DestroyImmediate(p.gameObject));
        }

        public static void CombineSkinSaveAssets(GameObject go, string[] texNames, string parentPath)
        {
            string nameId = go.transform.GetChild(0).name;
            AnimHelper.CombineSkinnedMesh(go, texNames);
            var smr = go.transform.GetChild(0).GetComponentInChildren<SkinnedMeshRenderer>();
            var mat = smr.sharedMaterial;
            // texture
            foreach (var name in texNames)
            {
                var tex = mat.GetTexture(name);
                var texPath = $"{parentPath}/{name}.png";
                var newTex = SaveAndReloadTexture2D(tex as Texture2D, texPath);
                mat.SetTexture(name, newTex);
            }

            // material
            var matSavePath = $"{parentPath}/mat_{nameId}.mat";
            AssetDatabase.CreateAsset(mat, matSavePath);
            // mesh
            var mesh = smr.sharedMesh;
            var meshSavePath = $"{parentPath}/mesh_{nameId}.asset";
            AssetDatabase.CreateAsset(mesh, meshSavePath);
        }

        private static Texture2D SaveAndReloadTexture2D(Texture2D t2d, string savePath)
        {
            var bytes = t2d.EncodeToPNG();
            File.WriteAllBytes(savePath, bytes);
            AssetDatabase.Refresh();
            var newT2d = AssetDatabase.LoadAssetAtPath<Texture2D>(savePath);
            return newT2d;
        }

        public static string[] PreSetAll(GameObject prefab)
        {
            var allSkin = prefab.GetComponentsInChildren<SkinnedMeshRenderer>();
            string[] allTexNames = new string[] { "_MainTex", "_MaskTex" };
            foreach (SkinnedMeshRenderer skin in allSkin)
            {
                var material = skin.sharedMaterial;
                if (material.shader.name != "NLD_URP/NLD_Charactor")
                {
                    // 修改为NLD_URP/NLD_Charactor
                    material.shader = Shader.Find("NLD_URP/NLD_Charactor");
                }
                // 判断所有的贴图是否已开启read/write
                foreach (var texName in allTexNames)
                {
                    var tex = material.GetTexture(texName);
                    if (tex != null)
                    {
                        var texPath = AssetDatabase.GetAssetPath(tex);
                        var importer = AssetImporter.GetAtPath(texPath) as TextureImporter;
                        if (importer.isReadable == false)
                        {
                            importer.isReadable = true;
                            importer.SaveAndReimport();
                        }
                    }
                }
            }
            return allTexNames;
        }

        public static Mesh DeepCopyMesh(Mesh originalMesh)
        {
            Mesh copiedMesh = new Mesh();

            copiedMesh.vertices = (Vector3[])originalMesh.vertices.Clone();
            copiedMesh.triangles = (int[])originalMesh.triangles.Clone();
            copiedMesh.uv = (Vector2[])originalMesh.uv.Clone();
            copiedMesh.normals = (Vector3[])originalMesh.normals.Clone();
            copiedMesh.tangents = (Vector4[])originalMesh.tangents.Clone();
            copiedMesh.colors = (Color[])originalMesh.colors.Clone();
            copiedMesh.boneWeights = (BoneWeight[])originalMesh.boneWeights.Clone();
            copiedMesh.bindposes = (Matrix4x4[])originalMesh.bindposes.Clone();

            return copiedMesh;
        }

        public static void PreSetModel(GameObject model)
        {
            var objPath = AssetDatabase.GetAssetPath(model);
            var modelImportor = AssetImporter.GetAtPath(objPath) as ModelImporter;
            modelImportor.avatarSetup = ModelImporterAvatarSetup.CreateFromThisModel;
            AssetDatabase.Refresh();
            modelImportor.SaveAndReimport();
        }
    }
}
