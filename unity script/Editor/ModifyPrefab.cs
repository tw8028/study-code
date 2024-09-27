using BehaviorDesigner.Runtime.Tasks;
using Cysharp.Threading.Tasks;
using MagicaCloth2;
using NUnit.Framework;
using PersonBrowser;
using SRF;
using System.Collections;
using System.Collections.Generic;
using System.Threading.Tasks;
using UnityEditor;
using UnityEngine;
using UnityEngine.Analytics;
using UnityEngine.UIElements;

public class ModifyPrefab : EditorWindow
{
    private GameObject[] objs;

    [MenuItem("Test/tools/�޸� prefab")]
    public static void ShowWindow() { GetWindow<ModifyPrefab>("�޸� Prefab"); }
    public void CreateGUI()
    {
        Button btn1 = new() { name = "button1", text = "�޸� wind zone" };
        rootVisualElement.Add(btn1);
        btn1.RegisterCallback<ClickEvent>(ModifyPlayers);

        Button btn3 = new() { name = "button3", text = "get autoGen character" };
        rootVisualElement.Add(btn3);
        btn3.RegisterCallback<ClickEvent>(GetObjs);

        Button btn2 = new() { name = "button2", text = "�޸� auto gen prefab" };
        rootVisualElement.Add(btn2);
        btn2.RegisterCallback<ClickEvent>(ModifyAutoGen);

        Button btn4 = new() { name = "button4", text = "�޸� ��ɫ scale" };
        rootVisualElement.Add(btn4);
        btn4.RegisterCallback<ClickEvent>(ModifyScale);

        Button btn5 = new() { name = "button5", text = "�Ƴ�pos�ؼ�֡" };
        rootVisualElement.Add(btn5);
        btn5.RegisterCallback<ClickEvent>(RemovePosCurve);

        Button btn6 = new() { name = "button5", text = "�޸���̨����" };
        rootVisualElement.Add(btn6);
        btn6.RegisterCallback<ClickEvent>(ModifyBattery);
    }


    void ModifyBattery(ClickEvent evt)
    {
        GameObject[] objectArray = Selection.gameObjects;
        foreach (GameObject obj in objectArray)
        {
            // ��ʵ������ֱ���޸���Դ����Ҫ Ctrl+S �ֶ�����
            var ins = obj.transform.GetChild(0);
            try
            {
                ins.Find("R_Root/").ResetLocal();
                Debug.Log($"{ins.name}:{ins.Find("R_Root/").name}");
            }
            catch
            {
                ins.Find("R_root/").ResetLocal();
                Debug.Log($"{ins.name}:{ins.Find("R_root/").name}");
            }
        }
    }

    void ModifyScale(ClickEvent evt)
    {
        GameObject[] objectArray = Selection.gameObjects;
        foreach (GameObject obj in objectArray)
        {
            // ��ʵ������ֱ���޸���Դ����Ҫ Ctrl+S �ֶ�����
            obj.transform.GetChild(0).localScale = new Vector3(1.0f, 1.0f, 1.0f);
        }
    }
    void ModifyPlayers(ClickEvent evt)
    {
        GameObject[] objectArray = Selection.gameObjects;
        ModifyWind(objectArray);
    }

    void GetObjs(ClickEvent ent)
    {
        string[] subFloders = AssetDatabase.GetSubFolders("Assets/Art/AutoGen/Characters");
        string[] guids = AssetDatabase.FindAssets("character_A", subFloders);
        List<GameObject> list = new List<GameObject>();
        foreach (string guid in guids)
        {
            string path = AssetDatabase.GUIDToAssetPath(guid);
            GameObject obj = AssetDatabase.LoadAssetAtPath<GameObject>(path);
            list.Add(obj);
            Debug.Log(obj.name);
        }
        objs = list.ToArray();
    }
    void ModifyAutoGen(ClickEvent ent)
    {

        ModifyWind(objs);
    }


    void ModifyWind(GameObject[] objectArray)
    {
        foreach (GameObject obj in objectArray)
        {
            //instantiate asset.
            GameObject prefab = (GameObject)PrefabUtility.InstantiatePrefab(obj);
            //delete old wind zone
            if (prefab.transform.Find("Magica Wind Zone") is not null)
            {
                DestroyImmediate(prefab.transform.Find("Magica Wind Zone").gameObject);
            }
            if (prefab.transform.GetChild(0).Find("Magica Wind Zone") is not null)
            {
                DestroyImmediate(prefab.transform.GetChild(0).Find("Magica Wind Zone").gameObject);
            }
            // create new wind zone
            GameObject wind = new("Magica Wind Zone");
            wind.transform.SetParent(prefab.transform);
            var component = wind.AddComponent<MagicaWindZone>();
            component.directionAngleX = 180;// set direction
            component.main = 3;
            // save 
            string path = AssetDatabase.GetAssetPath(obj);

            PrefabUtility.SaveAsPrefabAssetAndConnect(prefab, path, InteractionMode.AutomatedAction);
            UniTask.Delay(10);
        }
    }

    public void RemovePosCurve(ClickEvent evt)
    {
        var obj = Selection.activeGameObject;
        var path = AssetDatabase.GetAssetPath(obj);
        AnimationClip clip = AssetDatabase.LoadAssetAtPath<AnimationClip>(path);

        Debug.Log(clip.name);

        EditorCurveBinding[] curveBingdings = AnimationUtility.GetCurveBindings(clip);
        foreach (var curveBingding in curveBingdings)
        {
            string name = curveBingding.propertyName.ToLower();
            string bone = curveBingding.path;
            // Debug.Log(bone);
            if (name.Contains("position") && bone != "Root/Bip001")
            {
                AnimationUtility.SetEditorCurve(clip, curveBingding, null); // Set to null to remove the curve.
            }
            if (name.Contains("scale"))
            {
                AnimationUtility.SetEditorCurve(clip, curveBingding, null);
            }
        }
    }
}