using System.Text;
using VersOne.Epub;

namespace HtmlBuilder;

public static class HtmlTextBuilder
{
    public static string Build(EpubLocalTextContentFileRef[] chapters, string title)
    {
        StringBuilder htmlContentBuilder = new();
        
        // 添加 HTML 头部
        htmlContentBuilder.AppendLine("<html>");
        htmlContentBuilder.AppendLine("<head>");
        htmlContentBuilder.AppendLine("<meta charset=\"UTF-8\">");
        htmlContentBuilder.AppendLine($"<title>{title}</title>");
        
        htmlContentBuilder.AppendLine("<style>"); // style
        htmlContentBuilder.AppendLine("body {");
        htmlContentBuilder.AppendLine("    line-height: 1.6; /* 增加行距 */");
        htmlContentBuilder.AppendLine("    font-size: 18px; /* 增大字体 */");
        htmlContentBuilder.AppendLine("    background-color: #f5f5dc; /* 对眼友好的背景颜色，浅米色 */");
        htmlContentBuilder.AppendLine("    color: #333333; /* 字体颜色适合浅色背景 */");
        htmlContentBuilder.AppendLine("    margin: 240px; /* 增加页面的边距 */");
        // htmlContentBuilder.AppendLine("    font-family: Arial, Helvetica, sans-serif; /* 设置友好的字体 */");
        htmlContentBuilder.AppendLine("}");
        htmlContentBuilder.AppendLine("</style>");
        
        htmlContentBuilder.AppendLine("</head>");
        
        // body
        htmlContentBuilder.AppendLine("<body>");
        foreach (EpubLocalTextContentFileRef chapter in chapters)
        {
            string content = chapter.ReadContent();
            htmlContentBuilder.AppendLine(content);
        }

        // 添加 HTML 尾部
        htmlContentBuilder.AppendLine("</body>");
        htmlContentBuilder.AppendLine("</html>");

        return htmlContentBuilder.ToString();
    }
}