using System.Collections.Generic;
using System.IO;
using System.Linq;
using Art.temp.Editor.CharacterData;
using UnityEditor;
using UnityEngine;


namespace Art.temp.Editor.Structure
{
    public class StructureInfo
    {
        private readonly Structure config;
        private readonly Object folder;
        private string FolderPath => AssetDatabase.GetAssetPath(folder);

        public StructureInfo(Object folder, Structure config)
        {
            this.folder = folder;
            this.config = config;
        }

        private void Rename(Object obj)
        {
            string newName = obj.name.Replace(config.oldName, config.newName);
            string path = AssetDatabase.GetAssetPath(obj);
            AssetDatabase.RenameAsset(path, newName);
        }

        public void RenameAll()
        {
            List<Object> objects = AnimHelper
                .FindAssetsByFolders<Object>(filter: "t:Texture2D t:material t:gameObject", new[] { FolderPath })
                .ToList();
            foreach (Object obj in objects)
            {
                Rename(obj);
            }

            Rename(folder);
            Debug.Log($"{folder.name} >> {config.newName}");
        }

        public void MoveFolder()
        {
            string newPath = $"Assets/Art/Object/Fbxs/{config.category}/{folder.name}";
            if (config.category == "Item")
            {
                newPath = $"Assets/Art/Character/Models/Item/{folder.name}";
            }

            if (Directory.Exists(newPath))
            {
                IEnumerable<Object> gObjects =
                    AnimHelper.FindAssetsByFolders<GameObject>("t:gameObject", new[] { FolderPath });
                foreach (Object obj in gObjects)
                {
                    string oldFileName = AssetDatabase.GetAssetPath(obj);
                    string newFileName = Path.Combine(newPath, Path.GetFileName(oldFileName));
                    AssetDatabase.MoveAsset(oldFileName, newFileName);
                    Debug.Log($"move gameObject: {newFileName}");
                }
            }
            else
            {
                AssetDatabase.MoveAsset(FolderPath, newPath);
                Debug.Log($"move folder: {newPath}");
            }
        }
    }
}