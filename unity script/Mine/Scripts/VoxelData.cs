using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public static class VoxelData
{
	public static readonly int height = 5;
	public static readonly int width = 5;
	public static readonly int textureSize = 4;

	public static readonly Vector3[] pos = new Vector3[8]
	{
		new(0.0f, 0.0f, 0.0f), // 0
		new(1.0f, 0.0f, 0.0f), // 1
		new(1.0f, 1.0f, 0.0f), // 2
		new(0.0f, 1.0f, 0.0f), // 3
		new(0.0f, 0.0f, 1.0f), // 4
		new(1.0f, 0.0f, 1.0f), // 5
		new(1.0f, 1.0f, 1.0f), // 6
		new(0.0f, 1.0f, 1.0f)  // 7
	};

	public static readonly Vector3[] faceChecks = new Vector3[]
	{
		new(0.0f, 0.0f, -1.0f), // back
		new(0.0f, 0.0f, 1.0f),  // front
		new(0.0f, 1.0f, 0.0f),  // top
		new(0.0f, -1.0f, 0.0f), // bottom
		new(-1.0f, 0.0f, 0.0f), // left
		new(1.0f, 0.0f, 0.0f)   // right
	};

	public static readonly int[,] point = new int[6, 4] 
	{
		{ 0, 3, 1, 2 },  // back 0 3 1 2 
		{ 5, 6, 4, 7 },  // front
		{ 3, 7, 2, 6 },  // top
		{ 4, 0, 5, 1 },  // bottom
		{ 4, 7, 0, 3 },  // left
		{ 1, 2, 5, 6 }   // right
	};

	public static readonly Vector2[] uvPos = new Vector2[4]
	{
		new(0.0f, 0.0f),
		new(0.0f, 1.0f),
		new(1.0f, 0.0f),
		new(1.0f, 1.0f)
	};
}
