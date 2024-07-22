namespace SyncFile;

public enum State { NotFoundSource, NotFoundFolder, NewFile, Diff, Equal }
public class SyncItem
{
	public string Id { get; init; }
	public string SourcePath { get; init; }
	public string TargetFolder { get; init; }
	public string TargetPath { get; init; }
	public State State { get { return GetState(); } }
	public bool IsSync { get; set; } = false;

	public SyncItem(string id, string sourcePath, string targetFolder)
	{
		this.Id = id;
		this.SourcePath = sourcePath;
		this.TargetFolder = targetFolder;
		this.TargetPath = Path.Combine(targetFolder, Path.GetFileName(sourcePath));
	}

	public bool ExistsTargetFolder()
	{
		if (Directory.Exists(this.TargetFolder)) return true;
		else return false;
	}
	private bool ExistsTargetFile()
	{
		if (File.Exists(this.TargetPath)) return true;
		else return false;
	}

	private State GetState()
	{
		if (!File.Exists(SourcePath))
		{
			return State.NotFoundSource;
		}
		else
		{
			if (!ExistsTargetFolder())
			{
				return State.NotFoundFolder;
			}
			else
			{
				if (!ExistsTargetFile())
				{
					return State.NewFile;
				}
				else
				{
					bool equal = FileHelper.CompareByReadOnlySpan(this.SourcePath, this.TargetPath);
					if (equal) return State.Equal;
					else return State.Diff;
				}
			}
		}
	}
	public void CopeTo()
	{
		if (IsSync)
		{
			if (ExistsTargetFolder())
			{
				File.Copy(SourcePath, TargetPath, true);
			}
			else
			{
				Directory.CreateDirectory(TargetFolder);
				File.Copy(SourcePath, TargetPath, true);
			}
		}
	}
}	
