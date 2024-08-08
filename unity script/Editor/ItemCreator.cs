using System.IO;
using MagicaCloth2;
using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using UnityEngine.UIElements;


namespace PersonBrowser
{
    public class ItemCreater : EditorWindow
    {
        /// <summary>
        /// ��ʾui
        /// </summary>
        [MenuItem("Test/prefab����/������������ prefab")]
        public static void ShowWindow() { GetWindow<ItemCreater>("�������� Prefab ����"); }
        public void CreateGUI()
        {
            Button createGunButton = new() { name = "button1", text = "gun" };
            createGunButton.RegisterCallback<ClickEvent>(CreateGun);

            Button createBagButton = new() { name = "button2", text = "bag" };
            createBagButton.RegisterCallback<ClickEvent>(CreateBag);

            TextElement text1 = new() { text = "��project��ѡ��fbx��Դ������������˲���������ԭ����Դ��" };
            rootVisualElement.Add(text1);
            rootVisualElement.Add(createGunButton);
            rootVisualElement.Add(createBagButton);
        }

        /// <summary>
        /// ���� bag prefab
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
        /// �������� prefab, ������ģ������
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
    }
}