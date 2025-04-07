namespace ImportAssetsToUnity.Entity;

public interface ICategory
{
    public IEnumerable<AssetInfo> GetAllAssetInfo();
}

public record CategoryConfig(string Name, string SearchPattern, string SourceDirectory, string DestDirectory);

public class Animation(CategoryConfig config) : ICategory
{
    public IEnumerable<AssetInfo> GetAllAssetInfo()
    {
        string path = config.SourceDirectory;
        if (!Directory.Exists(path)) return [];
        DirectoryInfo dir = new DirectoryInfo(path);
        FileInfo[] fls = dir.GetFiles(config.SearchPattern);
        return fls.Select(CreateAssetInfo).ToArray();
    }

    private AssetInfo CreateAssetInfo(FileInfo fileInfo)
    {
        string fullName = fileInfo.FullName;

        string assetPathInUnity = Path.Combine(config.DestDirectory, fileInfo.Name);
        Console.WriteLine(assetPathInUnity + "11111xx");
        return new AssetInfo(fullName, assetPathInUnity);
    }
}

public class Model(CategoryConfig config) : ICategory
{
    public IEnumerable<AssetInfo> GetAllAssetInfo()
    {
        string path = config.SourceDirectory;
        if (!Directory.Exists(path)) return [];
        DirectoryInfo dir = new DirectoryInfo(path);
        FileInfo[] fls = dir.GetFiles(config.SearchPattern);
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

public class Player(CategoryConfig config) : ICategory
{
    public IEnumerable<AssetInfo> GetAllAssetInfo()
    {
        string path = config.SourceDirectory;
        DirectoryInfo dir = new DirectoryInfo(path);
        FileInfo[] fls = dir.GetFiles(config.SearchPattern);
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