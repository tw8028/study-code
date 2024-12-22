using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor;
using UnityEngine.UIElements;
using System.Linq;


namespace PersonBrowser
{
	public class CheckTableWindow : EditorWindow
	{
		List<Person> allPersons { get { return JsonData.GetPersons(); } }
		ListView list;
		[MenuItem("Test/prefab����/�˶Խ�ɫ�ܱ�")]
		public static void ShowWindow()
		{
			var w = GetWindow<CheckTableWindow>("�˶����޴������ܱ�");
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
			lab_model_0.text = "ԭ��ģ��";
			lab_model_0.style.width = 100;
			var lab_2 = new Label();
			lab_2.text = "ԭ����Ƥ";
			lab_2.style.width = 100;
			var lab_3 = new Label();
			lab_3.text = "ԭ��Prefab";
			lab_3.style.width = 100;
			var lab_4 = new Label();
			lab_4.text = "ԭ�漼��";
			lab_4.style.width = 100;

			var lab_model_1 = new Label();
			lab_model_1.text = "����ģ��";
			lab_model_1.style.width = 100;
			var lab_5 = new Label();
			lab_5.text = "������Ƥ";
			lab_5.style.width = 100;
			var lab_6 = new Label();
			lab_6.text = "����Prefab";
			lab_6.style.width = 100;
			var lab_7 = new Label();
			lab_7.text = "��������";
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
			// ɸѡ������, ����б�
			var source = allPersons.Where(person => !CheckById(person)).ToList();
			list.itemsSource = source;

			list.makeItem = () => new VisualElement();
			list.bindItem = (item, index) =>
			{
				PlayerAsset playerAsset = new PlayerAsset(source[index].id);
				(item as VisualElement).style.flexDirection = FlexDirection.Row;
				(item as VisualElement).style.justifyContent = Justify.SpaceBetween;
				var label_1 = new Label();
				label_1.text = source[index].id;
				label_1.style.width = 100;

				var label_model_0 = new Label();
				label_model_0.text = ErrorItemCheck(playerAsset.HasModelMax, source[index].model_0);
				label_model_0.style.width = 100;
				var label_2 = new Label();
				label_2.text = ErrorItemCheck(playerAsset.HasSkinMax, source[index].skin_0);
				label_2.style.width = 100;
				var label_3 = new Label();
				bool hasPrefab = playerAsset.DisplayPrefab == null ? false : true;
				label_3.text = ErrorItemCheck(hasPrefab, source[index].prefab_0);
				label_3.style.width = 100;
				var label_4 = new Label();
				label_4.text = ErrorItemCheck(playerAsset.HasAniMax, source[index].ani_0);
				label_4.style.width = 100;

				PlayerAsset playerAsset_01 = new(source[index].id.Remove(2, 1).Insert(2, "1"));
				var label_model_1 = new Label();
				label_model_1.text = ErrorItemCheck(playerAsset_01.HasModelMax, source[index].model_1);
				label_model_1.style.width = 100;
				var label_5 = new Label();
				label_5.text = ErrorItemCheck(playerAsset_01.HasSkinMax, source[index].skin_1);
				label_5.style.width = 100;
				var label_6 = new Label();
				bool prefabName_1 = playerAsset.DisplayPrefab == null ? false : true;
				label_6.text = ErrorItemCheck(prefabName_1, source[index].prefab_1);
				label_6.style.width = 100;
				var lavel_7 = new Label();
				lavel_7.text = ErrorItemCheck(playerAsset_01.HasAniMax, source[index].ani_1);
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
		/// ͨ��id���ԭ���뾫��, �������������ַ�������
		/// </summary>
		public bool CheckById(Person person)
		{
			PlayerAsset playerAsset = new PlayerAsset(person.id);
			bool m0 = Check(playerAsset.HasModelMax, person.model_0);
			bool s0 = Check(playerAsset.HasSkinMax, person.skin_0);
			bool hasPrefab = playerAsset.DisplayPrefab == null? false:true;
			bool p0 = Check(hasPrefab, person.prefab_0);
			bool a0 = Check(playerAsset.HasAniMax, person.ani_0);

			string id_1 = person.id.Remove(2, 1).Insert(2, "1");
			PlayerAsset info_1 = new PlayerAsset(id_1);
			bool m1 = Check(info_1.HasModelMax, person.model_1);
			bool s1 = Check(info_1.HasSkinMax, person.skin_1);
			bool hasPrefab_1 = info_1.DisplayPrefab == null? false:true;
			bool p1 = Check(hasPrefab_1, person.prefab_1);
			bool a1 = Check(info_1.HasAniMax, person.ani_1);

			if (m0 && s0 && p0 && a0 && m1 && s1 && p1 && a1) { return true; }
			else { return false; }
		}

		/// <summary>
		/// �˶��ʲ����ܱ�, û�����򷵻�true
		/// </summary>
		/// <param name="hasAsset"></param>
		/// <param name="cell"></param>
		/// <returns></returns>
		public bool Check(bool hasAsset, string cell)
		{
			bool result;
			if (!hasAsset)  // �ʲ�������
			{
				result = cell == "�����" ? false : true;
			}
			else    // �ʲ����
			{
				result = cell == "�����" ? true : false;
			}
			return result;  //û���ⷵ��true
		}
		public string ErrorItemCheck(bool hasAsset, string cell)
		{
			string result = null;
			if (!hasAsset)
			{
				result = cell == "�����" ? "ȱ�ļ�" : "";
			}
			else
			{
				result = cell == "�����" ? "" : "�����?";
			}
			return result;
		}
	}
}