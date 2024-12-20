using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using UnityEditor;
using UnityEngine;
using UnityEngine.UIElements;
public class AnimTool : EditorWindow
{
    [MenuItem("Test/prefab����/Animation")]
    public static void ShowWindow() { GetWindow<AnimTool>("��ȡanim�ļ�"); }
    public void CreateGUI()
    {
        Button btn1 = new() { name = "button1", text = "�ƶ��ļ�" };
        rootVisualElement.Add(btn1);
        btn1.RegisterCallback<ClickEvent>(MoveFiles);

        Button btn3 = new() { name = "button1", text = "rename�ļ�" };
        rootVisualElement.Add(btn3);
        btn3.RegisterCallback<ClickEvent>(RenameFiles);

        Button btn2 = new() { name = "button2", text = "��������meat�ļ�������avatar" };
        rootVisualElement.Add(btn2);
        btn2.RegisterCallback<ClickEvent>(DeleteMeta);

        Button btn5 = new Button() { name = "button5", text = "������animationClip" };
        rootVisualElement.Add(btn5);
        btn5.RegisterCallback<ClickEvent>(RenameAnim);

        Button btn6 = new() { name = "button6", text = "��ȡ animVictory" };
        rootVisualElement.Add(btn6);
        btn6.RegisterCallback<ClickEvent>(CopyToVictory);

        Label lbl = new("��ȡ�� compressedShow");
        rootVisualElement.Add(lbl);

        Button btn7 = new() { name = "button7", text = "ѡ��� fbx" };
        rootVisualElement.Add(btn7);
        btn7.RegisterCallback<ClickEvent>(CopySelectedToCompressedShow);

        Button btn8 = new() { name = "button7", text = "Show/Battle Ready Story �����ļ�" };
        rootVisualElement.Add(btn8);
        btn8.RegisterCallback<ClickEvent>(CopyToCompressedInShow);
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

    public void RenameFiles(ClickEvent evt)
    {
        GameObject[] objs = Selection.gameObjects;
        foreach (GameObject obj in objs)
        {
            string newName ="P_S_" + obj.name.Split('_')[1];
            string path = AssetDatabase.GetAssetPath(obj);
            AssetDatabase.RenameAsset(path, newName);
        }
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

    // ɾ��meta�ļ�, ����avatar
    public void DeleteMeta(ClickEvent evt)
    {
        GameObject[] objs = Selection.gameObjects;
        if (objs.Length == 0)
        {
            Debug.LogWarning("����ѡ������һ��Fbx�ļ�");
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


    public void AnimOptimize(AnimationClip clip)
    {
        EditorCurveBinding[] curveBingdings = AnimationUtility.GetCurveBindings(clip);
        for (int ii = 0; ii < curveBingdings.Length; ++ii)
        {
            AnimationCurve curve = AnimationUtility.GetEditorCurve(clip, curveBingdings[ii]);

            // ɾ���ƶ�֡(����Bip001)������֡
            string propName = curveBingdings[ii].propertyName.ToLower();
            string nodeName = Path.GetFileName(curveBingdings[ii].path);
            if (propName.Contains("position") && nodeName.StartsWith("Bip001 "))
            {
                curve = null;  //�пո��ų��ˡ�Bip001��
            }
            if (propName.Contains("scale"))
            {
                curve = null;
            }

            // ѹ��������
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

            // curveΪnull,��ɾ������
            AnimationUtility.SetEditorCurve(clip, curveBingdings[ii], curve);
        }
    }

    // copy fbx ��һ������ anim �� new path
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
            Debug.LogWarning("����ѡ������һ��Fbx�ļ�");
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
}

