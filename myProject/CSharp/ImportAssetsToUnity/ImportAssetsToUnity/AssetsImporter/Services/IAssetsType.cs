using ImportAssetsToUnity.AssetsImporter.Entities;

namespace ImportAssetsToUnity.AssetsImporter.Services;

public interface IAssetsType
{
    public string GetName();
    public IEnumerable<AssetInfo> GetAssetsInfo();
}