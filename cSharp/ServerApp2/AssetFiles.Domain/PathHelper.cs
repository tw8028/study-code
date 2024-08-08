using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AssetFiles.Domain;

/// <summary>
/// 根据文件名获取
/// </summary>
public static class PathHelper
{
    public static string GetDestDirectory(string fullName, AssetConfig config)
    {
        string fileName = Path.GetFileNameWithoutExtension(fullName);
        if (config.Key == "A" || config.Key == "N")
        {
            string dirName = fileName.Remove(1, 2).Insert(1, "00");
            return Path.Combine(config.DestRoot, dirName);
        }
        else
        {
            return Path.Combine(config.DestRoot, fileName);
        }
    }
}
