
namespace ImportAssetsToUnity.Domain.ValueObjects;

public record CategoryConfig(string Name, string SearchPattern, string SourceDirectory, string DestDirectory);