using ImportAssetsToUnity.ExcelToJson.Entities;
using ImportAssetsToUnity.ExcelToJson.ValueObjects;

namespace ImportAssetsToUnity.ExcelToJson.Services;

public class ExcelToJsonService
{
    public void CreateJsonFromExcel(SheetConfig config)
    {
        ExcelSheet sheet = new ExcelSheet(config);
        sheet.ToJson();
    }
}