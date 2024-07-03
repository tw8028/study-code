using System.Collections;
using System.Collections.Generic;
using System.IO;
using UnityEngine;

namespace PersonBrowser
{
    [System.Serializable]
    public class Person
    {
        // 字段名必须与json数据中名字相同
        public string id;
        public string name;
        public string aniSet;
        public string weapon;
    }
    [System.Serializable]
    public class PersonRoot
    {
        // 字段名必须与json数据 root 对象名字相同
        public List<Person> personList;
    }
    public static class JsonData
    {
        public static List<Person> GetData()
        {
            string url = Application.dataPath + "/Art/Temp/Editor/PlayerBrowser/PersonsData.json";
            string jsonData = File.ReadAllText(url); // read
            return JsonUtility.FromJson<PersonRoot>(jsonData).personList;
        }
    }
}
