using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AssetFiles.Domain;

/// <summary>
/// 不同分类在unity中文件夹有不同规则，根据config.key区分，配置在unity中文件夹
/// </summary>
public static class PathHelper
{
    public static string GetDestDirectory(string fullName, AssetConfig config)
    {
        string fileName = Path.GetFileNameWithoutExtension(fullName);
        if (config.Key == "A" || config.Key == "N")
        {
            // 皮肤 A00001 A01001 A02001 都放在 A00001 文件夹中
            string dirName = fileName.Remove(1, 2).Insert(1, "00");
            return Path.Combine(config.DestRoot, dirName);
        }
        if (config.Key == "AA")
        {
            string dirName = fileName.Remove(0, 1).Remove(1, 2).Insert(1, "00");
            return Path.Combine(config.DestRoot, dirName);
        }
        else if (config.Key == "ani_A" || config.Key == "ani_AA")
        {
            // 角色技能都放在 Animations/skill
            return config.DestRoot;
        }
        else if (config.Key == "ani_R" || config.Key == "ani_C")
        {
            // 文件名:ani_R00001_xx，文件夹为:R00001
            string dirName = fileName.Split('_')[1];
            return Path.Combine(config.DestRoot, dirName);
        }
        else
        {
            return Path.Combine(config.DestRoot, fileName);
        }
    }
}
