using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AssetDomain;

public class Role
{
    public string Name { get; init; }
    public DirectoryInfo SourceDir { get; init; }
    public DirectoryInfo DestDir { get; init; }
    public List<Asset> Models { get; init; }
    public List<Asset> Textures { get; init; }

    private readonly List<FileInfo> fbxList;
    private readonly List<FileInfo> texList;

    public Role(string sourceDir, string destDir)
    {
        this.SourceDir = new DirectoryInfo(sourceDir);
        this.DestDir = new DirectoryInfo(destDir);
        this.Name = SourceDir.Name;
        this.fbxList = new List<FileInfo>();
        this.texList = new List<FileInfo>();
        GetFileInfo(SourceDir, ref fbxList, ref texList);

        // Asset.IsChecked要在razor组件中绑定到checkbox，所有不能在属性中创建
        // 当razor组件访问Asset.IsChecked时，Asset必须是已存在的状态，而不能是待创建的状态
        this.Models = CreateModel();
        this.Textures = CreateTexture();
    }
    private List<Asset> CreateModel()
    {
        var models = CreateAssets(fbxList, DestDir);
        return models.Where(a => a.State != State.Equal).ToList();
    }

    private List<Asset> CreateTexture()
    {
        string texDestDir = Path.Combine(DestDir.FullName, "Texture");
        var textrues = CreateAssets(texList, new DirectoryInfo(texDestDir));
        return textrues.Where(a => a.State != State.Equal).ToList();
    }
    /// <summary>
    /// 
    /// </summary>
    /// <param name="destDir"></param>
    /// <param name="fls"></param>
    /// <returns></returns>
    private static List<Asset> CreateAssets(List<FileInfo> fls, DirectoryInfo destDir)
    {
        List<Asset> assets = new();
        foreach (FileInfo fl in fls)
        {
            Asset asset = new(fl.FullName, destDir.FullName);
            assets.Add(asset);
        }
        return assets;
    }

    private static void GetFileInfo(DirectoryInfo dir, ref List<FileInfo> fbxList, ref List<FileInfo> texList)
    {
        bool isFbx = dir.Name.Equals("fbx", StringComparison.OrdinalIgnoreCase);
        bool isTexture = dir.Name.Equals("Texture", StringComparison.OrdinalIgnoreCase);
        if (isFbx)
        {
            FileInfo[] fls = dir.GetFiles("*.fbx");
            fbxList.AddRange(fls);
        }
        else if (isTexture)
        {
            FileInfo[] fls = dir.GetFiles("*.jpg");
            texList.AddRange(fls);
        }
        DirectoryInfo[] subs = dir.GetDirectories();
        foreach (DirectoryInfo subDir in subs)
        {
            GetFileInfo(subDir, ref fbxList, ref texList);
        }
    }
}
