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
            // Player 初始值在Assets中获取，可写。
            try
            {
                string path = $"Assets/Art/Character/Prefabs/Players/P_{m_Name}.prefab";
                Player = AssetDatabase.LoadAssetAtPath<GameObject>(path);
            }
            catch
            {
                Player = null;
            }

            // Skill 只在Assets中获取，不可写。
            try
            {
                string path = $"Assets/Art/Animations/Battle/Skill/ani_{m_Name}_skill01.fbx";
                Skill = AssetDatabase.LoadAssetAtPath<GameObject>(path);
            }
            catch
            {
                Skill = null;
            }

            // Player_S 只在Assets中获取，不可写。
            try
            {
                string path = $"Assets/Art/Character/Prefabs/Players_S/P_S_{m_Name}.prefab";
                Display = AssetDatabase.LoadAssetAtPath<GameObject>(path);
            }
            catch
            {
                Display = null;
            }

            // Player_S Animator Controller 只在Assets中获取，不可写。
            try
            {
                Display_ac = Display.transform.GetChild(0).GetComponent<Animator>().runtimeAnimatorController;
            }
            catch
            {
                Display_ac = null;
            }

            // AutoGen 只在Assets中获取，不可写。
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
                // Debug.Log($"character_{m_Name} 路径不存在, 需要先构建角色");
                AutoGen = null;
                MainTex = null;
            };
            // project_A assets
            if (!System.IO.Directory.Exists($@"\\192.168.2.222\project_A"))
            {
                Debug.Log(@"无法链接：\\192.168.2.222\\project_A");
                ModelFile = null;
                SkinFile = null;
                AniFile = null;
            }
            else
            {
                string str = m_Name;
                str = str.Remove(2, 1);
                str = str.Insert(2, "0");

                string modelPath1 = $@"\\192.168.2.222\project_A\02_模型\Players\{str}\{m_Name}\{m_Name}.max";
                string modelPath2 = $@"\\192.168.2.222\project_A\02_模型\Players\{str}\{m_Name}.max";
                if (System.IO.File.Exists(modelPath1) || System.IO.File.Exists(modelPath2))
                {
                    ModelFile = m_Name + ".max";
                }
                else
                {
                    ModelFile = null;
                }

                string skinPath1 = $@"\\192.168.2.222\project_A\03_动作\角色蒙皮\{str}\{m_Name}\{m_Name}_skin.max";
                string skinPath2 = $@"\\192.168.2.222\project_A\03_动作\角色蒙皮\{str}\{m_Name}_skin.max";
                if (System.IO.File.Exists(skinPath1) || System.IO.File.Exists(skinPath2))
                {
                    SkinFile = m_Name + "_skin.max";
                }
                else
                {
                    SkinFile = null;
                }

                string path = $@"\\192.168.2.222\project_A\03_动作\角色技能\max\{m_Name}_skill01.max";
                if (System.IO.File.Exists(path))
                {
                    AniFile = $"{m_Name}_skill01.max";
                }
                else
                {
                    AniFile = null;
                }
            }

            // 啥都没有为灰色
            // 缺少一项为黄色
            // 资产齐全为绿色
            // 源文件齐全但未构建角色为红色
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
