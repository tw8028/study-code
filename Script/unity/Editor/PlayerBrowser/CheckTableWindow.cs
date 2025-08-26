using System.Linq;
using Art.temp.Editor.CharacterData;
using Art.temp.Editor.PrefabTool;
using UnityEditor;
using UnityEngine.UIElements;

namespace Art.temp.Editor.PlayerBrowser
{
    public class CheckTableWindow : EditorWindow
    {
        private static Person[] PersonArray => JsonData.GetPersons().Where(a => a.id[0] == 'A').ToArray();
        private ScrollView scrollView;

        [MenuItem("Test/prefab工具/核对纳罗达总表")]
        public static void ShowWindow()
        {
            GetWindow<CheckTableWindow>("核对纳罗达人设总表");
            //w.minSize = new Vector2(2000, 200);
            //w.maxSize = new Vector2(2000, 900);
        }

        public void CreateGUI()
        {
            var styleSheet =
                AssetDatabase.LoadAssetAtPath<StyleSheet>("Assets/Art/temp/Editor/PlayerBrowser/CheckTableUSSFile.uss");
            rootVisualElement.styleSheets.Add(styleSheet);

            Button button1 = new() { text = "check" };

            VisualElement header = new() { name = "header" };
            header.Add(new Label("nameId"));
            header.Add(new Label("原版模型"));
            header.Add(new Label("原版蒙皮"));
            header.Add(new Label("原版 prefab"));
            header.Add(new Label("精二模型"));
            header.Add(new Label("精二蒙皮"));
            header.Add(new Label("精二 prefab"));
            header.Add(new Label("技能动作"));

            scrollView = new ScrollView();

            rootVisualElement.Add(button1);
            rootVisualElement.Add(header);
            rootVisualElement.Add(scrollView);
            button1.RegisterCallback<ClickEvent>(OnClick);
        }

        private void OnClick(ClickEvent evt)
        {
            scrollView.Clear();
            // 筛选问题项, 添加列表
            var source = PersonArray.Where(person => !IsDone(person)).ToList();
            foreach (Person person in source)
            {
                string personId = person.id;
                var player0 = CharacterFactory.CreatePlayer(personId);

                char[] chars = personId.ToCharArray();
                chars[personId.Length - 4] = '1';
                var nameId = new string(chars);
                var player1 = CharacterFactory.CreatePlayer(nameId);
                

                var row = new VisualElement() { name = "row" };
                row.Add(new Label(personId));
                row.Add(new Label(ErrorMsg(player0.Model, person.model_0)));
                row.Add(
                    new Label(ErrorMsg(player0.Model ? player0.Model.transform.Find("Root") : false, person.skin_0)));
                row.Add(new Label(ErrorMsg(player0.Prefab, person.prefab_0)));

                row.Add(new Label(ErrorMsg(player1.Model, person.model_1)));
                row.Add(
                    new Label(ErrorMsg(player1.Model ? player1.Model.transform.Find("Root") : false, person.skin_1)));
                row.Add(new Label(ErrorMsg(player1.Prefab, person.prefab_1)));

                row.Add(new Label(ErrorMsg(player0.Skill, person.skill)));

                scrollView.Add(row);
            }
        }

        /// <summary>
        /// 通过id检查原版与精二, 并输出有问题的字符串数组
        /// </summary>
        private static bool IsDone(Person person)
        {
            var personId = person.id;
            var player0 = CharacterFactory.CreatePlayer(personId);
            char[] chars = personId.ToCharArray();
            chars[personId.Length - 4] = '1';
            var nameId = new string(chars);
            var player1 = CharacterFactory.CreatePlayer(nameId);
            if (ErrorMsg(player0.Model, person.model_0) != "")
            {
                return false;
            }
            else if (ErrorMsg(player0.Model ? player0.Model.transform.Find("Root") : false, person.skin_0) != "")
            {
                return false;
            }
            else if (ErrorMsg(player0.Prefab, person.prefab_0) != "")
            {
                return false;
            }
            else if (ErrorMsg(player1.Model, person.model_1) != "")
            {
                return false;
            }
            else if (ErrorMsg(player1.Model ? player1.Model.transform.Find("Root") : false, person.skin_1) != "")
            {
                return false;
            }
            else if (ErrorMsg(player1.Prefab, person.prefab_1) != "")
            {
                return false;
            }
            else if (ErrorMsg(player0.Skill, person.skill) != "")
            {
                return false;
            }
            else
            {
                return true;
            }
        }


        private static string ErrorMsg(bool hasAsset, string cell)
        {
            if (cell == "已完成")
            {
                return hasAsset ? "" : "缺文件";
            }
            else
            {
                return hasAsset ? "已完成?" : "";
            }
        }
    }
}