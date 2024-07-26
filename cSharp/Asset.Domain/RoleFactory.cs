using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AssetDomain;

public class RoleFactory
{
    private readonly RoleCategory _category;
    private readonly IFileService _fileService;
    private readonly string _pathArt;
    private readonly string _pathLocal;

    public RoleFactory(RoleCategory roleCategory, IFileService fileService)
    {
        this._category = roleCategory;
        this._fileService = fileService;
        this._pathArt = this._fileService.ReadFile(RoleFactoryConfig.UNITY_PATH_FILE);
        this._pathLocal = this._fileService.ReadFile(RoleFactoryConfig.LOCAL_PATH_FILE);
    }

    private static List<Role> GetRoles(string sourceRoot, string destRoot)
    {
        DirectoryInfo dirRoot = new DirectoryInfo(sourceRoot);
        // 加判断文件夹为空
        DirectoryInfo[] dirs = dirRoot.GetDirectories();
        List<Role> roles = new();
        foreach (DirectoryInfo dir in dirs)
        {
            string destDir = Path.Combine(destRoot, dir.Name);
            Role role = new(dir.FullName, destDir);
            roles.Add(role);
        }
        return roles;
    }
    public List<Role>? CreateRoles()
    {
        if (_category == RoleCategory.Player)
        {
            string pathLocal = Path.Combine(this._pathLocal, "角色蒙皮/Player");
            string pathUnity = Path.Combine(this._pathArt, "Character/Models/Players");
            return GetRoles(pathLocal, pathUnity);
        }
        else if (_category == RoleCategory.Npc)
        {
            string pathLocal = Path.Combine(this._pathLocal, "角色蒙皮/Npc");
            string pathUnity = Path.Combine(this._pathArt, "Character/Models/Npc");
            return GetRoles(pathLocal, pathUnity);
        }
        else if (_category == RoleCategory.Enemy)
        {
            string pathLocal = Path.Combine(this._pathLocal, "角色蒙皮/Enemy");
            string pathUnity = Path.Combine(this._pathArt, "Character/Models/Enemy");
            return GetRoles(pathLocal, pathUnity);
        }
        else if (_category == RoleCategory.Bag)
        {
            string pathLocal = Path.Combine(this._pathLocal, "背包蒙皮");
            string pathUnity = Path.Combine(this._pathArt, "Character/Models/Bag");
            return GetRoles(pathLocal, pathUnity);
        }
        else if (_category == RoleCategory.Gun)
        {
            string pathLocal = Path.Combine(this._pathLocal, "武器蒙皮");
            string pathUnity = Path.Combine(this._pathArt, "Character/Models/Guns");
            return GetRoles(pathLocal, pathUnity);
        }
        else if (_category == RoleCategory.Vehicle)
        {
            string pathLocal = Path.Combine(this._pathLocal, "载具蒙皮及动画");
            string pathUnity = Path.Combine(this._pathArt, "Character/Models/Vehicle");
            return GetRoles(pathLocal, pathUnity);
        }
        else
        {
            return null;
        }
    }
}
