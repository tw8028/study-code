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
        {
            Button btn1 = new Button() { text = "create all battery" };
            rootVisualElement.Add(btn1);
            btn1.RegisterCallback<ClickEvent>(CreateAllBattery);

            Button btn2 = new Button() { text = "create all vehicle" };
            rootVisualElement.Add(btn2);
            btn2.RegisterCallback<ClickEvent>(CreateVehicle);

            Button btn3 = new Button() { text = "create selected vehicle" };
            rootVisualElement.Add(btn3);
            btn3.RegisterCallback<ClickEvent>(CreateSelectedVehicle);
        }

        public void CreateSelectedVehicle(ClickEvent evt)
        {
            GameObject vehicleFbx = Selection.activeGameObject;
            GameObject vehiclePrefab = new GameObject($"P_{vehicleFbx.name}_01");
            PrefabUtility.InstantiatePrefab(vehicleFbx, vehiclePrefab.transform);
            string prefabPath = $"Assets/Art/Character/Prefabs/Vehicle/{vehiclePrefab.name}.prefab";
            PrefabUtility.SaveAsPrefabAssetAndConnect(vehiclePrefab, prefabPath, InteractionMode.AutomatedAction);
            Debug.Log(prefabPath);
        }






        public void CreateVehicle(ClickEvent evt)
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

        public void CreateBattery(GameObject batteryFbx)
        {
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
                Debug.Log($"{instance}:没有controller,停止创建");
            }
            else
            {
                animator.runtimeAnimatorController = controller;
                string path = $"Assets/Art/Character/Prefabs/BatteryNew/{batteryPrefab.name}.prefab";
                GameObject P_b = PrefabUtility.SaveAsPrefabAssetAndConnect(batteryPrefab, path, InteractionMode.AutomatedAction);
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
    }
}