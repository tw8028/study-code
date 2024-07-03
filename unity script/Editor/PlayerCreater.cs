using System.IO;
using MagicaCloth2;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEditor;
using UnityEngine;
using UnityEngine.UIElements;
using UnityEditor.UIElements;


namespace PersonBrowser
{
    public class PlayerCreater : EditorWindow
    {
        private readonly List<Person> persons = JsonData.GetData();
        private GameObject root;
        private Transform asset
        {
            get
            {
                return root.transform.GetChild(0);
            }
        }
        private GameObject Gun { get; set; }
        private GameObject Bag { get; set; }

        ObjectField PlayerField { get; set; }
        ObjectField GunField { get; set; }
        ObjectField BagField { get; set; }

        [MenuItem("Test/prefab工具/创建角色 prefab")]
        public static void ShowWindow()
        {
            var win = GetWindow<PlayerCreater>("角色 Prefab 工具");
            StyleSheet uss = AssetDatabase.LoadAssetAtPath<StyleSheet>("Assets/Art/Temp/Editor/PlayerBrowser/uss2.uss");
            // add styleSheet to rootVisualElement
            win.rootVisualElement.styleSheets.Add(uss);
        }
        public void CreateGUI()
        {
            VisualElement root = rootVisualElement;
            Box box1 = new Box();
            TextElement text1 = new() { text = "选择角色fbx资源创建prefab" };
            Button button1 = new() { text = "Create", name = "button1" };
            PlayerField = new ObjectField();

            Box box2 = new Box();
            TextElement text2 = new() { text = "为角色添加武器背包" };
            GunField = new("Gun");
            BagField = new("Bag");
            Button button2 = new() { text = "Add" };

            Box box3 = new Box();
            TextElement text3 = new() { text = "选择角色prefab，创建展示用prefab" };
            Button button3 = new() { text = "Create" };

            root.Add(box1);
            box1.Add(text1);
            box1.Add(button1);
            box1.Add(PlayerField);
            root.Add(box2);
            box2.Add(text2);
            box2.Add(GunField);
            box2.Add(BagField);
            box2.Add(button2);
            root.Add(box3);
            box3.Add(text3);
            box3.Add(button3);

            button1.RegisterCallback<ClickEvent>(CreatePlayer);
            button1.RegisterCallback<ClickEvent>(GetGun);
            button2.RegisterCallback<ClickEvent>(AddItem);
            button3.RegisterCallback<ClickEvent>(CreateDisplay);
        }

        /// <summary>
        /// 创建 player perfab, 添加 magica cloth 并初步设置, 添加 emoji, 放大1.1倍
        /// </summary>
        /// <param name="evt"></param>
        public void CreatePlayer(ClickEvent evt)
        {
            // Create empty GameObject and parent instantiate asset to it.
            GameObject obj = Selection.activeGameObject;
            root = new("P_" + obj.name);
            GameObject assetInstance = (GameObject)PrefabUtility.InstantiatePrefab(obj, root.transform);

            // Add emoji 
            Transform head = assetInstance.transform.Find("Root/Bip001/Bip001 Spine/Bip001 Spine1/Bip001 Neck/Bip001 Head/");
            GameObject emoji = AssetDatabase.LoadAssetAtPath<GameObject>("Assets/Art/Character/Models/Emoji/G_emoji.FBX");
            GameObject emojiInstance = (GameObject)PrefabUtility.InstantiatePrefab(emoji);
            emojiInstance.transform.parent = head;

            // Scale 1.1
            assetInstance.transform.localScale = new Vector3(1.1f, 1.1f, 1.1f);

            // Add migicaCloth component.
            MagicaCloth mc = assetInstance.AddComponent<MagicaCloth>();
            mc.SerializeData.clothType = ClothProcess.ClothType.BoneCloth; // set boneColth

            // root bone list
            mc.SerializeData.rootBones = BoneHelper.GetRootBones(assetInstance.transform.Find("Root/Bip001/")).ToList();

            // Import preset json.
            string player1_preset = File.ReadAllText(Application.dataPath + "/Art/Temp/Editor/MagicaClothPreset/MC2_Preset_(player1).json");
            mc.SerializeData.ImportJson(player1_preset);

            // Add magica wind zone
            GameObject wind = new("Magica Wind Zone");
            wind.transform.parent = assetInstance.transform;
            wind.AddComponent<MagicaWindZone>().directionAngleX = 180; // set direction
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="evt"></param>
        public void GetGun(ClickEvent evt)
        {
            PlayerField.value = root;           
            string str = asset.name.Remove(2, 1);
            str = str.Insert(2, "0");
            string gunName = "";
            try
            {
                gunName = persons.First(item => item.id == str).weapon;
            }
            catch
            {
                Debug.LogWarning($"无法找到角色{str}拥有的武器");
                return;
            }
            GunField.label = gunName;
            string gunDir = $"Assets/Art/Character/Prefabs/Guns/";
            try
            {
                string[] guids = AssetDatabase.FindAssets(gunName, new string[] { gunDir });
                string path = AssetDatabase.GUIDToAssetPath(guids[0]);
                GunField.value = AssetDatabase.LoadAssetAtPath<Object>(path);
            }
            catch
            {
                GunField.value = null;
            }
        }

        /// <summary>
        /// 添加武器背包到角色prefab
        /// </summary>
        /// <param name="evt"></param>
        public void AddItem(ClickEvent evt)
        {
            if (BagField.value != null)
            {
                Transform point01 = asset.Find("Root/Bip001/Bip001 Spine/Mount_point01/");
                GameObject bag = (GameObject)PrefabUtility.InstantiatePrefab(BagField.value, point01);
                bag.transform.localEulerAngles = new Vector3(90, 0, 0);
            }
            if (GunField.value != null)
            {
                Transform grip = asset.Find("Root/Bip001/Bip001 Spine/Bip001 Spine1/Bip001 R Clavicle/Bip001 R UpperArm/Bip001 R Forearm/Bip001 R Hand/Grip_point01/");
                GameObject gun = (GameObject)PrefabUtility.InstantiatePrefab(GunField.value, grip);
                gun.transform.localEulerAngles = new Vector3(90, 0, 0);
            }
        }

        /// <summary>
        /// 生成 display player, 覆盖原有资源.
        /// </summary>
        /// <param name="evt"></param>
        public void CreateDisplay(ClickEvent evt)
        {
            GameObject[] objectArray = Selection.gameObjects;
            foreach (GameObject obj in objectArray)
            {
                // rename 
                GameObject prefab = (GameObject)PrefabUtility.InstantiatePrefab(obj);
                Transform assetTransform = prefab.transform.GetChild(0);
                prefab.name = "P_S_" + assetTransform.name;

                // reset scale
                assetTransform.localScale = new Vector3(1, 1, 1);

                // 查询动作模组
                string assetName = "";
                assetName = assetTransform.name.Remove(2, 1);
                assetName = assetName.Insert(2, "0");
                string aniSet = persons.First(item => item.id == assetName).aniSet;
                string acPath = $"Assets/Art/Animations/animator/display_ovrride_{aniSet}.overrideController";

                // config animator controller
                Animator animator = assetTransform.GetComponent<Animator>();
                animator.runtimeAnimatorController = AssetDatabase.LoadAssetAtPath<RuntimeAnimatorController>(acPath);

                // if you want to create a new unique Prefab instead, you need to unpack the Prefab instance first.
                PrefabUtility.UnpackPrefabInstance(prefab, PrefabUnpackMode.OutermostRoot, InteractionMode.AutomatedAction);
                string path = $"Assets/Art/Character/Prefabs/Players_S/{prefab.name}.prefab";
                PrefabUtility.SaveAsPrefabAssetAndConnect(prefab, path, InteractionMode.AutomatedAction);
            }
        }
    }
}
