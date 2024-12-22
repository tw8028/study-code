using Gameplay.Story.Cmp;
using Gameplay.Story.Cmp.Timeline.CommonAction;
using Gameplay.Story.Cmp.Timeline.MsgAction;
using Gameplay.Story.Cmp.Timeline.PlayerTalkAction;
using Gameplay.Story.Cmp.Timeline.SetNameAction;
using NPOI.XSSF.UserModel;
using Sirenix.Utilities;
using System;
using System.CodeDom;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using UnityEditor;
using UnityEditor.Timeline;
using UnityEngine;
using UnityEngine.Timeline;
using UnityEngine.UIElements;


namespace PersonBrowser
{
	public static class TimelineInfo
	{
		private static bool IsTrackOfType<T>(TrackAsset track)
		{
			if (typeof(T) == typeof(MsgActionClip)) { return track is MsgActionTrack; }
			else if (typeof(T) == typeof(MsgActionClip)) { return track is MsgActionTrack; }
			else if (typeof(T) == typeof(TimelineClip)) { return track is AnimationTrack; }

			else return false;

		}
		private static T[] GetClips<T, Ttrack>(TimelineAsset timeline) where T : TimelineClip
		{
			var tracks = timeline.GetOutputTracks();

			// ��ȡָ�� tracks
			var tTracks = tracks.Where(track => track is Ttrack);

			//  ��ȡ clips
			var clips = tTracks.SelectMany(a => a.GetClips());
			return clips.Cast<T>().ToArray();
		}


		// ��ȡָ�� track �� clips
		public static TimelineClip[] GetClips<T>(TimelineAsset timeline) where T : TrackAsset
		{
			var tracks = timeline.GetOutputTracks();

			// ��ȡָ�� tracks
			var tTracks = tracks.Where(track => track is T);

			//  ��ȡ clips
			var clips = tTracks.SelectMany(a => a.GetClips());
			return clips.ToArray();
		}

		// ��ȡָ�� track
		public static TrackAsset[] GetTracks<T>(TimelineAsset timeline) where T : TrackAsset
		{
			var tracks = timeline.GetOutputTracks().Where(track => track is T);
			return tracks.ToArray();
		}

		/// <summary>
		/// ���л� block data ���ڵ���
		/// </summary>
		/// <param name="timeline"></param>
		/// <returns></returns>
		public static MsgClipInfo[] GetMsgClipData(TimelineAsset timeline)
		{
			TimelineClip[] clips = GetClips<MsgActionTrack>(timeline);
			TimelineClip[] talkClips = GetClips<PlayerTalkActionTrack>(timeline);

			var msgArray = new MsgClipInfo[clips.Length];
			for (int i = 0; i < clips.Length; i++)
			{
				var msgClip = clips[i].asset as MsgActionClip;
				var speakerInBlock = talkClips.Where(talk => talk.start > clips[i].start - 0.15d && talk.end < clips[i].end + 0.15d);
				MsgClipInfo msgClipData = new()
				{
					blockId = msgClip.blockId,
					msg = msgClip.msg,
					extMsg = msgClip.extMsgs.Length > 0 ? msgClip.extMsgs : null,
					speakers = speakerInBlock.Select(t => t.GetParentTrack().parent.name).ToArray()
				};
				msgArray[i] = msgClipData;
			}
			return msgArray;
		}

		/// <summary>
		/// �滻��ɫ prefab �� ����
		/// </summary>
		/// <param name="timeline"></param>
		public static void CheckAnimationClip(TimelineAsset timeline)
		{
			var animationTracks = GetTracks<AnimationTrack>(timeline);
			foreach (var track in animationTracks)
			{
				var clips = track.GetClips();
				foreach (var clip in clips)
				{
					if (clip.animationClip == null)
					{
						Debug.LogError($"������ʧ: {track.parent.name}: {clip.start}");
					}
					else
					{
						string clipName = clip.animationClip.name;
						/* if (clipName.Contains("_crawl_") || clipName.Contains("_stand_") || clipName.Contains("_common"))
						 {
							 string path = AssetDatabase.GetAssetPath(clip.animationClip);
							 Debug.LogWarning($"ʹ����ս������:{path}");
						 }

						 else if (clipName.Contains("ready"))
						 {
							 string path = AssetDatabase.GetAssetPath(clip.animationClip);
							 Debug.LogWarning($"ʹ����ready����:{path}");
						 }*/
						if (!clipName.StartsWith("compressed"))
						{
							Debug.LogWarning($"δѹ������: {track.parent.name}: {clip.start}");
						}
					}
				}
			}
		}
		public static void ReplaceAllAnimations(TimelineAsset timeline)
		{
			var clips = TimelineInfo.GetClips<AnimationTrack>(timeline);
			// ���� old clip ��
			foreach (TimelineClip clip in clips)
			{
				string displayName = clip.displayName;

				if (displayName.EndsWith("crawl_idle001"))
				{
					displayName = "ani_common_s_crawl_idle001";
				}
				else if (displayName.EndsWith("crawl_moveforward001"))
				{
					displayName = "ani_common_s_crawl_moveforward001";
				}
				else if (displayName.Contains("attack002"))
				{
					displayName = displayName.Replace("attack002", "attack001");
				}
				else if (displayName.StartsWith("ani_s_sit"))
				{
					if (displayName.Contains("_end"))
					{
						displayName = displayName.Replace("_end", "_loop");
					}
					if (displayName.Contains("_start"))
					{
						displayName = displayName.Replace("_start", "_loop");
					}
				}
				clip.displayName = displayName;
			}

			foreach (var clip in clips)
			{
				string displayName = clip.displayName;
				string path = $"Assets/Art/Animations/compressedShow/compressed_{displayName}.anim";

				var clipAsset = AssetDatabase.LoadAssetAtPath<AnimationClip>(path);
				if (clip.asset is AnimationPlayableAsset playableAsset)
				{
					playableAsset.clip = clipAsset;
				}
			}
		}
		public static void ReplaceAllCharacters(Transform root)
		{
			int n = root.childCount;
			Transform[] oldPlayers = new Transform[n];
			string[] playerNames = new string[n];
			string[] nameId = new string[n];
			int[] playerIds = new int[n];
			for (int i = 0; i < oldPlayers.Length; i++)
			{
				oldPlayers[i] = root.GetChild(i);
				playerNames[i] = oldPlayers[i].name;
				playerIds[i] = oldPlayers[i].GetComponent<CmpStoryPlayer>().playerId;
				nameId[i] = oldPlayers[i].GetChild(0).name;
			}
			for (int i = 0; i < playerNames.Length; i++)
			{
				if (playerNames[i].Split('_')[2] == "100")
				{
					continue;
				}

				GameObject playerPrefab = AnimUtility.FindDisplayPrefab($"P_S_{nameId[i]}");
				if (playerPrefab == null)
				{
					Debug.LogWarning($"�޷��ҵ� {playerNames[i]} ��Ӧ prefab");
					continue;
				}
				GameObject.DestroyImmediate(oldPlayers[i].gameObject);
				GameObject prefabInstance = (GameObject)PrefabUtility.InstantiatePrefab(playerPrefab, root);
				prefabInstance.name = playerNames[i];
				var cmpStoryPlayer = prefabInstance.AddComponent<CmpStoryPlayer>();
				cmpStoryPlayer.playerId = playerIds[i];
				Debug.Log($"�滻 prefab: {playerNames[i]}");
			}
		}
		public static void ReplaceSelectedCharacter(Transform root)
		{
			GameObject go = Selection.activeGameObject;
			// ����ǰ��¼����
			string playerName = go.name;

			GameObject playerPrefab = AnimUtility.FindDisplayPrefab($"P_S_{go.transform.GetChild(0).name}");
			if (playerPrefab != null)
			{
				int playerId = go.GetComponent<CmpStoryPlayer>().playerId;
				GameObject.DestroyImmediate(go);
				GameObject playerInstance = (GameObject)PrefabUtility.InstantiatePrefab(playerPrefab, root);
				playerInstance.name = playerName;
				var cmpStoryPlayer = playerInstance.AddComponent<CmpStoryPlayer>();
				cmpStoryPlayer.playerId = playerId;
				Debug.Log($"�滻��ɫ: {playerName}");
			}
			else
			{
				Debug.LogError($"�޷��ҵ���Ӧ��ɫ prefab��{playerName}");
			}
		}


		/// <summary>
		///  �����ı�
		/// </summary>
		/// <returns></returns>
		public static TimelineAsset[] GetTimelineAssets()
		{
			string assetPath = "Assets/Art/Story/{0}/{0}.playable";
			string[] idName = new string[]
			{
				"story_0_1_1",
				"story_0_1_2",
				"story_0_1_3",
				"story_0_1_4",
				"story_1_1_1",
				"story_1_1_2",
				"story_1_1_3",
				"story_1_1_4",
				"story_1_1_5",
				"story_1_1_6",
				"story_1_1_7",
				"story_1_1_8",
				"story_1_1_9",
				"story_1_1_10",
				"story_1_1_11",
				"story_1_2_1",
				"story_1_2_2",
				"story_1_2_3",
				"story_1_2_4",
				"story_1_2_5",
				"story_1_2_6",
				"story_1_2_7",
				"story_1_2_8"
			};

			return idName.Select(t => AssetDatabase.LoadAssetAtPath<TimelineAsset>(string.Format(assetPath, t))).ToArray();
		}
		public static void MsgToExcel(TimelineAsset timeline)
		{
			string excelPath = $"D:/work/story_excel/{timeline.name}.xlsx";
			if (File.Exists(excelPath))
			{
				File.Delete(excelPath);
			}
			var newExcel = new XSSFWorkbook();
			var sheet = newExcel.CreateSheet();
			var headers = new string[]
			{
				"blockId",
				"speaker",
				"msg",
				"exMsg1",
				"exMsg2",
				"exMsg3",
				"exMsg4"
			};
			var headRow = sheet.CreateRow(0);
			for (int i = 0; i < headers.Length; i++)
			{
				var cell = headRow.CreateCell(i);
				cell.SetCellValue(headers[i]);
			}

			var msgClipData = TimelineInfo.GetMsgClipData(timeline);
			for (int j = 0; j < msgClipData.Length; j++)
			{
				// set blockId
				var row = sheet.CreateRow(j + 1);
				var cellBlockId = row.CreateCell(0);
				cellBlockId.SetCellValue(msgClipData[j].blockId);

				// set speakers
				var cellSpeaker = row.CreateCell(1);
				if (msgClipData[j].speakers.Length > 0)
				{
					string str = string.Join("��", msgClipData[j].speakers);
					cellSpeaker.SetCellValue(str);
				}

				// set msg
				if (msgClipData[j].extMsg is null)
				{
					// set msg
					var cellMsg = row.CreateCell(2);
					cellMsg.SetCellValue(msgClipData[j].msg);
				}
				else
				{
					// set exMsg
					for (int k = 0; k < msgClipData[j].extMsg.Length; k++)
					{
						var cellExtMsg = row.CreateCell(k + 3);
						cellExtMsg.SetCellValue(msgClipData[j].extMsg[k]);
					}
				}
			}

			// save file
			using (FileStream fs = File.OpenWrite(excelPath))
			{
				newExcel.Write(fs);
			}
			Debug.Log(excelPath);
		}
		public static void MsgToJson(TimelineAsset timeline)
		{
			string jsonPath = $"D:/work/story_msg/{timeline.name}.json";
			MsgData msgData = new() { msgArray = TimelineInfo.GetMsgClipData(timeline) };
			string jsonData = JsonUtility.ToJson(msgData);
			File.WriteAllText(jsonPath, jsonData);
			Debug.Log($"������: {jsonPath}");
		}
		public static void ImportFromJson(TimelineAsset timeline)
		{
			string JsonPath = $"D:/work/story_msg/{timeline.name}.json";
			string msgData = File.ReadAllText(JsonPath); // read
			MsgClipInfo[] msgClipDataArray = JsonUtility.FromJson<MsgData>(msgData).msgArray;

			var MsgClips = GetClips<MsgActionTrack>(timeline);
			Debug.Log($"length: {MsgClips.Length}");

			foreach (var clip in MsgClips)
			{
				var msgClip = clip.asset as MsgActionClip;
				var msgClipData = msgClipDataArray.First(x => x.blockId == msgClip.blockId);
				msgClip.msg = msgClipData.msg;
				if (msgClipData.extMsg != null)
				{
					msgClip.extMsgs = msgClipData.extMsg;
				}
			}

			Debug.Log($"����: {JsonPath}");
		}

		/// <summary>
		/// ���� ��� �޸ľ����ı�
		/// </summary>
		/// <param name="timeline"></param>
		/// <param name="searchField"></param>
		public static void SearchMsg(TimelineAsset timeline, TextField searchField)
		{
			var MsgClips = GetClips<MsgActionTrack>(timeline);
			foreach (var clip in MsgClips)
			{
				MsgActionClip msgClip = clip.asset as MsgActionClip;
				string[] messages = msgClip.extMsgs.Length == 0 ? new string[] { msgClip.msg } : msgClip.extMsgs;
				foreach (var msg in messages)
				{
					if (searchField.value == "")
					{
						Debug.Log("������������");
					}
					if (msg.Contains(searchField.value))
					{
						Debug.LogWarning($"{msgClip.blockId}:����({searchField.value})    {msg}");
					}
				}
			}
		}
		public static void CheckMsg(TimelineAsset timeline)
		{
			var MsgClips = GetClips<MsgActionTrack>(timeline);
			foreach (var clip in MsgClips)
			{
				MsgActionClip msgClip = clip.asset as MsgActionClip;
				// ����ı�����
				string[] messages = msgClip.extMsgs.Length == 0 ? new string[] { msgClip.msg } : msgClip.extMsgs;
				foreach (var msg in messages)
				{
					if (msg != null)
					{
						if (msg.Length > 54)
						{
							Debug.LogWarning($"{msgClip.blockId}:�ı�̫��    {msg}");
						}
					}
					else
					{
						Debug.LogError($"{msgClip.blockId}:���ı�");
					}
				}

				// ����ַ�
				string originMsg = msgClip.msg;
				if (ContainsNonChinesePunctuation(originMsg))
				{
					Debug.LogWarning($"{msgClip.blockId}:�ı����淶   {originMsg}");
				}

				for (int i = 0; i < msgClip.extMsgs.Length; i++)
				{
					if (ContainsNonChinesePunctuation(msgClip.extMsgs[i]))
					{
						Debug.LogWarning($"{msgClip.blockId}:�ı����淶   {msgClip.extMsgs[i]}");
					}
				}

			}
		}
		public static void ModifyMsg(TimelineAsset timeline)
		{
			var MsgClips = GetClips<MsgActionTrack>(timeline);
			foreach (var clip in MsgClips)
			{
				MsgActionClip msgClip = clip.asset as MsgActionClip;

				// �޸� msg
				string originMsg = msgClip.msg;
				if (ContainsNonChinesePunctuation(originMsg))
				{
					string re = NonChineseReplace(originMsg);
					msgClip.msg = re;
					Debug.LogWarning($"{msgClip.blockId}:���ı�   {originMsg}");
					Debug.LogWarning($"{msgClip.blockId}:�޸�Ϊ   {re}");
				}

				// �޸� exMsg
				for (int i = 0; i < msgClip.extMsgs.Length; i++)
				{
					if (ContainsNonChinesePunctuation(msgClip.extMsgs[i]))
					{
						string re = NonChineseReplace(msgClip.extMsgs[i]);
						msgClip.extMsgs[i] = re;
						Debug.LogWarning($"{msgClip.blockId}:���ı�   {msgClip.extMsgs[i]}");
						Debug.LogWarning($"{msgClip.blockId}:�޸�Ϊ   {re}");
					}
				}
			}
		}
		public static void CheckJumpNext(TimelineAsset timeline)
		{
			var MsgClips = GetClips<MsgActionTrack>(timeline);
			var clips = MsgClips.Where(c => (c.asset as MsgActionClip).autoJumpNext == true);
			var ids = clips.Select(c => (c.asset as MsgActionClip).blockId);
			Debug.LogWarning("�Զ���ת��һ�� block: " + string.Join(", ", ids));
		}
		private static bool ContainsNonChinesePunctuation(string input)
		{
			// �� ���� ��Сд��ĸ ���� ���ı��
			string pattern1 = @"[^A-Z\u4e00-\u9fa5\w\s����������������������%��������������������]";
			bool match1 = Regex.IsMatch(input, pattern1);

			// ������ || ������ || ������ || ������ || ��
			string pattern2 = @"([(��)]{3,}|[��]{3,})|����\u2026|(\u2026����)|(?<!\u2026)\u2026(?!\u2026)";
			bool match2 = Regex.IsMatch(input, pattern2);

			// ���Ž�β
			string pattern3 = @"��$";
			bool match3 = Regex.IsMatch(input, pattern3);

			return match1 || match2 || match3;
		}
		private static string NonChineseReplace(string text)
		{
			string text1 = Regex.Replace(text, @"(?<!\u2026)\u2026(?!\u2026)", "����");
			string text2 = Regex.Replace(text1, @"��", "��");
			string text3 = Regex.Replace(text2, @"��", "��");
			string replacedText = Regex.Replace(text3, @"~", "����");
			return replacedText;
		}

		/// <summary>
		/// setName ɾ���հ׺��ظ�
		/// </summary>
		/// <param name="timeline"></param>
		public static void RemoveNoneSetNameClips(TimelineAsset timeline)
		{
			var setNameTracks = TimelineInfo.GetTracks<SetNameActionTrack>(timeline);
			foreach (var track in setNameTracks)
			{
				// ɾ���հ�
				var noneNameClips = track.GetClips().Where(c => (c.asset as SetNameActionClip).setName == "");
				noneNameClips.ForEach(c => timeline.DeleteClip(c));

				// 
				var singleClips = track.GetClips().DistinctBy(c => (c.asset as SetNameActionClip).setName);
				var exceptClips = track.GetClips().Except(singleClips);
				exceptClips.ForEach(a => timeline.DeleteClip(a));

				// 
				var names = track.GetClips().Select(c => (c.asset as SetNameActionClip).setName);
				Debug.Log(string.Join(",", names));
			}
			TimelineEditor.Refresh(RefreshReason.ContentsModified);
		}

		/// <summary>
		/// ˵�� �����ƶ�0.1s�������
		/// </summary>
		/// <param name="timeline"></param>
		public static void MoveTalkClips(TimelineAsset timeline)
		{
			TimelineClip[] blockClips = TimelineInfo.GetClips<MsgActionTrack>(timeline);
			TimelineClip[] talkClips = TimelineInfo.GetClips<PlayerTalkActionTrack>(timeline);

			for (int i = 0; i < blockClips.Length; i++)
			{
				var speakers = talkClips.Where(c => c.start > blockClips[i].start - 0.15d && c.end < blockClips[i].end + 0.15d);
				speakers.ForEach(c => c.start = blockClips[i].start + 0.1d);
				if (speakers.Count() > 1)
				{
					var names = speakers.Select(t => t.GetParentTrack().parent.name).ToArray();
					Debug.LogWarning($"block:{i} ���˵���� [{string.Join(", ", names)}]");
				}
				if (speakers.Count() == 0 && (blockClips[i].asset as MsgActionClip).msg != "")
				{
					Debug.LogWarning($"block:{i} û��˵����");
				}
			}
			TimelineEditor.Refresh(RefreshReason.ContentsModified);
		}

		/// <summary>
		/// ͨ�� ��鶪ʧĿ������
		/// </summary>
		/// <param name="timeline"></param>
		public static void CheckCommon(TimelineAsset timeline)
		{
			var commonClips = TimelineInfo.GetClips<CommonActionTrack>(timeline);
			foreach (var cl in commonClips)
			{
				var commonClip = cl.asset as CommonActionClip;
				if (commonClip.objFullPath != null)
				{
					var obj = GameObject.Find(commonClip.objFullPath);
					if (obj == null)
					{
						Debug.Log($"{timeline.name}, λ��: {cl.start}, obj: {commonClip.objFullPath}");
					}
				}
				else
				{
					Debug.LogWarning($"δָ��: {cl.start}");
				}
			}
		}

	}
}