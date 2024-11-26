using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor;
using UnityEngine.UIElements;
using UnityEditor.UIElements;
using UnityEditor.Animations;
using UnityEngine.WSA;
using System.IO;
using SkillEditor;
using Sirenix.OdinInspector.Editor.Validation;

namespace PersonBrowser
{
    public class VehicleCreater : EditorWindow
    {
        const string VEHICLE_POINT = "Root/G_{0}_bone001/Battery_point01";
        const string PATH_BATTERY = "Assets/Art/Character/Prefabs/Battery/{0}.prefab";
        const string PATH_VEHICLE = "Assets/Art/Character/Prefabs/Vehicle/{0}.prefab";
        const string PATH_VEHICLE_S = "Assets/Art/Character/Prefabs/Vehicle_S/{0}.prefab";

        ObjectField vehicleField;
        ObjectField batteryField;

        [MenuItem("Test/prefab工具/创建载具 prefab")]
        public static void ShowWindow() { GetWindow<VehicleCreater>("载具 Prefab 工具"); }

        public void CreateGUI()
        {
            Button btn2 = new Button() { text = "Create All Battery prefab" };
            rootVisualElement.Add(btn2);
            btn2.RegisterCallback<ClickEvent>(CreateAllBatteryPrefab);

            Label label1 = new Label();
            rootVisualElement.Add(label1);

            vehicleField = new() { label = "vehicleFbx" };
            rootVisualElement.Add(vehicleField);

            batteryField = new() { label = "batteryPrefab" };
            rootVisualElement.Add(batteryField);

            Button btn1 = new Button() { text = "Create Vehicle_S" };
            rootVisualElement.Add(btn1);
            btn1.RegisterCallback<ClickEvent>(CreateSelectedVehicleShow);

            Label label2 = new Label();
            rootVisualElement.Add(label2);

            Button btn3 = new Button() { text = "select fbx to Create Prefabs/Vehicle" };
            rootVisualElement.Add(btn3);
            btn3.RegisterCallback<ClickEvent>(CreateSelectedVehicle);


            Button btn4 = new Button() { text = "select fbx to Create AutoGen/Battery" };
            rootVisualElement.Add(btn4);
            btn4.RegisterCallback<ClickEvent>(CreateSelectedBattery);

            Button btn5 = new Button() { text = "旋转炮台" };
            rootVisualElement.Add(btn5);
            btn5.RegisterCallback<ClickEvent>(RotateBattery);
        }

        public void CreateVehicleShow(GameObject fbx)
        {
            string name = fbx.name.Remove(0, 1).Insert(0, "3");
            string prefabName = "P_S_" + name;
            GameObject prefab = new(prefabName);
            GameObject instance = (GameObject)PrefabUtility.InstantiatePrefab(fbx, prefab.transform);
            if (batteryField.value != null)
            {
                Debug.Log(batteryField.value);
                string pointPath = string.Format(VEHICLE_POINT, fbx.name);
                Transform point = instance.transform.Find(pointPath);
                PrefabUtility.InstantiatePrefab(batteryField.value, point);
            }
            string prefabPath = string.Format(PATH_VEHICLE_S, prefabName);
            PrefabUtility.SaveAsPrefabAssetAndConnect(prefab, prefabPath, InteractionMode.AutomatedAction);
            Debug.Log(prefabPath);
        }
        public void CreateSelectedVehicleShow(ClickEvent evt)
        {
            GameObject vehicleFbx = (GameObject)vehicleField.value;
            if (!vehicleFbx.name.StartsWith("C"))
            {
                Debug.Log($"{vehicleFbx.name}:不是载具");
                return;
            }
            CreateVehicleShow(vehicleFbx);
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

            // 生成 animator override controller 
            AnimatorController controller = AssetDatabase.LoadAssetAtPath<AnimatorController>("Assets/Art/Animations/animator/Battery/animator_battery.controller");
            AnimatorOverrideController overrideController = new(controller);
            AnimationClip attackClip = AssetDatabase.LoadAssetAtPath<AnimationClip>($"Assets/Art/Animations/Battery/{batteryFbx.name}/ani_{batteryFbx.name}_attack01.fbx");
            AnimationClip compressedAttackClip = LTCompressor.AutoCompress(attackClip);
            if (attackClip == null)
            {
                Debug.LogError($"缺少动作文件：ani_{batteryFbx.name}_attack01.fbx");
                return;
            }
            overrideController["ani_R00001_attack01"] = compressedAttackClip;
            AnimationClip idleClip = AssetDatabase.LoadAssetAtPath<AnimationClip>($"Assets/Art/Animations/Battery/{batteryFbx.name}/ani_{batteryFbx.name}_idle.fbx");
            AnimationClip compressedIdleClip = LTCompressor.AutoCompress(idleClip);
            if (idleClip == null)
            {
                Debug.LogError($"缺少动作文件：ani_{batteryFbx.name}_idle.fbx");
                return;
            }
            overrideController["ani_R00001_idle"] = compressedIdleClip;


            string folder = $"Assets/Art_Out/AutoGen/Battery/{batteryPrefab.name}";
            if (!Directory.Exists(folder))
            {
                Directory.CreateDirectory(folder);
            }

            AssetDatabase.CreateAsset(overrideController, $"Assets/Art_Out/AutoGen/Battery/{batteryPrefab.name}/ov_battery_{batteryFbx.name}.controller");
            AssetDatabase.SaveAssets();

            // 设置 animator
            var animator = instance.GetComponent<Animator>();
            animator.runtimeAnimatorController = overrideController;

            string path = $"Assets/Art_Out/AutoGen/Battery/{batteryPrefab.name}/{batteryPrefab.name}.prefab";

            GameObject P_b = PrefabUtility.SaveAsPrefabAssetAndConnect(batteryPrefab, path, InteractionMode.AutomatedAction);
            Debug.Log($"创建炮台：{P_b.name}");
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


        public void CreateAllBatteryPrefab(ClickEvent evt)
        {
            string[] guids = AssetDatabase.FindAssets("t:gameObject", new string[] { "Assets/Art/Character/Models/Battery" });
            foreach (string guid in guids)
            {
                string path = AssetDatabase.GUIDToAssetPath(guid);
                GameObject go = AssetDatabase.LoadAssetAtPath<GameObject>(path);

                if (go.transform.Find("R_Root") != null)
                {
                    CreateBatteryPrefab(go);
                }
                else
                {
                    Debug.LogWarning($"没有 R_Root: {go}");
                }
            }
        }
        public void CreateBatteryPrefab(GameObject go)
        {
            string name = "P_" + go.name + "_01";
            GameObject prefab = new(name);
            GameObject battery = (GameObject)PrefabUtility.InstantiatePrefab(go, prefab.transform);
            battery.transform.Find("R_Root").localEulerAngles = Vector3.zero;
            string prefabPath = string.Format(PATH_BATTERY, name);
            PrefabUtility.SaveAsPrefabAssetAndConnect(prefab, prefabPath, InteractionMode.AutomatedAction);
            Debug.Log(prefabPath);
        }

        public void RotateBattery(ClickEvent evt)
        {
            GameObject[] objs = Selection.gameObjects;
            foreach (GameObject obj in objs)
            {
                var instance = obj.transform.GetChild(0);
                string pointPath = string.Format(VEHICLE_POINT, instance.name);
                Transform point = instance.transform.Find(pointPath);
                point.GetChild(0).localEulerAngles = Vector3.zero;
            }
            AssetDatabase.SaveAssets();
            AssetDatabase.Refresh();
        }
    }
}