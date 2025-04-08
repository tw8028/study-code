
namespace ImportAssetsToUnity.Domain.ValueObjects;

public record Category(string Name, string SearchPattern, string SourceDirectory, string DestDirectory);