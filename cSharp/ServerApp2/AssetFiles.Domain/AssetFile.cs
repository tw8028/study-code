namespace AssetFiles.Domain;

public enum CheckResult { NotFoundSource, NotFoundFolder, NewFile, Different, Equal }

public class AssetFile
{
	public string Name { get; init; }
	public string FullName { get; init; }
	private string DestDirectory { get; init; }
	public string DestPath { get; init; }
	public CheckResult State { get { return GetState(); } }

	public bool IsChecked { get; set; }

	public AssetFile(string fullName, AssetConfig config)
	{
		this.Name = Path.GetFileName(fullName);
		this.FullName = fullName;
		this.DestDirectory = GetDestDirectory(fullName, config);
		this.DestPath = Path.Combine(DestDirectory, this.Name);
	}



	private CheckResult GetState()
	{
		if (!File.Exists(FullName))
		{
			return CheckResult.NotFoundSource;
		}
		else
		{
			if (!Directory.Exists(DestDirectory))
			{
				return CheckResult.NotFoundFolder;
			}
			else
			{
				if (!File.Exists(DestPath))
				{
					return CheckResult.NewFile;
				}
				else
				{
					bool equal = CompareByReadOnlySpan(this.FullName, this.DestPath);
					if (equal) return CheckResult.Equal;
					else return CheckResult.Different;
				}
			}
		}
	}
	public void CopyTo()
	{
		if (!Directory.Exists(DestDirectory))
		{
			Directory.CreateDirectory(DestDirectory);
		}
		File.Copy(FullName, DestPath, true);
	}

	/// <summary>
	/// 比较两个文件是否相同
	/// </summary>
	/// <param name="file1"></param>
	/// <param name="file2"></param>
	/// <returns></returns>
	private static bool CompareByReadOnlySpan(string file1, string file2)
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

	/// <summary>
	/// 目的地文件夹
	/// </summary>
	/// <param name="fullName"></param>
	/// <param name="config"></param>
	/// <returns></returns>
	private static string GetDestDirectory(string fullName, AssetConfig config)
	{
		string nameId = Path.GetFileNameWithoutExtension(fullName);
		if (nameId.StartsWith("ani_"))
		{
			if (nameId[4] == 'C' || nameId[4] == 'R')
			{
				// 载具和炮台 文件名:ani_R00001_xx，
				return Path.Combine(config.DestRoot, nameId.Split('_')[1]);
			}
			else
			{
				// 角色 motion skill
				return config.DestRoot;
			}
		}
		else
		{
			// 各种模型文件
			// 皮肤 A00001 A01001 A02001 AA01001 都放在 A00001 文件夹中
			char[] chars = nameId.ToCharArray();
			chars[nameId.Length - 4] = '0';
			var folderId = new string(chars)[^6..];

			if (folderId[0] == 'A')
			{
				return Path.Combine(config.DestRoot, "Players", folderId);
			}
			else if (folderId[0] == 'E')
			{
				return Path.Combine(config.DestRoot, "Enemy", folderId);
			}
			else if (folderId[0] == 'N')
			{
				return Path.Combine(config.DestRoot, "Npc", folderId);

			}
			else
			{
				return "";
			}
		}
	}
}