using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor;
using UnityEngine.UIElements;
using UnityEditor.UIElements;

namespace PersonBrowser
{
    public class VehicleCreater : EditorWindow
    {
        TextField TextField;
        ObjectField VehicleField;
        ObjectField BatteryField;
        [MenuItem("Test/prefab工具/创建载具 prefab")]
        public static void ShowWindow() { GetWindow<VehicleCreater>("载具 Prefab 工具"); }

        public void CreateGUI()
        {/*
            Button btn1 = new Button() { text = "create all battery" };
            rootVisualElement.Add(btn1);
            btn1.RegisterCallback<ClickEvent>(CreateAllBattery);

            Button btn2 = new Button() { text = "create all vehicle" };
            rootVisualElement.Add(btn2);
            btn2.RegisterCallback<ClickEvent>(CreateAllVehicle);*/

            Button btn3 = new Button() { text = "create selected vehicle" };
            rootVisualElement.Add(btn3);
            btn3.RegisterCallback<ClickEvent>(CreateSelectedVehicle);


            Button btn4 = new Button() { text = "create selected battery" };
            rootVisualElement.Add(btn4);
            btn4.RegisterCallback<ClickEvent>(CreateSelectedBattery);

            Button btn5 = new Button() { text = "重命名anim" };
            rootVisualElement.Add(btn5);
            btn5.RegisterCallback<ClickEvent>(RenameAnim);
        }

        public void CreateSelectedVehicle(ClickEvent evt)
        {
            GameObject vehicleFbx = Selection.activeGameObject;
            if (!vehicleFbx.name.StartsWith("C"))
            {
                Debug.Log($"{vehicleFbx.name}:不是载具");
                return;
            }
            GameObject vehiclePrefab = new GameObject($"P_{vehicleFbx.name}_01");
            PrefabUtility.InstantiatePrefab(vehicleFbx, vehiclePrefab.transform);
            string prefabPath = $"Assets/Art/Character/Prefabs/Vehicle/{vehiclePrefab.name}.prefab";
            PrefabUtility.SaveAsPrefabAssetAndConnect(vehiclePrefab, prefabPath, InteractionMode.AutomatedAction);
            Debug.Log(prefabPath);
        }

        public void CreateSelectedBattery(ClickEvent evt)
        {
            GameObject batteryFbx = Selection.activeGameObject;
            CreateBattery(batteryFbx);
        }

        public void CreateBattery(GameObject batteryFbx)
        {
            if (!batteryFbx.name.StartsWith("R"))
            {
                Debug.Log($"{batteryFbx.name}:不是载具武器");
                return;
            }
            GameObject batteryPrefab = new GameObject($"P_{batteryFbx.name}_01");
            PrefabUtility.InstantiatePrefab(batteryFbx, batteryPrefab.transform);
            Transform instance = batteryPrefab.transform.GetChild(0);
            try
            {
                instance.Find("R_Root").ResetLocals();
            }
            catch
            {
                instance.Find("R_root").ResetLocals();
            }
            if (instance.GetComponent<Animator>() == null)
            {
                instance.gameObject.AddComponent<Animator>();
            }
            var animator = instance.GetComponent<Animator>();

            var controller = AssetDatabase.LoadAssetAtPath<AnimatorOverrideController>($"Assets/Art/Animations/animator/Battery/ov_battery_{instance.name}.controller");
            if (controller == null)
            {
                // 创建controller 
                Debug.Log($"{instance.name}:没有controller,停止创建");
            }
            else
            {
                animator.runtimeAnimatorController = controller;
                string path = $"Assets/Art/Character/Prefabs/BatteryNew/{batteryPrefab.name}.prefab";
                GameObject P_b = PrefabUtility.SaveAsPrefabAssetAndConnect(batteryPrefab, path, InteractionMode.AutomatedAction);
            }
        }


        public void CreateAllVehicle(ClickEvent evt)
        {

            string[] guids = AssetDatabase.FindAssets("t:gameObject", new string[] { "Assets/Art/Character/Models/Vehicle" });
            foreach (string guid in guids)
            {
                string path = AssetDatabase.GUIDToAssetPath(guid);
                GameObject vehicleFbx = AssetDatabase.LoadAssetAtPath<GameObject>(path);
                GameObject vehiclePrefab = new GameObject($"P_{vehicleFbx.name}_01");
                PrefabUtility.InstantiatePrefab(vehicleFbx, vehiclePrefab.transform);
                string prefabPath = $"Assets/Art/Character/Prefabs/Vehicle/{vehiclePrefab.name}.prefab";
                PrefabUtility.SaveAsPrefabAssetAndConnect(vehiclePrefab, prefabPath, InteractionMode.AutomatedAction);
                Debug.Log(prefabPath);
            }
        }


        public void CreateAllBattery(ClickEvent evt)
        {
            string[] guids = AssetDatabase.FindAssets("t:gameObject", new string[] { "Assets/Art/Character/Models/Battery" });
            foreach (string guid in guids)
            {
                string path = AssetDatabase.GUIDToAssetPath(guid);
                GameObject gameObject = AssetDatabase.LoadAssetAtPath<GameObject>(path);
                CreateBattery(gameObject);
            }
        }

        public void RenameAnim(ClickEvent evt)
        {
            GameObject go = Selection.activeGameObject;
            string goPath = AssetDatabase.GetAssetPath(go);
            ModelImporter importer = AssetImporter.GetAtPath(goPath) as ModelImporter;

            ModelImporterClipAnimation clip = new();
            clip = importer.defaultClipAnimations[0];
            clip.name = go.name;
            importer.clipAnimations = new ModelImporterClipAnimation[] { clip };
            importer.SaveAndReimport();
        }
    }
}