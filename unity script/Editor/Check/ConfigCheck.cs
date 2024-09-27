using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor;
using UnityEngine.UIElements;
using CharacterBuilder;
using Framework;
using System.Linq;
using UnityEngine.Assertions.Must;
using VehicleBuilder;

public class ConfigCheck : EditorWindow
{
    List<CharacterBuildData> playerBuildDataList;
    List<VehicleBuildData> vehicleBuildDataList;
    List<PlayerItem> playerItems;
    List<VehicleItem> vehicleItems;


    [MenuItem("Test/prefab工具/角色及载具配置")]
    public static void ShowEditor()
    {
        var win = GetWindow<ConfigCheck>("配置检查");
        win.minSize = new Vector2(500, 700);
    }
    public void CreateGUI()
    {
        if (playerBuildDataList == null)
        {
            GetPlayerData();
        }
        if (vehicleBuildDataList == null)
        {
            GetVehicleData();
        }
        playerItems = new List<PlayerItem>();
        string[] guids = AssetDatabase.FindAssets("A00", new string[] { "Assets/Art/Character/Prefabs/Players" });
        foreach (string guid in guids)
        {
            string path = AssetDatabase.GUIDToAssetPath(guid);
            GameObject go = AssetDatabase.LoadAssetAtPath<GameObject>(path);
            var player = new PlayerItem(go, playerBuildDataList);
            if (!player.AllDone)
            {
                playerItems.Add(player);
            }
        }

        vehicleItems = new List<VehicleItem>();
        string[] vGuids = AssetDatabase.FindAssets("P_3", new string[] { "Assets/Art/Character/Prefabs/Vehicle" });
        foreach (string vGuid in vGuids)
        {
            string path = AssetDatabase.GUIDToAssetPath(vGuid);
            GameObject go = AssetDatabase.LoadAssetAtPath<GameObject>(path);
            var vehicleItem = new VehicleItem(go, vehicleBuildDataList);
            if (!vehicleItem.AllDone)
            {
                vehicleItems.Add(vehicleItem);
            }
        }



        // ui
        var view = new TwoPaneSplitView(0, 400, TwoPaneSplitViewOrientation.Vertical);
        rootVisualElement.Add(view);
        var playerPane = new VisualElement();
        var vehiclePane = new VisualElement();
        view.Add(playerPane);
        view.Add(vehiclePane);

        // 角色列表
        Label playerLabe = new Label() { text = "CharacterDefault配置" };
        playerLabe.style.unityTextAlign = TextAnchor.MiddleCenter;
        playerLabe.style.fontSize = 20;
        playerLabe.style.color = Color.green;
        playerPane.Add(playerLabe);

        ListView playerListView = new ListView();
        playerPane.Add(playerListView);

        playerListView.makeItem = () => new Label();
        playerListView.bindItem = (item, index) =>
        {
            (item as Label).text = playerItems[index].id + " ==> " + playerItems[index].message;
            if (!playerItems[index].mainConfigIsDone && playerItems[index].ani00_isDone)
            {
                (item as Label).style.color = Color.yellow;
            }
        };
        playerListView.itemsSource = playerItems;

        // 载具列表
        Label vLabe = new Label() { text = "VehicleConfig配置" };
        vLabe.style.unityTextAlign = TextAnchor.MiddleCenter;
        vLabe.style.fontSize = 20;
        vLabe.style.color = Color.green;
        vehiclePane.Add(vLabe);

        ListView vListView = new ListView();
        vehiclePane.Add(vListView);

        vListView.makeItem = () => new Label();
        vListView.bindItem = (item, index) =>
        {
            (item as Label).text = vehicleItems[index].id + " ==> " + vehicleItems[index].message;
            if (!vehicleItems[index].configIsDone)
            {
                (item as Label).style.color = Color.yellow;
            }
        };
        vListView.itemsSource = vehicleItems;
    }

    public void GetPlayerData()
    {
        playerBuildDataList = new List<CharacterBuildData>();
        var characterConfigList = EditorTableManager.instance.tables.CharacterAttri.DataList;

        for (int i = 0; i < characterConfigList.Count; i++)
        {
            var cConfig = characterConfigList[i];
            var buildData = new CharacterBuildData(cConfig);

            playerBuildDataList.Add(buildData);
        }
    }
    public void GetVehicleData()
    {
        vehicleBuildDataList = new List<VehicleBuildData>();
        var configList = EditorTableManager.instance.tables.VehicleConfig.DataList;
        for (int i = 0; i < configList.Count; i++)
        {
            var config = configList[i];
            var data = new VehicleBuildData();
            data.vehicleConfig = config;
            data.Init();
            vehicleBuildDataList.Add(data);
        }
    }
}
public class PlayerItem
{
    public string id;
    private readonly List<CharacterBuildData> buildDataList;
    public readonly bool ani00_isDone;
    public readonly bool ani01_isDone;
    // public readonly bool skinIsDone;
    public readonly bool mainConfigIsDone;
    public readonly bool skinsConfigIsDone;
    public readonly bool isBuild;
    public bool AllDone => ani00_isDone && ani01_isDone && mainConfigIsDone && isBuild;

    public string message = "";
    public PlayerItem(GameObject player, List<CharacterBuildData> buildDataList)
    {
        var asset = player.transform.GetChild(0);
        this.id = asset.name;
        string skin01Name = id.StartsWith("A0") ? id.Remove(2, 1).Insert(2, "1") : id.Remove(3, 1).Insert(3, "1");
        this.buildDataList = buildDataList;
        string path = $"Assets/Art/Animations/Battle/Skill/ani_{id}_skill01.fbx";
        ani00_isDone = AssetDatabase.LoadAssetAtPath<GameObject>(path);
        string path1 = $"Assets/Art/Animations/Battle/Skill/ani_{skin01Name}_skill01.fbx";
        ani01_isDone = AssetDatabase.LoadAssetAtPath<GameObject>(path1);

        //skinIsDone = asset.Find("Root/Bip001");
        // 查找配置
        mainConfigIsDone = buildDataList.Any(a => a.mainConfig.NameID == id);

        skinsConfigIsDone = buildDataList.Any(a => a.skins[1].NameID == skin01Name);

        // 是否存在AutoGen文件夹, 判断是否已构建（2个皮肤）
        string autoDir = $"Assets/Art/AutoGen/Characters/character_{id}/";
        string autoDir1 = $"Assets/Art/AutoGen/Characters/character_{skin01Name}/";

        isBuild = AssetDatabase.IsValidFolder(autoDir1); // 只检查皮肤2

        if (ani00_isDone) // 技能动画完成
        {
            if (!mainConfigIsDone)
            {
                this.message = "  缺少mainConfig";
            }
            else
            {
                if (isBuild is false)
                {
                    this.message = ani01_isDone ? "需要构建皮肤2" : "缺少技能动画2";
                }
            }
            if (!skinsConfigIsDone && ani01_isDone)
            {
                this.message = this.message + $"  缺少{skin01Name}skinConfg";
            }
           
        }
        else
        {
            this.message = "缺少技能动画1";
        }
    }
}

public class VehicleItem
{
    public string id;
    public bool configIsDone;
    public bool isBuild;
    public bool AllDone => configIsDone && isBuild;
    public string message;
    public VehicleItem(GameObject vPrefab, List<VehicleBuildData> dataList)
    {
        this.id = vPrefab.name.Split('_')[1];
        configIsDone = dataList.Any(a => a.vehicleConfig.ID.ToString() == id);
        message = configIsDone ? "需要构建载具" : "缺少配置or未解锁";
        string path = $"Assets/Art/AutoGen/Vehicle/{id}";
        isBuild = AssetDatabase.IsValidFolder(path);
    }

}