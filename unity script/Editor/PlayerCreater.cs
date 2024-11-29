using System.IO;
using MagicaCloth2;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEditor;
using UnityEngine;
using UnityEngine.UIElements;
using UnityEditor.UIElements;
using Google;


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

        ObjectField PlayerField { get; set; }
        ObjectField GunField { get; set; }
        ObjectField BagField { get; set; }

        [MenuItem("Test/prefab工具/创建角色 prefab")]
        public static void ShowWindow() { GetWindow<PlayerCreater>("角色 Prefab 工具"); }
        public void CreateGUI()
        {
            VisualElement root = rootVisualElement;
            Box box1 = new Box();
            TextElement text1 = new() { text = "选择角色fbx资源创建Player_S" };
            Button button1 = new() { text = "Create", name = "button1" };
            PlayerField = new ObjectField();
            GunField = new("Gun");
            BagField = new("Bag");


            Box box3 = new Box();
            TextElement text3 = new() { text = "选择Player_S, 创建Player" };
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

            button1.RegisterCallback<ClickEvent>(CreatePlayerS);

            button3.RegisterCallback<ClickEvent>(CreatePlayer);
            btn4.RegisterCallback<ClickEvent>(ResetMagicaCloth);

            Button btn5 = new() { text = "重新配置武器" };
            root.Add(btn5);
            btn5.RegisterCallback<ClickEvent>(ResetGun);

            Button btn6 = new() { text = "show in scene" };
            root.Add(btn6);
            btn6.RegisterCallback<ClickEvent>(ShowInScene);
        }

        /// <summary>
        /// 创建 Player_S, 添加 magica cloth 并初步设置, 添加 emoji, 添加武器背包
        /// </summary>
        /// <param name="evt"></param>
        public void CreatePlayerS(ClickEvent evt)
        {
            // Create empty GameObject and parent instantiate asset to it.
            GameObject obj = Selection.activeGameObject;
            root = new("P_S_" + obj.name);
            GameObject assetInstance = (GameObject)PrefabUtility.InstantiatePrefab(obj, root.transform);

            // Add emoji 
            Transform head = assetInstance.transform.Find(BoneHelper.HEAD);
            GameObject emoji = AssetDatabase.LoadAssetAtPath<GameObject>("Assets/Art/Character/Models/Emoji/G_emoji.FBX");
            GameObject emojiInstance = (GameObject)PrefabUtility.InstantiatePrefab(emoji);
            emojiInstance.transform.parent = head;

            // Add migicaCloth component.
            AddMagicaCloth(root);

            // 查询角色数据         
            string playerId = assetInstance.name.StartsWith("AA") ? assetInstance.name.Remove(3, 1).Insert(3, "0") : assetInstance.name.Remove(2, 1).Insert(2, "0");
            Person person = persons.FirstOrDefault(item => item.id == playerId);

            if (person is not null)
            {
                // add gun
                if (person.weapon != "")
                {
                    string gunPath = $"Assets/Art/Character/Prefabs/Guns/P_{person.weapon}.prefab";
                    var newgun = AssetDatabase.LoadAssetAtPath<GameObject>(gunPath);
                    Transform grip = assetInstance.transform.Find(BoneHelper.GRIP_01);
                    PrefabUtility.InstantiatePrefab(newgun, grip);
                    GunField.value = newgun;
                }
                else
                {
                    GunField.value = null;
                    Debug.LogWarning("未配置武器，跳过");
                }

                // add bag，不包含异格角色
                string bagName = "";
                if (assetInstance.name.StartsWith("AA"))
                {
                    bagName = assetInstance.name.Substring(3, 1) == "0" ? person.bag_0 : person.bag_1;
                }
                else
                {
                    bagName = assetInstance.name.Substring(2, 1) == "0" ? person.bag_0 : person.bag_1;
                }
                if (bagName != "")
                {
                    string bagPath = $"Assets/Art/Character/Prefabs/Bag/P_{bagName}.prefab";
                    var bag = AssetDatabase.LoadAssetAtPath<GameObject>(bagPath);
                    Transform mount01 = assetInstance.transform.Find(BoneHelper.MOUNT_01);
                    var bagInstance = (GameObject)PrefabUtility.InstantiatePrefab(bag, mount01);
                    bagInstance.transform.GetChild(0).Find("B_Root").localEulerAngles = Vector3.zero;
                    BagField.value = bag;
                }
                else
                {
                    BagField.value = null;
                }

                // add animator controller
                if (person.aniSet != "")
                {
                    string acPath = $"Assets/Art/Animations/animator/display_ovrride_{person.aniSet}.overrideController";
                    // config animator controller
                    Animator animator = assetInstance.GetComponent<Animator>();
                    animator.runtimeAnimatorController = AssetDatabase.LoadAssetAtPath<RuntimeAnimatorController>(acPath);
                }
            }
            else
            {
                Debug.LogWarning("无武器，背包配置信息");
            }
        }

        // 生成 players
        public void CreatePlayer(ClickEvent evt)
        {
            GameObject[] objectArray = Selection.gameObjects;
            foreach (GameObject obj in objectArray)
            {
                GameObject prefab = (GameObject)PrefabUtility.InstantiatePrefab(obj);
                Transform assetTransform = prefab.transform.GetChild(0);
                string id = assetTransform.name;
                string path;
                if (id.StartsWith("A"))
                {
                    path = $"Assets/Art/Character/Prefabs/Players/P_{id}.prefab";
                }
                else if (id.StartsWith("E"))
                {
                    path = $"Assets/Art/Character/Prefabs/Enemy/P_{id}.prefab";
                }
                else
                {
                    Debug.LogError("不是 player 或 enemy 角色");
                    return;
                }

                // if you want to create a new unique Prefab instead, you need to unpack the Prefab instance first.
                PrefabUtility.UnpackPrefabInstance(prefab, PrefabUnpackMode.OutermostRoot, InteractionMode.AutomatedAction);
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
            string id = assetInstance.name;

            // root bone list
            Transform[] allBones = assetInstance.GetComponentsInChildren<Transform>();
            var dynamicBones = allBones.Where(x => x.name.Contains("Hair") || x.name.Contains("Fabric"));
            var rootBones = dynamicBones.Where(x => x.parent.name.Contains("Bip001") && x.childCount != 0);
            if (rootBones.Count() == 0)
            {
                return;
            }

            // remove old MagicaCloth and add new
            DestroyImmediate(assetInstance.transform.GetComponent<MagicaCloth>());
            if (assetInstance.Find("Magica Cloth"))
            {
                DestroyImmediate(assetInstance.transform.Find("Magica Cloth").gameObject);
            }

            GameObject magicaCloth = new("Magica Cloth");
            magicaCloth.transform.parent = assetInstance.transform;
            MagicaCloth magicaClothComp = magicaCloth.AddComponent<MagicaCloth>();

            // set boneColth
            magicaClothComp.SerializeData.clothType = ClothProcess.ClothType.BoneCloth;
            magicaClothComp.SerializeData.rootBones = rootBones.ToList();

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

            // collider setting

            MotionConstraint.SerializeData ms = new() { useBackstop = true, backstopRadius = 1f, backstopDistance = new(0.05f) };

            if (id.StartsWith("E") || id.StartsWith("N"))
            {
                magicaClothComp.SerializeData.motionConstraint = ms;
            }
            else if (id.StartsWith("A"))
            {
                Transform pelvis = assetInstance.transform.Find(BoneHelper.PELVIS);
                Transform spine = assetInstance.transform.Find(BoneHelper.SPINE);
                Transform head = assetInstance.transform.Find(BoneHelper.HEAD);
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
        }

        public void ResetGun(ClickEvent evt)
        {
            GameObject[] objectArray = Selection.gameObjects;
            foreach (GameObject obj in objectArray)
            {
                GameObject prefab = (GameObject)PrefabUtility.InstantiatePrefab(obj);
                Transform instance = prefab.transform.GetChild(0);
                Transform grip = instance.Find(BoneHelper.GRIP_01);
                Transform gun = grip.GetChild(0);
                string gunName = "P_" + gun.name.Split('_')[1];
                string gunPath = $"Assets/Art/Character/Prefabs/Guns/{gunName}.prefab";
                var newgun = AssetDatabase.LoadAssetAtPath<GameObject>(gunPath);
                PrefabUtility.InstantiatePrefab(newgun, grip);
                DestroyImmediate(gun.gameObject);
                string objPath = AssetDatabase.GetAssetPath(obj);
                PrefabUtility.SaveAsPrefabAssetAndConnect(prefab, objPath, InteractionMode.AutomatedAction);
            }
            AssetDatabase.SaveAssets();
            AssetDatabase.Refresh();
        }

        public void ShowInScene(ClickEvent evt)
        {
            GameObject[] objs = Selection.gameObjects;
            for (int i = 0; i < objs.Length; i++)
            {
                GameObject prefab = (GameObject)PrefabUtility.InstantiatePrefab(objs[i]);
                prefab.transform.localPosition = new Vector3(-i, 0, 0);
            }
        }
    }
}
