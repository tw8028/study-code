using MagicaCloth2;
using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using UnityEngine.UIElements;

public class PrefabCreator : EditorWindow
{
    [MenuItem("Test/prefab工具/Prefab Creator")]
    public static void ShowWindow()
    {
        GetWindow<PrefabCreator>("Prefab Creator");
    }
    public void CreateGUI()
    {
        VisualElement root = rootVisualElement;
        Button buttonChara = new()
        {
            name = "button1",
            text = "player"
        };
        root.Add(buttonChara);
        buttonChara.RegisterCallback<ClickEvent>(CreateChara);

        Button buttonGun = new()
        {
            name = "button2",
            text = "gun"
        };
        root.Add(buttonGun);
        buttonGun.RegisterCallback<ClickEvent>(CreateGun);

        Button buttonBag = new()
        {
            name = "button3",
            text = "bag"
        };
        root.Add(buttonBag);
        buttonBag.RegisterCallback<ClickEvent>(CreateBag);

        TextElement textElement = new() { text = "在project中选择fbx资源，点击创建，此操作将在特定目录生成perfab资源，若已存在，则会覆盖掉原有资源。" };
        root.Add(textElement);
    }
    public void CreateBag(ClickEvent evt)
    {
        // "Assets/Art/Character/Prefabs/Bag/"
        // add MgicaCloth component
        CreatePrefabs("Assets/Art/Character/Prefabs/Bag/");
    }
    public void CreateChara(ClickEvent evt)
    {
        // "Assets/Art/Character/Prefabs/Players/"
        // add MgicaCloth component, emoji. Scale player to 1.1
        CreatePrefabs("Assets/Art/Character/Prefabs/Players/", true, true);
    }
    public void CreateGun(ClickEvent evt)
    {
        // "Assets/Art/Character/Prefabs/Guns/"
        CreatePrefabs("Assets/Art/Character/Prefabs/Guns/", false);
    }
    public void CreatePrefabs(string directory, bool hasMagicaCloth = true, bool isPlayer = false)
    {
        GameObject[] objectArray = Selection.gameObjects;

        foreach (GameObject obj in objectArray)
        {
            string name = "P_" + obj.name;
            string path = $"{directory}{name}.prefab";
            /*localPath = AssetDatabase.GenerateUniqueAssetPath(localPath);*/
            // create empty
            GameObject root = new(name);
            // instantiate asset object, then add to empty object
            GameObject assetInstance = (GameObject)PrefabUtility.InstantiatePrefab(obj, root.transform);
            // add migicaCloth component
            if (hasMagicaCloth)
            {
                assetInstance.AddComponent<MagicaCloth>();
            }
            // add emoji and Scale for player
            if (isPlayer)
            {
                Transform head = assetInstance.transform.Find("Root/Bip001/Bip001 Spine/Bip001 Spine1/Bip001 Neck/Bip001 Head/");
                GameObject emoji = AssetDatabase.LoadAssetAtPath<GameObject>("Assets/Art/Character/Models/Emoji/G_emoji.FBX");
                GameObject emojiInstance = (GameObject)PrefabUtility.InstantiatePrefab(emoji);
                emojiInstance.transform.parent = head;

                assetInstance.transform.localScale = new Vector3(1.1f, 1.1f, 1.1f);
            }
            // save prefab
            PrefabUtility.SaveAsPrefabAssetAndConnect(root, path, InteractionMode.UserAction);
        }
    }
}
