using System.Collections.Generic;
using System.IO;
using System.Linq;
using Art.temp.Editor.PrefabTool;
using Sirenix.Utilities;
using UnityEditor;
using UnityEngine;

namespace Art.temp.Editor.CharacterData
{
    public static class AnimHelper
    {
        public static GameObject FindDisplayPrefab(string nameId)
        {
            switch (nameId[0])
            {
                case 'A':
                {
                    var player = CharacterFactory.CreatePlayer(nameId);
                    return player.DisplayPrefab;
                }
                case 'E':
                {
                    var enemy = CharacterFactory.CreateEmeny(nameId);
                    return enemy.DisplayPrefab;
                }
                case 'N':
                {
                    var npc = CharacterFactory.CreateNpc(nameId);
                    return npc.DisplayPrefab;
                }
                default:
                    return null;
            }
        }


        // filter = "name t:xx l:xx" Name Labels Types
        public static IEnumerable<Object> FindAssetsByFolders<T>(string filter, string[] folders)
        {
            // FindAssets 能找子文件夹
            string[] guids = AssetDatabase.FindAssets(filter, folders);
            IEnumerable<string> paths = guids.Select(AssetDatabase.GUIDToAssetPath);
            return paths.Select(e => AssetDatabase.LoadAssetAtPath(e, typeof(T)));
        }

        /// <summary>
        /// 合并 prefab 中的 mesh, 要求只有一个材质，并且合并后只有一个 material
        /// </summary>
        /// <param name="go">cloned prefab</param>
        /// <param name="texNames">shader 贴图字段 [_MainTex, _MaskTex]</param>
        private static void CombineSkinnedMesh(GameObject go, string[] texNames)
        {
            var parts = go.GetComponentsInChildren<SkinnedMeshRenderer>(true);
            if (parts.Length < 2) return;

            // 获取蒙皮骨骼
            var bones = parts.SelectMany(p => p.bones).ToArray();

            // 合并贴图
            var texGroups = texNames.Select(t => parts.Select(p => p.sharedMaterial.GetTexture(t) as Texture2D))
                .ToArray();
            var combineTextures = texGroups.Select(g =>
            {
                var tex = new Texture2D(4, 4, TextureFormat.ARGB4444, true);
                tex.PackTextures(g.ToArray(), 0, 2048);
                return tex;
            });

            // 合并 mesh uv
            var uvGroups = parts.Select(p => p.sharedMesh.uv).ToArray();
            var rects =
                new Texture2D(4, 4, TextureFormat.ARGB4444, true).PackTextures(texGroups.ElementAt(0).ToArray(), 0,
                    2048);
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
            var list = texNames.Zip(combineTextures, (name, tex) =>
            {
                mat.SetTexture(name, tex);
                return 0;
            }).ToArray();

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
                    if (!tex) continue;
                    var texPath = AssetDatabase.GetAssetPath(tex);
                    var importer = AssetImporter.GetAtPath(texPath) as TextureImporter;
                    if (!importer) continue;
                    importer.isReadable = true;
                    importer.SaveAndReimport();
                }
            }

            return allTexNames;
        }

        private static Mesh DeepCopyMesh(Mesh originalMesh)
        {
            Mesh copiedMesh = new Mesh
            {
                vertices = (Vector3[])originalMesh.vertices.Clone(),
                triangles = (int[])originalMesh.triangles.Clone(),
                uv = (Vector2[])originalMesh.uv.Clone(),
                normals = (Vector3[])originalMesh.normals.Clone(),
                tangents = (Vector4[])originalMesh.tangents.Clone(),
                colors = (Color[])originalMesh.colors.Clone(),
                boneWeights = (BoneWeight[])originalMesh.boneWeights.Clone(),
                bindposes = (Matrix4x4[])originalMesh.bindposes.Clone()
            };

            return copiedMesh;
        }

        public static void PreSetModel(GameObject model)
        {
            var objPath = AssetDatabase.GetAssetPath(model);
            var modelImporter = AssetImporter.GetAtPath(objPath) as ModelImporter;
            if (!modelImporter) return;
            modelImporter.avatarSetup = ModelImporterAvatarSetup.CreateFromThisModel;
            AssetDatabase.Refresh();
            modelImporter.SaveAndReimport();
        }
    }
}