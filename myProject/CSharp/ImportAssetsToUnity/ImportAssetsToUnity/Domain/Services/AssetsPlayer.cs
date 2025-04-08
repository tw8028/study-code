using ImportAssetsToUnity.Domain.Entities;
using ImportAssetsToUnity.Domain.ValueObjects;

namespace ImportAssetsToUnity.Domain.Services;

public class AssetsPlayer(Category config) : IAssets
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
        string nameId = Path.GetFileNameWithoutExtension(fullName);
        char[] chars = nameId.ToCharArray();
        chars[nameId.Length - 4] = '0';
        string folder = new string(chars)[^6..];
        string assetPathInUnity = Path.Combine(config.DestDirectory, folder, fileInfo.Name);
        return new AssetInfo(fullName, assetPathInUnity);
    }
}