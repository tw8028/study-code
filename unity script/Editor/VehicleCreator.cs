using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor;
using UnityEngine.UIElements;
using UnityEditor.UIElements;
using UnityEditor.Animations;
using System.IO;
using System.Linq;


namespace PersonBrowser
{
    /// <summary>
    /// 1 生成底盘和炮台 prefab，变色手动创建变体，P_C00001_01, P_R00001_02
    /// 2 生成剧情用载具 P_S_300001
    /// 3 生成 Auto 炮台 P_R00001_01
    /// 4 使用构建器，生成 Auto 底盘
    /// </summary>
    public class VehicleCreator : EditorWindow
    {
        const string BATTERY_POINT = "Root/G_{0}_bone001/Battery_point01";

        private List<Vehicle> VehicleData => JsonData.GetVehicles();

        [MenuItem("Test/prefab工具/P_载具")]
        public static void ShowWindow() { GetWindow<VehicleCreator>("载具 Prefab 工具"); }

        public void CreateGUI()
        {
            Button btn1 = new() { text = "生成所有 origin prefab" };
            rootVisualElement.Add(btn1);
            btn1.RegisterCallback<ClickEvent>(AllPrefabClick);

            Button btn2 = new() { text = "选择 origin vehicle prefab 创建 s vehicle prefab" };
            rootVisualElement.Add(btn2);
            btn2.RegisterCallback<ClickEvent>(ShowVehicleClick);

            Button btn3 = new() { text = "生成所有 auto 炮台" };
            rootVisualElement.Add(btn3);
            btn3.RegisterCallback<ClickEvent>(AutoBatteryClick);

        }

        // 生成底盘和炮台 origin prefab
        public void PrefabCreator(GameObject fbx)
        {
            string id = fbx.name;
            string name = "P_" + id + "_01";
            string prefabPath;
            GameObject prefab = new(name);
            GameObject instance = (GameObject)PrefabUtility.InstantiatePrefab(fbx, prefab.transform);
            if (id.StartsWith("R"))
            {
                if (instance.transform.Find("R_Root") != null)
                {
                    // 炮台 root 归零
                    instance.transform.Find("R_Root").localEulerAngles = Vector3.zero;
                    prefabPath = string.Format(PrefabPath.BATTERY, name);
                }
                else
                {
                    Debug.LogWarning($"未蒙皮停止创建: {id}");
                    return;
                }

            }
            else if (id.StartsWith("C"))
            {
                if (instance.transform.Find("Root") != null)
                {
                    prefabPath = string.Format(PrefabPath.VEHICLE, name);
                }
                else
                {
                    Debug.LogWarning($"未蒙皮停止创建: {id}");
                    return;
                }
            }
            else
            {
                Debug.LogError($"错误模型名停止创建: {id}");
                return;
            }
            PrefabUtility.SaveAsPrefabAssetAndConnect(prefab, prefabPath, InteractionMode.AutomatedAction);
            Debug.Log(prefabPath);
        }
        public void AllPrefabClick(ClickEvent evt)
        {
            GameObject[] objs = AnimUtility.FindAssetsByFolder("t:gameObject", new string[] {
                "Assets/Art/Character/Models/Battery" ,
                "Assets/Art/Character/Models/Vehicle"
            });
            foreach (GameObject go in objs)
            {
                PrefabCreator(go);
            }
        }

        // 使用 origin prefab, 生成剧情用车辆, unPack 后删除 origin prefab 不影响
        public void ShowVehicleCreator(GameObject go)
        {
            string originName = go.name;
            string id = originName.Split('_')[1];
            Vehicle vehicle = VehicleData.FirstOrDefault(x => x.name == originName);
            if (vehicle == null)
            {
                Debug.Log($"未配置 vehicle json: {originName}");
                return;
            }

            GameObject newPrefab = (GameObject)PrefabUtility.InstantiatePrefab(go);
            newPrefab.name = originName.Insert(1, "_S");

            // 添加炮台						
            GameObject batteryPrefab = AnimUtility.FindPrefab(vehicle.batteryName);
            if (batteryPrefab != null)
            {
                Transform point_battery = newPrefab.transform.GetChild(0).Find(string.Format(BATTERY_POINT, id));
                PrefabUtility.InstantiatePrefab(batteryPrefab, point_battery);
            }
            else
            {
                Debug.LogWarning($"没有炮台: {originName}");
            }

            PrefabUtility.UnpackPrefabInstance(newPrefab, PrefabUnpackMode.Completely, InteractionMode.AutomatedAction);
            string prefabPath = string.Format(PrefabPath.VEHICLE_S, newPrefab.name);
            PrefabUtility.SaveAsPrefabAssetAndConnect(newPrefab, prefabPath, InteractionMode.AutomatedAction);
            Debug.Log(prefabPath);
        }
        public void ShowVehicleClick(ClickEvent evt)
        {
            GameObject[] objs = Selection.gameObjects;
            if (objs.Length == 0)
            {
                Debug.LogError("选择 origin vehicle prefab");
            }
            foreach (GameObject go in objs)
            {
                if (!go.name.StartsWith("P_C"))
                {
                    Debug.Log($"{go.name}:不是载具 prefab");
                    return;
                }
                ShowVehicleCreator(go);
            }
        }

        // 使用 origin prefab, 生成 auto 炮台, 最后 unPack
        public void AutoBatteryCreator(GameObject go)
        {
            string id = go.name.Split('_')[1];

            GameObject newPrefab = (GameObject)PrefabUtility.InstantiatePrefab(go);
            PrefabUtility.InstantiatePrefab(go, newPrefab.transform);
            Transform instance = newPrefab.transform.GetChild(0);

            if (instance.GetComponent<Animator>() == null)
            {
                instance.gameObject.AddComponent<Animator>();
            }

            // 生成 animator override controller 
            AnimatorController controller = AssetDatabase.LoadAssetAtPath<AnimatorController>("Assets/Art/Animations/animator/Battery/animator_battery.controller");
            AnimatorOverrideController overrideController = new(controller);

            AnimationClip attackClip = AssetDatabase.LoadAssetAtPath<AnimationClip>($"Assets/Art/Animations/Battery/{id}/ani_{id}_attack01.fbx");
            if (attackClip == null)
            {
                Debug.LogError($"缺少动作文件：ani_{id}_attack01.fbx");
                return;
            }
            AnimationClip compressedAttackClip = LTCompressor.AutoCompress(attackClip);
            overrideController["ani_R00001_attack01"] = compressedAttackClip;

            AnimationClip idleClip = AssetDatabase.LoadAssetAtPath<AnimationClip>($"Assets/Art/Animations/Battery/{id}/ani_{id}_idle.fbx");
            if (idleClip == null)
            {
                Debug.LogError($"缺少动作文件：ani_{id}_idle.fbx");
                return;
            }
            AnimationClip compressedIdleClip = LTCompressor.AutoCompress(idleClip);
            overrideController["ani_R00001_idle"] = compressedIdleClip;

            // 创建 auto 文件夹
            string folder = $"Assets/Art_Out/AutoGen/Battery/{newPrefab.name}";
            if (!Directory.Exists(folder))
            {
                Directory.CreateDirectory(folder);
            }

            AssetDatabase.CreateAsset(overrideController, $"Assets/Art_Out/AutoGen/Battery/{newPrefab.name}/ov_battery_{id}.controller");
            AssetDatabase.SaveAssets();

            // 设置 animator
            var animator = instance.GetComponent<Animator>();
            animator.runtimeAnimatorController = overrideController;

            // 保存 prefab
            PrefabUtility.UnpackPrefabInstance(newPrefab, PrefabUnpackMode.Completely, InteractionMode.AutomatedAction);
            string path = $"Assets/Art_Out/AutoGen/Battery/{newPrefab.name}/{newPrefab.name}.prefab";
            PrefabUtility.SaveAsPrefabAssetAndConnect(newPrefab, path, InteractionMode.AutomatedAction);
            Debug.Log($"创建炮台：{newPrefab}");
        }
        public void AutoBatteryClick(ClickEvent evt)
        {
            string[] guids = AssetDatabase.FindAssets("t:gameObject", new string[] {
                "Assets/Art/Character/Prefabs/Battery"
            });
            foreach (string guid in guids)
            {
                string path = AssetDatabase.GUIDToAssetPath(guid);
                GameObject go = AssetDatabase.LoadAssetAtPath<GameObject>(path);
                AutoBatteryCreator(go);
            }
        }

    }
}