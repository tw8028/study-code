namespace ServerApp2;

public class FileService
{
    private readonly string _wwwrootPath;

    public FileService(IWebHostEnvironment hostingEnvironment)
    {
        // 获取wwwroot目录的绝对路径
        _wwwrootPath = hostingEnvironment.WebRootPath;
    }

    public async Task WriteToFileAsync(string relativeFilePath, string content)
    {
        // 构建完整的文件路径
        var fullPath = Path.Combine(_wwwrootPath, relativeFilePath);

        // 确保目录存在
        var directory = Path.GetDirectoryName(fullPath);
        if (!Directory.Exists(directory))
        {
            Directory.CreateDirectory(directory);
        }

        // 写入文件
        await File.WriteAllTextAsync(fullPath, content);
    }
    public string ReadFile(string relativeFilePath)
    {
        var fullPath = Path.Combine(_wwwrootPath, relativeFilePath);
        if (File.Exists(fullPath))
        {
            return File.ReadAllText(fullPath);
        }
        else
        {
            return "null";
        }
    }
}
