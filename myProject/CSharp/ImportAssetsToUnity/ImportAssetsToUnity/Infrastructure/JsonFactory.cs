using ImportAssetsToUnity.ExcelToJson.Services;
using ImportAssetsToUnity.ExcelToJson.ValueObjects;

namespace ImportAssetsToUnity.Infrastructure;

public static class JsonFactory
{
    private static readonly ExcelToJsonService excelToJsonService = new();

    public static void CreatePerson()
    {
        SheetConfig personConfig = new SheetConfig(
            Sheet: 1,
            Title: "personArray",
            ExcelFile: "D:/纳罗达人设总表.xlsx",
            JsonFile: "D:/GitHub/NLDClient/ProjectNLD/Assets/Art/temp/Editor/JsonData/PersonData.json",
            Columns: new Dictionary<int, string>()
            {
                { (int)ColumnId.A, "id" },
                { (int)ColumnId.D, "name" },
                { (int)ColumnId.K, "weapon" },
                { (int)ColumnId.N, "aniSet" },
                { (int)ColumnId.Ab, "model_0" },
                { (int)ColumnId.Ac, "skin_0" },
                { (int)ColumnId.Ad, "prefab_0" },
                { (int)ColumnId.Ag, "model_1" },
                { (int)ColumnId.Ah, "skin_1" },
                { (int)ColumnId.Ai, "prefab_1" },
                { (int)ColumnId.Aj, "skill" },
                { (int)ColumnId.Ak, "bag_0" },
                { (int)ColumnId.Al, "bag_1" },
                { (int)ColumnId.Aq, "brow" },
                { (int)ColumnId.Ar, "eye" },
                { (int)ColumnId.At, "eye_color" },
                { (int)ColumnId.Au, "brow_color" }
            }
        );

        excelToJsonService.CreateJsonFromExcel(personConfig);
    }

    public static void CreateVehicle()
    {
        SheetConfig vehicleConfig = new SheetConfig(
            Sheet: 0,
            Title: "vehicleArray",
            ExcelFile: "D:/P_S_载具prefab.xlsx",
            JsonFile: "D:/GitHub/NLDClient/ProjectNLD/Assets/Art/temp/Editor/JsonData/vehicleData.json",
            Columns: new Dictionary<int, string>()
            {
                { (int)ColumnId.C, "name" },
                { (int)ColumnId.D, "batteryName" }
            }
        );

        excelToJsonService.CreateJsonFromExcel(vehicleConfig);
    }
}