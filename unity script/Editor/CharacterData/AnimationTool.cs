using System.Collections.Generic;
using System.IO;
using System.Linq;
using UnityEditor;
using UnityEngine;
using UnityEngine.UIElements;

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
            var objects = AnimHelper.FindAssetsFromSelectedFolders<GameObject>("ani_");
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

        private void AnimOptimize(AnimationClip clip)
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
                if (propName.Contains("scale"))
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
        private string[] CopyAnim(GameObject fbx, string destFolder, bool toCompressed = false)
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

        private void CopySelectedToCompressedShow(ClickEvent evt)
        {
            var objs = Selection.gameObjects;

            const string folder = "Assets/Art/Animations/compressedShow";

            foreach (GameObject obj in objs)
            {
                CopyAnim(obj, folder, true);
            }

            AssetDatabase.Refresh();
        }

        private void CopySelectedToTemp(ClickEvent evt)
        {
            var objects = Selection.gameObjects;

            const string tempFolder = "Assets/Art/temp/Animation";
            const string destFilePath = "Assets/Art/Animations/compressed/{0}";

            foreach (GameObject obj in objects)
            {
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
            var objects = AnimHelper.FindAssetsFromSelectedFolders<GameObject>("t:GameObject");

            // 选择的 gameObject
            // var objects = Selection.gameObjects;

            // 选择的 文件夹
            // var objects = Selection.GetFiltered<Object>(SelectionMode.Assets);

            foreach (Object obj in objects)
            {
                string name = obj.name;
                string newName = "Bui" + name[3..];
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
            var go = Selection.activeGameObject;
            var bones = go.GetComponent<SkinnedMeshRenderer>().bones;
            Debug.Log(string.Join(',', bones.Select(b => b.name)));
        }
    }
}