using System.Text;
using System.Text.Json;
using System.Text.Json.Serialization;

namespace Seek.ValueObject;

// 构造函数注入 HttpClient 服务
public class ChatRequest(HttpClient client)
{
    [JsonPropertyName("model")] public string Model { get; set; }
    [JsonPropertyName("messages")] public List<Message>? Messages { get; set; }

    [JsonPropertyName("stream")] public bool Stream { get; set; } = false;

    public async Task<ChatResponse> GetChatCompletionAsync(List<Message> messages, string model)
    {
        this.Model = model;
        this.Messages = messages;
        // 序列化请求体为 JSON
        var jsonContent = JsonSerializer.Serialize(this);
        var httpContent = new StringContent(jsonContent, Encoding.UTF8, "application/json");

        // 发送 POST 请求
        var response = await client.PostAsync("chat/completions", httpContent);

        // 检查响应状态
        response.EnsureSuccessStatusCode();

        // 读取响应内容
        var responseContent = await response.Content.ReadAsStringAsync();
        // 解析响应内容
        return new ChatResponse(responseContent);
    }
}