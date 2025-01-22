using System.IO;
using System.Linq;
using Art.temp.Editor.CharacterData;
using MagicaCloth2;
using UnityEditor;
using UnityEngine;
// ReSharper disable IdentifierTypo

namespace Art.temp.Editor.PrefabTool
{
    public abstract class CharacterInfo
    {
        private readonly string nameId;
        private readonly string personId;
        private readonly string folderId;

        protected CharacterInfo(string nameId)
        {
            this.nameId = nameId; // AA01001
            char[] chars = nameId.ToCharArray();
            chars[nameId.Length - 4] = '0';
            personId = new string(chars);
            folderId = new string(chars)[^6..];
        }

        private const string Head = "Root/Bip001/Bip001 Spine/Bip001 Spine1/Bip001 Neck/Bip001 Head/";
        private const string Grip01 = "Root/Bip001/Bip001 Spine/Bip001 Spine1/Bip001 R Clavicle/Bip001 R UpperArm/Bip001 R Forearm/Bip001 R Hand/Grip_point01/";
        private const string Mount01 = "Root/Bip001/Bip001 Spine/Mount_point01/";

        private const string AnimPath = "Assets/Art/Animations/Battle/Skill/ani_{0}_skill01.fbx";
        private const string AutoPath = "Assets/Art_Out/AutoGen/Characters/character_{0}_{1}/character_{0}.prefab";
        private const string ModelPath = "Assets/Art/Character/Models/{0}/{1}/{2}.fbx";
        private const string PrefabPath = "Assets/Art/Character/Prefabs/{0}/P_{1}.prefab";
        private const string DisplayPath = "Assets/Art/Character/Prefabs/{0}_S/P_S_{1}.prefab";

        private Person Config => JsonData.GetPersons().FirstOrDefault(a => a.id == personId);
        protected abstract string Category { get; }
        public GameObject Model => AssetDatabase.LoadAssetAtPath<GameObject>(string.Format(ModelPath, Category, folderId, nameId));
        public GameObject Prefab => AssetDatabase.LoadAssetAtPath<GameObject>(string.Format(PrefabPath, Category, nameId));
        public GameObject DisplayPrefab => AssetDatabase.LoadAssetAtPath<GameObject>(string.Format(DisplayPath, Category, nameId));
        public GameObject AutoPrefab => AssetDatabase.LoadAssetAtPath<GameObject>(string.Format(AutoPath, nameId, Config.weapon));
        public Object Skill => AssetDatabase.LoadAssetAtPath<Object>(string.Format(AnimPath, personId));

        // rebuild prefab and display prefab
        public void Rebuild()
        {
            // preset model
            var objPath = AssetDatabase.GetAssetPath(Model);
            var modelImporter = AssetImporter.GetAtPath(objPath) as ModelImporter;
            if (modelImporter)
            {
                modelImporter.avatarSetup = ModelImporterAvatarSetup.CreateFromThisModel;
                AssetDatabase.Refresh();
                modelImporter.SaveAndReimport();
            }

            // Create empty GameObject and parent instantiate asset to it.
            GameObject prefab = new("P_S_" + nameId);
            GameObject objInstance = (GameObject)PrefabUtility.InstantiatePrefab(Model, prefab.transform);

            // Add emoji 
            Transform head = objInstance.transform.Find(Head);
            GameObject emoji = AssetDatabase.LoadAssetAtPath<GameObject>("Assets/Art/Character/Models/Emoji/G_emoji.FBX");
            GameObject emojiInstance = (GameObject)PrefabUtility.InstantiatePrefab(emoji);
            emojiInstance.transform.parent = head;

            // Add magicaCloth component.
            AddMagicaCloth(prefab);

            if (Config is null)
            {
                Debug.LogWarning("无配置信息");
            }
            else
            {
                // add gun
                if (Config.weapon != "")
                {
                    GunInfo gun = new("G" + Config.weapon.PadLeft(5, '0'));
                    Transform grip = objInstance.transform.Find(Grip01);
                    if(grip == null)
                    {
                        Debug.LogError("没有武器挂点，终止");
                        return;
                    }
                    PrefabUtility.InstantiatePrefab(gun.Prefab, grip);
                }
                else
                {
                    Debug.LogWarning("未配置武器，跳过");
                }

                // add bag AA01001
                var bagNameId = nameId[^4] == '0' ? Config.bag_0 : Config.bag_1;

                if (bagNameId != "")
                {
                    BagInfo bag = new(bagNameId);
                    Transform mount01 = objInstance.transform.Find(Mount01);
                    var bagInstance = (GameObject)PrefabUtility.InstantiatePrefab(bag.Prefab, mount01);
                    bagInstance.transform.GetChild(0).Find("B_Root").localEulerAngles = Vector3.zero;
                }

                // add animator controller
                if (Config.aniSet != "")
                {
                    // ReSharper disable once StringLiteralTypo
                    string acPath = $"Assets/Art/Animations/animator/display_ovrride_{Config.aniSet}.overrideController";
                    // config animator controller
                    Animator animator = objInstance.GetComponent<Animator>();
                    var controller = AssetDatabase.LoadAssetAtPath<RuntimeAnimatorController>(acPath);
                    if (controller)
                    {
                        animator.runtimeAnimatorController = controller;
                    }
                    else
                    {
                        Debug.LogWarning($"没有找到 controller: {acPath}");
                    }
                }
                else
                {
                    Debug.LogWarning($"no controller: {Config.aniSet}");
                }
            }

            string displayPath = string.Format(DisplayPath, Category, nameId);
            string prefabPath = string.Format(PrefabPath, Category, nameId);
            PrefabUtility.SaveAsPrefabAssetAndConnect(prefab, displayPath, InteractionMode.AutomatedAction);
            PrefabUtility.SaveAsPrefabAsset(prefab, prefabPath);
            Debug.Log(displayPath);
            Debug.Log(prefab);
        }
        // ReSharper disable once IdentifierTypo
        private static void AddMagicaCloth(GameObject go)
        {
            Transform assetInstance = go.transform.GetChild(0);
            // root bone list
            var allBones = assetInstance.GetComponentsInChildren<Transform>();
            var dynamicBones = allBones.Where(x => x.name.Contains("Hair") || x.name.Contains("Fabric"));
            var rootBones = dynamicBones.Where(x => x.parent.name.Contains("Bip001") && x.childCount != 0).ToArray();

            if (!rootBones.Any())
            {
                return;
            }

            // add new
            GameObject magicaCloth = new("Magica Cloth")
            {
                transform =
                {
                    parent = assetInstance.transform
                }
            };
            MagicaCloth magicaClothComp = magicaCloth.AddComponent<MagicaCloth>();

            // set boneCloth
            magicaClothComp.SerializeData.clothType = ClothProcess.ClothType.BoneCloth;
            magicaClothComp.SerializeData.rootBones = rootBones.ToList();

            // Import preset json.
            string presetPath = Application.dataPath + "/Art/Temp/Editor/JsonData/MC2_Preset_(hair).json";
            string hairPreset = File.ReadAllText(presetPath);
            magicaClothComp.SerializeData.ImportJson(hairPreset);

            // Add magica wind zone
            GameObject wind = new("Magica Wind Zone")
            {
                transform =
                {
                    parent = assetInstance
                }
            };
            var windComponent = wind.AddComponent<MagicaWindZone>();
            windComponent.directionAngleY = -180f;
            windComponent.main = 3;

            // backstop setting
            MotionConstraint.SerializeData ms = new()
            {
                useBackstop = true,
                backstopRadius = 1f,
                backstopDistance = new(0.05f)
            };
            magicaClothComp.SerializeData.motionConstraint = ms;
        }
    }

    public class PlayerInformation : CharacterInfo
    {
        public PlayerInformation(string nameId) : base(nameId) { }

        protected override string Category => "Players";
    }


    public class EnemyInformation : CharacterInfo
    {
        public EnemyInformation(string nameId) : base(nameId) { }

        protected override string Category => "Enemy";
    }

    public class NpcInformation : CharacterInfo
    {
        public NpcInformation(string nameId) : base(nameId) { }

        protected override string Category => "Npc";
    }
}
