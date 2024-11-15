using System.Data.Common;
using System.Data;
using OfficeOpenXml;
using Newtonsoft.Json.Linq;

namespace Excels.Domain;

public enum ColName { A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z, AA, AB, AC, AD, AE, AF, AG, AH, AI, AJ, AK, AL }
    
public class ExcelToJson
{
    public string? ExcelPath { get; set; }
    public string? JsonPath { get; set; }
    public int Row { get; set; }
    public int Column { get; set; }
    public Dictionary<int, string>? ColSet { get; set; }

    public async Task ToJson()
    {
        using (FileStream fs = new(ExcelPath, FileMode.Open))
        {
            ExcelPackage.LicenseContext = LicenseContext.NonCommercial;
            using (ExcelPackage package = new(fs))
            {
                ExcelWorksheet sheet = package.Workbook.Worksheets[0];
                var data = sheet.Cells[1, 1, Row, Column].ToDataTable(x => x.AlwaysAllowNull = true);
                foreach (int key in ColSet.Keys)
                {
                    data.Columns[key].ColumnName = ColSet[key];
                }
                var selectedData = data.DefaultView.ToTable(false, ColSet.Values.ToArray());

                JObject root = new JObject();
                JArray arr = new JArray();
                foreach (DataRow dataRow in selectedData.Rows)
                {
                    JObject obj = new JObject();
                    foreach (DataColumn dataCol in selectedData.Columns)
                    {
                        obj.Add(dataCol.ColumnName, dataRow[dataCol.ColumnName].ToString());
                    }
                    arr.Add(obj);
                }
                foreach (var item in arr)
                {
                    if (item["aniSet"].ToString().Length >= 3)
                    {
                        string set = item["aniSet"].ToString().Substring(0, 3);
                        item["aniSet"] = set;
                        
                        if (item["weapon"] != null)
                        {
                            item["weapon"] = "G" + item["weapon"].ToString().PadLeft(5, '0');
                        }
                    }
                }
                root.Add("personList", arr);
                string jsonData = root.ToString();
                await File.WriteAllTextAsync("d:/PersonsData.json", jsonData);
                await File.WriteAllTextAsync(JsonPath, jsonData);
            }
        }
    }
}
