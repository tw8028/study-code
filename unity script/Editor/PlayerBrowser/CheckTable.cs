using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor;
using UnityEngine.UIElements;
using System.Linq;


namespace PersonBrowser
{
    public class CheckTable : EditorWindow
    {
        List<Person> allPersons { get { return JsonData.GetPersons(); } }
        ListView list;
        [MenuItem("Test/prefab工具/核对角色总表")]
        public static void ShowWindow()
        {
            var w = GetWindow<CheckTable>("核对纳罗达人设总表");
            w.minSize = new Vector2(900, 200);
            w.maxSize = new Vector2(900, 900);
        }
        public void CreateGUI()
        {
            VisualElement header = new VisualElement();
            header.style.flexDirection = FlexDirection.Row;
            header.style.justifyContent = Justify.SpaceBetween;
            var lab_1 = new Label();
            lab_1.text = "ID";
            lab_1.style.width = 100;
            var lab_model_0 = new Label();
            lab_model_0.text = "原版模型";
            lab_model_0.style.width = 100;
            var lab_2 = new Label();
            lab_2.text = "原版蒙皮";
            lab_2.style.width = 100;
            var lab_3 = new Label();
            lab_3.text = "原版Prefab";
            lab_3.style.width = 100;
            var lab_4 = new Label();
            lab_4.text = "原版技能";
            lab_4.style.width = 100;

            var lab_model_1 = new Label();
            lab_model_1.text = "精二模型";
            lab_model_1.style.width = 100;
            var lab_5 = new Label();
            lab_5.text = "精二蒙皮";
            lab_5.style.width = 100;
            var lab_6 = new Label();
            lab_6.text = "精二Prefab";
            lab_6.style.width = 100;
            var lab_7 = new Label();
            lab_7.text = "精二技能";
            lab_7.style.width = 100;

            header.Add(lab_1);
            header.Add(lab_model_0);
            header.Add(lab_2);
            header.Add(lab_3);
            header.Add(lab_4);
            header.Add(lab_model_1);
            header.Add(lab_5);
            header.Add(lab_6);
            header.Add(lab_7);


            Button button1 = new() { text = "check" };
            list = new();
            rootVisualElement.Add(button1);
            rootVisualElement.Add(header);
            rootVisualElement.Add(list);
            button1.RegisterCallback<ClickEvent>(Onclick);
        }
        public void Onclick(ClickEvent evt)
        {
            list.Clear();
            // 筛选问题项, 添加列表
            var source = allPersons.Where(person => !CheckById(person)).ToList();
            list.itemsSource = source;

            list.makeItem = () => new VisualElement();
            list.bindItem = (item, index) =>
            {
                PlayerInfo playerInfo = new PlayerInfo(source[index].id);
                (item as VisualElement).style.flexDirection = FlexDirection.Row;
                (item as VisualElement).style.justifyContent = Justify.SpaceBetween;
                var label_1 = new Label();
                label_1.text = source[index].id;
                label_1.style.width = 100;

                var label_model_0 = new Label();
                label_model_0.text = ErrorItemCheck(playerInfo.ModelFile, source[index].model_0);
                label_model_0.style.width = 100;
                var label_2 = new Label();
                label_2.text = ErrorItemCheck(playerInfo.SkinFile, source[index].skin_0);
                label_2.style.width = 100;
                var label_3 = new Label();
                string prefabName = null;
                try { prefabName = playerInfo.Player.name; } catch { }
                label_3.text = ErrorItemCheck(prefabName, source[index].prefab_0);
                label_3.style.width = 100;
                var label_4 = new Label();
                label_4.text = ErrorItemCheck(playerInfo.AniFile, source[index].ani_0);
                label_4.style.width = 100;

                PlayerInfo playerInfo_1 = new(source[index].id.Remove(2, 1).Insert(2, "1"));
                var label_model_1 = new Label();
                label_model_1.text = ErrorItemCheck(playerInfo_1.ModelFile, source[index].model_1);
                label_model_1.style.width = 100;
                var label_5 = new Label();
                label_5.text = ErrorItemCheck(playerInfo_1.SkinFile, source[index].skin_1);
                label_5.style.width = 100;
                var label_6 = new Label();
                string prefabName_1 = null;
                try { prefabName_1 = playerInfo_1.Player.name; } catch { }
                label_6.text = ErrorItemCheck(prefabName_1, source[index].prefab_1);
                label_6.style.width = 100;
                var lavel_7 = new Label();
                lavel_7.text = ErrorItemCheck(playerInfo_1.AniFile, source[index].ani_1);
                lavel_7.style.width = 100;

                (item as VisualElement).Add(label_1);
                (item as VisualElement).Add(label_model_0);
                (item as VisualElement).Add(label_2);
                (item as VisualElement).Add(label_3);
                (item as VisualElement).Add(label_4);
                (item as VisualElement).Add(label_model_1);
                (item as VisualElement).Add(label_5);
                (item as VisualElement).Add(label_6);
                (item as VisualElement).Add(lavel_7);
            };
        }

        /// <summary>
        /// 通过id检查原版与精二, 并输出有问题的字符串数组
        /// </summary>
        public bool CheckById(Person person)
        {
            PlayerInfo playerInfo = new PlayerInfo(person.id);
            bool m0 = Check(playerInfo.ModelFile, person.model_0);
            bool s0 = Check(playerInfo.SkinFile, person.skin_0);
            string prefabName = null;
            try { prefabName = playerInfo.Player.name; } catch { }
            bool p0 = Check(prefabName, person.prefab_0);
            bool a0 = Check(playerInfo.AniFile, person.ani_0);

            string id_1 = person.id.Remove(2, 1).Insert(2, "1");
            PlayerInfo info_1 = new PlayerInfo(id_1);
            bool m1 = Check(info_1.ModelFile, person.model_1);
            bool s1 = Check(info_1.SkinFile, person.skin_1);
            string prefabName_1 = null;
            try { prefabName_1 = info_1.Player.name; } catch { }
            bool p1 = Check(prefabName_1, person.prefab_1);
            bool a1 = Check(info_1.AniFile, person.ani_1);

            if (m0 && s0 && p0 && a0 && m1 && s1 && p1 && a1) { return true; }
            else { return false; }
        }

        /// <summary>
        /// 核对资产与总表, 没问题则返回true
        /// </summary>
        /// <param name="asset"></param>
        /// <param name="cell"></param>
        /// <returns></returns>
        public bool Check(string asset, string cell)
        {
            bool result;
            if (asset == null)  // 资产不存在
            {
                result = cell == "已完成" ? false : true;
            }
            else    // 资产完成
            {
                result = cell == "已完成" ? true : false;
            }
            return result;  //没问题返回true
        }
        public string ErrorItemCheck(string asset, string cell)
        {
            string result = null;
            if (asset == null)
            {
                result = cell == "已完成" ? "缺文件" : "";
            }
            else
            {
                result = cell == "已完成" ? "" : "已完成?";
            }
            return result;
        }
    }
}