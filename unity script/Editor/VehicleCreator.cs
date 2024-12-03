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
    /// 1 ���ɵ��̺���̨ prefab����ɫ�ֶ��������壬P_C00001_01, P_R00001_02
    /// 2 ���ɾ������ؾ� P_S_300001
    /// 3 ���� Auto ��̨ P_R00001_01
    /// 4 ʹ�ù����������� Auto ����
    /// </summary>
    public class VehicleCreator : EditorWindow
    {
        const string BATTERY_POINT = "Root/G_{0}_bone001/Battery_point01";

        private List<Vehicle> VehicleData => JsonData.GetVehicles();

        [MenuItem("Test/prefab����/P_�ؾ�")]
        public static void ShowWindow() { GetWindow<VehicleCreator>("�ؾ� Prefab ����"); }

        public void CreateGUI()
        {
            Button btn1 = new() { text = "�������� origin prefab" };
            rootVisualElement.Add(btn1);
            btn1.RegisterCallback<ClickEvent>(AllPrefabClick);

            Button btn2 = new() { text = "ѡ�� origin vehicle prefab ���� s vehicle prefab" };
            rootVisualElement.Add(btn2);
            btn2.RegisterCallback<ClickEvent>(ShowVehicleClick);

            Button btn3 = new() { text = "�������� auto ��̨" };
            rootVisualElement.Add(btn3);
            btn3.RegisterCallback<ClickEvent>(AutoBatteryClick);

        }

        // ���ɵ��̺���̨ origin prefab
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
                    // ��̨ root ����
                    instance.transform.Find("R_Root").localEulerAngles = Vector3.zero;
                    prefabPath = string.Format(PrefabPath.BATTERY, name);
                }
                else
                {
                    Debug.LogWarning($"δ��Ƥֹͣ����: {id}");
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
                    Debug.LogWarning($"δ��Ƥֹͣ����: {id}");
                    return;
                }
            }
            else
            {
                Debug.LogError($"����ģ����ֹͣ����: {id}");
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

        // ʹ�� origin prefab, ���ɾ����ó���, unPack ��ɾ�� origin prefab ��Ӱ��
        public void ShowVehicleCreator(GameObject go)
        {
            string originName = go.name;
            string id = originName.Split('_')[1];
            Vehicle vehicle = VehicleData.FirstOrDefault(x => x.name == originName);
            if (vehicle == null)
            {
                Debug.Log($"δ���� vehicle json: {originName}");
                return;
            }

            GameObject newPrefab = (GameObject)PrefabUtility.InstantiatePrefab(go);
            newPrefab.name = originName.Insert(1, "_S");

            // �����̨						
            GameObject batteryPrefab = AnimUtility.FindPrefab(vehicle.batteryName);
            if (batteryPrefab != null)
            {
                Transform point_battery = newPrefab.transform.GetChild(0).Find(string.Format(BATTERY_POINT, id));
                PrefabUtility.InstantiatePrefab(batteryPrefab, point_battery);
            }
            else
            {
                Debug.LogWarning($"û����̨: {originName}");
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
                Debug.LogError("ѡ�� origin vehicle prefab");
            }
            foreach (GameObject go in objs)
            {
                if (!go.name.StartsWith("P_C"))
                {
                    Debug.Log($"{go.name}:�����ؾ� prefab");
                    return;
                }
                ShowVehicleCreator(go);
            }
        }

        // ʹ�� origin prefab, ���� auto ��̨, ��� unPack
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

            // ���� animator override controller 
            AnimatorController controller = AssetDatabase.LoadAssetAtPath<AnimatorController>("Assets/Art/Animations/animator/Battery/animator_battery.controller");
            AnimatorOverrideController overrideController = new(controller);

            AnimationClip attackClip = AssetDatabase.LoadAssetAtPath<AnimationClip>($"Assets/Art/Animations/Battery/{id}/ani_{id}_attack01.fbx");
            if (attackClip == null)
            {
                Debug.LogError($"ȱ�ٶ����ļ���ani_{id}_attack01.fbx");
                return;
            }
            AnimationClip compressedAttackClip = LTCompressor.AutoCompress(attackClip);
            overrideController["ani_R00001_attack01"] = compressedAttackClip;

            AnimationClip idleClip = AssetDatabase.LoadAssetAtPath<AnimationClip>($"Assets/Art/Animations/Battery/{id}/ani_{id}_idle.fbx");
            if (idleClip == null)
            {
                Debug.LogError($"ȱ�ٶ����ļ���ani_{id}_idle.fbx");
                return;
            }
            AnimationClip compressedIdleClip = LTCompressor.AutoCompress(idleClip);
            overrideController["ani_R00001_idle"] = compressedIdleClip;

            // ���� auto �ļ���
            string folder = $"Assets/Art_Out/AutoGen/Battery/{newPrefab.name}";
            if (!Directory.Exists(folder))
            {
                Directory.CreateDirectory(folder);
            }

            AssetDatabase.CreateAsset(overrideController, $"Assets/Art_Out/AutoGen/Battery/{newPrefab.name}/ov_battery_{id}.controller");
            AssetDatabase.SaveAssets();

            // ���� animator
            var animator = instance.GetComponent<Animator>();
            animator.runtimeAnimatorController = overrideController;

            // ���� prefab
            PrefabUtility.UnpackPrefabInstance(newPrefab, PrefabUnpackMode.Completely, InteractionMode.AutomatedAction);
            string path = $"Assets/Art_Out/AutoGen/Battery/{newPrefab.name}/{newPrefab.name}.prefab";
            PrefabUtility.SaveAsPrefabAssetAndConnect(newPrefab, path, InteractionMode.AutomatedAction);
            Debug.Log($"������̨��{newPrefab}");
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