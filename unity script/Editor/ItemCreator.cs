using System.IO;
using MagicaCloth2;
using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using UnityEngine.UIElements;
using System.Linq;


namespace PersonBrowser
{
	public class ItemCreator : EditorWindow
	{
		[MenuItem("Test/prefab工具/P_武器背包")]
		public static void ShowWindow() { GetWindow<ItemCreator>("武器背包 Prefab 工具"); }
		public void CreateGUI()
		{
			Button createGunButton = new() { name = "button1", text = "gun" };
			rootVisualElement.Add(createGunButton);
			createGunButton.RegisterCallback<ClickEvent>(CreateGun);

			Button createBagButton = new() { name = "button2", text = "bag" };
			rootVisualElement.Add(createBagButton);
			createBagButton.RegisterCallback<ClickEvent>(CreateBag);
		}

		public void CreateBag(ClickEvent evt)
		{
			GameObject[] objectArray = AnimUtility.FindAssetsByFolder("t:gameObject", new string[] { "Assets/Art/Character/Models/Bag/" });
			foreach (GameObject obj in objectArray)
			{
				// Create empty GameObject and parent instantiate asset to it.
				GameObject prefab = new("P_" + obj.name);
				GameObject assetInstance = (GameObject)PrefabUtility.InstantiatePrefab(obj, prefab.transform);

				// root 归零
				if (assetInstance.transform.Find("B_Root") == null)
				{
					Debug.LogWarning($"未蒙皮模型: {assetInstance.name}");
					return;
				}
				var b_root = assetInstance.transform.Find("B_Root");
				b_root.localEulerAngles = Vector3.zero;

				// Add migicaCloth component. 
				MagicaCloth mc = assetInstance.AddComponent<MagicaCloth>();
				mc.SerializeData.clothType = ClothProcess.ClothType.BoneCloth;
				mc.SerializeData.rootBones = new List<Transform> { b_root.GetChild(0) };

				// Import preset json.
				string player1_preset = File.ReadAllText(Application.dataPath + "/Art/Temp/Editor/MagicaClothPreset/MC2_Preset_(bag).json");
				mc.SerializeData.ImportJson(player1_preset);

				// save 
				string path = $"Assets/Art/Character/Prefabs/Bag/{prefab.name}.prefab";
				PrefabUtility.SaveAsPrefabAssetAndConnect(prefab, path, InteractionMode.AutomatedAction);
				Debug.Log(path);
			}
		}

		
		public void CreateGun(ClickEvent evt)
		{
			// path = "Assets/Art/Character/Prefabs/Guns/"
			GameObject[] objectArray = AnimUtility.FindAssetsByFolder("t:GameObject", new string[] { "Assets/Art/Character/Models/Guns/" });

			foreach (GameObject obj in objectArray)
			{
				string name = obj.name.Split("_")[0];

				string prefabName = $"P_{name}";
				string path = $"Assets/Art/Character/Prefabs/Guns/{prefabName}.prefab";
				// create empty
				GameObject root = new(prefabName);
				// instantiate asset object, then add to empty object
				GameObject assetInstance = (GameObject)PrefabUtility.InstantiatePrefab(obj, root.transform);
				if (assetInstance.transform.Find("G_Root") == null)
				{
					Debug.LogWarning($"没有G_Root,跳过创建：{assetInstance.name}");
					continue;
				}
				assetInstance.transform.Find("G_Root").localEulerAngles = Vector3.zero;
				// save prefab
				PrefabUtility.SaveAsPrefabAssetAndConnect(root, path, InteractionMode.AutomatedAction);
				Debug.Log(path);
			}
		}
	}
}
