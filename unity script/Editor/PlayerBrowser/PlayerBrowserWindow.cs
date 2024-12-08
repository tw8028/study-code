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
		string[] gfxs;
		[MenuItem("Test/prefab工具/角色浏览器")]
		public static void ShowEditor()
		{
			var win = GetWindow<PlayerBrowserWindow>("Player Browser");
			win.minSize = new Vector2(900, 400);
		}
		public void CreateGUI()
		{
			// 获取特效文件
			var gfbPrefabs = AssetDatabase.FindAssets("Skill", new string[] { "Assets/Art/Gfx/Character" });
			List<string> skillNames = new();
			foreach (var gfb in gfbPrefabs)
			{
				string path = AssetDatabase.GUIDToAssetPath(gfb);
				var obj = AssetDatabase.LoadAssetAtPath<GameObject>(path);
				var name = obj.name.Split('_')[1];
				skillNames.Add(name);
			}

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


			var allPersons = JsonData.GetPersons().Where(a=>a.id.StartsWith("A")).ToArray();
			listPane.makeItem = () => new Label();
			listPane.bindItem = (item, index) =>
			{
				if (skillNames.Exists(a => a == allPersons[index].id))
				{
					(item as Label).text = allPersons[index].id + "  " + allPersons[index].name;
				}
				else
				{
					(item as Label).text = allPersons[index].id + "  " + allPersons[index].name + "   缺特效";
				}
				string id_a00 = allPersons[index].id;
				string id_a01 = id_a00.Remove(id_a00.Length - 4, 1).Insert(id_a00.Length - 4, "1");

				PlayerAsset asset_00 = new PlayerAsset(id_a00);
				PlayerAsset asset_01 = new PlayerAsset(id_a01);
				if (asset_00.State == Color.red || asset_01.State == Color.red)
				{
					(item as Label).style.color = Color.red;
				}
				else
				{
					(item as Label).style.color = asset_00.State == asset_01.State ? asset_00.State : Color.yellow;
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
			str = str.Remove(str.Length - 4, 1).Insert(str.Length - 4, "1");
			CreateVE(A01Pane, str, selectedPerson);
		}
		private void CreateVE(VisualElement pane, string id, Person selectedPerson)
		{
			PlayerAsset asset = new(id);

			// assets in \\192.168.2.222\project_A
			Box box4 = new Box();
			pane.Add(box4);
			box4.style.marginTop = 10;
			box4.Add(new Label("192.168.2.222/project_A"));

			TextField modelField = new TextField("模型");
			TextField skinfbxField = new TextField("蒙皮");
			TextField anifbxField = new TextField("技能动作");
			box4.Add(modelField);
			box4.Add(skinfbxField);
			box4.Add(anifbxField);

			modelField.value = asset.HasModelMax.ToString();
			anifbxField.value = asset.HasAniMax.ToString();
			skinfbxField.value = asset.HasSkinMax.ToString();

			// assets in editor
			Box box1 = new Box();
			box1.style.marginTop = 10;
			pane.Add(box1);
			box1.Add(new Label("Prefab asset"));

			ObjectField displayField = new("display prefab");
			displayField.value = asset.DisplayPrefab;
			box1.Add(displayField);

			ObjectField skillField = new("compressed skill");
			skillField.value = asset.CompressedSkill;
			box1.Add(skillField);
		}
	}
}