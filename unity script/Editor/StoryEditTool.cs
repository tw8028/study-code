using Gameplay.Story.Cmp;
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
            int playerId =   go.GetComponent<CmpStoryPlayer>().playerId;
            DestroyImmediate(go);
            GameObject playerInstance = (GameObject)PrefabUtility.InstantiatePrefab(playerPrefab, root);
            playerInstance.name = playerName;
            var cmpStoryPlayer =  playerInstance.AddComponent<CmpStoryPlayer>();
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
        if (pd is null)
        {
            Debug.LogError("缺少timeline资源");
            return;
        }
        TimelineAsset timeline = pd.playableAsset as TimelineAsset;
        if (timeline is null)
        {
            Debug.LogError("缺少timeline资源");
            return;
        }

        foreach (TrackAsset track in timeline.GetOutputTracks())
        {
            // 检查轨道是否为AnimationTrack类型
            if (track is AnimationTrack animationTrack)
            {
                var clips = track.GetClips();
                Debug.Log(track.parent.name);
                foreach (var clip in clips)
                {
                    string clipName = clip.animationClip.name;
                    // 给 animation playable asset 赋值
                    string path = $"Assets/Art/Animations/Show/{clipName}.anim";
                    var clipAsset = AssetDatabase.LoadAssetAtPath<Object>(path);
                    if (clipAsset != null)
                    {
                        clip.asset = clipAsset;
                    }
                    else
                    {
                        Debug.LogError($"{track.parent.name}缺少资源：{clipName}");
                        break;
                    }
                }
            }
        }

    }
}
