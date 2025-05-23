using ImportAssetsToUnity.AssetsImporter.Entities;
using ImportAssetsToUnity.AssetsImporter.ValueObjects;

namespace ImportAssetsToUnity.AssetsImporter.Services;

public class AssetsTypeNoFolder(Category config) : IAssetsType
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
        return new AssetInfo(fileInfo.FullName, config.DestDirectory);
    }
}