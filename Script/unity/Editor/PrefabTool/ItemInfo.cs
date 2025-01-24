using System.IO;
using System.Linq;
using Art.temp.Editor.CharacterData;
using Gameplay.Character;
using UnityEditor;
using UnityEditor.Animations;
using UnityEngine;

namespace Art.temp.Editor.PrefabTool
{
    public abstract class ItemInfo
    {
        protected readonly string nameId;

        protected ItemInfo(string nameId)
        {
            this.nameId = nameId;
        }

        protected abstract string Category { get; }
        private string ModelPath => string.Format("Assets/Art/Character/Models/{0}/{1}/{1}.fbx", Category, nameId);
        protected string PrefabPath => $"Assets/Art/Character/Prefabs/{Category}/P_{nameId}_01.prefab";

        protected virtual string Root => $"{nameId[0..1]}_Root";
        protected GameObject Model => AssetDatabase.LoadAssetAtPath<GameObject>(ModelPath);
        public GameObject Prefab => AssetDatabase.LoadAssetAtPath<GameObject>(PrefabPath);

        public virtual void Rebuild()
        {
            // Create empty GameObject and parent instantiate asset to it.
            GameObject prefab = new($"P_{nameId}_01");
            GameObject instance = (GameObject)PrefabUtility.InstantiatePrefab(Model, prefab.transform);

            Transform root = instance.transform.Find(Root);
            if (!root)
            {
                // not find Root, no skin
                Debug.LogWarning($"not find Root, continue: {instance.name}");
            }
            else
            {
                // root set zero except cars
                if (root.name != "Root")
                {
                    root.localEulerAngles = Vector3.zero;
                }

                // save 
                PrefabUtility.SaveAsPrefabAssetAndConnect(prefab, PrefabPath, InteractionMode.AutomatedAction);
                Debug.Log(PrefabPath);
            }
        }
    }

    public class BagInfo : ItemInfo
    {
        public BagInfo(string nameId) : base(nameId)
        {
        }

        protected override string Category => "Bag";
    }

    public class GunInfo : ItemInfo
    {
        public GunInfo(string nameId) : base(nameId)
        {
        }

        protected override string Category => "Guns";
    }

    public class BatteryInfo : ItemInfo
    {
        public BatteryInfo(string nameId) : base(nameId)
        {
        }

        protected override string Category => "Battery";

        public void RebuildAuto()
        {
            GameObject newPrefab = (GameObject)PrefabUtility.InstantiatePrefab(Prefab);
            Transform instance = newPrefab.transform.GetChild(0);

            if (instance.GetComponent<Animator>() == null)
            {
                instance.gameObject.AddComponent<Animator>();
            }

            // 生成 animator override controller 
            AnimatorController controller =
                AssetDatabase.LoadAssetAtPath<AnimatorController>(
                    "Assets/Art/Animations/animator/Battery/animator_battery.controller");
            AnimatorOverrideController overrideController = new(controller);

            AnimationClip attackClip =
                AssetDatabase.LoadAssetAtPath<AnimationClip>(
                    $"Assets/Art/Animations/Battery/{nameId}/ani_{nameId}_attack01.fbx");
            if (attackClip == null)
            {
                Debug.LogError($"缺少动作文件：ani_{nameId}_attack01.fbx");
                return;
            }

            AnimationClip compressedAttackClip = LTCompressor.AutoCompress(attackClip);
            overrideController["ani_R00001_attack01"] = compressedAttackClip;

            AnimationClip idleClip =
                AssetDatabase.LoadAssetAtPath<AnimationClip>(
                    $"Assets/Art/Animations/Battery/{nameId}/ani_{nameId}_idle.fbx");
            if (idleClip == null)
            {
                Debug.LogError($"缺少动作文件：ani_{nameId}_idle.fbx");
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

            AssetDatabase.CreateAsset(overrideController,
                $"Assets/Art_Out/AutoGen/Battery/{newPrefab.name}/ov_battery_{nameId}.controller");
            AssetDatabase.SaveAssets();

            // 设置 animator
            var animator = instance.GetComponent<Animator>();
            animator.runtimeAnimatorController = overrideController;

            // 保存 prefab
            PrefabUtility.UnpackPrefabInstance(newPrefab, PrefabUnpackMode.OutermostRoot,
                InteractionMode.AutomatedAction);
            string path = $"Assets/Art_Out/AutoGen/Battery/{newPrefab.name}/{newPrefab.name}.prefab";
            PrefabUtility.SaveAsPrefabAssetAndConnect(newPrefab, path, InteractionMode.AutomatedAction);
            Debug.Log($"创建炮台：{newPrefab}");
        }
    }

    public class VehicleInfo : ItemInfo
    {
        public VehicleInfo(string nameId) : base(nameId)
        {
        }

        protected override string Root => "Root";
        private string DisplayPrefabPath => $"Assets/Art/Character/Prefabs/Vehicle_S/P_S_{nameId}_01.prefab";
        public GameObject DisplayPrefab => AssetDatabase.LoadAssetAtPath<GameObject>(DisplayPrefabPath);

        protected override string Category => "Vehicle";

        public void RebuildDisplay()
        {
            Vehicle config = JsonData.GetVehicles().FirstOrDefault(x => x.name == Prefab.name);
            if (config == null)
            {
                Debug.Log($"未配置 vehicle json: {nameId}");
                return;
            }

            GameObject newPrefab = (GameObject)PrefabUtility.InstantiatePrefab(Prefab);

            // 添加炮台		

            if (!string.IsNullOrEmpty(config.batteryName))
            {
                BatteryInfo batteryInfo = new(config.batteryName.Split('_')[1]);
                string pointFullName = $"Root/G_{nameId}_bone001/Battery_point01";
                Transform pointBattery = newPrefab.transform.GetChild(0).Find(pointFullName);
                PrefabUtility.InstantiatePrefab(batteryInfo.Prefab, pointBattery);
            }
            else
            {
                Debug.LogWarning($"没有炮台: {nameId}");
            }

            PrefabUtility.UnpackPrefabInstance(newPrefab, PrefabUnpackMode.Completely, InteractionMode.AutomatedAction);
            var displayPrefab =
                PrefabUtility.SaveAsPrefabAssetAndConnect(newPrefab, DisplayPrefabPath,
                    InteractionMode.AutomatedAction);
            Debug.Log(DisplayPrefabPath);
            newPrefab.name = displayPrefab.name;
        }

        public override void Rebuild()
        {
            // Create empty GameObject and parent instantiate asset to it.
            GameObject prefab = new($"P_{nameId}_01");
            GameObject instance = (GameObject)PrefabUtility.InstantiatePrefab(Model, prefab.transform);

            Transform root = instance.transform.Find(Root);
            if (root == null)
            {
                // not find Root, no skin
                Debug.LogWarning($"not find Root, continue: {instance.name}");
                return;
            }

            var effectPointComponent = instance.AddComponent<CmpCharacterEffectPoints>();
            var bones = root.GetComponentsInChildren<Transform>();
            var hits = bones.Where(x => x.name.StartsWith("hit")).ToArray();
            effectPointComponent.m_CriticalPoints = hits.Where(a => a.name == "hit02").ToArray();
            effectPointComponent.m_OtherPoints = hits.Where(b => b.name != "hit02").ToArray();

            // save 
            PrefabUtility.SaveAsPrefabAssetAndConnect(prefab, PrefabPath, InteractionMode.AutomatedAction);
            Debug.Log(PrefabPath);
        }
    }
}