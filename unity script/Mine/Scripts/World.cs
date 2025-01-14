using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using static UnityEditor.PlayerSettings;

public class World : MonoBehaviour
{
	public Transform player;
	private Vector3 spawnPosition;

	public Material mat;
	public BlockType[] blockTypes;

	private readonly Chunk[,] chunks = new Chunk[VoxelData.worldChunkSize, VoxelData.worldChunkSize];

	private List<ChunkCoord> activeChunks = new();

	public ChunkCoord playerChunkCoord;
	public ChunkCoord playerLastChunkCoord;

	private void CreateNewChunk(int x, int z)
	{
		chunks[x, z] = new Chunk(this, new ChunkCoord(x, z));
		activeChunks.Add(new ChunkCoord(x, z));
	}
	private void Start()
	{
		var x = VoxelData.WorldVoxelSize / 2;
		var y = VoxelData.chunkHeight + 2f;
		spawnPosition = new Vector3(x, y, x);
		player.position = spawnPosition;
		playerLastChunkCoord = GetChunkCoordFromPos(spawnPosition);
		GenerateChunk();
	}
	private void Update()
	{
		playerChunkCoord = GetChunkCoordFromPos(player.position);
		if (!playerChunkCoord.Equals(playerLastChunkCoord))
		{
			CheckViewDistance();
		}
	}

	public void GenerateChunk()
	{
		int start = VoxelData.worldChunkSize / 2 - VoxelData.viewChunks;
		int end = VoxelData.worldChunkSize / 2 + VoxelData.viewChunks;
		for (int x = start; x < end; x++)
		{
			for (int z = start; z < end; z++)
			{
				CreateNewChunk(x, z);
			}
		}
	}

	private ChunkCoord GetChunkCoordFromPos(Vector3 pos)
	{
		int x = Mathf.FloorToInt(pos.x / VoxelData.chunkWidth);
		int z = Mathf.FloorToInt(pos.z / VoxelData.chunkWidth);
		return new ChunkCoord(x, z);
	}

	public void CheckViewDistance()
	{
		var coord = GetChunkCoordFromPos(player.position);
		List<ChunkCoord> previousActiveChunks = new(activeChunks);

		for (int x = coord.x - VoxelData.viewChunks; x < coord.x + VoxelData.viewChunks; x++)
		{
			for (int z = coord.z - VoxelData.viewChunks; z < coord.z + VoxelData.viewChunks; z++)
			{
				if (IsChunkInWorld(new ChunkCoord(x, z)))
				{
					if (chunks[x, z] == null)
						CreateNewChunk(x, z);
					else if (!chunks[x, z].IsActive)
					{
						chunks[x, z].IsActive = true;
						activeChunks.Add(new ChunkCoord(x, z));
					}
				}

				for (int i = 0; i < previousActiveChunks.Count; i++)
				{
					if (previousActiveChunks[i].Equals(new ChunkCoord(x, z)))
						previousActiveChunks.RemoveAt(i);
				}
			}
		}
		foreach(ChunkCoord c in previousActiveChunks)
			chunks[c.x, c.z].IsActive = false;
	}

	public bool IsChunkInWorld(ChunkCoord chunkCoord)
	{
		if (chunkCoord.x >= 0 && chunkCoord.x < VoxelData.worldChunkSize && chunkCoord.z >= 0 && chunkCoord.z < VoxelData.worldChunkSize)
			return true;
		else return false;
	}
	public byte GetBlockTypeId(Vector3 pos)  // world position
	{
		if (!IsVoxelInWorld(pos)) return 0;
		if (pos.y == VoxelData.chunkHeight - 1) return 3;
		else if (pos.y < 1) return 1;
		else return 2;
	}
	public static bool IsVoxelInWorld(Vector3 pos)
	{
		if (pos.x >= 0 && pos.x < VoxelData.WorldVoxelSize && pos.y >= 0 && pos.y < VoxelData.chunkHeight && pos.z >= 0 && pos.z < VoxelData.WorldVoxelSize)
			return true;
		else return false;
	}
}



// block 类型决定使用什么贴图
[System.Serializable]
public class BlockType
{
	public string name;
	public bool isSolid;
	[Header("texture value")]
	public int back;
	public int front;
	public int top;
	public int bottom;
	public int left;
	public int right;


	// 在贴图上的编号 4*4 贴图编号为: 0 ~ 15
	public int GetTextureId(int faceIndex)
	{
		switch (faceIndex)
		{
			case 0:
				return back;
			case 1:
				return front;
			case 2:
				return top;
			case 3:
				return bottom;
			case 4:
				return left;
			case 5:
				return right;
			default:
				Debug.LogError("invalid face id");
				return 0;
		}

	}
}
