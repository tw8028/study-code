using System.IO;
using UnityEngine;

namespace Art.temp.Editor.CharacterData
{
	/// <summary>
	/// 角色总表
	/// </summary>
	[System.Serializable]
	public class Person
	{
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
		public string skill;
		public string bag_0;
		public string bag_1;
		public string brow;
		public string eye;
		public string brow_color;
		public string eye_color;

	}

	[System.Serializable]
	public class PersonData
	{
		// 字段名必须与 json 数据 root 对象名字相同
		public Person[] personArray;
	}


	/// <summary>
	/// 载具表
	/// </summary>
	[System.Serializable]
	public class Vehicle
	{
		// prefab name: P_C00001_01
		public string name;

		// prefab name: P_R00001_01
		public string batteryName;
	}

	[System.Serializable]
	public class VehicleData
	{
		public Vehicle[] vehicleArray;
	}

	
	/// <summary>
	/// 
	/// </summary>
	[System.Serializable]
	public class MsgClip
	{
		public int blockId;
		public string[] speakers;
		public string msg;
		public string[] extMsg;
	}
	[System.Serializable]
	public class MsgData
	{
		public MsgClip[] msgArray;
	}



	public static class JsonData
	{
		public static Person[] GetPersons()
		{
			string url = Application.dataPath + "/Art/Temp/Editor/JsonData/PersonData.json";
			string jsonData = File.ReadAllText(url); // read
			return JsonUtility.FromJson<PersonData>(jsonData).personArray;
		}

		public static Vehicle[] GetVehicles()
		{
			string url = Application.dataPath + "/Art/Temp/Editor/JsonData/VehicleData.json";
			string jsonData = File.ReadAllText(url); // read
			return JsonUtility.FromJson<VehicleData>(jsonData).vehicleArray;
		}
	}
}
