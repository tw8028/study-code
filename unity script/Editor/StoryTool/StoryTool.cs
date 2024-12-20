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


		[MenuItem("Test/story/文本导出及模型替换")]
		public static void ShowWindow() { GetWindow<StoryTool>("剧情 tool"); }

		public void CreateGUI()
		{
			Box boxExport = new();
			boxExport.style.marginTop = 20;
			Label labelExport = new() { text = "导出文本工具" };

			Button btnJson = new() { text = "导出 json" };
			btnJson.RegisterCallback<ClickEvent>(evt => { TimelineInfo.GetTimelineAssets().ForEach(t => TimelineInfo.MsgToJson(t)); });

			Button btnExcel = new() { text = "导出 excel" };
			btnExcel.RegisterCallback<ClickEvent>(evt => { TimelineInfo.GetTimelineAssets().ForEach(t => TimelineInfo.MsgToExcel(t)); });

			rootVisualElement.Add(boxExport);
			boxExport.Add(labelExport);
			boxExport.Add(btnJson);
			boxExport.Add(btnExcel);

			// 角色 prefb 及动画处理

			Box boxRole = new();
			boxRole.style.marginTop = 20;
			Label labelRole = new() { text = "角色模型及动画" };

			Button btn1 = new() { text = "替换为 prefab（所有角色）" };
			btn1.RegisterCallback<ClickEvent>(evt => TimelineInfo.ReplaceAllCharacters(PlayersRoot));

			Button btn2 = new() { text = "替换为 prefab（选择角色）" };
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