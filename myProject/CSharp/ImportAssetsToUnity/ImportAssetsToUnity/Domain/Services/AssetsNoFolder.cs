using ImportAssetsToUnity.Domain.Entities;
using ImportAssetsToUnity.Domain.ValueObjects;

namespace ImportAssetsToUnity.Domain.Services;

public class AssetsNoFolder(CategoryConfig config) : IAssetService
{
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