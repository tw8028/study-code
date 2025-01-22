using System.IO;
using Art.temp.Editor.CharacterData;
using Framework;
using UnityEditor;
using UnityEngine;
using UnityEngine.UIElements;

namespace Art.temp.Editor.PrefabTool
{
    public class PrefabBuilderWin : EditorWindow
    {
        [MenuItem("Test/prefab工具/Prefab Builder")]
        public static void ShowWindow()
        {
            GetWindow<PrefabBuilderWin>("Prefab Builder");
        }

        public void CreateGUI()
        {
            var styleSheet = AssetDatabase.LoadAssetAtPath<StyleSheet>("Assets/Art/temp/Editor/CommonUSSFile.uss");
            rootVisualElement.styleSheets.Add(styleSheet);
            Label label1 = new() { text = "Select fbx to build prefab" };
            rootVisualElement.Add(label1);

            Button btn1 = new() {text ="apply" };
            rootVisualElement.Add(btn1);
            btn1.RegisterCallback<ClickEvent>(_ => CreatePrefab());


            Label label2 = new() {  text = "using prefab to rebuild"};
            rootVisualElement.Add(label2);

            Button btn2 = new() { text = "story car (select prefab)" };
            rootVisualElement.Add(btn2);
            btn2.RegisterCallback<ClickEvent>(_ => CreateDisplayCar());

            Button btn3 = new() { text = "auto battery (select prefab)" };
            rootVisualElement.Add(btn3);
            btn3.RegisterCallback<ClickEvent>(_ => CreateAutoBattery());

            Button btn4 = new() { text = "battle story character (by config)" };
            rootVisualElement.Add(btn4);
            btn4.RegisterCallback<ClickEvent>(_ => CreateBattleCharacter());

            Label label3 = new() { text = "test" };
            rootVisualElement.Add(label3);
            Button test = new() { text = "combine skinned mesh" };
            rootVisualElement.Add(test);
            test.RegisterCallback<ClickEvent>(_ => Combine());

            Button show = new() { text = "show object" };
            rootVisualElement.Add(show);
            show.RegisterCallback<ClickEvent>(_ => ShowInScene());
        }


        private static void CreatePrefab()
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


        // 使用 prefab 生成
        private static void CreateDisplayCar()
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

        private static void CreateAutoBattery()
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
        private static void CreateBattleCharacter()
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
                    PrefabUtility.UnpackPrefabInstance(prefab, PrefabUnpackMode.OutermostRoot,
                        InteractionMode.AutomatedAction);
                    string path = $"Assets/Art/Character/Prefabs/Npc/{prefab.name}.prefab";
                    PrefabUtility.SaveAsPrefabAssetAndConnect(prefab, path, InteractionMode.AutomatedAction);
                    Debug.Log($"创建战斗剧情角色：{prefab}");
                }
            }
        }

        private void ShowInScene()
        {
            var objects = Selection.gameObjects;
            for (int i = 0; i < objects.Length; i++)
            {
                GameObject prefab = (GameObject)PrefabUtility.InstantiatePrefab(objects[i]);
                prefab.transform.localPosition = new Vector3(-i, 0, 0);
            }
        }

        private static void Combine()
        {
            GameObject obj = Selection.activeGameObject;
            AnimHelper.PreSetAll(obj);
            var go = Object.Instantiate(obj);
            var nameId = obj.name.Split('_')[2];
            var texNames = new[] { "_MainTex", "_MaskTex" };
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