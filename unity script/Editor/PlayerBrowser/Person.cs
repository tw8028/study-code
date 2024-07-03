using System.Collections;
using System.Collections.Generic;
using System.IO;
using UnityEngine;

namespace PersonBrowser
{
    [System.Serializable]
    public class Person
    {
        // �ֶ���������json������������ͬ
        public string id;
        public string name;
        public string aniSet;
        public string weapon;
    }
    [System.Serializable]
    public class PersonRoot
    {
        // �ֶ���������json���� root ����������ͬ
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
