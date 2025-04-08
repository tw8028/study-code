using ImportAssetsToUnity.Domain.Services;
using ImportAssetsToUnity.Domain.ValueObjects;

namespace ImportAssetsToUnity.Infrastructure;

public static class AssetsFactory
{
    public static IAssets[] Get()
    {
        Category skillConfig = new(
            Name: "skill",
            SearchPattern: "*.fbx",
            SourceDirectory: "E:/project_A/03_动作/ani_skill_player/_fbx",
            DestDirectory: "D:/GitHub/NLDClient/ProjectNLD/Assets/Art/Animations/Battle/Skill");
        IAssets skill = new AssetsNoFolder(skillConfig);

        Category motionConfig = new(
            Name: "motion",
            SearchPattern: "*.fbx",
            SourceDirectory: "E:/project_A/03_动作/ani_motion/_fbx",
            DestDirectory: "D:/GitHub/NLDClient/ProjectNLD/Assets/Art/Animations/Battle/Motion");
        IAssets motion = new AssetsNoFolder(motionConfig);
        
        Category playerConfig = new(
            Name: "player",
            SearchPattern: "*.fbx",
            SourceDirectory: "E:/project_A/03_动作/skin_character/_fbx",
            DestDirectory: "D:/GitHub/NLDClient/ProjectNLD/Assets/Art/Character/Models/Players");
        IAssets player = new AssetsPlayer(playerConfig);
        
        Category bagConfig = new(
            Name: "bag",
            SearchPattern: "*.fbx",
            SourceDirectory: "E:/project_A/03_动作/skin_item/_fbx",
            DestDirectory: "D:/GitHub/NLDClient/ProjectNLD/Assets/Art/Character/Models/Bag");
        IAssets bag = new AssetsSingle(bagConfig);
        
        Category gunConfig = new(
            Name: "gun",
            SearchPattern: "*.fbx",
            SourceDirectory: "E:/project_A/03_动作/skin_item/_fbx",
            DestDirectory: "D:/GitHub/NLDClient/ProjectNLD/Assets/Art/Character/Models/Guns");
        IAssets gun = new AssetsSingle(gunConfig);


        return [skill, motion, player, bag, gun];
    }
}