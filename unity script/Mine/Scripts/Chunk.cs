using System.Collections;
using System.Collections.Generic;
using Unity.VisualScripting;
using UnityEngine;


// 块
public class Chunk : MonoBehaviour
{
	MeshFilter meshFilter;

	public static List<Vector3> vertices = new();
	public static List<int> triangles = new();
	public static List<Vector2> uvs = new();
	private static int vertexIndex = 0;

	private static readonly bool[,,] voxelMap = new bool[VoxelData.width, VoxelData.height, VoxelData.width];

	void Start()
	{
		meshFilter = this.gameObject.AddComponent<MeshFilter>();
		PopulateVoxelMap();
		CreateMeshData();
		CreateMesh();
	}

	void PopulateVoxelMap()
	{
		for (int x = 0; x < VoxelData.width; x++)
		{
			for (int y = 0; y < VoxelData.height; y++)
			{
				for (int z = 0; z < VoxelData.width; z++)
				{
					voxelMap[x, y, z] = true; // 将每个元素设置为 true
				}
			}
		}
	}

	bool CheckVoxel(Vector3 pos)
	{
		int x = Mathf.FloorToInt(pos.x);
		int y = Mathf.FloorToInt(pos.y);
		int z = Mathf.FloorToInt(pos.z);
		if (x < 0 || x > VoxelData.width - 1 || y < 0 || y > VoxelData.height - 1 || z < 0 || z > VoxelData.width - 1)
		{
			return false;
		}
		return voxelMap[x, y, z];
	}

	void CreateMeshData()
	{
		for (int x = 0; x < VoxelData.width; x++)
		{
			for (int y = 0; y < VoxelData.height; y++)
			{
				for (int z = 0; z < VoxelData.width; z++)
				{
					AddVoxelData(new Vector3(x, y, z));
				}
			}
		}
	}


	private void AddVoxelData(Vector3 offset)
	{
		for (int i = 0; i < 6; i++)  // i=face
		{
			if (!CheckVoxel(offset + VoxelData.faceChecks[i]))
			{
				vertices.Add(VoxelData.pos[VoxelData.point[i, 0]] + offset);
				vertices.Add(VoxelData.pos[VoxelData.point[i, 1]] + offset);
				vertices.Add(VoxelData.pos[VoxelData.point[i, 2]] + offset);
				vertices.Add(VoxelData.pos[VoxelData.point[i, 3]] + offset);
				uvs.Add(VoxelData.uvPos[0]);
				uvs.Add(VoxelData.uvPos[1]);
				uvs.Add(VoxelData.uvPos[2]);
				uvs.Add(VoxelData.uvPos[3]);
				triangles.Add(vertexIndex);
				triangles.Add(vertexIndex + 1);
				triangles.Add(vertexIndex + 2);
				triangles.Add(vertexIndex + 2);
				triangles.Add(vertexIndex + 1);
				triangles.Add(vertexIndex + 3);
				vertexIndex += 4;
			}
		}
	}

	void CreateMesh()
	{
		Mesh mesh = new()
		{
			vertices = vertices.ToArray(),
			triangles = triangles.ToArray(),
			uv = uvs.ToArray()
		};

		mesh.RecalculateBounds();
		meshFilter.sharedMesh = mesh;
	}
}
