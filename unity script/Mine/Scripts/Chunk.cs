using System.Collections;
using System.Collections.Generic;
using Unity.VisualScripting;
using UnityEditor.Experimental.GraphView;
using UnityEngine;
using UnityEngine.UIElements;
using static UnityEditor.PlayerSettings;

public struct ChunkCoord
{
	public int x;
	public int z;
	public ChunkCoord(int x, int z)
	{
		this.x = x;
		this.z = z;
	}
}

public class Chunk
{
	private readonly World world;
	private readonly ChunkCoord chunkCoord;
	private readonly GameObject chunkPrefab;
	private readonly MeshFilter meshFilter;
	Vector3 Position => chunkPrefab.transform.position;

	private int vertexIndex = 0;
	private readonly List<Vector3> vertices = new();
	private readonly List<int> triangles = new();
	private readonly List<Vector2> uvs = new();

	// 用 byte 值表示 BlockType Id
	private readonly byte[,,] blockTypeIdMap = new byte[VoxelData.chunkWidth, VoxelData.chunkHeight, VoxelData.chunkWidth];



	public Chunk(World world, ChunkCoord chunkCoord)
	{
		this.world = world;
		this.chunkCoord = chunkCoord;
		chunkPrefab = new($"chunk_{chunkCoord.x}_{chunkCoord.z}");
		chunkPrefab.transform.SetParent(world.transform);
		chunkPrefab.transform.localPosition = new Vector3(chunkCoord.x * VoxelData.chunkWidth, 0, chunkCoord.z * VoxelData.chunkWidth);
		meshFilter = chunkPrefab.AddComponent<MeshFilter>();
		var meshRenderer = chunkPrefab.AddComponent<MeshRenderer>();
		meshRenderer.sharedMaterial = world.mat;

		PopulateBlockTypeIdMap();
		CreateMesh();
	}

	private void CreateMesh()
	{
		for (int x = 0; x < VoxelData.chunkWidth; x++)
		{
			for (int y = 0; y < VoxelData.chunkHeight; y++)
			{
				for (int z = 0; z < VoxelData.chunkWidth; z++)
				{
					AddVoxelData(new Vector3(x, y, z));
				}
			}
		}

		Mesh mesh = new()
		{
			vertices = vertices.ToArray(),
			triangles = triangles.ToArray(),
			uv = uvs.ToArray()
		};

		mesh.RecalculateBounds();
		meshFilter.sharedMesh = mesh;
	}
	private void AddVoxelData(Vector3 offset)
	{
		for (int i = 0; i < 6; i++)  // i=face
		{
			if (IsRenderFace(offset + VoxelData.faceChecks[i]))
			{
				byte id = blockTypeIdMap[(int)offset.x, (int)offset.y, (int)offset.z];
				AddUvs(world.blockTypes[id].GetTextureId(i));

				triangles.Add(vertexIndex);
				triangles.Add(vertexIndex + 1);
				triangles.Add(vertexIndex + 2);
				triangles.Add(vertexIndex + 2);
				triangles.Add(vertexIndex + 1);
				triangles.Add(vertexIndex + 3);

				vertices.Add(VoxelData.pos[VoxelData.point[i, 0]] + offset);
				vertices.Add(VoxelData.pos[VoxelData.point[i, 1]] + offset);
				vertices.Add(VoxelData.pos[VoxelData.point[i, 2]] + offset);
				vertices.Add(VoxelData.pos[VoxelData.point[i, 3]] + offset);

				vertexIndex += 4;
			}
		}
	}

	/// <summary>
	/// 
	/// </summary>
	/// <param name="adjacentVoxelPos"> the local position of the adjacent voxel</param>
	/// <returns></returns>
	private bool IsRenderFace(Vector3 adjacentVoxelPos)
	{
		int x = Mathf.FloorToInt(adjacentVoxelPos.x);
		int y = Mathf.FloorToInt(adjacentVoxelPos.y);
		int z = Mathf.FloorToInt(adjacentVoxelPos.z);

		if (x < 0 || x > VoxelData.chunkWidth - 1 || y < 0 || y > VoxelData.chunkHeight - 1 || z < 0 || z > VoxelData.chunkWidth - 1)
		{
			// 相邻 voxel 超出了 chunk
			var pos = adjacentVoxelPos + this.Position; // the world position
			if (pos.x < 0 || pos.x > VoxelData.WorldVoxelSize - 1 || y < 0 || y > VoxelData.chunkHeight - 1 || pos.z < 0 || pos.z > VoxelData.WorldVoxelSize - 1)
				return true;  // 超出了 world
		}
		return false;
	}
	private void AddUvs(int textureId)
	{
		float normalizedSize = VoxelData.NormalizedTextureSize;
		float y = textureId / VoxelData.textureSize;
		float x = textureId - (y * VoxelData.textureSize);
		x *= normalizedSize;
		y *= normalizedSize;
		y = 1.0f - y - normalizedSize;
		uvs.Add(new Vector2(x, y));
		uvs.Add(new Vector2(x, y + normalizedSize));
		uvs.Add(new Vector2(x + normalizedSize, y));
		uvs.Add(new Vector2(x + normalizedSize, y + normalizedSize));
	}

	private void PopulateBlockTypeIdMap()
	{
		for (int x = 0; x < VoxelData.chunkWidth; x++)
		{
			for (int y = 0; y < VoxelData.chunkHeight; y++)
			{
				for (int z = 0; z < VoxelData.chunkWidth; z++)
				{
					blockTypeIdMap[x, y, z] = world.GetBlockTypeId(new Vector3(x, y, z) + this.Position);
				}
			}
		}

	}
}
