using System.Text.Json.Serialization;

namespace Seek.ValueObject;

public class Message(string role, string content)
{
    [JsonPropertyName("role")] public string Role { get; set; } = role;
    [JsonPropertyName("content")] public string Content { get; set; } = content;
}

public static class MessageFactory
{
    public static Message System(string content) => new Message(role: "system", content: content);
    public static Message User(string content) => new Message(role: "user", content: content);
    public static Message Assistant(string content) => new Message(role: "assistant", content: content);
}