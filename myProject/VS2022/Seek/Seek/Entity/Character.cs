namespace Seek.Entity;

public class Character
{
    public int Id { get; set; }
    public string Name { get; set; }
    public string Description { get; set; }
    public string SystemPrompt { get; set; }
    public DateTime CreateTime { get; set; }
}