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
                GameObject obj = (GameObject)PlayerField.value;
                return obj.transform.GetChild(0);
            }
        }
        private GameObject Gun { get; set; }
        private GameObject Bag { get; set; }

        ObjectField PlayerField { get; set; }
        ObjectField GunField { get; set; }
        ObjectField BagField { get; set; }

        [MenuItem("Test/prefab工具/创建角色 prefab")]
        public static void ShowWindow() { GetWindow<PlayerCreater>("角色 Prefab 工具"); }
        public void CreateGUI()
        {
            VisualElement root = rootVisualElement;
            Box box1 = new Box();
            TextElement text1 = new() { text = "选择角色fbx资源创建prefab" };
            Button button1 = new() { text = "Create", name = "button1" };
            PlayerField = new ObjectField();
            GunField = new("Gun");
            BagField = new("Bag");


            Box box3 = new Box();
            TextElement text3 = new() { text = "选择角色prefab，创建展示用prefab" };
            Button button3 = new() { text = "Create" };

            Box box4 = new Box();
            TextElement text4 = new() { text = "重新设置 Magica Cloth 参数" };
            Button btn4 = new() { text = "reset magica cloth" };

            root.Add(box1);
            box1.Add(text1);
            box1.Add(button1);
            box1.Add(PlayerField);
            box1.Add(GunField);
            box1.Add(BagField);
         
            root.Add(box3);
            box3.Add(text3);
            box3.Add(button3);
            root.Add(box4);
            box4.Add(text4);
            box4.Add(btn4);

            button1.RegisterCallback<ClickEvent>(CreatePlayer);
            button1.RegisterCallback<ClickEvent>(GetGun);
          
            button3.RegisterCallback<ClickEvent>(CreateDisplay);
            btn4.RegisterCallback<ClickEvent>(ResetMagicaCloth);
            
            Button btn5 = new() { text = "重新配置武器" };
            root.Add(btn5);
            btn5.RegisterCallback<ClickEvent>(ResetGun);
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
            AddMagicaCloth(root);

            // add gun
            Transform grip = assetInstance.transform.Find("Root/Bip001/Bip001 Spine/Bip001 Spine1/Bip001 R Clavicle/Bip001 R UpperArm/Bip001 R Forearm/Bip001 R Hand/Grip_point01/");

            string playerId = assetInstance.name.Remove(2, 1).Insert(2, "0");
            string gunName = "P_" + persons.First(item => item.id == playerId).weapon;
            string gunPath = $"Assets/Art/Character/Prefabs/Guns/{gunName}.prefab";
            var newgun = AssetDatabase.LoadAssetAtPath<GameObject>(gunPath);
            PrefabUtility.InstantiatePrefab(newgun, grip);

            // add bag
            Transform point01 = assetInstance.transform.Find("Root/Bip001/Bip001 Spine/Mount_point01/");
            string bagName = "";
            if (assetInstance.name.StartsWith("A00"))
            {
                bagName = "P_" + persons.First(item => item.id == playerId).bag_0;
            }
            else
            {
                bagName = "P_" + persons.First(item => item.id == playerId).bag_1;
            }
            string bagPath = $"Assets/Art/Character/Prefabs/Bag/{bagName}.prefab";
            var bag = AssetDatabase.LoadAssetAtPath<GameObject>(bagPath);
            PrefabUtility.InstantiatePrefab(bag, point01);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="evt"></param>
        public void GetGun(ClickEvent evt)
        {
            PlayerField.value = root;
            string playerId = "";
            if (asset.name.StartsWith("AA"))
            {
                playerId = asset.name.Remove(3, 1).Insert(3, "0");
            }
            else
            {
                playerId = asset.name.Remove(2, 1).Insert(2, "0");

            }

            string gunName = "";
            try
            {
                gunName = persons.First(item => item.id == playerId).weapon;
            }
            catch
            {
                Debug.LogWarning($"{asset.name}:缺少武器配置");
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
        public void AddBag(ClickEvent evt)
        {
            if (BagField.value != null)
            {
                Transform point01 = asset.Find("Root/Bip001/Bip001 Spine/Mount_point01/");
                if (point01 != null)
                {
                    GameObject bag = (GameObject)PrefabUtility.InstantiatePrefab(BagField.value, point01);
                    bag.transform.localEulerAngles = new Vector3(90, 0, 0);
                }
                else
                {
                    Debug.Log("缺少背包挂点，请检查蒙皮文件");
                }
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
                if (assetTransform.name.StartsWith("AA"))
                {
                    assetName = assetTransform.name.Remove(3, 1).Insert(3, "0");
                }
                else
                {
                    assetName = assetTransform.name.Remove(2, 1).Insert(2, "0");
                }
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

        public void ResetMagicaCloth(ClickEvent evt)
        {
            GameObject playerPrefab = Selection.gameObjects[0];

            AddMagicaCloth(playerPrefab);
        }

        public static void AddMagicaCloth(GameObject playerPrefab)
        {
            Transform assetInstance = playerPrefab.transform.GetChild(0);
            // remove old MagicaCloth and add new
            DestroyImmediate(assetInstance.transform.GetComponent<MagicaCloth>());
            if (assetInstance.Find("Magica Cloth"))
            {
                DestroyImmediate(assetInstance.transform.Find("Magica Cloth").gameObject);
            }

            GameObject magicaCloth = new("Magica Cloth");
            magicaCloth.transform.parent = assetInstance.transform;
            MagicaCloth magicaClothComp = magicaCloth.AddComponent<MagicaCloth>();


            magicaClothComp.SerializeData.clothType = ClothProcess.ClothType.BoneCloth; // set boneColth
            // root bone list
            magicaClothComp.SerializeData.rootBones = BoneHelper.GetRootBones(assetInstance.transform.Find("Root/Bip001/")).ToList();

            // Import preset json.
            string player1_preset = File.ReadAllText(Application.dataPath + "/Art/Temp/Editor/MagicaClothPreset/MC2_Preset_(hair).json");
            magicaClothComp.SerializeData.ImportJson(player1_preset);

            // Add magica wind zone
            if (playerPrefab.transform.Find("Magica Wind Zone"))
            {
                DestroyImmediate(playerPrefab.transform.Find("Magica Wind Zone").gameObject);
            }
            if (assetInstance.Find("Magica Wind Zone"))
            {
                DestroyImmediate(assetInstance.transform.Find("Magica Wind Zone").gameObject);
            }

            GameObject wind = new("Magica Wind Zone");
            wind.transform.parent = assetInstance;
            var windComponent = wind.AddComponent<MagicaWindZone>(); // set direction
            windComponent.directionAngleY = -180f;
            windComponent.main = 3;

            // Add Collider
            Transform pelvis = assetInstance.transform.Find("Root/Bip001/Bip001 Pelvis");
            Transform spine = assetInstance.transform.Find("Root/Bip001/Bip001 Spine");
            Transform head = assetInstance.transform.Find("Root/Bip001/Bip001 Spine/Bip001 Spine1/Bip001 Neck/Bip001 Head/");
            // remove old collider first
            if (pelvis.Find($"Magica Sphere Collider ({pelvis.name})"))
            {
                DestroyImmediate(pelvis.Find($"Magica Sphere Collider ({pelvis.name})").gameObject);
            }
            if (spine.Find($"Magica Sphere Collider ({spine.name})"))
            {
                DestroyImmediate(spine.Find($"Magica Sphere Collider ({spine.name})").gameObject);
            }
            if (spine.Find($"Magica Capsule Collider ({spine.name})"))
            {
                DestroyImmediate(spine.Find($"Magica Capsule Collider ({spine.name})").gameObject);
            }
            if (head.Find($"Magica Sphere Collider ({head.name})"))
            {
                DestroyImmediate(head.Find($"Magica Sphere Collider ({head.name})").gameObject);
            }

            GameObject headCollider = new($"Magica Sphere Collider ({head.name})");
            GameObject spineCollider = new($"Magica Capsule Collider ({spine.name})");
            spineCollider.transform.parent = spine;
            spineCollider.transform.ResetLocals();
            headCollider.transform.parent = head;
            headCollider.transform.ResetLocals();

            List<ColliderComponent> colList = new();
            var capsule = spineCollider.AddComponent<MagicaCapsuleCollider>();
            capsule.radiusSeparation = true;
            capsule.SetSize(new Vector3(0.14f, 0.12f, 0.46f)); // startRadius endRadius length
            capsule.center = new Vector3(-0.05f, 0.01f, 0f);
            colList.Add(capsule);
            var sphere = headCollider.AddComponent<MagicaSphereCollider>();
            sphere.SetSize(new Vector3(0.18f, 0.18f, 0.18f));
            sphere.center = new Vector3(-0.2f, 0f, 0f);
            colList.Add(sphere);
            magicaClothComp.SerializeData.colliderCollisionConstraint.colliderList = colList;
        }

        public void ResetGun(ClickEvent evt)
        {
            GameObject[] objectArray = Selection.gameObjects;
            foreach (GameObject obj in objectArray)
            {
                GameObject prefab = (GameObject)PrefabUtility.InstantiatePrefab(obj);
                Transform instance = prefab.transform.GetChild(0);
                Transform grip = instance.Find("Root/Bip001/Bip001 Spine/Bip001 Spine1/Bip001 R Clavicle/Bip001 R UpperArm/Bip001 R Forearm/Bip001 R Hand/Grip_point01/");
                Transform gun = grip.GetChild(0);
                string gunName = "P_" + gun.name.Split('_')[1];
                string gunPath = $"Assets/Art/Character/Prefabs/Guns/{gunName}.prefab";
                var newgun = AssetDatabase.LoadAssetAtPath<GameObject>(gunPath);
                PrefabUtility.InstantiatePrefab(newgun, grip);
                DestroyImmediate(gun);
                string objPath = AssetDatabase.GetAssetPath(obj);
                PrefabUtility.SaveAsPrefabAssetAndConnect(prefab, objPath, InteractionMode.AutomatedAction);
            }
            AssetDatabase.Refresh();
        }
    }
}
