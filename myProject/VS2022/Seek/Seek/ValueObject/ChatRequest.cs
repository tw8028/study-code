using System.Text.Json.Serialization;

namespace Seek.ValueObject;

// 构造函数注入 HttpClient 服务
public class ChatRequest
{
    [JsonPropertyName("model")] public string Model { get; set; } = string.Empty;
    [JsonPropertyName("messages")] public List<Message>? Messages { get; set; }
    [JsonPropertyName("stream")] public bool Stream { get; set; } = false;
    [JsonPropertyName("temperature")] public float Temperature { get; set; } = 1.0f;
}