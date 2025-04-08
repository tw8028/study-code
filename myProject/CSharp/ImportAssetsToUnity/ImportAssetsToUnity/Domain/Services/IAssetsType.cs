using ImportAssetsToUnity.Domain.Entities;

namespace ImportAssetsToUnity.Domain.Services;

public interface IAssets
{
    public string GetName();
    public IEnumerable<AssetInfo> GetAssetsInfo();
}