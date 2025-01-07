using System.Collections;
using System.Linq;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using UnityEngine.UIElements;
using UnityEditor.UIElements;
using CharacterData;
using PrefabTool;
using CriWare.CriMana;

namespace PersonBrowser
{
    public class PlayerBrowserWindow : EditorWindow
    {
        VisualElement A00Pane;
        VisualElement A01Pane;
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
            A00Pane = new VisualElement();
            A01Pane = new VisualElement();

            rootVisualElement.Add(view);
            view.Add(listPane);
            view.Add(playerPane);
            playerPane.Add(A00Pane);
            playerPane.Add(A01Pane);

            // 列表元素 item
            var personArray = JsonData.GetPersons().Where(a => a.id[0] == 'A').ToArray();
            listPane.makeItem = () => new Label();
            listPane.bindItem = (item, index) =>
            {
                (item as Label).text = $"{personArray[index].id}  {personArray[index].name}";

                string personId = personArray[index].id;
                char[] chars = personId.ToCharArray();
                chars[personId.Length - 4] = '1';
                string nameId = new(chars);

                PlayerInformation player1 = new(personId);
                PlayerInformation player2 = new(nameId);
                if (player1.AutoPrefab)
                {
                    (item as Label).style.color = Color.green;
                }
                else
                {
                    if (
                    player1.Skill
                    && (player1.Model ? player1.Model.transform.Find("Root") : null)
                    && (player2.Model ? player2.Model.transform.Find("Root") : null)
                    )
                    {
                        (item as Label).style.color = Color.yellow;
                    }
                    else
                    {
                        (item as Label).style.color = Color.white;
                    }
                }
            };

            listPane.itemsSource = personArray;
            listPane.selectionChanged += OnIDSelectionChange;
        }

        private void OnIDSelectionChange(IEnumerable<object> selectedItems)
        {
            A00Pane.Clear();
            A01Pane.Clear();
            var selectedPerson = selectedItems.First() as Person;
            string personId = selectedPerson.id;

            if (selectedPerson == null)
            {
                return;
            }

            CreateVE(A00Pane, personId);

            char[] chars = personId.ToCharArray();
            chars[personId.Length - 4] = '1';
            CreateVE(A01Pane, new string(chars));
        }

        private void CreateVE(VisualElement pane, string nameId)
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