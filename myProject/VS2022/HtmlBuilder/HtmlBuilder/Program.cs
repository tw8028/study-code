using System.Collections.ObjectModel;
using HtmlBuilder;
using VersOne.Epub;


const string filePath = "D:/Temp/book/07 Harry Potter and the Deathly Hallows - J.K. Rowling.epub";
string htmlPath = $"D:/Temp/html/{Path.GetFileNameWithoutExtension(filePath)}.html";
const int skip = 7;
const int num = 38;
EpubBookRef epubBookRef = EpubReader.OpenBook(filePath);
Console.WriteLine($"Title: {epubBookRef.Title}");
Console.WriteLine($"Author: {epubBookRef.Author}");

ReadOnlyCollection<EpubLocalTextContentFileRef> html = epubBookRef.Content.Html.Local;
EpubLocalTextContentFileRef[] selectedHtml = html.Skip(skip).Take(num).ToArray();

// 打印章节
foreach (EpubLocalTextContentFileRef file in selectedHtml)
{
    Console.WriteLine(file.Key);
}

// string builder
string contents = HtmlTextBuilder.Build(selectedHtml, epubBookRef.Title);

// 保存 html 文件
File.WriteAllText(htmlPath, contents);
Console.WriteLine("HTML 文件已保存到: " + htmlPath);