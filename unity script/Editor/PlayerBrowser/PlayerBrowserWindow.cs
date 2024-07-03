using System.Collections;
using System.Linq;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using UnityEngine.UIElements;
using UnityEditor.UIElements;


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
            StyleSheet uss = AssetDatabase.LoadAssetAtPath<StyleSheet>("Assets/Art/Temp/Editor/PlayerBrowser/uss1.uss");
            // add styleSheet to rootVisualElement
            win.rootVisualElement.styleSheets.Add(uss);
            win.minSize = new Vector2(900, 700);
        }
        public void CreateGUI()
        {
            var view = new TwoPaneSplitView(0, 200, TwoPaneSplitViewOrientation.Horizontal);

            rootVisualElement.Add(view);
            var listPane = new ListView();
            var playerPane = new TwoPaneSplitView(0, 350, TwoPaneSplitViewOrientation.Horizontal);

            A00Pane = new VisualElement();
            A01Pane = new VisualElement();
            view.Add(listPane);
            view.Add(playerPane);
            playerPane.Add(A00Pane);
            playerPane.Add(A01Pane);


            var allPersons = JsonData.GetData();
            listPane.makeItem = () => new Label();
            listPane.bindItem = (item, index) =>
            {
                (item as Label).text = allPersons[index].id + "  " + allPersons[index].name;
                string id_a01 = allPersons[index].id;
                id_a01 = id_a01.Remove(2, 1);
                id_a01 = id_a01.Insert(2, "1");
                PlayerInfo info00 = new PlayerInfo(allPersons[index].id);
                PlayerInfo info01 = new PlayerInfo(id_a01);
                if (info00.State == Color.red || info01.State == Color.red)
                {
                    (item as Label).style.color = Color.red;
                }
                else
                {
                    (item as Label).style.color = info00.State == info01.State ? info00.State : Color.yellow;
                }
            };
            listPane.itemsSource = allPersons;

            listPane.selectionChanged += OnIDSelectionChange;
        }
        private void OnIDSelectionChange(IEnumerable<object> selectedItems)
        {
            A00Pane.Clear();
            A01Pane.Clear();
            var selectedPerson = selectedItems.First() as Person;
            if (selectedPerson == null)
            {
                return;
            }
            CreateVE(A00Pane, selectedPerson.id, selectedPerson);
            string str = selectedPerson.id;
            str = str.Remove(2, 1);
            str = str.Insert(2, "1");
            CreateVE(A01Pane, str, selectedPerson);
        }
        private void CreateVE(VisualElement pane, string id, Person selectedPerson)
        {
            PlayerInfo info = new(id);

            // assets in \\192.168.2.222\project_A
            Box box4 = new Box();
            pane.Add(box4);
            box4.Add(new Label("192.168.2.222/project_A"));

            TextField modelField = new TextField("模型");
            TextField skinfbxField = new TextField("蒙皮");
            TextField anifbxField = new TextField("技能动作");
            box4.Add(modelField);
            box4.Add(modelField);
            box4.Add(skinfbxField);
            box4.Add(anifbxField);

            modelField.value = info.ModelFile;
            anifbxField.value = info.AniFile;
            skinfbxField.value = info.SkinFile;

            // assets in editor
            Box box1 = new Box();
            pane.Add(box1);
            box1.Add(new Label("Prefab"));

            ObjectField playerField = new("Player");
            playerField.value = info.Player;
            box1.Add(playerField);

            ObjectField skillField = new("----skill");
            skillField.value = info.Skill;
            box1.Add(skillField);

            TextField emojiField = new("----emoji");
            if (info.Emoji != null) emojiField.value = info.Emoji.name;
            box1.Add(emojiField);

            TextField gunField = new(selectedPerson.weapon);
            if (info.Gun != null) gunField.value = info.Gun.name;
            box1.Add(gunField);

            TextField bagField = new("----bag");
            if (info.Bag != null) bagField.value = info.Bag.name;
            box1.Add(bagField);

            ObjectField player_ac_field = new("----controller");
            player_ac_field.value = info.Player_ac;
            box1.Add(player_ac_field);

            // player_s
            Box box2 = new Box();
            pane.Add(box2);
            box2.Add(new Label("Prefab"));

            ObjectField displayField = new("Player_S");
            displayField.value = info.Display;
            box2.Add(displayField);

            ObjectField display_ac_field = new("----controller");
            display_ac_field.value = info.Display_ac;
            box2.Add(display_ac_field);

            // AutoGen 
            Box box3 = new Box();
            pane.Add(box3);
            box3.Add(new Label("AutoGen"));

            ObjectField autoGenField = new ObjectField("Character");
            autoGenField.value = info.AutoGen;
            box3.Add(autoGenField);
            box3.style.height = 350;

            Image mainTex = new Image();
            mainTex.scaleMode = ScaleMode.ScaleToFit;
            mainTex.image = info.MainTex;
            box3.Add(mainTex);


            // set color
            if (info.SkinFile != null)
            {
                autoGenField.style.backgroundColor = info.AutoGen == null ? new Color(1, 1, 0, 0.4f) : Color.clear;
            }
            if (info.AniFile != null)
            {
                autoGenField.style.backgroundColor = info.AutoGen == null ? new Color(1, 0, 0, 0.4f) : Color.clear;
                if (info.Player != null)
                {
                    skillField.style.backgroundColor = skillField.value == null ? new Color(1, 1, 0, 0.4f) : Color.clear;
                    gunField.style.backgroundColor = gunField.value == null ? new Color(1, 1, 0, 0.4f) : Color.clear;
                }
                else
                {
                    playerField.style.backgroundColor = new Color(1, 0, 0, 0.4f);
                }
            }
            if (info.Gun != null)
            {
                gunField.style.backgroundColor = gunField.value == "P_" + selectedPerson.weapon ? Color.clear : new Color(1, 0, 0, 0.4f);
            }
            else
            {
                gunField.style.backgroundColor = Color.clear;
            }
        }
    }
}