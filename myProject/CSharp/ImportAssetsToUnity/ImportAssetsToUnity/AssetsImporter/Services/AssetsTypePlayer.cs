using ImportAssetsToUnity.AssetsImporter.Entities;
using ImportAssetsToUnity.AssetsImporter.ValueObjects;

namespace ImportAssetsToUnity.AssetsImporter.Services;

public class AssetsTypePlayer(Category config) : IAssetsType
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
        string destDirectory = Path.Combine(config.DestDirectory, folder);
        return new AssetInfo(fullName, destDirectory);
    }
}