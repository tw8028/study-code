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

public class StoryEditTool : EditorWindow
{
    string SceneName => SceneManager.GetActiveScene().name;
    PlayableDirector PlayableDirector => GameObject.Find("StoryManager/timeline").GetComponent<PlayableDirector>();

    Transform PlayersRoot => GameObject.Find("StoryManager/players").transform;

    TextElement text;

    [MenuItem("Test/prefab工具/Story Tool")]
    public static void ShowWindow() { GetWindow<StoryEditTool>("剧情工具"); }
    public void CreateGUI()
    {
        Button btn1 = new() { text = "替换为prefab（所有角色）" };
        rootVisualElement.Add(btn1);
        btn1.RegisterCallback<ClickEvent>(ResetPlayers);

        Button btn2 = new() { text = "替换为prefab（选择角色）" };
        rootVisualElement.Add(btn2);
        btn2.RegisterCallback<ClickEvent>(ResetPlayer);

        Button btn3 = new() { text = "替换角色clip" };
        rootVisualElement.Add(btn3);
        btn3.RegisterCallback<ClickEvent>(ChangePlayerClips);

        Button btn4 = new() { text = "clip info" };
        rootVisualElement.Add(btn4);
        btn4.RegisterCallback<ClickEvent>(GetClipsInfo);

        Button btn6 = new() { text = "导出剧情文本" };
        rootVisualElement.Add(btn6);
        btn6.RegisterCallback<ClickEvent>(ExportMsg);


		Button btn7 = new() { text = "import 剧情文本" };
		rootVisualElement.Add(btn7);
		btn7.RegisterCallback<ClickEvent>(ImportMsg);

		Button btn5 = new() { text = "计算行走时间" };
        rootVisualElement.Add(btn5);
        btn5.RegisterCallback<ClickEvent>(WalkTime);

        text = new TextElement();
        rootVisualElement.Add(text);
    }

    public void WalkTime(ClickEvent evt)
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
            text.text = $" walk01 需要走 {time1} 秒 \n walk02 需要走 {time2} 秒";
        }
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
            Debug.LogError($"无法找到对应角色prefab：{playerName}");
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
                Debug.LogWarning($"无法找到 {oldPlayers[i]} 对应prefab");
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

        if (PlayableDirector.playableAsset is TimelineAsset timeline)
        {
            foreach (TrackAsset track in timeline.GetOutputTracks())
            {
                // 检查轨道是否为AnimationTrack类型
                if (track is AnimationTrack animationTrack)
                {
                    var clips = animationTrack.GetClips();
                    // 处理历史clip名
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
                    Debug.Log($"替换clip：{track.parent.name}");
                }
            }
        }
        else
        {
            Debug.LogError("没找到timeline资");
        }
    }


    public void GetClipsInfo(ClickEvent evt)
    {
        if (PlayableDirector.playableAsset is TimelineAsset timeline)
        {
            foreach (TrackAsset track in timeline.GetOutputTracks())
            {
                // 检查轨道是否为AnimationTrack类型
                if (track is AnimationTrack animationTrack)
                {
                    var clips = animationTrack.GetClips();
                    Debug.Log(track.parent.name);
                    foreach (var clip in clips)
                    {
                        if (clip.animationClip == null)
                        {
                            Debug.LogError($"clip丢失:{clip.displayName}");
                        }
                        else
                        {
                            string clipName = clip.animationClip.name;
                            /* if (clipName.Contains("_crawl_") || clipName.Contains("_stand_") || clipName.Contains("_common"))
                             {
                                 string path = AssetDatabase.GetAssetPath(clip.animationClip);
                                 Debug.LogWarning($"使用了战斗动画:{path}");
                             }

                             else if (clipName.Contains("ready"))
                             {
                                 string path = AssetDatabase.GetAssetPath(clip.animationClip);
                                 Debug.LogWarning($"使用了ready动画:{path}");
                             }*/
                            if (!clipName.StartsWith("compressed"))
                            {
                                string path = AssetDatabase.GetAssetPath(clip.animationClip);
                                Debug.Log($"未压缩动画: {path}");
                            }
                        }
                    }
                }
            }
        }
        else
        {
            Debug.LogError("缺少timeline资源");
        }
    }

    public void ExportMsg(ClickEvent evt)
    {
        var savePath = $"D:/work/story_msg/{SceneName}.json";
        if (PlayableDirector.playableAsset is TimelineAsset timeline)
        {
            foreach (TrackAsset track in timeline.GetOutputTracks())
            {
                // 检查轨道是否为AnimationTrack类型
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
                        Debug.Log ($"{msgClip.blockId.ToString()} : {msgClip.msg}");
                        msgRoot.msgList.Add(msg);
                    }
                   
                    string jsonData = JsonUtility.ToJson(msgRoot);
                    File.WriteAllText(savePath, jsonData);
                }
            }
        }
    }

    public void ImportMsg(ClickEvent evt)
    {
		var importPath = $"D:/work/story_msg/{SceneName}.json";
		string jsonData = File.ReadAllText(importPath); // read
		List<Msg> msgList =  JsonUtility.FromJson<MsgRoot>(jsonData).msgList;


		if (PlayableDirector.playableAsset is TimelineAsset timeline)
		{
			foreach (TrackAsset track in timeline.GetOutputTracks())
			{
				if (track is MsgActionTrack msgActionTrack)
				{
					Debug.Log(track.parent.name);
					var clips = msgActionTrack.GetClips().ToArray();
					
					Debug.Log($"length: {clips.Length}");
					foreach (var clip in clips)
					{
						var msgClip = clip.asset as MsgActionClip;
						var msg = msgList.First(x=>x.id == msgClip.blockId.ToString());
						msgClip.msg = msg.velue;
					}
				}
			}
		}
        Debug.Log("done");
	}
}
