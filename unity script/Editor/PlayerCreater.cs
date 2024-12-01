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
		// display character 用于剧情 story 
		// 一般角色用于构建器生成，player（战斗关卡），enemy（战斗关卡），npc（战斗剧情）

		private List<Person> PersonData => JsonData.GetPersons();
		private List<Npc> NpcData => JsonData.GetNpcs();

		ObjectField PlayerField { get; set; }
		ObjectField GunField { get; set; }
		ObjectField BagField { get; set; }

		[MenuItem("Test/prefab工具/角色")]
		public static void ShowWindow() { GetWindow<PlayerCreater>("角色 Prefab 工具"); }
		public void CreateGUI()
		{
			Box box1 = new Box();
			TextElement text1 = new() { text = "选择 fbx 创建 display character" };
			Button button1 = new() { text = "player enemy npc", name = "button1" };
			PlayerField = new ObjectField();
			GunField = new("Gun");
			BagField = new("Bag");
			rootVisualElement.Add(box1);
			box1.Add(text1);
			box1.Add(button1);
			box1.Add(PlayerField);
			box1.Add(GunField);
			box1.Add(BagField);

			Box box3 = new Box();
			TextElement text3 = new() { text = "创建关卡 character" };
			Button button3 = new() { text = "player enemy" };
			Button button2 = new() { text = "npc" };
			rootVisualElement.Add(box3);
			box3.Add(text3);
			box3.Add(button3);
			box3.Add(button2);

			Box box4 = new Box();
			TextElement text4 = new() { text = "tools" };
			Button btn4 = new() { text = "reset magica cloth" };
			Button btn6 = new() { text = "show in scene" };
			rootVisualElement.Add(box4);
			box4.Add(text4);
			box4.Add(btn4);
			box4.Add(btn6);

			button1.RegisterCallback<ClickEvent>(CreateDisplayCharacter);
			button2.RegisterCallback<ClickEvent>(CreateNpc);
			button3.RegisterCallback<ClickEvent>(CreateCharacter);
			btn4.RegisterCallback<ClickEvent>(ResetMagicaCloth);
			btn6.RegisterCallback<ClickEvent>(ShowInScene);

		}


		// 创建 display player enemy npc, 添加 magica cloth 并初步设置, 添加 emoji, 添加武器背包
		// 从 PersonsData 读取武器，背包，模组
		public void CreateDisplayCharacter(ClickEvent evt)
		{
			GameObject obj = Selection.activeGameObject;
			string id = obj.name;

			// Create empty GameObject and parent instantiate asset to it.
			GameObject prefab = new("P_S_" + id);
			GameObject objInstance = (GameObject)PrefabUtility.InstantiatePrefab(obj, prefab.transform);

			// Add emoji 
			Transform head = objInstance.transform.Find(BoneHelper.HEAD);
			GameObject emoji = AssetDatabase.LoadAssetAtPath<GameObject>("Assets/Art/Character/Models/Emoji/G_emoji.FBX");
			GameObject emojiInstance = (GameObject)PrefabUtility.InstantiatePrefab(emoji);
			emojiInstance.transform.parent = head;

			// Add magicaCloth component.
			AddMagicaCloth(prefab);

			// 查询角色数据 AA01001 A01001 A00001
			string str = id.Substring(id.Length - 3, 3);
			string personId = id.StartsWith("AA") ? "AA00" + str : "A00" + str;
			Person person = PersonData.FirstOrDefault(item => item.id == personId);

			if (person is not null)
			{
				// add gun
				if (person.weapon != "")
				{
					string gunPath = $"Assets/Art/Character/Prefabs/Guns/P_{person.weapon}.prefab";
					var newGun = AssetDatabase.LoadAssetAtPath<GameObject>(gunPath);
					Transform grip = objInstance.transform.Find(BoneHelper.GRIP_01);
					PrefabUtility.InstantiatePrefab(newGun, grip);
					GunField.value = newGun;
				}
				else
				{
					GunField.value = null;
					Debug.LogWarning("未配置武器，跳过");
				}

				// add bag
				string bagName = "";
				if (id.StartsWith("AA"))
				{
					bagName = id.Substring(3, 1) == "0" ? person.bag_0 : person.bag_1;
				}
				else
				{
					bagName = id.Substring(2, 1) == "0" ? person.bag_0 : person.bag_1;
				}
				if (bagName != "")
				{
					string bagPath = $"Assets/Art/Character/Prefabs/Bag/P_{bagName}.prefab";
					var bag = AssetDatabase.LoadAssetAtPath<GameObject>(bagPath);
					Transform mount01 = objInstance.transform.Find(BoneHelper.MOUNT_01);
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
					string acPath = $"Assets/Art/Animations/animator/display_override_{person.aniSet}.overrideController";
					// config animator controller
					Animator animator = objInstance.GetComponent<Animator>();
					animator.runtimeAnimatorController = AssetDatabase.LoadAssetAtPath<RuntimeAnimatorController>(acPath);
				}
			}
			else
			{
				Debug.LogWarning("无武器，背包配置信息");
			}
		}

		// 创建构建用玩家和敌人角色
		public void CreateCharacter(ClickEvent evt)
		{
			GameObject[] objectArray = AnimUtility.FindAssetsByFolder("t:gameObject", new string[] {
				"Assets/Art/Character/Prefabs/Players_S/",
				"Assets/Art/Character/Prefabs/Enemy_S/"
			});

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

		// 通过 NpcsData json 数据 创建
		public void CreateNpc(ClickEvent evt)
		{
			foreach (Npc npc in NpcData)
			{
				string id = npc.id;
				string originPrefabName = npc.originPrefab;
				if (id.StartsWith("BN"))
				{
					// 找到 display prefab 角色
					GameObject oldPrefab = AnimUtility.FindDisplayPrefab(originPrefabName);
					GameObject prefab = (GameObject)PrefabUtility.InstantiatePrefab(oldPrefab);
					// 重命名
					prefab.name = id;
					// 保存 prefab
					PrefabUtility.UnpackPrefabInstance(prefab, PrefabUnpackMode.OutermostRoot, InteractionMode.AutomatedAction);
					string path = $"Assets/Art/Character/Prefabs/Npc/{prefab.name}.prefab";
					PrefabUtility.SaveAsPrefabAssetAndConnect(prefab, path, InteractionMode.AutomatedAction);
					Debug.Log($"创建战斗剧情角色：{prefab}");
				}
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
			var windComponent = wind.AddComponent<MagicaWindZone>();
			windComponent.directionAngleY = -180f;
			windComponent.main = 3;

			// collider setting
			MotionConstraint.SerializeData ms = new() { useBackstop = true, backstopRadius = 1f, backstopDistance = new(0.05f) };
			if (!id.StartsWith("X"))
			{
				magicaClothComp.SerializeData.motionConstraint = ms;
			}
			else
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
