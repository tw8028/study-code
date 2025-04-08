namespace ImportAssetsToUnity.AssetsImporter.Domain.Entities;

public enum CheckResult
{
    NotFoundSource,
    NotFoundFolder,
    NewFile,
    Different,
    Equal
}


public class AssetInfo(string fullName, string assetPathInUnity)
{
    public string Name => Path.GetFileNameWithoutExtension(fullName);
    public CheckResult State => GetState();

    public void CopyTo()
    {
        if (!Directory.Exists(assetPathInUnity))
        {
            Directory.CreateDirectory(assetPathInUnity);
        }

        File.Copy(fullName, destFileName: assetPathInUnity, overwrite: true);
    }

    private CheckResult GetState()
    {
        if (!File.Exists(fullName))
        {
            return CheckResult.NotFoundSource;
        }

        if (!Directory.Exists(Path.GetDirectoryName(assetPathInUnity)))
        {
            return CheckResult.NotFoundFolder;
        }

        if (!File.Exists(assetPathInUnity))
        {
            return CheckResult.NewFile;
        }

        bool equal = CompareByReadOnlySpan(fullName, assetPathInUnity);
        return equal ? CheckResult.Equal : CheckResult.Different;
    }

    private static bool CompareByReadOnlySpan(string file1, string file2)
    {
        const int bytesToRead = 1024 * 10;

        using FileStream fs1 = File.Open(file1, FileMode.Open);
        using FileStream fs2 = File.Open(file2, FileMode.Open);

        byte[] one = new byte[bytesToRead];
        byte[] two = new byte[bytesToRead];
        while (true)
        {
            int len1 = fs1.Read(one, 0, bytesToRead);
            int len2 = fs2.Read(two, 0, bytesToRead);
            // 字节数组可直接转换为ReadOnlySpan
            if (!((ReadOnlySpan<byte>)one).SequenceEqual((ReadOnlySpan<byte>)two)) return false;
            if (len1 == 0 || len2 == 0) break; // 两个文件都读取到了末尾,退出while循环
        }

        return true;
    }
}