using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using UnityEditor;
using UnityEngine;
using UnityEngine.UIElements;


namespace CharacterData
{
    public class AnimationTool : EditorWindow
    {
        [MenuItem("Test/prefab工具/Animation")]
        public static void ShowWindow() { GetWindow<AnimationTool>("Animation Tools"); }
        public void CreateGUI()
        {
            Box box1 = new();
            box1.Add(new Label("Anim file tool"));
            box1.Add(new Button() { name = "meta_btn", text = "重新生成meta文件并设置avatar" });
            box1.Add(new Button() { name = "renameClip_btn", text = "rename animationClip" });
            box1.Add(new Button() { name = "copyAnim_btn", text = "提取 anim to compressedShow" });
            box1.Add(new Button() { name = "copyTempAnim_btn", text = "提取 anim to temp" });
            box1.Add(new Button() { name = "find controller", text = "Find animatorController" });
            rootVisualElement.Add(box1);
            box1.Q<Button>("meta_btn").RegisterCallback<ClickEvent>(DeleteMeta);
            box1.Q<Button>("renameClip_btn").RegisterCallback<ClickEvent>(RenameAnim);
            box1.Q<Button>("copyAnim_btn").RegisterCallback<ClickEvent>(CopySelectedToCompressedShow);
            box1.Q<Button>("copyTempAnim_btn").RegisterCallback<ClickEvent>(CopySelectedToTemp);
            box1.Q<Button>("find controller").RegisterCallback<ClickEvent>(FindAnimatorController);

            Box box2 = new();
            box2.Add(new Label("other files tool"));
            box2.Add(new Button() { name = "renameAssets_btn", text = " rename assets file" });
            box2.Add(new Button() { name = "renameFolder_btn", text = "rename folders" });
            rootVisualElement.Add(box2);
            box2.Q<Button>("renameAssets_btn").RegisterCallback<ClickEvent>(RenameAssets);
            box2.Q<Button>("renameFolder_btn").RegisterCallback<ClickEvent>(RenameFolders);
        }


        public void RenameAnim(ClickEvent evt)
        {

            GameObject[] gos = Selection.gameObjects;

            foreach (var go in gos)
            {
                string goPath = AssetDatabase.GetAssetPath(go);
                ModelImporter importer = AssetImporter.GetAtPath(goPath) as ModelImporter;

                ModelImporterClipAnimation clip = new();
                clip = importer.defaultClipAnimations[0];
                clip.name = go.name;
                importer.clipAnimations = new ModelImporterClipAnimation[] { clip };
                importer.SaveAndReimport();
            }
            AssetDatabase.Refresh();
        }

        // 删除meta文件, 设置avatar
        public void DeleteMeta(ClickEvent evt)
        {
            GameObject[] objs = Selection.gameObjects;
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
                var modelImportor = AssetImporter.GetAtPath(objPath) as ModelImporter;
                modelImportor.avatarSetup = ModelImporterAvatarSetup.CreateFromThisModel;
                modelImportor.SaveAndReimport();


            }
            AssetDatabase.Refresh();
        }
        public void FindAnimatorController(ClickEvent evt)
        {
            var objects = AnimHelper.FindAssetsSelectedFolders<GameObject>("P_");
            foreach (GameObject obj in objects)
            {
                var model = obj.transform.GetChild(0);
                var animator = model.GetComponent<Animator>();

                if (animator.runtimeAnimatorController == null)
                {
                    Debug.LogWarning($"lost controller: {obj.name}");
                }
            }
        }

        private void AnimOptimize(AnimationClip clip)
        {
            EditorCurveBinding[] curveBingdings = AnimationUtility.GetCurveBindings(clip);
            for (int ii = 0; ii < curveBingdings.Length; ++ii)
            {
                AnimationCurve curve = AnimationUtility.GetEditorCurve(clip, curveBingdings[ii]);

                // 删除移动帧(除了Bip001)和缩放帧
                string propName = curveBingdings[ii].propertyName.ToLower();
                string nodeName = Path.GetFileName(curveBingdings[ii].path);
                if (propName.Contains("position") && nodeName.StartsWith("Bip001 "))
                {
                    curve = null;  //有空格，排除了“Bip001”
                }
                if (propName.Contains("scale"))
                {
                    curve = null;
                }

                // 压缩浮点数
                if (curve != null && curve.keys != null)
                {
                    Keyframe[] keyFrames = curve.keys;
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

                // curve为null,则删除曲线
                AnimationUtility.SetEditorCurve(clip, curveBingdings[ii], curve);
            }
        }

        // copy fbx 中一个或多个 anim 到 new path
        public void CopyAnim(GameObject fbx, string newfolder, bool toCompressed = false)
        {
            string fbxPath = AssetDatabase.GetAssetPath(fbx);
            var assets = AssetDatabase.LoadAllAssetRepresentationsAtPath(fbxPath);

            foreach (var asset in assets)
            {
                if (asset is AnimationClip clip)
                {
                    AnimOptimize(clip);
                    AnimationClip newClip = new();
                    EditorUtility.CopySerialized(clip, newClip);
                    string str = clip.name + ".anim";
                    string name = toCompressed ? "compressed_" + str : str;
                    string newPath = Path.Combine(newfolder, name);
                    AssetDatabase.CreateAsset(newClip, newPath);
                    Debug.Log(newPath);
                }
            }
        }

        public void CopyToVictory(ClickEvent evt)
        {
            GameObject[] objs = Selection.gameObjects;

            string folder = "Assets/Art/Animations/animVictory";
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
            string[] guids = AssetDatabase.FindAssets("t:GameObject", new string[] {
            "Assets/Art/Animations/Show/Battle",
            "Assets/Art/Animations/Show/Ready",
            "Assets/Art/Animations/Show/Story",

            });
            var paths = guids.Select(e => AssetDatabase.GUIDToAssetPath(e));
            var objs = paths.Select(e => AssetDatabase.LoadAssetAtPath<GameObject>(e)).ToArray();


            string folder = "Assets/Art/Animations/compressedShow";

            foreach (GameObject obj in objs)
            {
                CopyAnim(obj, folder, true);
            }
            AssetDatabase.Refresh();
        }

        public void CopySelectedToCompressedShow(ClickEvent evt)
        {
            GameObject[] objs = Selection.gameObjects;

            string folder = "Assets/Art/Animations/compressedShow";

            foreach (GameObject obj in objs)
            {
                CopyAnim(obj, folder, true);
            }
            AssetDatabase.Refresh();
        }
        public void CopySelectedToTemp(ClickEvent evt)
        {
            GameObject[] objs = Selection.gameObjects;

            string folder = "Assets/Art/temp/Animation";

            foreach (GameObject obj in objs)
            {
                CopyAnim(obj, folder, true);
            }
            AssetDatabase.Refresh();
        }

        // rename assets and folder
        public void RenameAssets(ClickEvent evt)
        {
            var objects = AnimHelper.FindAssetsByFolders<GameObject>("t:GameObject", new string[] { "Assets/Art/Character/Models/Guns" });
            foreach (var obj in objects)
            {
                string name = obj.name;
                string newName = name.Split('_')[0];
                string path = AssetDatabase.GetAssetPath(obj);
                AssetDatabase.RenameAsset(path, newName);
            }
            AssetDatabase.Refresh();
        }


        // files
        public void RenameFolders(ClickEvent evt)
        {
            var folders = Selection.GetFiltered<Object>(SelectionMode.Assets);
            foreach (Object folder in folders)
            {
                string name = folder.name;
                string newName = name.Split('_')[0];
                string path = AssetDatabase.GetAssetPath(folder);
                AssetDatabase.RenameAsset(path, newName);
            }
            AssetDatabase.Refresh();
        }

        public void MoveFiles(ClickEvent evt)
        {
            Object[] objs = Selection.objects;
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
    }
}
