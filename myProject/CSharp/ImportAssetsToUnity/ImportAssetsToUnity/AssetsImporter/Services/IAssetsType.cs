using ImportAssetsToUnity.AssetsImporter.Domain.Entities;

namespace ImportAssetsToUnity.AssetsImporter.Domain.Services;

public interface IAssetsType
{
    public string GetName();
    public IEnumerable<AssetInfo> GetAssetsInfo();
}