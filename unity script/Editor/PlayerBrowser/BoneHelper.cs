using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor;
using System.Linq;

namespace PersonBrowser
{
	public static class BoneHelper
	{
		public const string PELVIS = "Root/Bip001/Bip001 Pelvis";
		public const string SPINE = "Root/Bip001/Bip001 Spine";
		public const string HEAD = "Root/Bip001/Bip001 Spine/Bip001 Spine1/Bip001 Neck/Bip001 Head/";
		public const string GRIP_01 = "Root/Bip001/Bip001 Spine/Bip001 Spine1/Bip001 R Clavicle/Bip001 R UpperArm/Bip001 R Forearm/Bip001 R Hand/Grip_point01/";
		public const string MOUNT_01 = "Root/Bip001/Bip001 Spine/Mount_point01/";

		public static Transform GetBoneByName(Transform root, string str)
		{
			Transform[] allBones = root.transform.GetComponentsInChildren<Transform>();
			return allBones.First(item => item.name.Contains(str));
		}
	}
	public static class ResetTransform
	{
		public static void ResetLocals(this Transform transform)
		{
			transform.localPosition = Vector3.zero;
			transform.localEulerAngles = Vector3.zero;
			transform.localScale = Vector3.one;
		}
	}


	public class FbxPath
	{
		public const string BAG = "Assets/Art/Character/Models/Bag/{0}/{0}.fbx";
		public const string GUN = "Assets/Art/Character/Models/Guns/{0}/{0}.fbx";
		public const string BATTERY = "Assets/Art/Character/Models/Battery/{0}/{0}.fbx";
		public const string VEHICLE = "Assets/Art/Character/Models/Vehicle/{0}/{0}.fbx";

		public const string PLAYER = "Assets/Art/Character/Models/Players/{0}/{1}.fbx";
		public const string ENEMY = "Assets/Art/Character/Models/Enemy/{0}/{0}.fbx";
		public const string NPC = "Assets/Art/Character/Models/Npc/{0}/{1}.fbx";

		public const string EMOJi = "Assets/Art/Character/Models/Emoji/emoji.fbx";
	}

	public class PrefabPath
	{
		public const string BAG = "Assets/Art/Character/Prefabs/Bag/{0}.prefab";
		public const string GUN = "Assets/Art/Character/Prefabs/Guns/{0}.prefab";
		public const string BATTERY = "Assets/Art/Character/Prefabs/Battery/{0}.prefab";
		public const string VEHICLE = "Assets/Art/Character/Prefabs/Vehicle/{0}.prefab";
		public const string VEHICLE_S = "Assets/Art/Character/Prefabs/Vehicle_S/{0}.prefab";

		public const string PLAYER = "Assets/Art/Character/Prefabs/Players/{0}.prefab";
		public const string PLAYER_S = "Assets/Art/Character/Prefabs/Players_S/{0}.prefab";

		public const string ENEMY = "Assets/Art/Character/Prefabs/Enemy/{0}.prefab";
		public const string ENEMY_S = "Assets/Art/Character/Prefabs/Enemy_S/{0}.prefab";

		public const string NPC = "Assets/Art/Character/Prefabs/Npc/{0}.prefab";
		public const string NPC_S = "Assets/Art/Character/Prefabs/Npc_S/{0}.prefab";
	}

	public class AnimPath
	{
		public const string COMPRESSED = "Assets/Art/Animations/compressed/{0}.anim";
		public const string COMPRESSEDSHOW = "Assets/Art/Animations/compressedShow/{0}.anim";
	}

	public static class AnimUtility
	{
		public static GameObject FindModel(string id)
		{
			string path = "";
			if (id.StartsWith("B")) // bag B00001
			{
				path = string.Format(FbxPath.BAG, id);
			}
			else if (id.StartsWith("G")) // gun G00001
			{
				path = string.Format(FbxPath.GUN, id);
			}
			else if (id.StartsWith("R")) // 炮 R00001
			{
				path = string.Format(FbxPath.BATTERY, id);
			}
			else if (id.StartsWith("C")) // 车 C00001
			{
				path = string.Format(FbxPath.VEHICLE, id);
			}
			else if (id.StartsWith("E")) // 敌人 E00001
			{
				path = string.Format(FbxPath.ENEMY, id);
			}
			else if (id.StartsWith("N")) // npc 有精二模型 N01001
			{
				string folder = "N00" + id.Substring(id.Length - 3);
				path = string.Format(FbxPath.NPC, folder, id);
			}
			else if (id.StartsWith("A")) // player 有精二模型 A01001 AA01001
			{
				string folder = "A00" + id.Substring(id.Length - 3);
				path = string.Format(FbxPath.PLAYER, folder, id);
			}
			else
			{
				Debug.LogWarning($"无法找到 fbx: {id}");
			}
			return AssetDatabase.LoadAssetAtPath<GameObject>(path);
		}

		public static GameObject FindPrefab(string name)
		{
			string path = "";
			if (name.StartsWith("P_B")) // bag B00001
			{
				path = string.Format(PrefabPath.BAG, name);
			}
			else if (name.StartsWith("P_G")) // gun G00001
			{
				path = string.Format(PrefabPath.GUN, name);
			}
			else if (name.StartsWith("P_R")) // 炮 R00001
			{
				path = string.Format(PrefabPath.BATTERY, name);
			}
			else if (name.StartsWith("P_C")) // 车 C00001
			{
				path = string.Format(PrefabPath.VEHICLE, name);
			}
			else if (name.StartsWith("P_E")) // 敌人 E00001
			{
				path = string.Format(PrefabPath.ENEMY, name);
			}

			else if (name.StartsWith("P_A0")) // player 有精二模型 A01001
			{
				path = string.Format(PrefabPath.PLAYER, name);
			}
			else if (name.StartsWith("P_AA")) // 有精二模型 AA01001
			{
				path = string.Format(PrefabPath.PLAYER, name);
			}
			else
			{
				Debug.LogWarning($"无法找到 prefab: {name}");
			}
			return AssetDatabase.LoadAssetAtPath<GameObject>(path);
		}
		public static GameObject FindDisplayPrefab(string name)
		{
			string path = "";

			if (name.StartsWith("P_S_E")) // 敌人 E00001
			{
				path = string.Format(PrefabPath.ENEMY_S, name);
			}
			else if (name.StartsWith("P_S_N")) // npc 
			{
				path = string.Format(PrefabPath.NPC_S, name);
			}
			else if (name.StartsWith("P_S_A")) // player
			{
				path = string.Format(PrefabPath.PLAYER_S, name);
			}
			else
			{
				Debug.LogWarning($"无法找到 display prefab: {name}");
			}
			return AssetDatabase.LoadAssetAtPath<GameObject>(path);
		}

		public static AnimationClip FindAnimationClip(string name)
		{
			string path = "";
			if (name.StartsWith("ani_s_"))
			{
				path = string.Format(AnimPath.COMPRESSEDSHOW, name);
			}
			else
			{
				path = string.Format(AnimPath.COMPRESSED, name);
			}
			return AssetDatabase.LoadAssetAtPath<AnimationClip>(path);
		}

		public static GameObject[] FindAssetsByFolder(string filter, string[] folders)
		{
			string[] guids = AssetDatabase.FindAssets(filter, folders);
			var paths = guids.Select(e => AssetDatabase.GUIDToAssetPath(e));
			return paths.Select(e => AssetDatabase.LoadAssetAtPath<GameObject>(e)).ToArray();
		}
	}
}

