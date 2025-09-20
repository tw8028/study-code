using System.Collections.Generic;
using System.IO;
using System.Linq;
using Gameplay.Character;
using UnityEditor;
using UnityEngine;
using UnityEngine.UIElements;
using SaadKhawaja.InstantScreenshot;
using UnityEngine.Rendering;

namespace Art.temp.Editor.CharacterData
{
    public class AnimationTool : EditorWindow
    {
        [MenuItem("Test/prefab工具/Animation")]
        public static void ShowWindow()
        {
            GetWindow<AnimationTool>("Animation Tools");
        }

        public void CreateGUI()
        {
            var styleSheet = AssetDatabase.LoadAssetAtPath<StyleSheet>("Assets/Art/temp/Editor/CommonUSSFile.uss");
            rootVisualElement.styleSheets.Add(styleSheet);

            Box box1 = new();
            box1.Add(new Label("Anim file tool"));
            box1.Add(new Button() { name = "meta_btn", text = "重新生成 meta 文件并设置 avatar" });
            box1.Add(new Button() { name = "renameClip_btn", text = "rename animationClip" });
            box1.Add(new Button() { name = "copyAnim_btn", text = "提取 anim to compressedShow" });
            box1.Add(new Button() { name = "copyTempAnim_btn", text = "提取 anim to compressed" });
            box1.Add(new Button() { name = "find something", text = "Find Fire" });
            rootVisualElement.Add(box1);
            box1.Q<Button>("meta_btn").RegisterCallback<ClickEvent>(DeleteMeta);
            box1.Q<Button>("renameClip_btn").RegisterCallback<ClickEvent>(RenameAnim);
            box1.Q<Button>("copyAnim_btn").RegisterCallback<ClickEvent>(CopySelectedToCompressedShow);
            box1.Q<Button>("copyTempAnim_btn").RegisterCallback<ClickEvent>(CopySelectedToTemp);
            box1.Q<Button>("find something").RegisterCallback<ClickEvent>(FindSomething);

            Box box2 = new();
            rootVisualElement.Add(box2);
            box2.Add(new Label("other files tool"));
            box2.Add(new Button() { name = "renameAssets_btn", text = "rename assets" });
            box2.Add(new Button() { name = "test", text = "test" });

            box2.Q<Button>("renameAssets_btn").RegisterCallback<ClickEvent>(RenameAssets);
            box2.Q<Button>("test").RegisterCallback<ClickEvent>(Test);

            box2.Add(new Button() { name = "MeshSimplify_btn", text = "character mesh simplify" });
            box2.Q<Button>("MeshSimplify_btn").RegisterCallback<ClickEvent>(SimplifyCharacterMesh);

            box2.Add(new Button() { name = "vehicleShader_btn", text = "vehicleShader" });
            box2.Q<Button>("vehicleShader_btn").RegisterCallback<ClickEvent>(SetVehicleShader);

            box2.Add(new Button() { name = "AddPoint_btn", text = "添加 hit Points" });
            box2.Q<Button>("AddPoint_btn").RegisterCallback<ClickEvent>(AddHitPoints);

            box2.Add(new Button() { name = "RemoveObj_btn", text = "移除重复骨骼" });
            box2.Q<Button>("RemoveObj_btn").RegisterCallback<ClickEvent>(RemoveDuplicateBones);

            box2.Add(new Button() { name = "show_player", text = "角色截屏" });
            box2.Q<Button>("show_player").RegisterCallback<ClickEvent>(ShotPlayerTest);
        }

        private static void ShotAutoPlayer(GameObject character)
        {
            GameObject prefab = (GameObject)PrefabUtility.InstantiatePrefab(character);
            GameObject instance = prefab.transform.GetChild(0).gameObject;
            GameObject mesh = prefab.transform.GetChild(1).gameObject;
            SkinnedMeshRenderer skin = mesh.GetComponent<SkinnedMeshRenderer>();
            string dir = Path.GetDirectoryName(AssetDatabase.GetAssetPath(skin.sharedMesh));
            Mesh meshFile = AssetDatabase.LoadAssetAtPath<Mesh>(dir + "/mesh_" + prefab.name.Split('_')[1] + ".asset");
            skin.sharedMesh = meshFile;

            RuntimeAnimatorController controller =
                AssetDatabase.LoadAssetAtPath<RuntimeAnimatorController>(
                    "Assets/Art/temp/Animation/animator_show.controller");
            Animator animator = instance.GetComponent<Animator>();
            animator.runtimeAnimatorController = controller;

            var clips = animator.runtimeAnimatorController.animationClips;
            AnimationMode.StartAnimationMode();
            AnimationMode.SampleAnimationClip(instance.gameObject, clips[0], 1f);
            AnimationMode.EndSampling();
            Debug.LogWarning("截取角色");

            InstantScreenshot.TakeScreenshot("E:/project_A/screenshot/character01", $"{instance.name}.png", Camera.main,
                2048,
                2048, 2, true);
            DestroyImmediate(prefab);
        }

        private static void ShotDisplayPlayer(GameObject character)
        {
            GameObject prefab = (GameObject)PrefabUtility.InstantiatePrefab(character);
            Transform instance = prefab.transform.GetChild(0);
            
            // 重绘面部
            AnimHelper.SetFaceMaterial(instance.gameObject);

            // set anim
            AnimationClip clip =
                AssetDatabase.LoadAssetAtPath<AnimationClip>("Assets/Art/temp/Animation/ani_s_stand01.anim");
            AnimationMode.StartAnimationMode();
            AnimationMode.SampleAnimationClip(instance.gameObject, clip, 1f);
            AnimationMode.EndSampling();

            InstantScreenshot.TakeScreenshot("E:/project_A/screenshot/player_s", $"{instance.name}.png", Camera.main,
                2048, 2048, 2, true);
            // DestroyImmediate(prefab);
        }

        private static void ShotVehicle(ClickEvent evt)
        {
            foreach (GameObject go in Selection.gameObjects)
            {
                GameObject prefab = (GameObject)PrefabUtility.InstantiatePrefab(go);
                Transform instance = prefab.transform.GetChild(0);
                InstantScreenshot.TakeScreenshot("E:/project_A/screenshot/vehicle", $"{prefab.name.Split('_')[2]}.png",
                    Camera.main,
                    2048,
                    2048, 2, true);
                DestroyImmediate(prefab);
            }
        }


        private static void ShotPlayerTest(ClickEvent evt)
        {
            ShotDisplayPlayer(Selection.activeGameObject);
        }

        private static void ShotPlayer(ClickEvent evt)
        {
            var assets =
                AnimHelper.FindAssetsByFolders<GameObject>("t:GameObject",
                    new[] { "Assets/Art_Out/AutoGen/Characters" });
            Object[] characters = assets.GroupBy(p => p.name).Select(g => g.First())
                .Where(c => c.name.Split('_')[1].StartsWith("A01"))
                .ToArray();
            foreach (Object character in characters)
            {
                if (character is GameObject player)
                {
                    ShotAutoPlayer(player);
                }
            }
        }


        private static void AddHitPoints(ClickEvent evt)
        {
            GameObject[] gameObjects = Selection.gameObjects;
            foreach (GameObject go in gameObjects)
            {
                GameObject instance = PrefabUtility.InstantiatePrefab(go) as GameObject;
                if (instance == null) return;
                if (instance.transform.Find("hit001")) continue;
                if (instance.name.EndsWith("_b")) continue;
                var pointEffect = instance.AddComponent<CmpCharacterEffectPoints>();
                List<GameObject> points = new List<GameObject>();
                for (int i = 0; i < 4; i++)
                {
                    var hit = new GameObject($"hit00{i + 1}");
                    hit.transform.SetParent(instance.transform);
                    points.Add(hit);
                }

                pointEffect.m_CriticalPoints = new[] { points[0].transform };
                pointEffect.m_OtherPoints = new[] { points[1].transform, points[2].transform, points[3].transform };
            }
        }

        private static void RemoveDuplicateBones(ClickEvent evt)
        {
            Object[] folders = Selection.objects;
            string[] folderPaths = folders.Select(AssetDatabase.GetAssetPath).ToArray();
            IEnumerable<Object> buildingsPrefab =
                AnimHelper.FindAssetsByFolders<GameObject>("t:GameObject", folderPaths);
            foreach (Object buildingPrefab in buildingsPrefab)
            {
                GameObject prefab = buildingPrefab as GameObject;
                if (prefab == null) continue;
                var groups = prefab.GetComponentsInChildren<Transform>()
                    .GroupBy(p => p.name)
                    .Where(g => g.Count() > 1)
                    .ToArray();
                if (!groups.Any()) continue;
                foreach (var group in groups)
                {
                    foreach (Transform tran in group.ToArray())
                    {
                        DestroyImmediate(tran.gameObject, true);
                    }
                }

                PrefabUtility.SavePrefabAsset(prefab);
                Debug.Log(prefab.name + "：删除重复骨骼->" + string.Join(",", groups.Select(g => g.Key)));
            }
        }

        private static void SetVehicleShader(ClickEvent evt)
        {
            string[] paths = { "Assets/Art/Character/Models/Battery", "Assets/Art/Character/Models/Vehicle" };
            List<Object> objects = AnimHelper.FindAssetsByFolders<Object>(filter: "t:material", paths).ToList();
            foreach (Object obj in objects)
            {
                if (obj is Material mat)
                {
                    if (mat.shader == Shader.Find("NLD_URP/NLD_Vehicle")) continue;
                    mat.shader = Shader.Find("NLD_URP/NLD_Vehicle");
                    // mat.SetFloat("_Factor", 0.2f);
                    Debug.Log(mat.name);
                }
            }

            AssetDatabase.SaveAssets();
        }

        private static void SimplifyMesh(GameObject instance, float vertexAmount)
        {
            Debug.Log(instance.transform.childCount);
            for (int i = 0; i < instance.transform.childCount; i++)
            {
                GameObject meshGameObject = instance.transform.GetChild(i).gameObject;
                SkinnedMeshRenderer skin = meshGameObject.GetComponent<SkinnedMeshRenderer>();

                if (skin == null) continue;
                if (skin.sharedMesh == null) break;
                string dir = Path.GetDirectoryName(AssetDatabase.GetAssetPath(skin.sharedMesh));
                if (!Directory.Exists(dir)) break;

                var simplify = meshGameObject.GetComponent<MeshSimplify>();
                if (simplify == null) simplify = meshGameObject.AddComponent<MeshSimplify>();
                simplify.m_fVertexAmount = vertexAmount;
                simplify.m_bEnablePrefabUsage = true;
                simplify.m_strAssetPath = Path.Combine(dir, skin.sharedMesh.name + "_simplyMesh.asset");

                MeshSimplyTool.Create(simplify);
                PrefabUtility.ApplyPrefabInstance(instance, InteractionMode.UserAction);
                Debug.Log(Path.Combine(dir, skin.sharedMesh.name));
            }
        }

        private static void SimplifyCharacterMesh(ClickEvent evt)
        {
            Object[] folders = Selection.objects;
            string[] folderPaths = folders.Select(AssetDatabase.GetAssetPath).ToArray();
            IEnumerable<Object> characters = AnimHelper.FindAssetsByFolders<GameObject>("character_", folderPaths);

            int i = -1;
            foreach (Object obj in characters)
            {
                if (obj is not GameObject character) continue;
                GameObject instance = (GameObject)PrefabUtility.InstantiatePrefab(character);
                instance.transform.localPosition = new Vector3(i, 0, 0);
                i--;

                if (instance.name.StartsWith("character_A")) SimplifyMesh(instance, 0.6f);
                if (instance.name.StartsWith("character_E")) SimplifyMesh(instance, 0.4f);
            }
        }

        private static void RenameAnim(ClickEvent evt)
        {
            var gos = Selection.gameObjects;
            if (!gos.Any()) return;

            foreach (var go in gos)
            {
                string goPath = AssetDatabase.GetAssetPath(go);
                ModelImporter importer = AssetImporter.GetAtPath(goPath) as ModelImporter;
                if (!importer) continue;
                importer.avatarSetup = ModelImporterAvatarSetup.CreateFromThisModel;

                ModelImporterClipAnimation clip = importer.defaultClipAnimations[0];
                clip.name = go.name;
                importer.clipAnimations = new[] { clip };
                importer.SaveAndReimport();
            }

            AssetDatabase.Refresh();
        }

        // 删除 meta 文件, 设置 avatar
        private static void DeleteMeta(ClickEvent evt)
        {
            var objs = Selection.gameObjects;
            if (objs.Length == 0)
            {
                Debug.LogWarning("请先选择至少一个Fbx文件");
            }

            foreach (GameObject obj in objs)
            {
                string objPath = AssetDatabase.GetAssetPath(obj);
                string metaPath = objPath + ".meta";
                File.Delete(metaPath);
                AssetDatabase.Refresh();
                var modelImporter = AssetImporter.GetAtPath(objPath) as ModelImporter;
                if (!modelImporter) continue;
                modelImporter.avatarSetup = ModelImporterAvatarSetup.CreateFromThisModel;
                modelImporter.SaveAndReimport();
            }

            AssetDatabase.Refresh();
        }

        private static void FindSomething(ClickEvent evt)
        {
            Object[] folders = Selection.objects;
            string[] folderPaths = folders.Select(AssetDatabase.GetAssetPath).ToArray();
            var objects = AnimHelper.FindAssetsByFolders<GameObject>("ani_", folderPaths);
            foreach (var obj in objects)
            {
                string fbxPath = AssetDatabase.GetAssetPath(obj);
                var assets = AssetDatabase.LoadAllAssetRepresentationsAtPath(fbxPath);
                var clips = assets.OfType<AnimationClip>();
                var curves = clips.SelectMany(AnimationUtility.GetCurveBindings);
                if (curves.Any(c => Path.GetFileName(c.path).StartsWith("Fire")))
                    Debug.LogWarning("f:" + obj.name);
            }
        }

        private static void AnimOptimize(AnimationClip clip)
        {
            var curveBindings = AnimationUtility.GetCurveBindings(clip);
            for (int ii = 0; ii < curveBindings.Length; ++ii)
            {
                AnimationCurve curve = AnimationUtility.GetEditorCurve(clip, curveBindings[ii]);

                // 删除移动帧(除了Bip001)和缩放帧
                string propName = curveBindings[ii].propertyName.ToLower();
                string nodeName = Path.GetFileName(curveBindings[ii].path);
                /*if (propName.Contains("position") && nodeName.StartsWith("Bip001 "))
                {
                    curve = null;  //有空格，排除了“Bip001”
                }*/
                if (propName.Contains("scale") && !nodeName.Contains("Grip_point01"))
                {
                    curve = null;
                }

                if (nodeName.StartsWith("Fire"))
                {
                    curve = null;
                }

                // 压缩浮点数
                if (curve is { keys: not null })
                {
                    var keyFrames = curve.keys;
                    for (int i = 0; i < keyFrames.Length; i++)
                    {
                        Keyframe key = keyFrames[i];
                        key.value = float.Parse(key.value.ToString("f4"));
                        key.inTangent = float.Parse(key.inTangent.ToString("f4"));
                        key.outTangent = float.Parse(key.outTangent.ToString("f4"));
                        keyFrames[i] = key;
                    }

                    curve.keys = keyFrames;
                }

                // curve 为 null, 则删除曲线
                AnimationUtility.SetEditorCurve(clip, curveBindings[ii], curve);
            }
        }

        // copy fbx 中一个或多个 anim 到 new path
        private static string[] CopyAnim(GameObject fbx, string destFolder, bool toCompressed = false)
        {
            string fbxPath = AssetDatabase.GetAssetPath(fbx);
            var assets = AssetDatabase.LoadAllAssetRepresentationsAtPath(fbxPath);
            var animPaths = new List<string>();
            foreach (Object asset in assets)
            {
                if (asset is not AnimationClip clip) continue;
                AnimOptimize(clip);
                AnimationClip newClip = new();
                EditorUtility.CopySerialized(clip, newClip);
                string str = clip.name + ".anim";
                string compressed = toCompressed ? "compressed_" + str : str;
                string newPath = Path.Combine(destFolder, compressed);
                AssetDatabase.CreateAsset(newClip, newPath);
                Debug.Log(newPath);
                animPaths.Add(newPath);
            }

            return animPaths.ToArray();
        }

        public void CopyToVictory(ClickEvent evt)
        {
            var objs = Selection.gameObjects;

            const string folder = "Assets/Art/Animations/animVictory";
            if (objs.Length == 0)
            {
                Debug.LogWarning("请先选择至少一个Fbx文件");
            }

            foreach (GameObject obj in objs)
            {
                CopyAnim(obj, folder);
            }

            AssetDatabase.Refresh();
        }

        public void CopyToCompressedInShow(ClickEvent evt)
        {
            string[] guids = AssetDatabase.FindAssets("t:GameObject", new[]
            {
                "Assets/Art/Animations/Show/Battle",
                "Assets/Art/Animations/Show/Ready",
                "Assets/Art/Animations/Show/Story",
            });
            var paths = guids.Select(AssetDatabase.GUIDToAssetPath);
            var objs = paths.Select(AssetDatabase.LoadAssetAtPath<GameObject>).ToArray();


            const string folder = "Assets/Art/Animations/compressedShow";

            foreach (GameObject obj in objs)
            {
                CopyAnim(obj, folder, true);
            }

            AssetDatabase.Refresh();
        }

        private static void CopySelectedToCompressedShow(ClickEvent evt)
        {
            // const string folder = "Assets/Art/Animations/compressedShow";
            var objects = Selection.gameObjects;

            const string tempFolder = "Assets/Art/temp/Animation";
            const string destFilePath = "Assets/Art/Animations/compressedShow/{0}";

            foreach (GameObject obj in objects)
            {
                AnimHelper.PreSetModel(obj);
                string[] fileNames = CopyAnim(obj, tempFolder, true);
                foreach (string f in fileNames)
                {
                    string destFile = string.Format(destFilePath, Path.GetFileName(f));
                    File.Copy(f, destFile, true);
                    Debug.Log(destFile);
                }
            }

            AssetDatabase.Refresh();
        }

        private static void CopySelectedToTemp(ClickEvent evt)
        {
            var objects = Selection.gameObjects;

            const string tempFolder = "Assets/Art/temp/Animation";
            const string destFilePath = "Assets/Art/Animations/compressed/{0}";

            foreach (GameObject obj in objects)
            {
                AnimHelper.PreSetModel(obj);
                string[] fileNames = CopyAnim(obj, tempFolder, true);
                foreach (string f in fileNames)
                {
                    string destFile = string.Format(destFilePath, Path.GetFileName(f));
                    File.Copy(f, destFile, true);
                    Debug.Log(destFile);
                }
            }

            AssetDatabase.Refresh();
        }

        // rename assets 
        private static void RenameAssets(ClickEvent evt)
        {
            // 选择的文件中的 GameObject
            // Object[] folders = Selection.objects;
            // string[] folderPath = folders.Select(AssetDatabase.GetAssetPath).ToArray();
            // var objects = AnimHelper.FindAssetsByFolders<GameObject>("t:GameObject", folderPath);

            // 选择的 gameObject
            var objects = Selection.gameObjects.Where(g => g.name.EndsWith("_01"));

            // 选择的 文件夹
            // var objects = Selection.GetFiltered<Object>(SelectionMode.Assets);

            foreach (GameObject obj in objects)
            {
                string name = obj.name.Split("_")[2];
                string newName = "3" + name[1..];
                string path = AssetDatabase.GetAssetPath(obj);
                AssetDatabase.RenameAsset(path, newName);
            }

            AssetDatabase.Refresh();
        }

        public void MoveFiles(ClickEvent evt)
        {
            var objs = Selection.objects;
            string folder = $"Assets/Art_Out/Manual/VictoryAnim";

            foreach (Object obj in objs)
            {
                string oldPath = AssetDatabase.GetAssetPath(obj);
                string fileName = Path.GetFileName(oldPath);
                string newPath = Path.Combine(folder, fileName);
                AssetDatabase.MoveAsset(oldPath, newPath);
                Debug.Log(newPath);
            }

            AssetDatabase.Refresh();
        }

        private static void Test(ClickEvent evt)
        {
            /*var go = Selection.activeGameObject;
            var bones = go.GetComponent<SkinnedMeshRenderer>().bones;
            Debug.Log(string.Join(',', bones.Select(b => b.name)));*/
            var persons = JsonData.GetPersons();
            var names = persons.Where(p => p.weapon == "27" || p.weapon == "28" || p.weapon == "41" || p.weapon == "65")
                .ToArray();
            foreach (Person person in names)
            {
                Debug.Log(person.name + ":" + person.id + ">>" + person.weapon);
            }
        }

        private static void Combine()
        {
            GameObject obj = Selection.activeGameObject;
            AnimHelper.PreSetAll(obj);
            var go = Object.Instantiate(obj);
            var nameId = obj.name.Split('_')[2];
            var texNames = new[] { "_MainTex", "_MaskTex" };
            var parentPath = $"Assets/Art/temp/Prefab/character_{nameId}";
            if (!Directory.Exists(parentPath))
            {
                Directory.CreateDirectory(parentPath);
            }

            AnimHelper.CombineSkinSaveAssets(go, texNames, parentPath);
            // save prefab
            string path = $"{parentPath}/character_{nameId}.prefab";
            PrefabUtility.SaveAsPrefabAssetAndConnect(go, path, InteractionMode.AutomatedAction);
        }
    }
}