using ImportAssetsToUnity.Domain.Entities;

namespace ImportAssetsToUnity.Domain.Services;

public interface IAssetsType
{
    public string GetName();
    public IEnumerable<AssetInfo> GetAssetsInfo();
}