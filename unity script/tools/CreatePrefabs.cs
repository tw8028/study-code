using UnityEditor;
using UnityEngine;

public class CreatePrefabs
{
    [MenuItem("Tools/Create Prefab")]
    static void CreatePrefab()
    {
        GameObject[] objectArray = Selection.gameObjects;
        foreach (GameObject obj in objectArray)
        {
            string localPath = "Assets/Resources/Prefabs/" + obj.name + ".prefab";
            /*localPath = AssetDatabase.GenerateUniqueAssetPath(localPath);*/

            // save prefab asset 
            // add setupBody component
            bool prefabSuccess;
            PrefabUtility.SaveAsPrefabAsset(obj, localPath, out prefabSuccess).AddComponent<SetupBody>();
            if (prefabSuccess == true)
                Debug.Log(string.Format("{0} was saved successfully", obj.name));
            else
                Debug.Log("Prefab failed to save" + prefabSuccess);
        }
    }
}
