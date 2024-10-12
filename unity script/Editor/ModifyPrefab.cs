using Cysharp.Threading.Tasks;
using MagicaCloth2;
using SRF;
using System.Collections.Generic;
using System.Linq;
using UnityEditor;
using UnityEditor.Experimental;
using UnityEngine;
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
        btn5.RegisterCallback<ClickEvent>(AnimOptimize);

        Button btn6 = new() { name = "button6", text = "�޸���̨����" };
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

    public void AnimOptimize(ClickEvent evt)
    {
        var obj = Selection.activeGameObject;
        var path = AssetDatabase.GetAssetPath(obj);
        AnimationClip clip = AssetDatabase.LoadAssetAtPath<AnimationClip>(path);

        Debug.Log(clip.name);

        // ɾ��POS������֡
        EditorCurveBinding[] curveBingdings = AnimationUtility.GetCurveBindings(clip);
        foreach (var curveBingding in curveBingdings)
        {
            string name = curveBingding.propertyName.ToLower();
            string bonePath = curveBingding.path;
            // ɾ��POS��Ҫ�ų����ģ������ҵ�
            string[] fliter = new string[]{
             "Root/Bip001",
             "Root/Bip001/Bip001 Spine/Bip001 Spine1/Bip001 R Clavicle/Bip001 R UpperArm/Bip001 R Forearm/Bip001 R Hand/Grip_point01",
             "Root/Bip001/Bip001 Spine/Bip001 Spine1/Bip001 L Clavicle/Bip001 L UpperArm/Bip001 L Forearm/Bip001 L Hand/Grip_point02"};
            // Debug.Log(bone);
            if (name.Contains("position") && !fliter.Any(a => a == bonePath))
            {
                AnimationUtility.SetEditorCurve(clip, curveBingding, null); // Set to null to remove the curve.
            }
            if (name.Contains("scale"))
            {
                AnimationUtility.SetEditorCurve(clip, curveBingding, null);
            }
        }

        // ���㾫��ѹ��
        AnimationClipCurveData[] curves = null;
        curves = AnimationUtility.GetAllCurves(clip);
        Keyframe key;
        Keyframe[] keyFrames;
        for (int ii = 0; ii < curves.Length; ++ii)
        {
            AnimationClipCurveData curveDate = curves[ii];
            if (curveDate.curve == null || curveDate.curve.keys == null)
            {
                continue;
            }
            keyFrames = curveDate.curve.keys;
            for (int i = 0; i < keyFrames.Length; i++)
            {
                key = keyFrames[i];
                key.value = float.Parse(key.value.ToString("f3"));
                key.inTangent = float.Parse(key.inTangent.ToString("f3"));
                key.outTangent = float.Parse(key.outTangent.ToString("f3"));
                keyFrames[i] = key;
            }
            curveDate.curve.keys = keyFrames;
            clip.SetCurve(curveDate.path, curveDate.type, curveDate.propertyName, curveDate.curve);
        }

        // ��ȡanim�ļ�
        AnimationClip newClip = new AnimationClip();
        EditorUtility.CopySerialized(clip, newClip);
        string newAnimPath = "";
        AssetDatabase.CreateAsset(newClip, newAnimPath);
    }
}