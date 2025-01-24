using UnityEditor;
using UnityEngine;

namespace PrefabInfo
{
    public class PlayerSkeleton
    {
        public Transform Asset { get; }
        public Transform Head => Asset.Find("Root/Bip001/Bip001 Spine/Bip001 Spine1/Bip001 Neck/Bip001 Head/");
        public Transform Grip => Asset.Find("Root/Bip001/Bip001 Spine/Bip001 Spine1/Bip001 R Clavicle/Bip001 R UpperArm/Bip001 R Forearm/Bip001 R Hand/Grip_point01/");
        public Transform Point01 => Asset.Find("Root/Bip001/Bip001 Spine/Mount_point01/");

        public PlayerSkeleton(GameObject player)
        {
            Asset = player.transform.GetChild(0);
        }

    }

    public class Character
    {
        private GameObject playerPrefab;
        private string m_Name;
        private string m_Path;
        private string m_directory;
        private GameObject m_character => AssetDatabase.LoadAssetAtPath<GameObject>(m_Path);
        public string Name => m_character.name;
        public Transform Gun => new PlayerSkeleton(m_character).Grip.GetChild(0);
        public Transform Bag => new PlayerSkeleton(m_character).Point01.GetChild(0);
        public string Controller => Find("ov_", m_directory);
        public Character(GameObject player)
        {
            playerPrefab = player;
            m_Name = playerPrefab.transform.GetChild(0).name;
            m_directory = $"Assets/Art/AutoGen/Characters/character_{m_Name}/";
            // 注：路径必须有后缀名，结尾不能有斜杠
            m_Path = $"Assets/Art/AutoGen/Characters/character_{m_Name}/character_{m_Name}.prefab";

        }

        public string Find(string name, string directory)
        {
            try
            {
                string[] guids = AssetDatabase.FindAssets(name, new string[] { directory });
                string path = AssetDatabase.GUIDToAssetPath(guids[0]);
                return AssetDatabase.LoadAssetAtPath<Object>(path).name;
            }
            catch
            {
                return null;
            }
        }
    }
}
