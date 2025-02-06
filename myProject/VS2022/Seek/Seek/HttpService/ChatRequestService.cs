using System.Text;
using System.Text.Json;
using Seek.ValueObject;

namespace Seek.HttpService;

public class ChatRequestService(HttpClient client)
{
    public async Task<ChatResponse> GetChatCompletionAsync(ChatRequest chatRequest)
    {
        // 序列化请求体为 JSON
        var jsonContent = JsonSerializer.Serialize(chatRequest);
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