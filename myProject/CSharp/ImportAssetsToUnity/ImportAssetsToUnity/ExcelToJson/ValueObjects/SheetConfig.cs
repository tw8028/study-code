using ImportAssetsToUnity.AssetsImporter.Domain.ValueObjects;

namespace ImportAssetsToUnity.ExcelToJson.Domain.ValueObjects;

public record SheetConfig(int Sheet, string Title, string ExcelFile, string JsonFile, Dictionary<int, string> Columns);