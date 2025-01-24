using System.Collections;
using System.Collections.Generic;
using System.IO;
using UnityEngine;

namespace PersonBrowser
{
	[System.Serializable]
	public class Person
	{
		// 字段名必须与 json 数据中名字相同
		public string id;
		public string name;
		public string aniSet;
		public string weapon;
		public string model_0;
		public string model_1;
		public string skin_0;
		public string skin_1;
		public string prefab_0;
		public string prefab_1;
		public string ani_0;
		public string ani_1;
		public string bag_0;
		public string bag_1;
	}

	[System.Serializable]
	public class PersonRoot
	{
		// 字段名必须与 json 数据 root 对象名字相同
		public List<Person> personList;
	}

	[System.Serializable]
	public class Vehicle
	{
		// prefab name: P_C00001_01
		public string name;

		// prefab name: P_R00001_01
		public string batteryName;
	}

	[System.Serializable]
	public class VehicleRoot
	{
		// 字段名必须与 json 数据 root 对象名字相同
		public List<Vehicle> vehicleList;
	}

	[System.Serializable]
	public class Npc
	{
		public string id;
		public string originPrefab;
	}

	[System.Serializable]
	public class NpcRoot
	{
		// 字段名必须与 json 数据 root 对象名字相同
		public List<Npc> npcList;
	}

	[System.Serializable]
	public class MsgClipInfo
	{
		public int blockId;
		public string[] speakers;
		public string msg;
		public string[] extMsg;
	}
	[System.Serializable]
	public class MsgData
	{
		public MsgClipInfo[] msgArray;
	}



	public static class JsonData
	{
		public static List<Person> GetPersons()
		{
			string url = Application.dataPath + "/Art/Temp/Editor/CharacterConfig/PersonData.json";
			string jsonData = File.ReadAllText(url); // read
			return JsonUtility.FromJson<PersonRoot>(jsonData).personList;
		}

		public static List<Vehicle> GetVehicles()
		{
			string url = Application.dataPath + "/Art/Temp/Editor/CharacterConfig/VehicleData.json";
			string jsonData = File.ReadAllText(url); // read
			return JsonUtility.FromJson<VehicleRoot>(jsonData).vehicleList;
		}

		public static List<Npc> GetNpcs()
		{
			string url = Application.dataPath + "/Art/Temp/Editor/CharacterConfig/NpcData.json";
			string jsonData = File.ReadAllText(url); // read
			return JsonUtility.FromJson<NpcRoot>(jsonData).npcList;
		}
	}
}
