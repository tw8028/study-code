using System.Collections.ObjectModel;
using HtmlBuilder;
using VersOne.Epub;


const string filePath = "D:/Temp/book/04 Harry Potter and the Goblet of Fire - J.K. Rowling.epub";
const int skip = 6;
const int num = 38;

EpubBookRef epubBookRef = EpubReader.OpenBook(filePath);
Console.WriteLine($"Title: {epubBookRef.Title}");
Console.WriteLine($"Author: {epubBookRef.Author}");

// 只保留需要的 chapter
ReadOnlyCollection<EpubLocalTextContentFileRef> html = epubBookRef.Content.Html.Local;
EpubLocalTextContentFileRef[] selectedHtml = html.Skip(skip).Take(num).ToArray();
foreach (EpubLocalTextContentFileRef file in selectedHtml)
{
    Console.WriteLine(file.Key);
}

// 构建并保存 HTML
string[] chapters = selectedHtml.Select(h => h.ReadContent()).ToArray();
string contents = HtmlTextBuilder.Build(chapters, epubBookRef.Title);
string htmlPath = $"D:/Temp/phone/{Path.GetFileNameWithoutExtension(filePath)}.html";
File.WriteAllText(htmlPath, contents);
Console.WriteLine("HTML 文件已保存到: " + htmlPath);