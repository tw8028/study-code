using Seek.ValueObject;

namespace Seek.Entity;

public class Chat
{
    public int Id { get; set; }
    public string Title { get; set; }
    public List<Message> Messages { get; set; }
    public DateTime CreateTime { get; set; }
}