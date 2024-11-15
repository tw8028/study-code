using System.Collections;
using System.Collections.Generic;
using System.IO;
using UnityEditor;
using UnityEngine;
using UnityEngine.UIElements;

public class ModifyPrefab : EditorWindow
{
    [MenuItem("Test/tools/修改 Tool")]
    public static void ShowWindow() { GetWindow<ModifyPrefab>("修改工具"); }

    public void CreateGUI()
    {
        Button btn1 = new() { text = "移动 prefab" };
        rootVisualElement.Add(btn1);
        btn1.RegisterCallback<ClickEvent>(MovePrefab);
    }
    public void MovePrefab(ClickEvent evt)
    {
        Object[] objs = Selection.objects;
        foreach (Object obj in objs)
        {
            string oldPath = AssetDatabase.GetAssetPath(obj);
            string newPath = GetNewPath(obj);
            AssetDatabase.MoveAsset(oldPath, newPath);
        }

    }
    public string GetNewPath(Object obj)
    {        
        if (obj.name.StartsWith("P_R"))
        {
            string folder = obj.name.Split('_')[1];
            string folderPath = $"Assets/Art_Out/AutoGen/Battery/{folder}";

            if (!Directory.Exists(folderPath))
            {
                Directory.CreateDirectory(folderPath);
            }


            return $"Assets/Art_Out/AutoGen/Battery/{folder}/{obj.name}.prefab";
        }

        else if (obj.name.StartsWith("ov_battery"))
        {
            string folder = obj.name.Split('_')[2];
            string folderPath = $"Assets/Art_Out/AutoGen/Battery/{folder}";
            return $"Assets/Art_Out/AutoGen/Battery/{folder}/{obj.name}.controller";
        }

        else
        {
            return null;
        }
    }
}
