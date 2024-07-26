using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AssetDomain;

public interface IFileService
{
    public Task WriteToFileAsync(string relativeFilePath, string content);
    public string ReadFile(string relativeFilePath);
}
