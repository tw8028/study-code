using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using UnityEngine.UIElements;
using System.Linq;
using BehaviorDesigner.Runtime.Tasks.Unity.UnityString;
using MagicaCloth2;
using System.Drawing.Text;

public class CheckTool : EditorWindow
{
    TextElement text;

    [MenuItem("Test/tools/check tool")]
    public static void ShowWindow() { GetWindow<CheckTool>("check tool"); }
    public void CreateGUI()
    {

        Button btn1 = new() { name = "button1", text = "check����fbx��root�ڵ�" };
        rootVisualElement.Add(btn1);
        btn1.RegisterCallback<ClickEvent>(CheckRoot);

        text = new() { name = "text", text = "" };
        rootVisualElement.Add(text);


        Button btn2 = new() { name = "button2", text = "check��ɫprefab����" };
        rootVisualElement.Add(btn2);
        btn2.RegisterCallback<ClickEvent>(CheckScale);

        Button btn3 = new() { name = "button3", text = "check magica cloth rootBones" };
        rootVisualElement.Add(btn3);
        btn3.RegisterCallback<ClickEvent>(CheckMCRootBoneList);

        Button btn4 = new() { name = "button4", text = "����ظ���������" };
        rootVisualElement.Add(btn4);
        btn4.RegisterCallback<ClickEvent>(CheckBonesName);
    }

    // ��� prefab ����
    public void CheckScale(ClickEvent evt)
    {
        GameObject[] objs = FindAssetsByDir("t:GameObject", GetSelectFolder());
        if (objs.Count() == 0 || objs is null)
        {
            Debug.Log("��Ҫѡ���ļ���");
            return;
        }
        var m = 0;
        foreach (GameObject obj in objs)
        {
            var scale = new Vector3(1, 1, 1);
            var scale2 = new Vector3(1.1f, 1.1f, 1.1f);
            if (obj.transform.childCount != 0)
            {
                if (obj.transform.GetChild(0).localScale != scale)
                {
                    //Debug.Log($"{obj.name} has scale");
                    Debug.Log($"{obj.name} ������{obj.transform.GetChild(0).localScale}");
                    m++;
                }
            }
        }
        Debug.Log($"{objs.Count()} ���ʲ�");
        Debug.Log($"{m} ��������");
    }

    public string[] GetSelectFolder()
    {
        var folders = Selection.GetFiltered<Object>(SelectionMode.Assets);
        List<string> paths = new();
        foreach (Object obj in folders)
        {
            paths.Add(AssetDatabase.GetAssetPath(obj));
        }
        return paths.ToArray();
    }


    // ����ɫ���� fbx �ļ��Ƿ��� root �ڵ�
    public void CheckRoot(ClickEvent evt)
    {
        GameObject[] anis = FindAssetsByDir("t:GameObject", new string[] { "Assets/Art/Animations/Battle/Skill/" });
        var hasRoots = anis.Where(a => a.transform.Find("Root") is null);
        if (hasRoots.Count() == 0)
        {
            text.text = "δ�ҵ�������Root��gameObject";
        }
        else
        {
            text.text = "";
            foreach (var item in hasRoots)
            {
                text.text = text.text + "\n" + item.name;
            }
        }
    }

    public GameObject[] FindAssetsByDir(string filter, string[] folders)
    {
        string[] guids = AssetDatabase.FindAssets(filter, folders);
        var paths = guids.Select(e => AssetDatabase.GUIDToAssetPath(e));
        return paths.Select(e => AssetDatabase.LoadAssetAtPath<GameObject>(e)).ToArray();
    }

    // ��� magica cloth ���
    public void CheckMCRootBoneList(ClickEvent evt)
    {
        GameObject[] objs = FindAssetsByDir("t:GameObject", GetSelectFolder());
        if (objs.Count() == 0 || objs is null)
        {
            Debug.Log("��Ҫѡ���ļ���");
            return;
        }
        foreach (var obj in objs)
        {
            var mc = obj.transform.GetChild(0).GetComponent<MagicaCloth>();
            if (mc != null)
            {
                if (mc.SerializeData.rootBones.Count() == 0)
                {
                    Debug.Log($"{obj.name}:ȱ��rootBones");
                }
            }
        }
    }

    // ����ظ�����
    public void CheckBonesName(ClickEvent evt)
    {
        GameObject[] objs = FindAssetsByDir("t:GameObject", GetSelectFolder());
        if (objs.Count() == 0 || objs is null)
        {
            Debug.Log("��Ҫѡ���ļ���");
            return;
        }
        foreach(var obj in objs)
        {
            CheckBonesName(obj.transform);
        }
    }
    public void CheckBonesName(Transform root)
    {
        HashSet<string> names = new HashSet<string>();
        Check(root);
        void Check(Transform bone)
        {
            var n = bone.childCount;
            if (n > 0)
            {
                for (int i = 0; i < n; i++)
                {
                    var child = bone.GetChild(i);
                    if (!names.Add(child.name))
                    {
                        Debug.Log($"{root}:�ظ���bone---> {child.name}");
                    }
                    Check(child);
                }
            }
        }       
    }
}
