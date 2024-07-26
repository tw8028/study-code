namespace AssetDomain;

public enum State { NotFoundSource, NotFoundFolder, NewFile, Diff, Equal }
public class Asset
{
    public string Name { get; init; }
    public string SourcePath { get; init; }
    public string DestDirectory { get; init; }
    public string DestPath { get; init; }
    public State State { get { return GetState(); } }

    public bool IsChecked { get; set; }

    /// <summary>
    /// 
    /// </summary>
    /// <param name="name"></param>
    /// <param name="sourcePath"></param>
    /// <param name="destDirectory"></param>
    public Asset(string sourcePath, string destDirectory)
    {
        this.SourcePath = sourcePath;
        this.DestDirectory = destDirectory;
        this.Name = Path.GetFileName(sourcePath);
        this.DestPath = Path.Combine(destDirectory, this.Name);
    }

    public bool ExistsTargetFolder()
    {
        if (Directory.Exists(this.DestDirectory)) return true;
        else return false;
    }
    private bool ExistsTargetFile()
    {
        if (File.Exists(this.DestPath)) return true;
        else return false;
    }

    private State GetState()
    {
        if (!File.Exists(SourcePath))
        {
            return State.NotFoundSource;
        }
        else
        {
            if (!ExistsTargetFolder())
            {
                return State.NotFoundFolder;
            }
            else
            {
                if (!ExistsTargetFile())
                {
                    return State.NewFile;
                }
                else
                {
                    bool equal = CompareByReadOnlySpan(this.SourcePath, this.DestPath);
                    if (equal) return State.Equal;
                    else return State.Diff;
                }
            }
        }
    }
    public void CopyTo()
    {
        if (IsChecked)
        {
            if (!ExistsTargetFolder())
            {
                Directory.CreateDirectory(DestDirectory);
            }
            File.Copy(SourcePath, DestPath, true);
        }
    }

    /// <summary>
    /// 比较两个文件是否相同
    /// </summary>
    /// <param name="file1"></param>
    /// <param name="file2"></param>
    /// <returns></returns>
    public static bool CompareByReadOnlySpan(string file1, string file2)
    {
        const int BYTES_TO_READ = 1024 * 10;

        using FileStream fs1 = File.Open(file1, FileMode.Open);
        using FileStream fs2 = File.Open(file2, FileMode.Open);

        byte[] one = new byte[BYTES_TO_READ];
        byte[] two = new byte[BYTES_TO_READ];
        while (true)
        {
            int len1 = fs1.Read(one, 0, BYTES_TO_READ);
            int len2 = fs2.Read(two, 0, BYTES_TO_READ);
            // 字节数组可直接转换为ReadOnlySpan
            if (!((ReadOnlySpan<byte>)one).SequenceEqual((ReadOnlySpan<byte>)two)) return false;
            if (len1 == 0 || len2 == 0) break;  // 两个文件都读取到了末尾,退出while循环
        }
        return true;
    }
}
