namespace ImportAssetsToUnity.Domain.Services;

public static class FileUtils
{
    public static FileInfo[] GetFilesFromDirectory(string directory, string searchPattern)
    {
        if (!Directory.Exists(directory)) return [];
        DirectoryInfo dir = new DirectoryInfo(directory);
        return dir.GetFiles(searchPattern);
    }
}