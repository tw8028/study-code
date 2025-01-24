using System.Collections;
using System.Linq;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor;
using UnityEditor.UIElements;
using UnityEngine.UIElements;

public class PlayerEditor : EditorWindow
{
    ObjectField charaField = null;
    ObjectField gunField = null;
    ObjectField bagField = null;
    [MenuItem("Test/prefab工具/Player Editor")]
    public static void ShowWindow()
    {
        GetWindow<PlayerEditor>("Character Editor");
    }

    public void CreateGUI()
    {
        VisualElement root = rootVisualElement;

        Label label1 = new Label("Edit Player");
        root.Add(label1);

        charaField = new ObjectField("player prefab") { objectType = typeof(GameObject), allowSceneObjects = false };
        root.Add(charaField);

        gunField = new ObjectField("add gun") { objectType = typeof(GameObject), allowSceneObjects = false };
        root.Add(gunField);

        bagField = new ObjectField("add bag") { objectType = typeof(GameObject), allowSceneObjects = false };
        root.Add(bagField);

        Button button1 = new()
        {
            name = "button1",
            text = "applay"
        };
        root.Add(button1);
        button1.RegisterCallback<ClickEvent>(EditPlayer);

        TextElement textElement = new() { text = "调整好背包位置后, Apply Overrides" };
        root.Add(textElement);
    }

    private void EditPlayer(ClickEvent evt)
    {
        GameObject prefabRoot = (GameObject)PrefabUtility.InstantiatePrefab(charaField.value);
        Transform assetInstance = prefabRoot.transform.GetChild(0);
        Debug.Log(assetInstance.name);


        if (bagField.value != null)
        {
            Transform point01 = assetInstance.Find("Root/Bip001/Bip001 Spine/Mount_point01/");
            GameObject bag = (GameObject)PrefabUtility.InstantiatePrefab(bagField.value, point01);
            bag.transform.localEulerAngles = new Vector3(90, 0, 0);
        }
        if (gunField.value != null)
        {
            Transform grip = assetInstance.Find("Root/Bip001/Bip001 Spine/Bip001 Spine1/Bip001 R Clavicle/Bip001 R UpperArm/Bip001 R Forearm/Bip001 R Hand/Grip_point01/");
            GameObject gun = (GameObject)PrefabUtility.InstantiatePrefab(gunField.value, grip);
            gun.transform.localEulerAngles = new Vector3(90, 0, 0);
        }

        /* config animator 角色已构建才能取到 animator controller
        Animator animator = assetInstance.GetComponent<Animator>();
        string[] guids = AssetDatabase.FindAssets("ov_A", new string[] { $"Assets/Art/AutoGen/Characters/character_{assetInstance.name}" });
        string path = AssetDatabase.GUIDToAssetPath(guids[0]);
        animator.runtimeAnimatorController = AssetDatabase.LoadAssetAtPath<RuntimeAnimatorController>(path);
        */
    }
}
