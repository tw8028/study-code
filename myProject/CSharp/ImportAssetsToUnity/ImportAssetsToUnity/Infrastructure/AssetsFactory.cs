using ImportAssetsToUnity.AssetsImporter.Services;
using ImportAssetsToUnity.AssetsImporter.ValueObjects;

namespace ImportAssetsToUnity.Infrastructure;

public static class AssetsFactory
{
    public static IAssetsType[] Get()
    {
        // animation
        Category skillConfig = new(
            Name: "skill",
            SearchPattern: "*.fbx",
            SourceDirectory: "E:/project_A/03_动作/ani_skill_player/_fbx",
            DestDirectory: "D:/GitHub/NLDClient/ProjectNLD/Assets/Art/Animations/Battle/Skill");
        IAssetsType skill = new AssetsTypeNoFolder(skillConfig);

        Category motionConfig = new(
            Name: "motion",
            SearchPattern: "*.fbx",
            SourceDirectory: "E:/project_A/03_动作/ani_motion/_fbx",
            DestDirectory: "D:/GitHub/NLDClient/ProjectNLD/Assets/Art/Animations/Battle/Motion");
        IAssetsType motion = new AssetsTypeNoFolder(motionConfig);


        // character
        Category playerConfig = new(
            Name: "player",
            SearchPattern: "*.fbx",
            SourceDirectory: "E:/project_A/03_动作/skin_character/_fbx",
            DestDirectory: "D:/GitHub/NLDClient/ProjectNLD/Assets/Art/Character/Models/Players");
        IAssetsType player = new AssetsTypePlayer(playerConfig);

        Category npcConfig = new(
            Name: "npc",
            SearchPattern: "*.fbx",
            SourceDirectory: "E:/project_A/03_动作/skin_character/_fbx_npc",
            DestDirectory: "D:/GitHub/NLDClient/ProjectNLD/Assets/Art/Character/Models/Npc");
        IAssetsType npc = new AssetsTypePlayer(npcConfig);

        Category enemyConfig = new(
            Name: "enemy",
            SearchPattern: "*.fbx",
            SourceDirectory: "E:/project_A/03_动作/skin_character/_fbx_enemy",
            DestDirectory: "D:/GitHub/NLDClient/ProjectNLD/Assets/Art/Character/Models/Enemy");
        IAssetsType enemy = new AssetsTypePlayer(enemyConfig);


        // item
        Category bagConfig = new(
            Name: "bag",
            SearchPattern: "*.fbx",
            SourceDirectory: "E:/project_A/03_动作/skin_item/bag/_fbx",
            DestDirectory: "D:/GitHub/NLDClient/ProjectNLD/Assets/Art/Character/Models/Bag");
        IAssetsType bag = new AssetsTypeSingle(bagConfig);

        Category gunConfig = new(
            Name: "gun",
            SearchPattern: "*.fbx",
            SourceDirectory: "E:/project_A/03_动作/skin_item/gun/_fbx",
            DestDirectory: "D:/GitHub/NLDClient/ProjectNLD/Assets/Art/Character/Models/Guns");
        IAssetsType gun = new AssetsTypeSingle(gunConfig);


        return [skill, motion, player, npc, enemy, bag, gun];
    }
}