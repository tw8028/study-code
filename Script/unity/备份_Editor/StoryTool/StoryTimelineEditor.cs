using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEditor;
using UnityEngine;
using UnityEngine.Timeline;
using UnityEngine.UIElements;
using UnityEngine.Playables;

namespace PersonBrowser
{
	public class StoryTimelineEditor : EditorWindow
	{
		public TextField searchField;
		private Vector3 pos;
		private Vector3 ro;
		private Vector3 scale;
		private static PlayableDirector Pd => GameObject.Find("StoryManager/timeline").GetComponent<PlayableDirector>();
		private static TimelineAsset CurrentTimeline => Pd.playableAsset as TimelineAsset;

		[MenuItem("Test/story/timeline 编辑")]
		public static void ShowWindow() { GetWindow<StoryTimelineEditor>("story editor"); }

		public void CreateGUI()
		{
			// 剧情文字
			Box boxMsg = new();
			boxMsg.style.marginTop = 20;
			rootVisualElement.Add(boxMsg);

			Label labelMsg = new() { text = "剧情文字" };

			searchField = new("Search");
			Button btnSearch = new() { text = "搜索" };
			btnSearch.RegisterCallback<ClickEvent>(evt => { TimelineInfo.SearchMsg(CurrentTimeline, searchField); });

			Button btnCheck = new() { text = "检查" };
			btnCheck.RegisterCallback<ClickEvent>(evt => TimelineInfo.CheckMsg(CurrentTimeline));

			Button btnModify = new() { text = "修改" };
			btnModify.RegisterCallback<ClickEvent>(evt => TimelineInfo.ModifyMsg(CurrentTimeline));

			Button btnJumpBlock = new() { text = "检查自动跳转" };
			btnJumpBlock.RegisterCallback<ClickEvent>(evt => TimelineInfo.CheckJumpNext(CurrentTimeline));

			Button btnExport = new() { text = "Export to Json" };
			btnExport.RegisterCallback<ClickEvent>(evt => TimelineInfo.MsgToJson(CurrentTimeline));

			Button btnImport = new() { text = " Import from Json" };
			btnImport.RegisterCallback<ClickEvent>(evt => TimelineInfo.ImportFromJson(CurrentTimeline));

			boxMsg.Add(labelMsg);
			boxMsg.Add(searchField);
			boxMsg.Add(btnSearch);
			boxMsg.Add(btnCheck);
			boxMsg.Add(btnModify);
			boxMsg.Add(btnJumpBlock);
			boxMsg.Add(btnExport);
			boxMsg.Add(btnImport);


			// 剧情角色
			Box boxCharacter = new();
			boxCharacter.style.marginTop = 20;
			rootVisualElement.Add(boxCharacter);

			Label label2 = new() { text = "角色" };

			Button characterBtn1 = new() { text = "说活_向右移动 0.1s" };
			characterBtn1.RegisterCallback<ClickEvent>(evt => TimelineInfo.MoveTalkClips(CurrentTimeline));

			Button characterBtn2 = new() { text = "名字_删除无效标签" };
			characterBtn2.RegisterCallback<ClickEvent>(evt => TimelineInfo.RemoveNoneSetNameClips(CurrentTimeline));
			Button characterBtn3 = new() { text = "check animation" };
			characterBtn3.RegisterCallback<ClickEvent>(evt => TimelineInfo.CheckAnimationClip(CurrentTimeline));

			boxCharacter.Add(label2);
			boxCharacter.Add(characterBtn1);
			boxCharacter.Add(characterBtn2);
			boxCharacter.Add(characterBtn3);

			// 相机
			// UI
			// 通用
			Box boxCommon = new();
			boxCommon.style.marginTop = 20;
			rootVisualElement.Add(boxCommon);

			Label labelCommon = new() { text = "通用" };
			Button btnCommon = new() { text = "检查通用 clip" };
			btnCommon.RegisterCallback<ClickEvent>(evt => TimelineInfo.CheckCommon(CurrentTimeline));

			boxCommon.Add(labelCommon);
			boxCommon.Add(btnCommon);

			// tools
			Box boxTool = new();
			boxTool.style.marginTop = 20;
			rootVisualElement.Add(boxTool);

			Label label3 = new() { text = "tools" };

			// Button btnTool1 = new() { text = "计算移动时间" };
			Button btnTool2 = new() { text = "复制 transform" };
			btnTool2.RegisterCallback<ClickEvent>(evt => CopyTransform());
			Button btnTool3 = new() { text = "粘贴 transform" };
			btnTool3.RegisterCallback<ClickEvent>(evt => PasteTransform());

			boxTool.Add(label3);
			// boxTool.Add(btnTool1);
			boxTool.Add(btnTool2);
			boxTool.Add(btnTool3);
		}

		/// <summary>
		/// 
		/// </summary>
		public void WalkTime()
		{
			Transform[] points = Selection.transforms;
			if (points.Length != 2)
			{
				Debug.LogWarning("请选择两个 player_point");
			}
			else
			{
				float distance = (points[0].position - points[1].position).magnitude * 100;
				float time1 = distance / 64.5f;
				float time2 = distance / 63f;
				string text = $" walk01 需要走 {time1} 秒 \n walk02 需要走 {time2} 秒";
				Debug.Log(text);
			}
		}
		public void CopyTransform()
		{
			Transform trans = Selection.activeTransform;
			pos = trans.localPosition;
			ro = trans.localEulerAngles;
			scale = trans.localScale;
		}
		public void PasteTransform()
		{
			Transform trans = Selection.activeTransform;
			trans.localPosition = pos;
			trans.localEulerAngles = ro;
			trans.localScale = scale;
		}
	}
}