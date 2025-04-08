using ImportAssetsToUnity.Domain.Entities;
using ImportAssetsToUnity.Domain.ValueObjects;

namespace ImportAssetsToUnity.Domain.Services;

public class AssetsNoFolder(Category config) : IAssets
{
    public string GetName()
    {
        return config.Name;
    }

    public IEnumerable<AssetInfo> GetAssetsInfo()
    {
        FileInfo[] fls = FileUtils.GetFilesFromDirectory(config.SourceDirectory, config.SearchPattern);
        return fls.Select(CreateAssetInfo).ToArray();
    }

    private AssetInfo CreateAssetInfo(FileInfo fileInfo)
    {
        string assetPathInUnity = Path.Combine(config.DestDirectory, fileInfo.Name);
        return new AssetInfo(fileInfo.FullName, assetPathInUnity);
    }
}