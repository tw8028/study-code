using System.IO;
using MagicaCloth2;
using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using UnityEngine.UIElements;
using UnityEngine.Analytics;
using System.Linq;
using NPOI.HSSF.Record;


namespace PersonBrowser
{
    public class ItemCreater : EditorWindow
    {
        public string GunsInfo { get; set; }
        /// <summary>
        /// 显示ui
        /// </summary>
        [MenuItem("Test/prefab工具/创建武器背包 prefab")]
        public static void ShowWindow() { GetWindow<ItemCreater>("武器背包 Prefab 工具"); }
        public void CreateGUI()
        {
            Button createGunButton = new() { name = "button1", text = "gun" };
            createGunButton.RegisterCallback<ClickEvent>(CreateGun);

            Button createBagButton = new() { name = "button2", text = "bag" };
            createBagButton.RegisterCallback<ClickEvent>(CreateBag);

            TextElement text1 = new() { text = "在project中选择fbx资源，点击创建，此操作将覆盖原有资源。" };
            TextElement text2 = new() { text = Check() + "\n--end" };
            rootVisualElement.Add(text1);
            rootVisualElement.Add(createGunButton);
            rootVisualElement.Add(createBagButton);
            rootVisualElement.Add(text2);
        }

        /// <summary>
        /// 创建 bag prefab
        /// </summary>
        /// <param name="evt"></param>
        public void CreateBag(ClickEvent evt)
        {
            GameObject[] objectArray = Selection.gameObjects;
            foreach (GameObject obj in objectArray)
            {
                // Create empty GameObject and parent instantiate asset to it.
                GameObject root = new("P_" + obj.name);
                GameObject assetInstance = (GameObject)PrefabUtility.InstantiatePrefab(obj, root.transform);

                // Add migicaCloth component.
                MagicaCloth mc = assetInstance.AddComponent<MagicaCloth>();
                mc.SerializeData.clothType = ClothProcess.ClothType.BoneCloth;
                mc.SerializeData.rootBones = new List<Transform> { BoneHelper.GetBoneByName(assetInstance.transform, "bone001") };

                // Import preset json.
                string player1_preset = File.ReadAllText(Application.dataPath + "/Art/Temp/Editor/MagicaClothPreset/MC2_Preset_(bag).json");
                mc.SerializeData.ImportJson(player1_preset);

                // save 
                string path = $"Assets/Art/Character/Prefabs/Bag/{root.name}.prefab";
                PrefabUtility.SaveAsPrefabAssetAndConnect(root, path, InteractionMode.AutomatedAction);
            }
        }

        /// <summary>
        /// 创建武器 prefab, 并根据模组命名
        /// </summary>
        /// <param name="evt"></param>
        public void CreateGun(ClickEvent evt)
        {
            // path = "Assets/Art/Character/Prefabs/Guns/"
            GameObject[] objectArray = Selection.gameObjects;

            foreach (GameObject obj in objectArray)
            {
                string set = obj.name.Split("_")[1];
                string setName = "";
                switch (set)
                {
                    case "ar":
                        setName = "g01";
                        break;
                    case "dmr":
                        setName = "g02";
                        break;
                    case "bar":
                        setName = "g03";
                        break;

                    case "bow":
                        setName = "g04";
                        break;

                    case "sg":
                        setName = "g05";
                        break;

                    case "sar":
                        setName = "lever_g06";
                        break;

                    case "lmg":
                        setName = "g08";
                        break;
                    case "hf":
                        setName = "g11";
                        break;
                }
                string name = $"P_{obj.name}_{setName}";
                string path = $"Assets/Art/Character/Prefabs/Guns/{name}.prefab";
                // create empty
                GameObject root = new(name);
                // instantiate asset object, then add to empty object
                GameObject assetInstance = (GameObject)PrefabUtility.InstantiatePrefab(obj, root.transform);
                // save prefab
                PrefabUtility.SaveAsPrefabAssetAndConnect(root, path, InteractionMode.AutomatedAction);
            }
        }
        public Object[] FindAssetsByDir(string filter, string[] folders)
        {
            string[] guids = AssetDatabase.FindAssets(filter, folders);
            var paths = guids.Select(e => AssetDatabase.GUIDToAssetPath(e));
            return paths.Select(e => AssetDatabase.LoadAssetAtPath<Object>(e)).ToArray();
        }
        public string Check()
        {
            var gunsFbx = FindAssetsByDir("t:GameObject", new string[] { "Assets/Art/Character/Models/Guns/" });
            var gunsFbx_id = gunsFbx.Select(e => e.name.Split('_')[0]);
            var gunsPrefab = FindAssetsByDir("t:prefab", new string[] { "Assets/Art/Character/Prefabs/Guns/" });
            var gunsPrefab_id = gunsPrefab.Select(e => e.name.Split('_')[1]);
            var gunsNoFind = gunsFbx_id.Where(e => gunsPrefab_id.FirstOrDefault(f=>f==e) == null);
            string result = "以下武器缺少prefab";
            foreach (var item in gunsNoFind)
            {
                result = result + "\n" + item;
               // Debug.Log(item.n + "haha");
            }
            //Debug.Log(gunsFbx[1].name);
            return result;
        }
    }
}
