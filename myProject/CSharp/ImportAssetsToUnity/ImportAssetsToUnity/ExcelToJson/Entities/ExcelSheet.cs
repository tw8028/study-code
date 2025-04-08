using System.Data;
using ImportAssetsToUnity.ExcelToJson.Domain.ValueObjects;
using OfficeOpenXml;
using Newtonsoft.Json.Linq;

namespace ImportAssetsToUnity.ExcelToJson.Domain.Entities;

public class ExcelSheet(SheetConfig config)
{
    public void ToJson()
    {
        using var fs = new FileStream(config.ExcelFile, FileMode.Open, FileAccess.Read);

        ExcelPackage.LicenseContext = LicenseContext.NonCommercial;
        using ExcelPackage package = new(fs);
        ExcelWorksheet sheet = package.Workbook.Worksheets[config.Sheet];
        int endRow = sheet.Dimension.End.Row;
        int endColumn = sheet.Dimension.End.Column;

        var data = sheet.Cells[1, 1, endRow, endColumn].ToDataTable(options =>
        {
            options.AlwaysAllowNull = true;
            options.PredefinedMappingsOnly = true;
            foreach (KeyValuePair<int, string> column in config.Columns)
            {
                options.Mappings.Add(column.Key, column.Value);
            }
        });

        JArray objArray = [];
        foreach (DataRow dataRow in data.Rows)
        {
            JObject obj = new JObject();
            foreach (DataColumn dataCol in data.Columns)
            {
                obj.Add(dataCol.ColumnName, dataRow[dataCol.ColumnName].ToString());
            }

            objArray.Add(obj);
        }

        JObject root = new JObject { { config.Title, objArray } };
        string jsonData = root.ToString();
        File.WriteAllTextAsync(config.JsonFile, jsonData);
    }
}