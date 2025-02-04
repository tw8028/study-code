using System.Text.Json;

namespace Seek.ValueObject;

public class ChatResponse
{
    public string? Content { get; set; }
    public string? ReasoningContent { get; set; }

    public ChatResponse(string responseContent)
    {
        try
        {
            using JsonDocument doc = JsonDocument.Parse(responseContent);
            JsonElement root = doc.RootElement;

            // 提取 content 和 reasoning_content
            var choices = root.GetProperty("choices").EnumerateArray();
            JsonElement message = choices.ElementAt(0).GetProperty("message");
            this.Content = message.GetProperty("content").GetString();
            try
            {
                this.ReasoningContent = message.GetProperty("reasoning_content").GetString();
            }
            catch (Exception)
            {
                this.ReasoningContent = null;
            }
        }
        catch (JsonException ex)
        {
            string errorInfo = $"JSON 解析错误: {ex.Message}";
            Console.WriteLine(errorInfo);
            this.Content = errorInfo;
        }
    }
}