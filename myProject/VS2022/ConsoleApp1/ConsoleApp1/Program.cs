using System.Text;
using VersOne.Epub;
using HtmlAgilityPack;


namespace ConsoleApp1;

class Program
{
    static void Main(string[] args)
    {
        EpubBook book =
            EpubReader.ReadBook("D:/Temp/book/01 Harry Potter and the Philosopher's Stone - J.K. Rowling.epub");
        Test2.PrintChapters(book);
    }
}