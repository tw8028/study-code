namespace AssetFiles.Domain;

public record CategoryConfig
{
    public int Id { get; set; }
    public string? Name { get; set; }
    public string? Key { get; set; }
    public string? SourceRoot { get; set; }
    public string? DestRoot { get; set; }
}
