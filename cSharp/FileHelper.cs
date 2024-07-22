using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SyncFile;

public class FileHelper
{
    /// <summary>
	/// 比较两个文件是否相同
	/// </summary>
	/// <param name="file1"></param>
	/// <param name="file2"></param>
	/// <returns></returns>
	public static bool CompareByReadOnlySpan(string file1, string file2)
    {
        const int BYTES_TO_READ = 1024 * 10;

        using (FileStream fs1 = File.Open(file1, FileMode.Open))
        using (FileStream fs2 = File.Open(file2, FileMode.Open))
        {
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
        }
        return true;
    }

	/// <summary>
	/// 获取文件，将文件名，文件路径，添加到字典中
	/// </summary>
	/// <param name="dir"></param>
	/// <param name="paths"></param>
	/// <returns></returns>
	public static Dictionary<string, string> GetFiles(DirectoryInfo dir, Dictionary<string, string> paths)
	{
		FileInfo[] fls = dir.GetFiles("*.fbx"); // 获取指定类型文件
		foreach (FileInfo fl in fls)
		{	
			paths.Add(Path.GetFileNameWithoutExtension(fl.Name),fl.FullName);
		}
		DirectoryInfo[] subs = dir.GetDirectories();
		foreach (DirectoryInfo sub in subs)
		{
			GetFiles(sub, paths);
		}
		return paths;
	}
}
