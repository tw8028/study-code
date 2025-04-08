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

        Category motionConfig = new(Name: "motion",
            SearchPattern: "*.fbx",
            SourceDirectory: "E:/project_A/03_动作/ani_motion/_fbx",
            DestDirectory: "D:/GitHub/NLDClient/ProjectNLD/Assets/Art/Animations/Battle/Motion");
        IAssets motion = new AssetsNoFolder(motionConfig);


        return [skill, motion];
    }
}