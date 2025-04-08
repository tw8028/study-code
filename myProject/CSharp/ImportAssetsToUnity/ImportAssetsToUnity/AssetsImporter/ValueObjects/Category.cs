namespace ImportAssetsToUnity.AssetsImporter.Domain.ValueObjects;

public record Category(string Name, string SearchPattern, string SourceDirectory, string DestDirectory);