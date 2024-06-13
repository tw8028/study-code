namespace TransferFiles;

internal class Program
{
    static void Main(string[] args)
    {
        string rootPath = @"D:\Temp\Art";
        string targetPath = @"D:\Temp\unity";
        var items = Directory.EnumerateDirectories(rootPath);
        foreach (var item in items)
        {
            Console.WriteLine(item);
            Console.WriteLine(Path.GetFileName(item));

        }
    }

}
record Item
{
    public string name;
    public string path;
    public string texPath;
    public Item(string name, string fbxPath)
    {
        this.name = name;
        this.path = fbxPath;
        this.texPath = $"{fbxPath}/texture";

    }
}
