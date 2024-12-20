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

		[MenuItem("Test/story/timeline �༭")]
		public static void ShowWindow() { GetWindow<StoryTimelineEditor>("story editor"); }

		public void CreateGUI()
		{
			// ��������
			Box boxMsg = new();
			boxMsg.style.marginTop = 20;
			rootVisualElement.Add(boxMsg);

			Label labelMsg = new() { text = "��������" };

			searchField = new("Search");
			Button btnSearch = new() { text = "����" };
			btnSearch.RegisterCallback<ClickEvent>(evt => { TimelineInfo.SearchMsg(CurrentTimeline, searchField); });

			Button btnCheck = new() { text = "���" };
			btnCheck.RegisterCallback<ClickEvent>(evt => TimelineInfo.CheckMsg(CurrentTimeline));

			Button btnModify = new() { text = "�޸�" };
			btnModify.RegisterCallback<ClickEvent>(evt => TimelineInfo.ModifyMsg(CurrentTimeline));

			Button btnJumpBlock = new() { text = "����Զ���ת" };
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


			// �����ɫ
			Box boxCharacter = new();
			boxCharacter.style.marginTop = 20;
			rootVisualElement.Add(boxCharacter);

			Label label2 = new() { text = "��ɫ" };

			Button characterBtn1 = new() { text = "˵��_�����ƶ� 0.1s" };
			characterBtn1.RegisterCallback<ClickEvent>(evt => TimelineInfo.MoveTalkClips(CurrentTimeline));

			Button characterBtn2 = new() { text = "����_ɾ����Ч��ǩ" };
			characterBtn2.RegisterCallback<ClickEvent>(evt => TimelineInfo.RemoveNoneSetNameClips(CurrentTimeline));
			Button characterBtn3 = new() { text = "check animation" };
			characterBtn3.RegisterCallback<ClickEvent>(evt => TimelineInfo.CheckAnimationClip(CurrentTimeline));

			boxCharacter.Add(label2);
			boxCharacter.Add(characterBtn1);
			boxCharacter.Add(characterBtn2);
			boxCharacter.Add(characterBtn3);

			// ���
			// UI
			// ͨ��
			Box boxCommon = new();
			boxCommon.style.marginTop = 20;
			rootVisualElement.Add(boxCommon);

			Label labelCommon = new() { text = "ͨ��" };
			Button btnCommon = new() { text = "���ͨ�� clip" };
			btnCommon.RegisterCallback<ClickEvent>(evt => TimelineInfo.CheckCommon(CurrentTimeline));

			boxCommon.Add(labelCommon);
			boxCommon.Add(btnCommon);

			// tools
			Box boxTool = new();
			boxTool.style.marginTop = 20;
			rootVisualElement.Add(boxTool);

			Label label3 = new() { text = "tools" };

			// Button btnTool1 = new() { text = "�����ƶ�ʱ��" };
			Button btnTool2 = new() { text = "���� transform" };
			btnTool2.RegisterCallback<ClickEvent>(evt => CopyTransform());
			Button btnTool3 = new() { text = "ճ�� transform" };
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
				Debug.LogWarning("��ѡ������ player_point");
			}
			else
			{
				float distance = (points[0].position - points[1].position).magnitude * 100;
				float time1 = distance / 64.5f;
				float time2 = distance / 63f;
				string text = $" walk01 ��Ҫ�� {time1} �� \n walk02 ��Ҫ�� {time2} ��";
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