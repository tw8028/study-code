using System.Collections.Generic;
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

        private readonly List<string> anims = new() { "attack01", "idle", "skill" };

        public void RebuildAuto()
        {
            GameObject newPrefab = (GameObject)PrefabUtility.InstantiatePrefab(Prefab);
            Transform instance = newPrefab.transform.GetChild(0);

            Transform[] transforms = instance.gameObject.GetComponentsInChildren<Transform>();

            Transform fire = transforms.SingleOrDefault(transform => transform.name == "Fire");
            if (fire == null)
            {
                Debug.LogError($"not find Fire: {instance.name}");
                return;
            }

            Transform fireSkill = transforms.SingleOrDefault(transform => transform.name == "Fire_skill");
            if (fireSkill == null)
            {
                Debug.LogWarning($"not find Fire_skill to create new: {instance.name}");
                GameObject fireSkillObj = new("Fire_skill");
                fireSkillObj.transform.SetParent(fire.transform.parent);
                fireSkillObj.transform.localPosition = fire.localPosition;
                fireSkillObj.transform.localRotation = fire.localRotation;
            }


            if (instance.GetComponent<Animator>() == null)
            {
                instance.gameObject.AddComponent<Animator>();
            }

            // 生成 animator override controller 
            AnimatorController controller =
                AssetDatabase.LoadAssetAtPath<AnimatorController>(
                    "Assets/Art/Animations/animator/Battery/animator_battery.controller");
            AnimatorOverrideController overrideController = new(controller);

            foreach (string anim in anims)
            {
                AnimationClip clip =
                    AssetDatabase.LoadAssetAtPath<AnimationClip>(
                        $"Assets/Art/Animations/Battery/{nameId}/ani_{nameId}_{anim}.fbx");
                if (clip == null)
                {
                    Debug.LogWarning($"缺少动作文件：ani_{nameId}_{anim}.fbx");
                    overrideController[$"ani_R00001_{anim}"] =
                        AssetDatabase.LoadAssetAtPath<AnimationClip>(
                            $"Assets/Art/Animations/compressed/compressed_ani_{nameId}_idle.anim");
                }
                else
                {
                    AnimationClip compressedAttackClip = LTCompressor.AutoCompress(clip);
                    overrideController[$"ani_R00001_{anim}"] = compressedAttackClip;
                }
            }

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
                IEnumerable<Object> batteryPrefabs = AnimHelper.FindAssetsByFolders<GameObject>(config.batteryName,
                    new[] { "Assets/Art/Character/Prefabs/Battery" });

                string pointFullName = $"Root/G_{nameId}_bone001/Battery_point01";
                Transform pointBattery = newPrefab.transform.GetChild(0).Find(pointFullName);
                if (pointBattery == null)
                    pointBattery = newPrefab.transform.GetChild(0).Find("Root/cog/Battery_point01");
                if (batteryPrefabs != null)
                    PrefabUtility.InstantiatePrefab(batteryPrefabs.ElementAt(0), pointBattery);
            }
            else
            {
                Debug.LogWarning($"没有炮台: {nameId}");
            }

            PrefabUtility.UnpackPrefabInstance(newPrefab, PrefabUnpackMode.Completely,
                InteractionMode.AutomatedAction);
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
            if (!bones.Any(x => x.name.StartsWith("hit")))
            {
                Debug.LogError($"{nameId}: has no hit points");
                return;
            }

            effectPointComponent.m_CriticalPoints = hits.Where(a => a.name == "hit02").ToArray();
            effectPointComponent.m_OtherPoints = hits.Where(b => b.name != "hit02").ToArray();

            // save 
            PrefabUtility.SaveAsPrefabAssetAndConnect(prefab, PrefabPath, InteractionMode.AutomatedAction);
            Debug.Log(PrefabPath);
        }
    }
}