using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using UnityEditor;
using UnityEngine;
using UnityEngine.UIElements;
public class AnimTool : EditorWindow
{
    [MenuItem("Test/prefab工具/Anim Tool")]
    public static void ShowWindow() { GetWindow<AnimTool>("提取anim文件"); }
    public void CreateGUI()
    {
        Button btn1 = new() { name = "button1", text = "提取anim" };
        rootVisualElement.Add(btn1);
        btn1.RegisterCallback<ClickEvent>(SeparateAnim);

        Button btn2 = new() { name = "button2", text = "提取anim到当前目录" };
        rootVisualElement.Add(btn2);
        btn2.RegisterCallback<ClickEvent>(SeparateAnim1);
    }

    public void SeparateAnim1(ClickEvent evt)
    {
        GameObject[] objs = Selection.gameObjects;
        if (objs.Length == 0)
        {
            Debug.LogWarning("请先选择至少一个Fbx文件");
        }
        foreach (GameObject obj in objs)
        {
            string objName = obj.name;
            string objPath =  AssetDatabase.GetAssetPath(obj);
            string animPath = Path.GetDirectoryName(objPath) + $"/{objName}.anim";
            AnimationClip clip = AssetDatabase.LoadAssetAtPath<AnimationClip>(objPath);
            AnimationClip newClip = new();
            EditorUtility.CopySerialized(clip, newClip);
            AssetDatabase.CreateAsset(newClip, animPath);
            Debug.Log($"生成anim：{animPath}");
        }
    }
    public void SeparateAnim(ClickEvent evt)
    {
        GameObject[] objs = Selection.gameObjects;
        if (objs.Length == 0)
        {
            Debug.LogWarning("请先选择至少一个Fbx文件");
        }
        foreach (GameObject obj in objs)
        {
            string objName = obj.name;
            string animPath = GetAnimPath(objName);

            if (animPath is null)
            {
                Debug.LogWarning($"无效的文件名: {objName}");
                break;
            }

            string objPath = AssetDatabase.GetAssetPath(obj);
            AnimationClip clip = AssetDatabase.LoadAssetAtPath<AnimationClip>(objPath);
            // 优化曲线
            if (clip == null)
            {
                Debug.LogWarning($"没有动画: {objName}");
                break;

            }
            else
            {
                AnimOptimize(clip);
            }
            // 提取anim文件, 保存
            AnimationClip newClip = new();
            EditorUtility.CopySerialized(clip, newClip);
            AssetDatabase.CreateAsset(newClip, animPath);
            AssetDatabase.ImportAsset(objPath);
            Debug.Log($"生成anim：{animPath}");
        }
        AssetDatabase.Refresh();
    }

    public void AnimOptimize(AnimationClip clip)
    {
        EditorCurveBinding[] curveBingdings = AnimationUtility.GetCurveBindings(clip);
        for (int ii = 0; ii < curveBingdings.Length; ++ii)
        {
            AnimationCurve curve = AnimationUtility.GetEditorCurve(clip, curveBingdings[ii]);

            // 删除移动帧(除了Bip001)和缩放帧
            string propName = curveBingdings[ii].propertyName.ToLower();
            string nodeName = Path.GetFileName(curveBingdings[ii].path);
            if (propName.Contains("position") && nodeName.StartsWith("Bip001 "))
            {
                curve = null;  //有空格，排除了“Bip001”
            }
            if (propName.Contains("scale"))
            {
                curve = null;
            }

            // 压缩浮点数
            /*if (curve != null && curve.keys != null)
            {
                Keyframe[] keyFrames = curve.keys;
                for (int i = 0; i < keyFrames.Length; i++)
                {
                    Keyframe key = keyFrames[i];
                    key.value = float.Parse(key.value.ToString("f3"));
                    key.inTangent = float.Parse(key.inTangent.ToString("f3"));
                    key.outTangent = float.Parse(key.outTangent.ToString("f3"));
                    keyFrames[i] = key;
                }
                curve.keys = keyFrames;
            }*/

            // curve为null,则删除曲线
            AnimationUtility.SetEditorCurve(clip, curveBingdings[ii], curve);
        }
    }


    public string GetAnimPath(string objName)
    {
        // 技能动画
        if (objName.StartsWith("ani_A"))
        {
            return $"Assets/Art/Animations/Battle/Skill/{objName}.anim";
        }
        // 火炮
        else if (objName.StartsWith("ani_R"))
        {
            string folder = objName.Split("_")[1];
            return $"Assets/Art/Animations/Battery/{folder}/{objName}.anim";
        }
        // 载具
        else if (objName.StartsWith("ani_C"))
        {
            string folder = objName.Split("_")[1];
            return $"Assets/Art/Animations/Vehicle/{folder}/{objName}.anim";
        }

        // common
        else if (objName.StartsWith("ani_common"))
        {
            return $"Assets/Art/Animations/Battle/Common/{objName}.anim";
        }
        // g01
        else if (objName.StartsWith("ani_g01"))
        {
            return $"Assets/Art/Animations/Battle/G01_AR/{objName}.anim";
        }
        // g02
        else if (objName.StartsWith("ani_g02"))
        {
            return $"Assets/Art/Animations/Battle/G02_DMR01/{objName}.anim";
        }
        // g03
        else if (objName.StartsWith("ani_g03"))
        {
            return $"Assets/Art/Animations/Battle/G03_BAR/{objName}.anim";
        }
        // g04
        else if (objName.StartsWith("ani_g04"))
        {
            return $"Assets/Art/Animations/Battle/G04_Bow/{objName}.anim";
        }
        // g05
        else if (objName.StartsWith("ani_g05"))
        {
            return $"Assets/Art/Animations/Battle/G05_SG/{objName}.anim";
        }
        // g06
        else if (objName.StartsWith("ani_g06"))
        {
            return $"Assets/Art/Animations/Battle/G06_SAR_lever/{objName}.anim";
        }
        // g08
        else if (objName.StartsWith("ani_g08"))
        {
            return $"Assets/Art/Animations/Battle/G08_MG/{objName}.anim";
        }
        // g11
        else if (objName.StartsWith("ani_g11"))
        {
            return $"Assets/Art/Animations/Battle/G11_HF_RPG/{objName}.anim";
        }
        else
        {
            return null;
        }
    }
}


