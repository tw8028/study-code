using NPOI.OpenXmlFormats.Dml;
using UnityEditor;
using UnityEngine;

namespace PersonBrowser
{
    public class PlayerInfo
    {
        private string m_Name;
        private Transform m_Asset
        {
            get
            {
                try { return Player.transform.GetChild(0); }
                catch { return null; }
            }
        }
        public GameObject Player { get; set; }
        public GameObject Skill { get; }
        public Object Player_ac
        {
            get
            {
                try
                {
                    return m_Asset.GetComponent<Animator>().runtimeAnimatorController;
                }
                catch
                {
                    return null;
                }
            }
        }
        public GameObject Emoji
        {
            get
            {
                try
                {
                    return m_Asset.Find("Root/Bip001/Bip001 Spine/Bip001 Spine1/Bip001 Neck/Bip001 Head/G_emoji/").gameObject;
                }
                catch
                {
                    return null;
                }
            }
        }
        public GameObject Gun
        {
            get
            {
                try
                {
                    Transform grip = m_Asset.Find("Root/Bip001/Bip001 Spine/Bip001 Spine1/Bip001 R Clavicle/Bip001 R UpperArm/Bip001 R Forearm/Bip001 R Hand/Grip_point01/");
                    return grip.GetChild(0).gameObject;
                }
                catch
                {
                    return null;
                }
            }
        }
        public GameObject Bag
        {
            get
            {
                try
                {
                    Transform point1 = m_Asset.Find("Root/Bip001/Bip001 Spine/Mount_point01/");
                    return point1.GetChild(0).gameObject;
                }
                catch
                {
                    return null;
                }
            }
        }
        public GameObject Display { get; }
        public Object Display_ac { get; }
        public GameObject AutoGen { get; }
        public Texture2D MainTex { get; }
        public string ModelFile { get; }
        public string SkinFile { get; }
        public string AniFile { get; }
        public Color State { get; }
        public PlayerInfo(string id)
        {
            m_Name = id;
            // Player ��ʼֵ��Assets�л�ȡ����д��
            try
            {
                string path = $"Assets/Art/Character/Prefabs/Players/P_{m_Name}.prefab";
                Player = AssetDatabase.LoadAssetAtPath<GameObject>(path);
            }
            catch
            {
                Player = null;
            }

            // Skill ֻ��Assets�л�ȡ������д��
            try
            {
                string path = $"Assets/Art/Animations/Battle/Skill/ani_{m_Name}_skill01.fbx";
                Skill = AssetDatabase.LoadAssetAtPath<GameObject>(path);
            }
            catch
            {
                Skill = null;
            }

            // Player_S ֻ��Assets�л�ȡ������д��
            try
            {
                string path = $"Assets/Art/Character/Prefabs/Players_S/P_S_{m_Name}.prefab";
                Display = AssetDatabase.LoadAssetAtPath<GameObject>(path);
            }
            catch
            {
                Display = null;
            }

            // Player_S Animator Controller ֻ��Assets�л�ȡ������д��
            try
            {
                Display_ac = Display.transform.GetChild(0).GetComponent<Animator>().runtimeAnimatorController;
            }
            catch
            {
                Display_ac = null;
            }

            // AutoGen ֻ��Assets�л�ȡ������д��
            string directory = $"Assets/Art/AutoGen/Characters/character_{m_Name}/";
            if (AssetDatabase.IsValidFolder(directory))
            {
                try
                {
                    string[] guids = AssetDatabase.FindAssets("character", new string[] { directory });
                    string path = AssetDatabase.GUIDToAssetPath(guids[0]);
                    AutoGen = AssetDatabase.LoadAssetAtPath<GameObject>(path);
                }
                catch
                {
                    AutoGen = null;
                }
                try
                {
                    string path = $"Assets/Art/AutoGen/Characters/character_{m_Name}/_MainTex.png";
                    MainTex = AssetDatabase.LoadAssetAtPath<Texture2D>(path);
                }
                catch
                {
                    MainTex = null;
                }
            }
            else
            {
                // Debug.Log($"character_{m_Name} ·��������, ��Ҫ�ȹ�����ɫ");
                AutoGen = null;
                MainTex = null;
            };
            // project_A assets
            ModelFile = null;
            SkinFile = null;
            AniFile = null;
            if (!System.IO.Directory.Exists($@"\\192.168.2.222\project_A"))
            {
                Debug.Log(@"�޷����ӣ�\\192.168.2.222\\project_A");
            }
            else
            {
                string str = "";
                string modelPath1 = "";
                string modelPath2 = "";
                string skinPath = "";
                if (m_Name.StartsWith("AA"))
                {
                    str = m_Name.Remove(3, 1).Insert(3, "0");
                    modelPath1 = $@"\\192.168.2.222\project_A\02_ģ��\Players\{str.Remove(0, 1)}\{m_Name}\{m_Name}.max";
                    modelPath2 = $@"\\192.168.2.222\project_A\02_ģ��\Players\{str.Remove(0, 1)}\{m_Name}.max";
                    skinPath = $@"\\192.168.2.222\project_A\03_����\��ɫ��Ƥ\���\{str}\{m_Name}\{m_Name}_skin.max";
                }
                else
                {
                    str = m_Name.Remove(2, 1).Insert(2, "0");
                    modelPath1 = $@"\\192.168.2.222\project_A\02_ģ��\Players\{str}\{m_Name}\{m_Name}.max";
                    modelPath2 = $@"\\192.168.2.222\project_A\02_ģ��\Players\{str}\{m_Name}.max";
                    skinPath = $@"\\192.168.2.222\project_A\03_����\��ɫ��Ƥ\Player\{str}\{m_Name}\{m_Name}_skin.max";
                }

              
                if (System.IO.File.Exists(modelPath1) || System.IO.File.Exists(modelPath2))
                {
                    ModelFile = m_Name + ".max";
                }
              
                if (System.IO.File.Exists(skinPath))
                {
                    SkinFile = m_Name + "_skin.max";
                }


                string aniPath = $@"\\192.168.2.222\project_A\03_����\��ɫ����\max\{m_Name}_skill01.max";
                if (System.IO.File.Exists(aniPath))
                {
                    AniFile = $"{m_Name}_skill01.max";
                }
            }

            // ��ɫ��ɶ��û��
            // ��ɫ������ȱһ��
            // ��ɫ����ȫ
            // ��ɫ���ļ���ȫ��δ������ɫ
            if (AniFile == null && ModelFile == null && SkinFile == null)
            {
                State = Color.gray;
            }
            else if (AniFile == null || ModelFile == null || SkinFile == null)
            {
                State = Color.yellow;
            }
            else if (AniFile != null && ModelFile != null && SkinFile != null)
            {
                State = AutoGen == null ? Color.red : Color.green;
            }
            else State = Color.white;
        }
    }
}
