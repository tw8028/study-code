using UnityEditor;
using UnityEngine;
using System.IO;
using System.Linq;
using System.Collections.Generic;

namespace PersonBrowser
{
	
	// 不考虑 npc 和敌人
	public class PlayerAsset
	{
		private Person PersonData => JsonData.GetPersons().FirstOrDefault(p => p.id == CharacterId);
		
		// id A00001 A01001 AA01001
		public readonly string id;
		public PlayerAsset(string id)
		{
			this.id = id;
		}
		private string CharacterId => id.Remove(id.Length - 4, 1).Insert(id.Length - 4, "0");
		private string ModelPath => $@"\\192.168.2.222\project_A\02_模型\Players\{CharacterId}\{id}\{id}.max";
		private string SkinPath => $@"\\192.168.2.222\project_A\03_动作\skin_Character\Player\{CharacterId}\{id}\{id}_skin.max";
		private string AniPath => $@"\\192.168.2.222\project_A\03_动作\ani_Skill_player\{CharacterId}_skill01.max";

		// max file
		public bool HasModelMax => File.Exists(ModelPath);
		public bool HasSkinMax => File.Exists(SkinPath);
		public bool HasAniMax => File.Exists(AniPath);

		// weapon
		public string Gun => PersonData.weapon;

		// prefab
		public GameObject DisplayPrefab => AnimUtility.FindDisplayPrefab($"P_S_{id}");

		// compressed animation
		public Object CompressedSkill => AnimUtility.FindCompressedAnimation($"ani_{CharacterId}_skill01");

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
		// max file 完成度
		public Color State
		{
			get
			{
				if (!HasAniMax && !HasSkinMax && !HasModelMax)
				{
					return Color.gray;
				}
				else if (HasModelMax && HasSkinMax && HasAniMax)
				{
					return Color.green;
				}
				else if (HasAniMax || HasModelMax || HasSkinMax)
				{
					return Color.yellow;
				}

				else
				{
					return Color.white;
				}
			}
		}
	}
}
