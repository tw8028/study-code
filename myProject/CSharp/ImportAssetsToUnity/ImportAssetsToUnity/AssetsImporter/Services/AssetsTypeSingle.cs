using ImportAssetsToUnity.AssetsImporter.Entities;
using ImportAssetsToUnity.AssetsImporter.ValueObjects;

namespace ImportAssetsToUnity.AssetsImporter.Services;

public class AssetsTypeSingle(Category config) : IAssetsType
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
        string fullName = fileInfo.FullName;
        string folderName = Path.GetFileNameWithoutExtension(fullName);
        string assetPathInUnity = Path.Combine(config.DestDirectory, folderName, fileInfo.Name);
        return new AssetInfo(fullName, assetPathInUnity);
    }
}