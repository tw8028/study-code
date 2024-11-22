using Gameplay.Story.Cmp;
using Microsoft.Win32;
using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using UnityEngine.Playables;
using UnityEngine.Timeline;
using UnityEngine.UIElements;

public class StoryEditTool : EditorWindow
{
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
        btn2.RegisterCallback<ClickEvent>(ResetSelection);

        Button btn3 = new() { text = "替换角色clip" };
        rootVisualElement.Add(btn3);
        btn3.RegisterCallback<ClickEvent>(ChangePlayerClips);

        Button btn4 = new() { text = "clip info" };
        rootVisualElement.Add(btn4);
        btn4.RegisterCallback<ClickEvent>(GetClipsInfo);

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



    public void ResetSelection(ClickEvent evt)
    {
        Transform root = GameObject.Find("StoryManager/players").transform;
        GameObject go = Selection.activeGameObject;
        string playerName = go.name;
        GameObject playerPrefab = FindPlayerPrefab(playerName);
        if (playerPrefab != null)
        {
            int playerId = go.GetComponent<CmpStoryPlayer>().playerId;
            DestroyImmediate(go);
            GameObject playerInstance = (GameObject)PrefabUtility.InstantiatePrefab(playerPrefab, root);
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
        Transform root = GameObject.Find("StoryManager/players").transform;
        Transform[] oldPlayers = new Transform[root.childCount];
        string[] playerNames = new string[root.childCount];
        for (int i = 1; i < oldPlayers.Length; i++)
        {
            oldPlayers[i] = root.GetChild(i);
            playerNames[i] = oldPlayers[i].name;
        }
        for (int i = 1; i < playerNames.Length; i++)
        {

            GameObject.DestroyImmediate(oldPlayers[i].gameObject);
            GameObject playerPrefab = FindPlayerPrefab(playerNames[i]);
            GameObject prefabInstance = (GameObject)PrefabUtility.InstantiatePrefab(playerPrefab, root);
            prefabInstance.name = playerNames[i];
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
            string prefabName = name.Remove(0, 1).Insert(0, "P_C");
            string prefabPath = $"Assets/Art/Character/Prefabs/Vehicle/{prefabName}.prefab";
            return AssetDatabase.LoadAssetAtPath<GameObject>(prefabPath);
        }
        else
        {
            return null;
        }
    }

    public void ChangePlayerClips(ClickEvent evt)
    {

        PlayableDirector pd = GameObject.Find("StoryManager/timeline").GetComponent<PlayableDirector>();
        if (pd.playableAsset is TimelineAsset timeline)
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
            Debug.LogError("没找到timeline资源");
        }
    }


    public void GetClipsInfo(ClickEvent evt)
    {
        PlayableDirector pd = GameObject.Find("StoryManager/timeline").GetComponent<PlayableDirector>();
        if (pd.playableAsset is TimelineAsset timeline)
        {
            foreach (TrackAsset track in timeline.GetOutputTracks())
            {
                // 检查轨道是否为AnimationTrack类型
                if (track is AnimationTrack animationTrack)
                {
                    var clips = track.GetClips();
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

                            if (clipName.Contains("_crawl_") || clipName.Contains("_stand_") || clipName.Contains("_common"))
                            {
                                string path = AssetDatabase.GetAssetPath(clip.animationClip);
                                Debug.LogWarning($"使用了战斗动画:{path}");
                            }

                            else if (clipName.Contains("ready"))
                            {
                                string path = AssetDatabase.GetAssetPath(clip.animationClip);
                                Debug.LogWarning($"使用了ready动画:{path}");
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
}
