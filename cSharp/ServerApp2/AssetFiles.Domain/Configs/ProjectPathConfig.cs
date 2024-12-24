using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AssetFiles.Domain;

public record ProjectPathConfig
{
    public string UnityArtPath { get; set; }
    public string SourcePath { get; set; }
}
