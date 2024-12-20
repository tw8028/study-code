using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using UnityEngine.UIElements;
using System.Linq;
using MagicaCloth2;
using System.IO;
using PersonBrowser;
using CharacterBuilder;
using Framework;
using cfg.WeaponCfg;

public class CheckTools : EditorWindow
{
    TextField text;

    [MenuItem("Test/tools/С����")]
    public static void ShowWindow() { GetWindow<CheckTools>("check tool"); }
    public void CreateGUI()
    {
        Button btn0 = new() { text = "��ȡ��Դ·��" };
        rootVisualElement.Add(btn0);
        btn0.RegisterCallback<ClickEvent>(GetAssetPath);

        Button btn1 = new() { name = "button1", text = "check����fbx��root�ڵ�" };
        rootVisualElement.Add(btn1);
        btn1.RegisterCallback<ClickEvent>(CheckRoot);

        text = new() { name = "text", value = "" };
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

        Button btn5 = new() { name = "button5", text = "���headNub" };
        rootVisualElement.Add(btn5);
        btn5.RegisterCallback<ClickEvent>(CheckHeadNub);


        Button btn6 = new() { name = "button6", text = "Rename Assets" };
        rootVisualElement.Add(btn6);
        btn6.RegisterCallback<ClickEvent>(RenameAssets);


        Button btn7 = new() { name = "button6", text = "�����Щǿû��ʹ��" };
        rootVisualElement.Add(btn7);
        btn7.RegisterCallback<ClickEvent>(CheckWeapon);
    }

    public void GetAssetPath(ClickEvent ent)
    {
        GameObject gameObject = Selection.activeGameObject;
        string path = AssetDatabase.GetAssetPath(gameObject);
        string folder = Path.GetDirectoryName(path);
        text.value = folder;
        Debug.Log(folder);
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
            text.value = "δ�ҵ�������Root��gameObject";
        }
        else
        {
            text.value = "";
            foreach (var item in hasRoots)
            {
                text.value = text.value + "\n" + item.name;
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
        foreach (var obj in objs)
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

    // ��� Bip001 HeadNub
    public void CheckHeadNub(ClickEvent evt)
    {
        GameObject[] objs = FindAssetsByDir("t:GameObject", GetSelectFolder());
        if (objs.Count() == 0 || objs is null)
        {
            Debug.Log("��Ҫѡ���ļ���");
            return;
        }
        foreach (var obj in objs)
        {
            HasHeadNub(obj.transform);
        }
    }
    public void HasHeadNub(Transform obj)
    {
        var asset = obj.GetChild(0);
        string headNub = "Root/Bip001/Bip001 Spine/Bip001 Spine1/Bip001 Neck/Bip001 Head/Bip001 HeadNub";
        if (asset.Find(headNub) == null)
        {
            Debug.Log($"{obj.name}û�� HeadNub");
        }
    }

    // rename asset
    public void RenameAssets(ClickEvent evt)
    {
        GameObject[] objects = Selection.gameObjects;
        foreach (GameObject obj in objects)
        {
            string id = obj.transform.GetChild(0).name;
            string newName = $"P_S_{id}_01";
            string path = AssetDatabase.GetAssetPath(obj);
            AssetDatabase.RenameAsset(path, newName);
        }

    }

    private void CheckWeapon(ClickEvent evt)
    {
        List<Person> persons = JsonData.GetPersons();
        List<string> guns = new List<string>();
        for (int i = 0; i < 73; i++)
        {
            var p = persons.FirstOrDefault(w => w.weapon == "G" + i.ToString().PadLeft(5, '0'));
            if (p == null)
            {
                Debug.LogWarning(i);
                guns.Add(i.ToString());
            }
        }
       

        var monsterClassDataList = EditorTableManager.instance.tables.MonsterClass.DataList;
        for (int i = 0; i < monsterClassDataList.Count; i++)
        {
            var monsterGun = monsterClassDataList[i].WeaponId.ToString();
            // Debug.Log(monsterGun);
            var g = guns.FirstOrDefault(g => g == monsterGun);
            if (g != null)
            {
                guns.Remove(g);
            }
        }
        foreach (var g in guns)
        {
            Debug.Log(g);
        }
    }
}