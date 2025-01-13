using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using static UnityEditor.PlayerSettings;

public class World : MonoBehaviour
{
	public Transform player;
	public Vector3 spawnPosition;

	public Material mat;
	public BlockType[] blockTypes;

	private void Start()
	{
		var x = VoxelData.WorldVoxelSize / 2;
		var y = VoxelData.chunkHeight + 2f;
		spawnPosition = new Vector3(x, y, x);
		GenerateChunk();
	}
	private void Update()
	{
		// player view chunks
	}

	public void GenerateChunk()
	{
		int start = VoxelData.worldChunkSize / 2 - VoxelData.viewChunks;
		int end = VoxelData.worldChunkSize / 2 + VoxelData.viewChunks;
		for (int x = start; x < end; x++)
		{
			for (int z = start; z < end; z++)
			{
				new Chunk(this, new ChunkCoord(x, z));
			}
		}
		player.position = spawnPosition;
	}

	public void CheckViewDistance()
	{
		var pos = player.position;
		int x = Mathf.FloorToInt(pos.x / VoxelData.chunkWidth);
		int z = Mathf.FloorToInt(pos.z / VoxelData.chunkWidth);
		ChunkCoord chunkCoord = new ChunkCoord(x, z);


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
