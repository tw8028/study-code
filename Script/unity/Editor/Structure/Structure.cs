using System.Collections.Generic;
using System.IO;
using System.Linq;
using NPOI.XSSF.UserModel;
using UnityEngine;

namespace Art.temp.Editor.Structure
{
    [System.Serializable]
    public class Structure
    {
        public string oldName;
        public string newName;
        public string category;
    }

    [System.Serializable]
    public class StructureData
    {
        // 字段名必须与 json 数据 root 对象名字相同
        public Structure[] structureArray;
    }

    public static class StructureTable
    {
        private static Structure[] GetStructures(string category)
        {
            string url = Application.dataPath + $"/Art/Temp/Editor/JsonData/{category}Data.json";
            string jsonData = File.ReadAllText(url); // read
            return JsonUtility.FromJson<StructureData>(jsonData).structureArray;
        }

        public static Structure[] GetAll()
        {
            var element = GetStructures("Element");
            var item = GetStructures("Item");
            var plant = GetStructures("Plant");
            var build = GetStructures("Build");
            return element.Concat(item).Concat(plant).Concat(build).ToArray();
        }

        public static void ExcelToJson(string category)
        {
            string excelPath = $"D:/{category}.xlsx";
            if (!File.Exists(excelPath))
            {
                Debug.LogWarning($"not find file: {excelPath}");
                return;
            }

            using var fs = new FileStream(excelPath, FileMode.Open, FileAccess.Read);
            var newExcel = new XSSFWorkbook(fs);
            var sheet = newExcel.GetSheetAt(0);

            List<Structure> structures = new();
            for (int i = 1; i <= sheet.LastRowNum; i++)
            {
                var row = sheet.GetRow(i);

                if (row?.GetCell(2) is null)
                {
                    continue;
                }

                Structure item = new()
                {
                    oldName = row.GetCell(2).StringCellValue,
                    newName = row.GetCell(3).StringCellValue,
                    category = category,
                };
                structures.Add(item);
            }

            var jObject = new StructureData() { structureArray = structures.ToArray() };
            string json = JsonUtility.ToJson(jObject);
            string jsonPath = Application.dataPath + $"/Art/Temp/Editor/JsonData/{category}Data.json";
            File.WriteAllText(jsonPath, json);
            Debug.Log(jsonPath);
        }
    }
}