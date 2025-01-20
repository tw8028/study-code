using VersOne.Epub;

namespace BlazorBookApp;

public static class Helper
{
    public static BookInfo[]  GetBookInfo(string folder)
    {
        string[] fullNames = Directory.GetFiles(folder, "*.epub");
        return fullNames.Select(fullName =>
        {
            EpubBook book = EpubReader.ReadBook(fullName);
            return new BookInfo
            {
                id = fullName.GetHashCode(),
                title = book.Title,
                author = book.Author
            };
        }).ToArray();
    }
}