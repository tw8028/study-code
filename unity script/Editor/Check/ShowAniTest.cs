using System;
using System.Linq;
using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using UnityEngine.UIElements;
using Sirenix.Utilities;
using BehaviorDesigner.Runtime.Tasks.Unity.UnityString;
using Google.Protobuf.WellKnownTypes;
using UnityEditor.Animations;
using PersonBrowser;


public class ShowAniTest : EditorWindow
{
    TextField startIdField;
    private readonly List<Person> persons = JsonData.GetData();
    private GameObject points;
    private List<GameObject> prefabList;
    private int stateCount = 0;
    private string[] stateNames = new string[] { "squatready001", "standready001", "standready002" };


    [MenuItem("Test/tools/ani test")]
    public static void ShowWindow() { GetWindow<ShowAniTest>("show ani test"); }

    public void CreateGUI()
    {
        startIdField = new TextField() { label = "起始prefab id:00001或01001" };
        rootVisualElement.Add(startIdField);

        Button btn1 = new() { name = "button1", text = "add prefab to point" };
        rootVisualElement.Add(btn1);
        btn1.RegisterCallback<ClickEvent>(AddPrefab);

        Button btn2 = new() { name = "button2", text = "remove" };
        rootVisualElement.Add(btn2);
        btn2.RegisterCallback<ClickEvent>(RemovePlayers);

        Button btn3 = new() { text = "chang animation" };
        rootVisualElement.Add(btn3);
        btn3.RegisterCallback<ClickEvent>(ChangAni);

        Button btn4 = new() { text = "play skill" };
        rootVisualElement.Add(btn4);
        btn4.RegisterCallback<ClickEvent>(PlaySkill);

        points = GameObject.Find("Points");
    }

    public void AddPrefab(ClickEvent evt)
    {
        prefabList = new();
        if (startIdField.value.Length != 5)
        {
            Debug.Log("请输入正确id");
            return;
        }
        int id = Convert.ToInt32(startIdField.value);
        int n = 1;
        for (int i = id; i < id + 10; i++)
        {
            Transform point = points.transform.Find($"Point{n}");
            n++;
            string idName = i.ToString().PadLeft(5, '0');
            string[] guids = AssetDatabase.FindAssets($"t:GameObject", new string[] { $"Assets/Art/AutoGen/Characters/character_A{idName}/" });
            if (guids.Length != 0)
            {
                string path = AssetDatabase.GUIDToAssetPath(guids[0]);
                GameObject prefab = AssetDatabase.LoadAssetAtPath<GameObject>(path);
                GameObject instance = (GameObject)PrefabUtility.InstantiatePrefab(prefab, point);
                prefabList.Add(instance);
            }
        }
    }
    public void RemovePlayers(ClickEvent evt)
    {
        foreach (GameObject item in prefabList)
        {
            DestroyImmediate(item);
        }
    }
    public void ChangAni(ClickEvent evt)
    {
        stateCount = (stateCount + 1) % stateNames.Length;
        Debug.Log($"切换动作：{stateCount}");
        string nextStateName = stateNames[stateCount];
        foreach (GameObject item in prefabList)
        {
            Transform assetTransform = item.transform.GetChild(0);
            Animator animator = assetTransform.GetComponent<Animator>();

            // 查询动作模组
            string assetName = "";
            assetName = assetTransform.name.Remove(2, 1);
            assetName = assetName.Insert(2, "0");
            string aniSet = persons.First(item => item.id == assetName).aniSet;
            string acPath = $"Assets/Art/Animations/animator/display_ovrride_{aniSet}.overrideController";

            // config animator controller
            animator.runtimeAnimatorController = AssetDatabase.LoadAssetAtPath<RuntimeAnimatorController>(acPath);

            animator.Play(nextStateName);
            Debug.Log(nextStateName);
        }
    }
    public void PlaySkill(ClickEvent evt)
    {
        foreach (GameObject item in prefabList)
        {
            Transform assetTransform = item.transform.GetChild(0);
            Animator animator = assetTransform.GetComponent<Animator>();

            // 查询动作模组
            string assetName = "";
            assetName = assetTransform.name.Remove(2, 1);
            assetName = assetName.Insert(2, "0");
            string aniSet = persons.First(item => item.id == assetName).aniSet;
            string acPath = $"Assets/Art/AutoGen/Characters/character_{assetName}/ov_{assetName}_{aniSet}.overrideController";

            // config animator controller
            var rac = AssetDatabase.LoadAssetAtPath<RuntimeAnimatorController>(acPath);
            Debug.Log(rac.name);
            animator.runtimeAnimatorController = AssetDatabase.LoadAssetAtPath<RuntimeAnimatorController>(acPath);
           
            animator.Play($"skill");
        }
    }
}
