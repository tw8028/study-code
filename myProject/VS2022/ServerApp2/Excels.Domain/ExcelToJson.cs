﻿using System.Data.Common;
using System.Data;
using OfficeOpenXml;
using Newtonsoft.Json.Linq;

namespace Excels.Domain;

public enum ColName
{
    A,
    B,
    C,
    D,
    E,
    F,
    G,
    H,
    I,
    J,
    K,
    L,
    M,
    N,
    O,
    P,
    Q,
    R,
    S,
    T,
    U,
    V,
    W,
    X,
    Y,
    Z,
    Aa,
    Ab,
    Ac,
    Ad,
    Ae,
    Af,
    Ag,
    Ah,
    Ai,
    Aj,
    Ak,
    Al,
    Am,
    An,
    Ao,
    Ap,
    Aq,
    Ar,
    As,
    At,
    Au
}

public enum Category
{
    Item,
    Person,
    Story,
    Npc,
    Car
}

public class ExcelToJson(string listName, string excelPath, string jsonPath)
{
    private string ListName => listName;
    public string ExcelPath => excelPath;
    public string JsonPath => jsonPath;
    public Category Category { get; set; }
    public Dictionary<int, string>? ColSet { get; set; }

    public async Task ToJson()
    {
        var sheetIndex = Category == Category.Person ? 1 : 0;
        using (FileStream fs = new(ExcelPath, FileMode.Open))
        {
            ExcelPackage.LicenseContext = LicenseContext.NonCommercial;
            using (ExcelPackage package = new(fs))
            {
                ExcelWorksheet sheet = package.Workbook.Worksheets[sheetIndex];
                int endRow = sheet.Dimension.End.Row;
                int endColumn = sheet.Dimension.End.Column;

                var data = sheet.Cells[1, 1, endRow, endColumn].ToDataTable(c =>
                {
                    c.AlwaysAllowNull = true;
                    c.PredefinedMappingsOnly = true;
                    foreach (int key in ColSet.Keys)
                    {
                        c.Mappings.Add(key, ColSet[key]);
                    }
                });

                //var selectedData = data.DefaultView.ToTable(false, ColSet.Values.ToArray());

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

                if (Category == Category.Person)
                {
                    foreach (var item in arr)
                    {
                        if (item["aniSet"].ToString().Length >= 3)
                        {
                            string set = item["aniSet"].ToString()[0..3];
                            item["aniSet"] = set;
                        }
                    }
                }


                root.Add(ListName, arr);
                string jsonData = root.ToString();
                await File.WriteAllTextAsync(JsonPath, jsonData);
            }
        }
    }
}