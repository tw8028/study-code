using System.Collections.Generic;
using System.Linq;
using Art.temp.Editor.CharacterData;
using Art.temp.Editor.PrefabTool;
using UnityEditor;
using UnityEditor.UIElements;
using UnityEngine;
using UnityEngine.UIElements;

namespace Art.temp.Editor.PlayerBrowser
{
    public class PlayerBrowserWindow : EditorWindow
    {
        private VisualElement a00Pane;
        private VisualElement a01Pane;
        [MenuItem("Test/prefab工具/角色浏览器")]
        public static void ShowEditor()
        {
            var win = GetWindow<PlayerBrowserWindow>("Player Browser");
            win.minSize = new Vector2(900, 400);
        }
        public void CreateGUI()
        {
            // 布局
            var view = new TwoPaneSplitView(0, 200, TwoPaneSplitViewOrientation.Horizontal);
            var listPane = new ListView();
            var playerPane = new TwoPaneSplitView(0, 350, TwoPaneSplitViewOrientation.Horizontal);
            a00Pane = new VisualElement();
            a01Pane = new VisualElement();

            rootVisualElement.Add(view);
            view.Add(listPane);
            view.Add(playerPane);
            playerPane.Add(a00Pane);
            playerPane.Add(a01Pane);

            // 列表元素 item
            var personArray = JsonData.GetPersons().Where(a => a.id[0] == 'A').ToArray();
            listPane.makeItem = () => new Label();
            listPane.bindItem = (item, index) =>
            {
                ((Label)item).text = $"{personArray[index].id}  {personArray[index].name}";

                string personId = personArray[index].id;
                char[] chars = personId.ToCharArray();
                chars[personId.Length - 4] = '1';
                string nameId = new(chars);

                PlayerInformation player1 = new(personId);
                PlayerInformation player2 = new(nameId);
                if (player1.AutoPrefab)
                {
                    ((Label)item).style.color = Color.green;
                }
                else
                {
                    if (
                    player1.Skill
                    && (player1.Model ? player1.Model.transform.Find("Root") : null)
                    && (player2.Model ? player2.Model.transform.Find("Root") : null)
                    )
                    {
                        ((Label)item).style.color = Color.yellow;
                    }
                    else
                    {
                        ((Label)item).style.color = Color.white;
                    }
                }
            };

            listPane.itemsSource = personArray;
            listPane.selectionChanged += OnIDSelectionChange;
        }

        private void OnIDSelectionChange(IEnumerable<object> selectedItems)
        {
            a00Pane.Clear();
            a01Pane.Clear();
            if(selectedItems.First() is not Person selectedPerson) return;
            string personId = selectedPerson.id;

            CreateVe(a00Pane, personId);

            char[] chars = personId.ToCharArray();
            chars[personId.Length - 4] = '1';
            CreateVe(a01Pane, new string(chars));
        }

        private static void CreateVe(VisualElement pane, string nameId)
        {
            PlayerInformation player = new(nameId);

            pane.Add(new Label("资源完成度"));
            pane.Add(new ObjectField("模型") { value = player.Model });
            pane.Add(new ObjectField("蒙皮") { value = player.Model ? player.Model.transform.Find("Root") : null });
            pane.Add(new ObjectField("技能") { value = player.Skill });
            pane.Add(new ObjectField("Display Prefab") { value = player.DisplayPrefab });
            pane.Add(new ObjectField("Auto Prefab") { value = player.AutoPrefab });
        }
    }
}