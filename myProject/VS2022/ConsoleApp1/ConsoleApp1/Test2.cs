using System.Text;
using VersOne.Epub;
using HtmlAgilityPack;


namespace ConsoleApp1;

public static class Test2
{
    public static void PrintChapters(EpubBook book)
    {
        foreach (EpubLocalTextContentFile textContentFile in book.ReadingOrder)
        {
            PrintTextContentFile(textContentFile);
        }
    }

    private static void PrintTextContentFile(EpubLocalTextContentFile textContentFile)
    {
        HtmlDocument htmlDocument = new();
        htmlDocument.LoadHtml(textContentFile.Content);
        StringBuilder sb = new();
        foreach (HtmlNode node in htmlDocument.DocumentNode.SelectNodes("//text()"))
        {
            sb.AppendLine(node.InnerText.Trim());
        }

        string contentText = sb.ToString();
        Console.WriteLine(contentText);
        Console.WriteLine();
    }
}