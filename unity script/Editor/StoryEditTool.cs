using Gameplay.Story.Cmp;
using Gameplay.Story.Cmp.Timeline.MsgAction;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEditor;
using UnityEngine;
using UnityEngine.Playables;
using UnityEngine.Timeline;
using UnityEngine.UIElements;
using PersonBrowser;
using System.IO;
using UnityEngine.SceneManagement;
using System.Text.RegularExpressions;
using SRF;

public class StoryEditTool : EditorWindow
{
	string SceneName => SceneManager.GetActiveScene().name;

	IEnumerable<TrackAsset> Tracks
	{
		get
		{
			PlayableDirector pd = GameObject.Find("StoryManager/timeline").GetComponent<PlayableDirector>();
			TimelineAsset timeline = pd.playableAsset as TimelineAsset;
			return timeline.GetOutputTracks();
		}
	}

	Transform PlayersRoot => GameObject.Find("StoryManager/players").transform;

	TextField TextField1;

	private Vector3 pos;
	private Vector3 ro;
	private Vector3 scale;

	[MenuItem("Test/prefab����/Tool Story")]
	public static void ShowWindow() { GetWindow<StoryEditTool>("���鹤��"); }
	public void CreateGUI()
	{
		Button btn1 = new() { text = "�滻Ϊ prefab�����н�ɫ��" };
		rootVisualElement.Add(btn1);
		btn1.RegisterCallback<ClickEvent>(ResetPlayers);

		Button btn2 = new() { text = "�滻Ϊ prefab��ѡ���ɫ��" };
		rootVisualElement.Add(btn2);
		btn2.RegisterCallback<ClickEvent>(ResetPlayer);

		Button btn3 = new() { text = "�滻��ɫ clip" };
		rootVisualElement.Add(btn3);
		btn3.RegisterCallback<ClickEvent>(ChangePlayerClips);

		Button btn4 = new() { text = "clip info" };
		rootVisualElement.Add(btn4);
		btn4.RegisterCallback<ClickEvent>(GetClipsInfo);


		/* Button btn6 = new() { text = "���������ı�" };
         rootVisualElement.Add(btn6);
         btn6.RegisterCallback<ClickEvent>(ExportMsg);


         Button btn7 = new() { text = "import �����ı�" };
         rootVisualElement.Add(btn7);
         btn7.RegisterCallback<ClickEvent>(ImportMsg);*/

		Box box2 = new Box();
		box2.style.marginTop = 10;
		rootVisualElement.Add(box2);

		Button btn8 = new() { text = "����ı�" };
		box2.Add(btn8);
		btn8.RegisterCallback<ClickEvent>(MsgCheck);

		TextField1 = new("search");
		box2.Add(TextField1);

		Button btn9 = new() { text = "�����ı�" };
		box2.Add(btn9);
		btn9.RegisterCallback<ClickEvent>(MsgSearch);

		Button btn10 = new() { text = "�滻�ı�" };
		box2.Add(btn10);
		btn10.RegisterCallback<ClickEvent>(MsgReplace);


		Box box1 = new Box();
		box1.style.marginTop = 10;
		box1.Add(new Label() { text = "С����" });
		rootVisualElement.Add(box1);

		Button btn5 = new() { text = "��������ʱ��" };
		box1.Add(btn5);
		btn5.RegisterCallback<ClickEvent>(WalkTime);

		Button btn11 = new() { text = "���� transform" };
		box1.Add(btn11);
		btn11.RegisterCallback<ClickEvent>(CopyTransform);

		Button btn12 = new() { text = "ճ�� transform" };
		box1.Add(btn12);
		btn12.RegisterCallback<ClickEvent>(PasteTransform);
	}

	public void WalkTime(ClickEvent evt)
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

	public void CopyTransform(ClickEvent evt)
	{
		Transform trans = Selection.activeTransform;
		pos = trans.localPosition;
		ro = trans.localEulerAngles;
		scale = trans.localScale;
	}

	public void PasteTransform(ClickEvent evt)
	{
		Transform trans = Selection.activeTransform;
		trans.localPosition = pos;
		trans.localEulerAngles = ro;
		trans.localScale = scale;
	}

	public void ResetPlayer(ClickEvent evt)
	{
		GameObject go = Selection.activeGameObject;
		string playerName = go.name;
		GameObject playerPrefab = FindPlayerPrefab(playerName);
		if (playerPrefab != null)
		{
			int playerId = go.GetComponent<CmpStoryPlayer>().playerId;
			DestroyImmediate(go);
			GameObject playerInstance = (GameObject)PrefabUtility.InstantiatePrefab(playerPrefab, PlayersRoot);
			playerInstance.name = playerName;
			var cmpStoryPlayer = playerInstance.AddComponent<CmpStoryPlayer>();
			cmpStoryPlayer.playerId = playerId;
		}
		else
		{
			Debug.LogError($"�޷��ҵ���Ӧ��ɫprefab��{playerName}");
		}
	}

	public void ResetPlayers(ClickEvent evt)
	{
		Transform[] oldPlayers = new Transform[PlayersRoot.childCount];
		string[] playerNames = new string[PlayersRoot.childCount];
		int[] playerIds = new int[PlayersRoot.childCount];
		for (int i = 0; i < oldPlayers.Length; i++)
		{
			oldPlayers[i] = PlayersRoot.GetChild(i);
			playerNames[i] = oldPlayers[i].name;
			playerIds[i] = oldPlayers[i].GetComponent<CmpStoryPlayer>().playerId;
		}
		for (int i = 0; i < playerNames.Length; i++)
		{
			if (playerNames[i].Split('_')[2] == "100")
			{
				continue;
			}

			GameObject.DestroyImmediate(oldPlayers[i].gameObject);
			GameObject playerPrefab = FindPlayerPrefab(playerNames[i]);
			if (playerPrefab == null)
			{
				Debug.LogWarning($"�޷��ҵ� {oldPlayers[i]} ��Ӧ prefab");
			}
			GameObject prefabInstance = (GameObject)PrefabUtility.InstantiatePrefab(playerPrefab, PlayersRoot);
			prefabInstance.name = playerNames[i];
			var cmpStoryPlayer = prefabInstance.AddComponent<CmpStoryPlayer>();
			cmpStoryPlayer.playerId = playerIds[i];
		}
	}

	public GameObject FindPlayerPrefab(string playerName)
	{
		string name = playerName.Split('_')[2];
		if (name.StartsWith("1"))
		{
			string prefabName = name.Remove(0, 1).Insert(0, "P_S_A");
			string prefabPath = $"Assets/Art/Character/Prefabs/Players_S/{prefabName}.prefab";
			return AssetDatabase.LoadAssetAtPath<GameObject>(prefabPath);
		}
		else if (name.StartsWith("9"))
		{
			string prefabName = name.Remove(0, 1).Insert(0, "P_S_N");
			string prefabPath = $"Assets/Art/Character/Prefabs/Npc_S/{prefabName}.prefab";
			return AssetDatabase.LoadAssetAtPath<GameObject>(prefabPath);
		}
		else if (name.StartsWith("2"))
		{
			string prefabName = name.Remove(0, 1).Insert(0, "P_S_E");
			string prefabPath = $"Assets/Art/Character/Prefabs/Enemy_S/{prefabName}.prefab";
			return AssetDatabase.LoadAssetAtPath<GameObject>(prefabPath);
		}
		else if (name.StartsWith("3"))
		{
			string prefabName = "P_S_" + name;
			string prefabPath = $"Assets/Art/Character/Prefabs/Vehicle_S/{prefabName}.prefab";
			return AssetDatabase.LoadAssetAtPath<GameObject>(prefabPath);
		}
		else
		{
			return null;
		}
	}

	public void ChangePlayerClips(ClickEvent evt)
	{

		foreach (TrackAsset track in Tracks)
		{
			// ������Ƿ�ΪAnimationTrack����
			if (track is AnimationTrack animationTrack)
			{
				var clips = animationTrack.GetClips();
				// ������ʷclip��
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
				Debug.Log($"�滻 clip��{track.parent.name}");
			}
		}

	}


	public void GetClipsInfo(ClickEvent evt)
	{
		foreach (TrackAsset track in Tracks)
		{
			// ������Ƿ�ΪAnimationTrack����
			if (track is AnimationTrack animationTrack)
			{
				var clips = animationTrack.GetClips();
				Debug.Log(track.parent.name);
				foreach (var clip in clips)
				{
					if (clip.animationClip == null)
					{
						Debug.LogError($"clip��ʧ:{clip.displayName}");
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
							string path = AssetDatabase.GetAssetPath(clip.animationClip);
							Debug.LogWarning($"δѹ������: {path}");
						}
					}
				}
			}
		}

	}

	public void ExportMsg(ClickEvent evt)
	{
		var savePath = $"D:/work/story_msg/{SceneName}.json";

		foreach (TrackAsset track in Tracks)
		{
			// ������Ƿ�ΪAnimationTrack����
			if (track is MsgActionTrack msgActionTrack)
			{
				Debug.Log(track.parent.name);
				var clips = msgActionTrack.GetClips().ToArray();
				MsgRoot msgRoot = new();
				msgRoot.msgList = new List<Msg>();
				Debug.Log($"length: {clips.Length}");
				foreach (var clip in clips)
				{
					if (clip == null)
					{
						continue;
					}
					var msgClip = clip.asset as MsgActionClip;
					Msg msg = new Msg();
					msg.id = msgClip.blockId.ToString();
					msg.velue = msgClip.msg;
					Debug.Log($"{msgClip.blockId.ToString()} : {msgClip.msg}");
					msgRoot.msgList.Add(msg);
				}

				string jsonData = JsonUtility.ToJson(msgRoot);
				File.WriteAllText(savePath, jsonData);
			}
		}

	}

	public void ImportMsg(ClickEvent evt)
	{
		var importPath = $"D:/work/story_msg/{SceneName}.json";
		string jsonData = File.ReadAllText(importPath); // read
		List<Msg> msgList = JsonUtility.FromJson<MsgRoot>(jsonData).msgList;

		foreach (TrackAsset track in Tracks)
		{
			if (track is MsgActionTrack msgActionTrack)
			{
				Debug.Log(track.parent.name);
				var clips = msgActionTrack.GetClips().ToArray();

				Debug.Log($"length: {clips.Length}");
				foreach (var clip in clips)
				{
					var msgClip = clip.asset as MsgActionClip;
					var msg = msgList.First(x => x.id == msgClip.blockId.ToString());
					msgClip.msg = msg.velue;
				}
			}
		}
		Debug.Log("done");
	}

	static bool ContainsNonChinesePunctuation(string input)
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

	static string[] GetMsgs(TimelineClip clip)
	{
		MsgActionClip msgClip = clip.asset as MsgActionClip;
		if (msgClip.extMsgs.Length == 0)
		{
			return new string[] { msgClip.msg };
		}
		else
		{
			return msgClip.extMsgs;
		}
	}

	public void MsgCheck(ClickEvent evt)
	{

		foreach (TrackAsset track in Tracks)
		{
			if (track is MsgActionTrack msgActionTrack)
			{
				Debug.Log(SceneName);
				var clips = msgActionTrack.GetClips();
				foreach (var clip in clips)
				{
					MsgActionClip msgClip = clip.asset as MsgActionClip;

					// ����ı�����
					string[] msgs = GetMsgs(clip);
					foreach (var msg in msgs)
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
		}
	}

	public void MsgSearch(ClickEvent evt)
	{
		foreach (TrackAsset track in Tracks)
		{
			if (track is MsgActionTrack msgActionTrack)
			{
				Debug.Log(SceneName);
				var clips = msgActionTrack.GetClips();
				foreach (var clip in clips)
				{
					MsgActionClip msgClip = clip.asset as MsgActionClip;
					string[] msgs = GetMsgs(clip);
					foreach (var msg in msgs)
					{
						if (msg.Contains(TextField1.value) && TextField1.value != "")
						{
							Debug.LogWarning($"{msgClip.blockId}:����({TextField1.value})    {msg}");
						}
					}
				}
			}
		}
	}
	public void MsgReplace(ClickEvent evt)
	{
		foreach (TrackAsset track in Tracks)
		{
			if (track is MsgActionTrack msgActionTrack)
			{
				Debug.Log(SceneName);
				var clips = msgActionTrack.GetClips();
				foreach (var clip in clips)
				{
					MsgActionClip msgClip = clip.asset as MsgActionClip;

					string originMsg = msgClip.msg;
					if (ContainsNonChinesePunctuation(originMsg))
					{
						string re = NonChineseReplace(originMsg);
						msgClip.msg = re;
						Debug.LogWarning($"{msgClip.blockId}:���ı�   {originMsg}");
						Debug.LogWarning($"{msgClip.blockId}:�޸�Ϊ   {re}");
					}

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
		}
	}

	public string NonChineseReplace(string text)
	{
		string text1 = Regex.Replace(text, @"(?<!\u2026)\u2026(?!\u2026)", "����");
		string text2 = Regex.Replace(text1, @"��", "��");
		string text3 = Regex.Replace(text2, @"��", "��");
		string replacedText = Regex.Replace(text3, @"~", "����");
		return replacedText;
	}
}
