using ImportAssetsToUnity.Domain.Entities;
using ImportAssetsToUnity.Domain.ValueObjects;

namespace ImportAssetsToUnity.Domain.Services;

public class AssetsSingle(Category config) : IAssetService
{
    public IEnumerable<AssetInfo> GetAssetsInfo()
    {
        FileInfo[] fls = FileUtils.GetFilesFromDirectory(config.SourceDirectory, config.SearchPattern);
        return fls.Select(CreateAssetInfo).ToArray();
    }

    private AssetInfo CreateAssetInfo(FileInfo fileInfo)
    {
        string fullName = fileInfo.FullName;
        string folderName = Path.GetFileNameWithoutExtension(fullName);
        string assetPathInUnity = Path.Combine(config.DestDirectory, folderName, fileInfo.Name);
        return new AssetInfo(fullName, assetPathInUnity);
    }
}