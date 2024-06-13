using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor;
using System.Xml.Linq;

public class Createprefabs 
{
    [MenuItem("Tools/Create Prefabs")]
    static void Create()
    {
        GameObject[] objs = Selection.gameObjects;
        foreach (GameObject obj in objs)
        {
            GameObject root = new GameObject($"P_{obj.name}");
            GameObject prefab = (GameObject)PrefabUtility.InstantiatePrefab(obj, root.transform);
        }
    }

    [MenuItem("Tools/Get Prefabs")]
    static void Get()
    {
        GameObject[] objs = Selection.gameObjects;
        foreach (GameObject obj in objs)
        {
            GameObject ins = (GameObject)PrefabUtility.InstantiatePrefab(obj);
        }
    }

    [MenuItem("Tools/Save Prefabs")]
    static void Save()
    {
        GameObject[] objs = Selection.gameObjects;
        foreach (GameObject obj in objs)
        {
            string path = $"Assets/Prefab/{obj.name}.prefab";
            GameObject p = (GameObject)PrefabUtility.SaveAsPrefabAssetAndConnect(obj, path, InteractionMode.UserAction);
        }
    }
    [MenuItem("Tools/Add GameObject")]
    static void AddGameObject()
    {
        GameObject[] obj = Selection.gameObjects;

    }
}
