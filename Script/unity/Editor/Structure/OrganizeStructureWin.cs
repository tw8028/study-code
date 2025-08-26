using System.Linq;
using BehaviorDesigner.Runtime.Tasks.Unity.UnityString;
using UnityEditor;
using UnityEngine;
using UnityEngine.UIElements;

namespace Art.temp.Editor.Structure
{
    public class OrganizeStructureWin : EditorWindow
    {
        private static Structure[] Data => StructureTable.GetAll();

        [MenuItem("Test/prefab工具/Structure Organize")]
        public static void ShowWindow()
        {
            GetWindow<OrganizeStructureWin>("Structure Organize");
        }

        public void CreateGUI()
        {
            Button btn1 = new() { text = "导出 json data" };
            rootVisualElement.Add(btn1);
            btn1.RegisterCallback<ClickEvent>(_ => ToJson());

            Button btn2 = new() { text = "移动模型文件夹" };
            rootVisualElement.Add(btn2);
            btn2.RegisterCallback<ClickEvent>(_ => MoveModelFolder());

            Button btn3 = new() { text = "重命名模型贴图材质" };
            rootVisualElement.Add(btn3);
            btn3.RegisterCallback<ClickEvent>(_ => RenameModel());

            Button btn4 = new() { text = "移动并重命名 prefab" };
            rootVisualElement.Add(btn4);
            btn4.RegisterCallback<ClickEvent>(_ => MovePrefab());
        }

        private static void ToJson()
        {
            StructureTable.ExcelToJson("Element");
            StructureTable.ExcelToJson("Plant");
            StructureTable.ExcelToJson("Build");
            StructureTable.ExcelToJson("Item");
        }

        private static void MoveModelFolder()
        {
            Object[] folders = Selection.GetFiltered<Object>(SelectionMode.Assets);
            foreach (Object folder in folders)
            {
                Structure structure = Data.SingleOrDefault(s => s.oldName == folder.name);
                if (structure == null)
                {
                    Debug.LogWarning($"{folder.name}: 缺少配置");
                    continue;
                }

                StructureInfo info = new(folder, structure);
                info.MoveFolder();
            }

            AssetDatabase.Refresh();
        }

        private static void RenameModel()
        {
            Object[] folders = Selection.objects;
            foreach (Object folder in folders)
            {
                Structure structure = Data.SingleOrDefault(s => s.oldName == folder.name);
                if (structure == null)
                {
                    Debug.LogWarning($"{folder.name}: 缺少配置");
                    continue;
                }

                StructureInfo info = new(folder, structure);
                info.RenameAll();
            }

            AssetDatabase.Refresh();
        }

        // 移动 character/prefabs 中的建筑
        // 目录：Build Camp Camp_I Decorate Legion Plant Pvpbuild Structure Summon
        private static void MovePrefab()
        {
            AssetDatabase.StartAssetEditing();
            AssetDatabase.DisallowAutoRefresh();

            GameObject[] gameObjects = Selection.gameObjects;
            foreach (GameObject go in gameObjects)
            {
                if (go.transform.childCount > 1)
                {
                    Debug.LogWarning($"{go}: 有{go.transform.childCount}个子物体");
                }

                string nameId = go.name;
                Structure structure =
                    Data.SingleOrDefault(s => !string.IsNullOrEmpty(s.oldName) && nameId.Contains(s.oldName));

                if (structure == null)
                {
                    Debug.LogWarning($"{nameId}: 缺少配置");
                    continue;
                }

                string oldFileName = AssetDatabase.GetAssetPath(go);
                string prefabName = go.name.Replace(structure.oldName, structure.newName);
                string newFileName = $"Assets/Art/Object/Prefabs/{structure.category}/{prefabName}.prefab";
                if (structure.newName.StartsWith("I"))
                {
                    newFileName = $"Assets/Art/Character/Prefabs/Item/{prefabName}.prefab";
                }

                if (AssetDatabase.LoadAssetAtPath<Object>(newFileName))
                {
                    Debug.LogWarning($"重复的 FileName : {newFileName}");
                    continue;
                }

                AssetDatabase.MoveAsset(oldFileName, newFileName);
                Debug.Log($"{oldFileName} >> {newFileName}");
            }

            AssetDatabase.AllowAutoRefresh();
            AssetDatabase.StopAssetEditing();
            AssetDatabase.Refresh();
        }
    }
}