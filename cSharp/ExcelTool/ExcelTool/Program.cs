using System.Data;
using System.IO;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using OfficeOpenXml;

namespace ExcelTool;

internal class Program
{
    static void Main(string[] args)
    {
        string excelPath = @"D:\Code\纳罗达人设总表.xlsx";
        string workSheet = "Sheet1";
        int row = 121;
        int column = 32;
        Dictionary<int, string> col = new()
        {
            { 0, "id" },
            { 3, "name" },
            { 9, "weapon" },
            { 11, "aniSet" },
            { 23, "skin_0" },
            { 24, "prefab_0" },
            { 28, "skin_1" },
            { 29, "prefab_1" },
            { 30, "ani_0" },
            { 31, "ani_1" }
        };

        string jsonPath = @"D:\Code\a.json";

        DataTable data = GetDataFromExcel(excelPath, workSheet, row, column);
        DataTable dataColumns = SelectColumnsByName(data, col);
        ExportJson(dataColumns, jsonPath);
    }

    /// <summary>
    /// 通过path, workSheet, row, column 获取 dataTable
    /// 将ExcelWorkSheet转化为 dataTable
    /// </summary>
    /// <param name="path"></param>
    /// <param name="sheetName"></param>
    /// <returns></returns>
    private static DataTable GetDataFromExcel(string path, string sheetName, int row, int column)
    {
        using (FileStream fs = new(path, FileMode.Open))
        {
            ExcelPackage.LicenseContext = LicenseContext.NonCommercial;
            using (ExcelPackage package = new(fs))
            {
                ExcelWorksheet sheet = package.Workbook.Worksheets[1];
                return sheet.Cells[1, 1, row, column].ToDataTable(x => x.AlwaysAllowNull = true);
            }
        }
    }

    /// <summary>
    /// 筛选列，通过字典根据key选择列，并用value重命名列
    /// </summary>
    /// <param name="data"></param>
    /// <param name="col"></param>
    /// <returns></returns>
    private static DataTable SelectColumnsByName(DataTable data, Dictionary<int, string> col)
    {
        foreach (int key in col.Keys)
        {
            data.Columns[key].ColumnName = col[key];
        }
        return data.DefaultView.ToTable(false, col.Values.ToArray());
    }

    /// <summary>
    /// 通过DataTable 输出Json文件
    /// </summary>
    /// <param name="worksheet"></param>
    /// <param name="fileName"></param>
    private static void ExportJson(DataTable data, string toPath)
    {
        string rootName = "personList";
        JObject root = new JObject();
        JArray arr = new JArray();
        foreach (DataRow dataRow in data.Rows)
        {
            JObject obj = new JObject();
            foreach (DataColumn dataCol in data.Columns)
            {
                obj.Add(dataCol.ColumnName, dataRow[dataCol.ColumnName].ToString());
            }
            arr.Add(obj);
        }
        foreach (var item in arr)
        {
            if (item["weapon"] != null)
            {
                item["weapon"] = "G" + item["weapon"].ToString().PadLeft(5, '0');
            }

            if (item["aniSet"].ToString().Length >= 3)
            {
                item["aniSet"] = item["aniSet"].ToString().Substring(0, 3);
            }
        }
        root.Add(rootName, arr);
        File.WriteAllText(toPath, root.ToString());
    }
}