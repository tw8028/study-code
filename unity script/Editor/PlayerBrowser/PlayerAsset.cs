using UnityEditor;
using UnityEngine;
using System.IO;
<<<<<<< HEAD
using System.Linq;
using System.Collections.Generic;

namespace PersonBrowser
{
	
	// 不考虑 npc 和敌人
	public class PlayerAsset
	{
		private Person PersonData => JsonData.GetPersons().FirstOrDefault(p => p.id == CharacterId);
		
=======

namespace PersonBrowser
{
	// 不考虑 npc 和敌人
	public class PlayerAsset
	{
>>>>>>> 7a7581e38ef7cb87c876b9f01074481e53f52bd0
		// id A00001 A01001 AA01001
		public readonly string id;
		public PlayerAsset(string id)
		{
			this.id = id;
		}
		private string CharacterId => id.Remove(id.Length - 4, 1).Insert(id.Length - 4, "0");
<<<<<<< HEAD
		private string ModelPath => $@"\\192.168.2.222\project_A\02_模型\Players\{CharacterId}\{id}\{id}.max";
		private string SkinPath => $@"\\192.168.2.222\project_A\03_动作\skin_Character\Player\{CharacterId}\{id}\{id}_skin.max";
		private string AniPath => $@"\\192.168.2.222\project_A\03_动作\ani_Skill_player\{CharacterId}_skill01.max";
=======

		// private const string FILEPATH = "/192.168.2.222/project_A";
		private const string FILEPATH = "D:/project_A";
		private string ModelPath => Path.Combine(FILEPATH, $"/02_模型/Players/{CharacterId}/{id}.max");
		private string SkinPath => Path.Combine(FILEPATH, $"/03_动作/skin_character/Player/{CharacterId}/{id}_skin.max");
		private string AniPath => Path.Combine(FILEPATH, $"/03_动作/ani_skill_player/{CharacterId}_skill01.max");
>>>>>>> 7a7581e38ef7cb87c876b9f01074481e53f52bd0

		// max file
		public bool HasModelMax => File.Exists(ModelPath);
		public bool HasSkinMax => File.Exists(SkinPath);
		public bool HasAniMax => File.Exists(AniPath);

<<<<<<< HEAD
		// weapon
		public string Gun => PersonData.weapon;

		// prefab
=======
		// prefab
		public GameObject Prefab => AnimUtility.FindPrefab($"P_{id}");
>>>>>>> 7a7581e38ef7cb87c876b9f01074481e53f52bd0
		public GameObject DisplayPrefab => AnimUtility.FindDisplayPrefab($"P_S_{id}");

		// compressed animation
		public Object CompressedSkill => AnimUtility.FindCompressedAnimation($"ani_{CharacterId}_skill01");

<<<<<<< HEAD
		// auto prefab 
		public GameObject AutoPrefab
		{
			get
			{
				int weaponId = int.Parse(Gun[^3..]);
				string path = string.Format(PrefabPath.PLAYER_AUTO, id, weaponId);
				return AssetDatabase.LoadAssetAtPath<GameObject>(path);
			}
		}
=======
>>>>>>> 7a7581e38ef7cb87c876b9f01074481e53f52bd0
		// max file 完成度
		public Color State
		{
			get
			{
				if (!HasAniMax && !HasSkinMax && !HasModelMax)
				{
					return Color.gray;
				}
<<<<<<< HEAD
				else if (HasModelMax && HasSkinMax && HasAniMax)
				{
					return Color.green;
				}
=======
>>>>>>> 7a7581e38ef7cb87c876b9f01074481e53f52bd0
				else if (HasAniMax || HasModelMax || HasSkinMax)
				{
					return Color.yellow;
				}
<<<<<<< HEAD

=======
				else if (HasModelMax && HasSkinMax && HasAniMax)
				{
					return Color.green;
				}
>>>>>>> 7a7581e38ef7cb87c876b9f01074481e53f52bd0
				else
				{
					return Color.white;
				}
			}
		}
	}
}
