using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEditor.UIElements;
using UnityEngine;
using UnityEngine.UIElements;

namespace PrefabInfo
{
    public class Player : MonoBehaviour
    {
        public GameObject prefab;
        public Object controller;
        public Object emoji;
    }
    public class PlayerPrefabInfo : EditorWindow
    {
        TextField playerBinding;
        TextField emojiBingding;
        TextField controllerBinding;
        TextField gunBinding;
        TextField bagBinding;
        TextField skillBinding;

        TextField charaField;
        TextField charaEmoji = null;
        TextField charaController;
        TextField charaGun;
        TextField charaBag;
        TextField charaSkill;

        [MenuItem("Test/prefab工具/角色prefab信息")]
        public static void ShowWindow()
        {
            GetWindow<PlayerPrefabInfo>("Player Prefab Info");
        }
        public void CreateGUI()
        {
            var view = new TwoPaneSplitView(0, 300, TwoPaneSplitViewOrientation.Horizontal);
            var leftPane = new VisualElement();
            view.Add(leftPane);
            var rightPane = new VisualElement();
            view.Add(rightPane);
            rootVisualElement.Add(view);

            playerBinding = new TextField("Player");
            leftPane.Add(playerBinding);
            emojiBingding = new TextField("emoji");
            leftPane.Add(emojiBingding);
            controllerBinding = new TextField("controller");
            leftPane.Add(controllerBinding);
            gunBinding = new TextField("gun");
            leftPane.Add(gunBinding);
            bagBinding = new TextField("bag");
            leftPane.Add(bagBinding);
            skillBinding = new TextField("skill");
            leftPane.Add(skillBinding);

            charaField = new TextField("charactor");
            rightPane.Add(charaField);
            charaEmoji = new TextField("emoji");
            rightPane.Add(charaEmoji);
            charaController = new TextField("controller");
            rightPane.Add(charaController);
            charaGun = new TextField("gun");
            rightPane.Add(charaGun);
            charaBag = new TextField("bag");
            rightPane.Add(charaBag);
            charaSkill = new TextField("skill");
            rightPane.Add(charaSkill);

            Button button1 = new()
            {
                name = "button1",
                text = "create Player_S"
            };
            rootVisualElement.Add(button1);
            button1.RegisterCallback<ClickEvent>(Create);
        }

        public void OnSelectionChange()
        {
            GameObject obj = Selection.activeObject as GameObject;
            if (obj != null)
            {
                ShowPlayer(obj);
                ShowCharactor(obj);
            }

            else
            {
                playerBinding.value = null;
                emojiBingding.value = null;
                controllerBinding.value = null;
                bagBinding.value = null;
                gunBinding.value = null;
                skillBinding.value = null;

                charaField.value = "";
                charaController.value = "";
                charaGun.value = "";
                charaBag.value = "";
                charaSkill.value = "";
            }

        }
        public void ShowPlayer(GameObject obj)
        {
            playerBinding.value = obj.name;
            PlayerSkeleton player = new(obj);
            try { emojiBingding.value = player.Head.Find("G_emoji").name; }
            catch { emojiBingding.value = null; }
            try { controllerBinding.value = player.Asset.GetComponent<Animator>().runtimeAnimatorController.name; }
            catch { controllerBinding.value = null; }
            try { gunBinding.value = player.Grip.GetChild(0).name; }
            catch { gunBinding.value = null; }
            try { bagBinding.value = player.Point01.GetChild(0).name; }
            catch { bagBinding.value = null; }
            try
            {
                string[] guids = AssetDatabase.FindAssets(player.Asset.name, new string[] { $"Assets/Art/Animations/Battle/Skill/" });
                string path = AssetDatabase.GUIDToAssetPath(guids[0]);
                skillBinding.value = AssetDatabase.LoadAssetAtPath<GameObject>(path).name;
            }
            catch
            {
                skillBinding.value = null;
            }
        }
        public void ShowCharactor(GameObject obj)
        {
            if (obj != null)
            {
                Character chara = null;
                try
                {
                    chara = new Character(obj);
                    charaField.value = chara.Name;
                }
                catch
                {
                    charaField.value = "null";
                }
                if (chara != null)
                {
                    try { charaGun.value = chara.Gun.name; }
                    catch { charaGun.value = null; }
                    try { charaBag.value = chara.Bag.name; }
                    catch { charaBag.value = null; }
                    try { charaController.value = chara.Controller; }
                    catch { charaController.value = null; }
                }
            }
        }
        public void Create(ClickEvent evt)
        {
            GameObject[] objectArray = Selection.gameObjects;

            foreach (GameObject obj in objectArray)
            {
                // rename and reset scale
                GameObject prefab = (GameObject)PrefabUtility.InstantiatePrefab(obj);
                Transform assetTransform = prefab.transform.GetChild(0);
                assetTransform.localScale = new Vector3(1, 1, 1);
                prefab.name = "P_S_" + assetTransform.name;

                // config animator controller
                Animator animator = assetTransform.GetComponent<Animator>();
                string[] acName = animator.runtimeAnimatorController.name.Split("_");
                Debug.Log(acName[2]);
                string acPath = $"Assets/Art/Animations/animator/display_ovrride_{acName[2]}.overrideController";
                animator.runtimeAnimatorController = AssetDatabase.LoadAssetAtPath<RuntimeAnimatorController>(acPath);
                // if you want to create a new unique Prefab instead, you need to unpack the Prefab instance first.
                PrefabUtility.UnpackPrefabInstance(prefab, PrefabUnpackMode.OutermostRoot, InteractionMode.UserAction);
                string path = $"Assets/Art/Character/Prefabs/Players_S/{prefab.name}.prefab";
                PrefabUtility.SaveAsPrefabAssetAndConnect(prefab, path, InteractionMode.UserAction);
            }
        }
    }
}