using UnityEditor;
using UnityEngine;
using System.IO;

namespace PersonBrowser
{
	// 不考虑 npc 和敌人
	public class PlayerAsset
	{
		// id A00001 A01001 AA01001
		public readonly string id;
		public PlayerAsset(string id)
		{
			this.id = id;
		}
		private string CharacterId => id.Remove(id.Length - 4, 1).Insert(id.Length - 4, "0");

		// private const string FILEPATH = "/192.168.2.222/project_A";
		private const string FILEPATH = "D:/project_A";
		private string ModelPath => Path.Combine(FILEPATH, $"/02_模型/Players/{CharacterId}/{id}.max");
		private string SkinPath => Path.Combine(FILEPATH, $"/03_动作/skin_character/Player/{CharacterId}/{id}_skin.max");
		private string AniPath => Path.Combine(FILEPATH, $"/03_动作/ani_skill_player/{CharacterId}_skill01.max");

		// max file
		public bool HasModelMax => File.Exists(ModelPath);
		public bool HasSkinMax => File.Exists(SkinPath);
		public bool HasAniMax => File.Exists(AniPath);

		// prefab
		public GameObject Prefab => AnimUtility.FindPrefab($"P_{id}");
		public GameObject DisplayPrefab => AnimUtility.FindDisplayPrefab($"P_S_{id}");

		// compressed animation
		public Object CompressedSkill => AnimUtility.FindCompressedAnimation($"ani_{CharacterId}_skill01");

		// max file 完成度
		public Color State
		{
			get
			{
				if (!HasAniMax && !HasSkinMax && !HasModelMax)
				{
					return Color.gray;
				}
				else if (HasAniMax || HasModelMax || HasSkinMax)
				{
					return Color.yellow;
				}
				else if (HasModelMax && HasSkinMax && HasAniMax)
				{
					return Color.green;
				}
				else
				{
					return Color.white;
				}
			}
		}
	}
}
