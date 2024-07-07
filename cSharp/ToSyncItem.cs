namespace BlazorApp1;

/// <summary>
/// 同步fbx文件到unity工程
/// 角色蒙皮 A00001 A01001 A02001 位于文件夹 /Character/Moldels/A00001
/// 角色技能 ani_A00001_skill01 ani_A01001_skill01 位于文件夹 /Animations/Battle/Skills/
/// Npc enemy Gun Bag 位于文件夹 /Character/Moldels/Npc Enemy Gun Bag
/// 资源类型可以从名字区分 角色：A， 敌人：E，NPC：N， 枪械：G， 背包：B
/// </summary>
public class ToSyncItem
{
	public string ID { get; init; }
	public string Group { get; init; }
	public string SourcePath { get; init; }
	public string UnityPath { get; init; }
	public bool ExistsInUnity { get { return File.Exists(UnityPath) ? true : false; } }
	public bool EqualtoUnity
	{
		get
		{
			if (ExistsInUnity)
			{
				return SyncHelper.CompareByReadOnlySpan(SourcePath, UnityPath) ? true : false;
			}
			else return false;
		}
	}
	// 之后在UI中通过checkbox为其赋值
	public bool IsReady { get; set; } = false;

	/// <summary>
	/// id: A00001 G00001 E00001 等等
	/// </summary>
	/// <param name="id"></param>
	public ToSyncItem(string id)
	{
		this.ID = id;
		this.Group = id.Substring(0, 1);
		switch (Group)
		{
			case "A":
				string unityFolder = $"{SyncHelper.playerFolder}{ID.Remove(2, 1).Insert(2, "0")}";
				if (!Directory.Exists(unityFolder))
				{
					Directory.CreateDirectory(unityFolder);
				}
				string sourceFolder = $"{SyncHelper.playerSource}{ID.Remove(2, 1).Insert(2, "0")}/fbx";
				this.SourcePath = $"{sourceFolder}/{ID}.fbx";
				this.UnityPath = $"{unityFolder}/{ID}.fbx";
				break;
			case "B":
				this.SourcePath = $"{SyncHelper.bagSource}/{ID}/{ID}.fbx";
				this.UnityPath = $"{SyncHelper.bagFolder}/{ID}/{ID}.fbx";
				break;
			case "G":
				this.SourcePath = $"{SyncHelper.gunSource}/{ID}/{ID}.fbx";
				this.UnityPath = $"{SyncHelper.gunFolder}/{ID}/{ID}.fbx";
				break;
			case "E":
				this.SourcePath = $"{SyncHelper.enemySource}/{ID}/{ID}.fbx";
				this.UnityPath = $"{SyncHelper.enemyFolder}/{ID}/{ID}.fbx";
				break;
			case "N":
				this.SourcePath = $"{SyncHelper.npcSource}/{ID}/{ID}.fbx";
				this.UnityPath = $"{SyncHelper.npcFolder}/{ID}/{ID}.fbx";
				break;
			case "a":
				this.SourcePath = $"{SyncHelper.aniSource}/{ID}/{ID}.fbx";
				this.UnityPath = $"{SyncHelper.aniFolder}/{ID}/{ID}.fbx";
				break;
			default:
				this.SourcePath = "";
				this.UnityPath = "";
				break;
		}
	}
}
