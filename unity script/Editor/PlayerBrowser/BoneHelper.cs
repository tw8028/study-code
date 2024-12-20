using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor;
using System.Linq;
using System;

namespace PersonBrowser
{
	public static class BoneHelper
	{
		public const string PELVIS = "Root/Bip001/Bip001 Pelvis";
		public const string SPINE = "Root/Bip001/Bip001 Spine";
		public const string HEAD = "Root/Bip001/Bip001 Spine/Bip001 Spine1/Bip001 Neck/Bip001 Head/";
		public const string GRIP_01 = "Root/Bip001/Bip001 Spine/Bip001 Spine1/Bip001 R Clavicle/Bip001 R UpperArm/Bip001 R Forearm/Bip001 R Hand/Grip_point01/";
		public const string MOUNT_01 = "Root/Bip001/Bip001 Spine/Mount_point01/";

		public const string EMOJI = "Root/Bip001/Bip001 Spine/Bip001 Spine1/Bip001 Neck/Bip001 Head/G_emoji/";

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
	public static class LinqExtensions
	{
		public static IEnumerable<TSource> DistinctBy<TSource, TKey>(
			this IEnumerable<TSource> source,
			Func<TSource, TKey> keySelector)
		{
			var seenKeys = new HashSet<TKey>();
			foreach (var element in source)
			{
				if (seenKeys.Add(keySelector(element)))
				{
					yield return element;
				}
			}
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
		// 暂时这样 有一个例外 P_S_C00002_02
		public const string VEHICLE_S = "Assets/Art/Character/Prefabs/Vehicle_S/{0}_01.prefab";

		public const string PLAYER = "Assets/Art/Character/Prefabs/Players/{0}.prefab";
		public const string PLAYER_S = "Assets/Art/Character/Prefabs/Players_S/{0}.prefab";
		public const string PLAYER_AUTO = "Assets/Art_Out/AutoGen/Characters/character_{0}_{1}/character_{0}.prefab";

		public const string ENEMY = "Assets/Art/Character/Prefabs/Enemy/{0}.prefab";
		public const string ENEMY_S = "Assets/Art/Character/Prefabs/Enemy_S/{0}.prefab";

		public const string NPC = "Assets/Art/Character/Prefabs/Npc/{0}.prefab";
		public const string NPC_S = "Assets/Art/Character/Prefabs/Npc_S/{0}.prefab";
	}

	public class AnimPath
	{
		public const string COMPRESSED = "Assets/Art/Animations/compressed/compressed_{0}.anim";
		public const string COMPRESSEDSHOW = "Assets/Art/Animations/compressedShow/compressed_{0}.anim";
	}

	public static class AnimUtility
	{

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
			else if (name.StartsWith("P_S_C"))
			{
				path = string.Format(PrefabPath.VEHICLE_S, name);	
			}

			
			return AssetDatabase.LoadAssetAtPath<GameObject>(path);
		}
	

		public static AnimationClip FindCompressedAnimation(string name)
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

