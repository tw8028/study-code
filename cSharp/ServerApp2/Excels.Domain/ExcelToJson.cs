using System.Data.Common;
using System.Data;
using OfficeOpenXml;
using Newtonsoft.Json.Linq;

namespace Excels.Domain;

public enum ColName { A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z, AA, AB, AC, AD, AE, AF, AG, AH, AI, AJ, AK, AL, AM }

public enum Category { item, person, story, npc, car }
public class ExcelToJson(string listName)
{
	private string ListName => listName;
	public string? ExcelPath { get; set; }
	public string? JsonPath { get; set; }
	public Category Category { get; set; }
	public Dictionary<int, string>? ColSet { get; set; }

	public async Task ToJson()
	{
		using (FileStream fs = new(ExcelPath, FileMode.Open))
		{
			ExcelPackage.LicenseContext = LicenseContext.NonCommercial;
			using (ExcelPackage package = new(fs))
			{
				ExcelWorksheet sheet = package.Workbook.Worksheets[0];
				int endRow = sheet.Dimension.End.Row;
				int endColumn = sheet.Dimension.End.Column;

				var data = sheet.Cells[1, 1, endRow, endColumn].ToDataTable(c =>
				{
					c.AlwaysAllowNull = true;
					c.PredefinedMappingsOnly = true;
					foreach (int key in ColSet.Keys)
					{
						c.Mappings.Add(key, ColSet[key]);
					}
				});

				//var selectedData = data.DefaultView.ToTable(false, ColSet.Values.ToArray());

				JObject root = new JObject();
				JArray arr = new JArray();
				foreach (DataRow dataRow in data.Rows)
				{
					JObject obj = new JObject();
					foreach (DataColumn dataCol in data.Columns)
					{
						obj.Add(dataCol.ColumnName, dataRow[dataCol.ColumnName].ToString());
					}
					arr.Add(obj);
				}

				if (Category == Category.person)
				{
					foreach (var item in arr)
					{
						if (item["aniSet"].ToString().Length >= 3)
						{
							string set = item["aniSet"].ToString().Substring(0, 3);
							item["aniSet"] = set;
						}
						if (item["weapon"].ToString() != "")
						{
							string str = "G" + item["weapon"].ToString().PadLeft(5, '0');
							item["weapon"] = str;
						}
					}
				}

				if (Category == Category.npc)
				{
					foreach (var item in arr)
					{
						item["originPrefab"] = "P_S_" + item["originPrefab"].ToString().Split('_')[0];
					}
				}

				root.Add(ListName, arr);
				string jsonData = root.ToString();
				await File.WriteAllTextAsync(JsonPath, jsonData);
			}
		}
	}
}
