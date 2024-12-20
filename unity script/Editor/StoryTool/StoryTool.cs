using System.Collections;
using System.Collections.Generic;
using Sirenix.Utilities;
using UnityEditor;
using UnityEngine;
using UnityEngine.Playables;
using UnityEngine.Timeline;
using UnityEngine.UIElements;


namespace PersonBrowser
{
	public class StoryTool : EditorWindow
	{
		private static PlayableDirector Pd => GameObject.Find("StoryManager/timeline").GetComponent<PlayableDirector>();
		private static TimelineAsset CurrentTimeline => Pd.playableAsset as TimelineAsset;
		private static Transform PlayersRoot => GameObject.Find("StoryManager/players").transform;


		[MenuItem("Test/story/�ı�������ģ���滻")]
		public static void ShowWindow() { GetWindow<StoryTool>("���� tool"); }

		public void CreateGUI()
		{
			Box boxExport = new();
			boxExport.style.marginTop = 20;
			Label labelExport = new() { text = "�����ı�����" };

			Button btnJson = new() { text = "���� json" };
			btnJson.RegisterCallback<ClickEvent>(evt => { TimelineInfo.GetTimelineAssets().ForEach(t => TimelineInfo.MsgToJson(t)); });

			Button btnExcel = new() { text = "���� excel" };
			btnExcel.RegisterCallback<ClickEvent>(evt => { TimelineInfo.GetTimelineAssets().ForEach(t => TimelineInfo.MsgToExcel(t)); });

			rootVisualElement.Add(boxExport);
			boxExport.Add(labelExport);
			boxExport.Add(btnJson);
			boxExport.Add(btnExcel);

			// ��ɫ prefb ����������

			Box boxRole = new();
			boxRole.style.marginTop = 20;
			Label labelRole = new() { text = "��ɫģ�ͼ�����" };

			Button btn1 = new() { text = "�滻Ϊ prefab�����н�ɫ��" };
			btn1.RegisterCallback<ClickEvent>(evt => TimelineInfo.ReplaceAllCharacters(PlayersRoot));

			Button btn2 = new() { text = "�滻Ϊ prefab��ѡ���ɫ��" };
			btn2.RegisterCallback<ClickEvent>(evt => TimelineInfo.ReplaceSelectedCharacter(PlayersRoot));

			Button btn3 = new() { text = "check animation" };
			btn3.RegisterCallback<ClickEvent>(evt => TimelineInfo.CheckAnimationClip(CurrentTimeline));

			Button btn4 = new() { text = "replace animation" };
			btn4.RegisterCallback<ClickEvent>(evt => TimelineInfo.ReplaceAllAnimations(CurrentTimeline));

			rootVisualElement.Add(boxRole);
			boxRole.Add(labelRole);
			boxRole.Add(btn1);
			boxRole.Add(btn2);
			boxRole.Add(btn3);
			boxRole.Add(btn4);
		}
	}
}