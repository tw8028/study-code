using ImportAssetsToUnity.Domain.Entities;

namespace ImportAssetsToUnity.Domain.Services;

public interface IAssetService
{
    public IEnumerable<AssetInfo> GetAssetsInfo();
}