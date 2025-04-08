namespace ImportAssetsToUnity.ExcelToJson.ValueObjects;

public record SheetConfig(int Sheet, string Title, string ExcelFile, string JsonFile, Dictionary<int, string> Columns);