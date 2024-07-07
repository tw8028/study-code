namespace BlazorApp1;

public static class SyncHelper
{
	// source
	public const string sourceBase = "D:/Projects/03动作/";

	public const string playerSource = sourceBase + "角色蒙皮/";
	public const string gunSource = sourceBase + "武器蒙皮/";
	public const string bagSource = sourceBase + "背包蒙皮/";
	public const string enemySource = sourceBase + "敌人蒙皮/";
	public const string npcSource = sourceBase + "npc蒙皮/";
	public const string aniSource = sourceBase + "技能动作/";

	// art in unity
	public const string artBase = "D:/Projects/Test/Assets/Art/";

	public const string playerFolder = artBase + "Models/Players/";
	public const string gunFolder = artBase + "Models/Guns/";
	public const string bagFolder = artBase + "Models/Bags/";
	public const string enemyFolder = artBase + "Models/Enemys/";
	public const string npcFolder = artBase + "Models/Npc/";
	public const string aniFolder = artBase + "Models/animations/";

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
	/// 搜索文件夹, 递归获取fbx文件, 创建ToSyncItem对象列表
	/// </summary>
	/// <param name="dir"></param>
	/// <param name="itemList"></param>
	/// <returns></returns>
	public static List<ToSyncItem> GetItems(DirectoryInfo dir, List<ToSyncItem> itemList)
	{
		FileInfo[] fls = dir.GetFiles("*.fbx"); // 获取指定类型文件
		foreach (FileInfo fl in fls)
		{
			// 通过文件名创建对象, 并添加对象列表
			itemList.Add(new ToSyncItem(fl.Name.Split('.')[0]));
		}
		DirectoryInfo[] subs = dir.GetDirectories();
		foreach (DirectoryInfo sub in subs)
		{
			GetItems(sub, itemList);
		}
		return itemList;
	}

	public static List<T> GetItems<T>(DirectoryInfo dir, List<T> itemList) 
	{
		FileInfo[] fls = dir.GetFiles("*.fbx"); // 获取指定类型文件
		foreach (FileInfo fl in fls)
		{
			// 通过文件名创建对象, 并添加对象列表
			var item = (T)Activator.CreateInstance(typeof(T), fl.Name.Split('.')[0]);
			itemList.Add(item);
		}
		DirectoryInfo[] subs = dir.GetDirectories();
		foreach (DirectoryInfo sub in subs)
		{
			GetItems(sub, itemList);
		}
		return itemList;
	}
	/// <summary>
	/// 获取所有源文件
	/// </summary>
	/// <returns></returns>
	public static List<ToSyncItem> GetAll() 
	{
		/*var list_1 = GetItems(new DirectoryInfo(playerSource), new List<ToSyncItem>());
		var list_2 = GetItems(new DirectoryInfo(gunSource), list_1);
		var list_3 = GetItems(new DirectoryInfo(bagSource), list_2);
		var list_4 = GetItems(new DirectoryInfo(enemySource), list_3);
		var list_5 = GetItems(new DirectoryInfo(npcSource), list_4);
		var list_6 = GetItems(new DirectoryInfo(aniSource), list_5);
		return list_6;*/

		var list_1 = GetItems<ToSyncItem>(new DirectoryInfo(playerSource), new List<ToSyncItem>());
		var list_2 = GetItems<ToSyncItem>(new DirectoryInfo(gunSource), list_1);
		return list_2;
	}
}
