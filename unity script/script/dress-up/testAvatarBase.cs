using System.Collections.Generic;
using UnityEngine;

public class testAvatarBase : MonoBehaviour
{
    public GameObject AvatarSkel;
    public List<GameObject> cloths;

    //=========================================================================================
    /// <summary>
    /// Bones dictionary of avatars to dress up.
    /// </summary>
    Dictionary<string, Transform> AvatarBoneMap = new Dictionary<string, Transform>();

    private void Awake()
    {
        Init();
    }
    void Start()
    {
        foreach (GameObject cloth in cloths)
        {
            /* GameObject insCloth = Instantiate(cloth);
             insCloth.SetActive(false);*/
            EquipCloth(AvatarSkel, cloth);
        }
    }

    void Update()
    {

    }

    //=========================================================================================
    /// <summary>
    /// Create an avatar bone dictionary in advance.
    /// </summary>
    void Init()
    {
        Debug.Assert(AvatarSkel);

        // Create all bone maps for the target avatar
        foreach (Transform bone in AvatarSkel.GetComponentsInChildren<Transform>())
        {
            if (AvatarBoneMap.ContainsKey(bone.name) == false)
            {
                AvatarBoneMap.Add(bone.name, bone);
            }
            else
            {
                Debug.Log($"Duplicate bone name :{bone.name}");
            }
        }
    }

    void EquipCloth(GameObject AvatarSkel, GameObject clothPrefab)
    {
        // get all SkinnedMeshRenderer in prefab
        var sourceSmrs = clothPrefab.GetComponentsInChildren<SkinnedMeshRenderer>();

        // create new part in AvatarSkel
        // Swap the bones, meshe and material of the SkinnedMeshRenderer.
        // This process is a general dress-up process for SkinnedMeshRenderer.
        foreach (var sourceSmr in sourceSmrs)
        {
            // create parts in AvatarSkel
            GameObject part = new() { name = sourceSmr.name };
            part.transform.parent = AvatarSkel.transform;
            SkinnedMeshRenderer partSmr = part.AddComponent<SkinnedMeshRenderer>();
            // swap mesh in new SkinnedMeshRenderer 
            partSmr.sharedMesh = sourceSmr.sharedMesh;
            // swap material in new SkinnedMeshRenderer 
            partSmr.material = sourceSmr.sharedMaterial;

            // swap bones in new SkinnedMeshRenderer 
            partSmr.bones = SkinnedMeshHelper.GetNewBones(AvatarSkel, sourceSmr);

        }
    }
    static class SkinnedMeshHelper
    {
        public static Transform[] GetNewBones(GameObject skel, SkinnedMeshRenderer smr)
        {
            Transform[] skelBones = skel.GetComponentsInChildren<Transform>();
            Transform[] skinBones = new Transform[smr.bones.Length];
            for (int i = 0; i < smr.bones.GetLength(0); i++)
            {
                Transform smrBone = smr.bones[i];
                foreach (Transform target in skelBones)
                {
                    if (target.name == smrBone.name)
                    {
                        skinBones[i] = target;
                    }
                }
            }
            return skinBones;
        }
    }
}
