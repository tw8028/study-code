using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AssetFiles.Domain;

public class AssetConfig
{
    public int Id { get; set; }
    public string Name { get; set; }
    public string SourceRoot { get; set; }
    public string DestRoot { get; set; }
}
