using System.Collections;
using System.Linq;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor;
using UnityEditor.UIElements;
using UnityEngine.UIElements;

namespace PersonBrowser
{
    public class PrefabInfo : EditorWindow
    {
        ObjectField charaField = null;
        ObjectField gunField = null;
        ObjectField bagField = null;

        List<Person> Persons = JsonData.GetData();
        Box box1;

        [MenuItem("Test/Skelton", false)]
        public static void ShowWindow() { GetWindow<PrefabInfo>("结构信息"); }

        public void CreateGUI()
        {
            box1 = new Box();
            box1.style.marginTop = 60;
            rootVisualElement.Add(box1);
        }
        public void OnSelectionChange()
        {
            ShowSelected();
        }

        private void ShowSelected()
        {
            box1.Clear();
            GameObject selected = Selection.activeObject as GameObject;
            try
            {
                selected.transform.GetChild(0);
            }
            catch
            {
                return;
            }
            PlayerInfo info = new(selected.transform.GetChild(0).name);
            info.Player = selected;

            ObjectField playerField = new("Player");
            playerField.value = info.Player;
            box1.Add(playerField);

            ObjectField skillField = new("----skill");
            skillField.value = info.Skill;
            box1.Add(skillField);

            ObjectField emojiField = new("----emoji");
            emojiField.value = info.Emoji;
            box1.Add(emojiField);

            ObjectField gunField = new("----gun");
            gunField.value = info.Gun;
            box1.Add(gunField);

            ObjectField bagField = new("----bag");
            bagField.value = info.Bag;
            box1.Add(bagField);
        }
        private void EditPlayer(ClickEvent evt)
        {
            GameObject prefabRoot = (GameObject)PrefabUtility.InstantiatePrefab(charaField.value);
            Transform assetInstance = prefabRoot.transform.GetChild(0);
            Debug.Log(assetInstance.name);


            if (bagField.value != null)
            {
                Transform point01 = assetInstance.Find("Root/Bip001/Bip001 Spine/Mount_point01/");
                GameObject bag = (GameObject)PrefabUtility.InstantiatePrefab(bagField.value, point01);
                bag.transform.localEulerAngles = new Vector3(90, 0, 0);
            }
            if (gunField.value != null)
            {
                Transform grip = assetInstance.Find("Root/Bip001/Bip001 Spine/Bip001 Spine1/Bip001 R Clavicle/Bip001 R UpperArm/Bip001 R Forearm/Bip001 R Hand/Grip_point01/");
                GameObject gun = (GameObject)PrefabUtility.InstantiatePrefab(gunField.value, grip);
                gun.transform.localEulerAngles = new Vector3(90, 0, 0);
            }
        }
        private void OnPlayerChengedEvent(ChangeEvent<Object> evt)
        {
            var player = charaField.value as GameObject;
            string name = player.transform.GetChild(0).name;
            string str = "";
            str = name.Remove(2, 1);
            str = str.Insert(2, "0");
            string gunName = Persons.First(item => item.id == str).weapon;
            gunField.label = gunName;
            string gunDir = $"Assets/Art/Character/Prefabs/Guns/";
            try
            {
                string[] guids = AssetDatabase.FindAssets(gunName, new string[] { gunDir });
                string path = AssetDatabase.GUIDToAssetPath(guids[0]);
                gunField.value = AssetDatabase.LoadAssetAtPath<Object>(path);
            }
            catch
            {
                gunField.value = null;
            }
        }
    }
}