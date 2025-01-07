using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor;
using UnityEngine.UIElements;
using PersonBrowser;
using Sirenix.Utilities;
using Framework;
using CharacterData;
using System.IO;

namespace PrefabTool
{
    public class PrefabBuilderWin : EditorWindow
    {
        [MenuItem("Test/prefab工具/Prefab Builder")]
        public static void ShowWindow() { GetWindow<PrefabBuilderWin>("Prefab Builder"); }

        public void CreateGUI()
        {
            Label label1 = new() { text = "Select fbx to build prefab" };
            label1.style.unityTextAlign = TextAnchor.MiddleCenter;
            label1.style.height = 30;
            rootVisualElement.Add(label1);

            Button btn1 = new() { text = "apply" };
            btn1.style.height = 30;
            rootVisualElement.Add(btn1);
            btn1.RegisterCallback<ClickEvent>(evt => CreatePrefab());


            Label label2 = new() { text = "using prefab to rebuild" };
            label2.style.unityTextAlign = TextAnchor.MiddleCenter;
            label2.style.height = 30;
            rootVisualElement.Add(label2);

            Button btn2 = new() { text = "story car (select prefab)" };
            btn2.style.height = 30;
            rootVisualElement.Add(btn2);
            btn2.RegisterCallback<ClickEvent>(evt => CreateDisplayCar());

            Button btn3 = new() { text = "auto battery (select prefab)" };
            btn3.style.height = 30;
            rootVisualElement.Add(btn3);
            btn3.RegisterCallback<ClickEvent>(evt => CreateAutoBattery());

            Button btn4 = new() { text = "battle story character (by config)" };
            btn4.style.height = 30;
            rootVisualElement.Add(btn4);
            btn4.RegisterCallback<ClickEvent>(evt => CreateBattleCharacter());

            Label label3 = new() { text = "test" };
            label3.style.unityTextAlign = TextAnchor.MiddleCenter;
            label3.style.height = 30;
            rootVisualElement.Add(label3);
            Button test = new() { text = "combine skinned mesh" };
            test.style.height = 30;
            rootVisualElement.Add(test);
            test.RegisterCallback<ClickEvent>(evt => Combine());

            Button show = new() { text = "show object" };
            show.style.height = 30;
            rootVisualElement.Add(show);
            show.RegisterCallback<ClickEvent>(evt => ShowInScene());
        }

        /// <summary>
        /// 所有 item 变色必须手动创建预制体变体
        /// </summary>
        /// <param name="go"></param>
        public static void CreatePrefab()
        {
            foreach (GameObject go in Selection.gameObjects)
            {
                string id = go.name;
                if (id.StartsWith("B"))
                {
                    BagInfo bag = new(id);
                    bag.Rebuild();
                }
                else if (id.StartsWith("G"))
                {
                    GunInfo gun = new(id);
                    gun.Rebuild();
                }
                else if (id.StartsWith("R"))
                {
                    AnimHelper.PreSetModel(go);
                    BatteryInfo battery = new(id);
                    battery.Rebuild();
                }
                else if (id.StartsWith("C"))
                {
                    AnimHelper.PreSetModel(go);
                    VehicleInfo car = new(id);
                    car.Rebuild();
                }

                else if (id.StartsWith("A"))
                {
                    PlayerInformation player = new(id);
                    player.Rebuild();
                }
                else if (id.StartsWith("E"))
                {
                    EnemyInformation enemy = new(id);
                    enemy.Rebuild();
                }
                else if (id.StartsWith("N"))
                {
                    NpcInformation npc = new(id);
                    npc.Rebuild();
                }
                else
                {
                    Debug.LogWarning("Invalid file name");
                }
            }
            AssetDatabase.Refresh();
        }

        /// <summary>
        /// 使用 prefab 生成
        /// </summary>
        /// <param name="go"></param>
        public static void CreateDisplayCar()
        {
            foreach (GameObject go in Selection.gameObjects)
            {
                string id = go.name.Split('_')[1];
                if (!id.StartsWith("C"))
                {
                    Debug.LogWarning("is not car prefab");
                    return;
                }

                VehicleInfo car = new(id);
                car.RebuildDisplay();
            }
        }
        public static void CreateAutoBattery()
        {
            foreach (GameObject go in Selection.gameObjects)
            {
                string id = go.name.Split('_')[1];
                if (!id.StartsWith("R"))
                {
                    Debug.LogWarning("is not battery prefab");
                    return;
                }
                BatteryInfo battery = new(id);
                battery.RebuildAuto();
            }
        }

        // 战斗角色 由 player npc 等创建
        public static void CreateBattleCharacter()
        {
            var battleCharacterData = EditorTableManager.instance.tables.FightNPCConfig.DataList;
            foreach (var battleCharacter in battleCharacterData)
            {
                string id = battleCharacter.NameId;
                string modelNameId = battleCharacter.NameRead.Split("_")[0];
                if (id.StartsWith("BN"))
                {
                    // 找到 display prefab 角色
                    GameObject oldPrefab = AnimHelper.FindDisplayPrefab(modelNameId);
                    GameObject prefab = (GameObject)PrefabUtility.InstantiatePrefab(oldPrefab);
                    // 重命名
                    prefab.name = "P_" + id;
                    // 保存 prefab
                    PrefabUtility.UnpackPrefabInstance(prefab, PrefabUnpackMode.OutermostRoot, InteractionMode.AutomatedAction);
                    string path = $"Assets/Art/Character/Prefabs/Npc/{prefab.name}.prefab";
                    PrefabUtility.SaveAsPrefabAssetAndConnect(prefab, path, InteractionMode.AutomatedAction);
                    Debug.Log($"创建战斗剧情角色：{prefab}");
                }
            }
        }

        public void ShowInScene()
        {
            GameObject[] objects = Selection.gameObjects;
            for (int i = 0; i < objects.Length; i++)
            {
                GameObject prefab = (GameObject)PrefabUtility.InstantiatePrefab(objects[i]);
                prefab.transform.localPosition = new Vector3(-i, 0, 0);
            }
        }

        public void Combine()
        {
            GameObject obj = Selection.activeGameObject;
            AnimHelper.PreSetAll(obj);
            var go = Object.Instantiate<GameObject>(obj);
            var nameId = obj.name.Split('_')[2];
            var texNames = new string[] { "_MainTex", "_MaskTex" };
            var parentPath = $"Assets/Art/temp/Prefab/character_{nameId}";
            if (!Directory.Exists(parentPath))
            {
                Directory.CreateDirectory(parentPath);
            }

            AnimHelper.CombineSkinSaveAssets(go, texNames, parentPath);
            // save prefab
            string path = $"{parentPath}/character_{nameId}.prefab";
            PrefabUtility.SaveAsPrefabAssetAndConnect(go, path, InteractionMode.AutomatedAction);
        }
    }
}
