using MagicaCloth2;
using System.Collections.Generic;
using UnityEngine;

public class DressUp : MonoBehaviour
{
    /// <summary>
    /// Avatar to change clothes.
    /// </summary>
    public GameObject AvatarSkel;

    public GameObject upEqupPrefab;

    public GameObject downEquipPrefab;

    public GameObject suitEquipPrefab;

    //=========================================================================================
    /// <summary>
    /// Bones dictionary of avatars to dress up.
    /// </summary>
    Dictionary<string, Transform> targetAvatarBoneMap = new Dictionary<string, Transform>();

    /// <summary>
    /// Information class for canceling dress-up.
    /// </summary>
    /// 

    //===========================================================================================
    private Material bodyMaterial;




    class EquipInfo
    {
        public GameObject equipObject;
        public List<ColliderComponent> colliderList;

        public bool IsValid() => equipObject != null;
    }
    EquipInfo upEquipInfo = new EquipInfo();
    EquipInfo downEquipInfo = new EquipInfo();
    EquipInfo suitEquipInfo = new EquipInfo();

    //=========================================================================================
    void Awake()
    {
        Init();
    }

    void Start()
    {

    }

    void Update()
    {

    }

    private void OnGUI()
    {
        if (GUI.Button(new Rect(100, 600, 80, 30), "upEquip"))
        {
            OnUpEquipButton();
        }

        if (GUI.Button(new Rect(200, 600, 80, 30), "downEquip"))
        {
            OnDownEquipButton();
        }

        if (GUI.Button(new Rect(300, 600, 80, 30), "suitEquip"))
        {
            OnSuitEquipButton();
        }
    }

    //=========================================================================================
    public void OnUpEquipButton()
    {
        if (upEquipInfo.IsValid())
        {
            Remove(upEquipInfo);
            DisplayBody(upEqupPrefab);
        }
        else
        {
            Equip(upEqupPrefab, upEquipInfo);
            HideBody(upEqupPrefab);
        }
    }



    public void OnDownEquipButton()
    {
        if (downEquipInfo.IsValid())
        {
            Remove(downEquipInfo);
            DisplayBody(downEquipPrefab);
        }

        else
        {
            Equip(downEquipPrefab, downEquipInfo);
            HideBody(downEquipPrefab);
        }

    }
    public void OnSuitEquipButton()
    {
        if (suitEquipInfo.IsValid())
        {
            Remove(suitEquipInfo);
            DisplayBody(suitEquipPrefab);
        }

        else

        {
            Equip(suitEquipPrefab, suitEquipInfo);
            HideBody(suitEquipPrefab);
        }
    }

    //=========================================================================================
    /// <summary>
    /// Create an avatar bone dictionary in advance.
    /// </summary>
    private void Init()
    {

        Debug.Assert(AvatarSkel);

        bodyMaterial = AvatarSkel.GetComponentInChildren<SkinnedMeshRenderer>().material;

        // Create all bone maps for the target avatar
        foreach (Transform bone in AvatarSkel.GetComponentsInChildren<Transform>())
        {
            if (targetAvatarBoneMap.ContainsKey(bone.name) == false)
            {
                targetAvatarBoneMap.Add(bone.name, bone);
            }
            else
            {
                Debug.Log($"Duplicate bone name :{bone.name}");
            }
        }

    }

    /// <summary>
    /// Equip clothes.
    /// </summary>
    /// <param name="equipPrefab"></param>
    /// <param name="einfo"></param>
    void Equip(GameObject equipPrefab, EquipInfo einfo)
    {
        Debug.Assert(equipPrefab);

        // Generate a prefab with cloth set up.
        var gobj = Instantiate(equipPrefab, AvatarSkel.transform);

        // All cloth components included in the prefab.
        var clothList = new List<MagicaCloth>(gobj.GetComponentsInChildren<MagicaCloth>());

        // All collider components included in the prefab.
        var colliderList = new List<ColliderComponent>(gobj.GetComponentsInChildren<ColliderComponent>());

        //¡¡All renderers included in the prefab.
        var skinList = new List<SkinnedMeshRenderer>(gobj.GetComponentsInChildren<SkinnedMeshRenderer>());

        // First stop the automatic build that is executed with Start().
        // And just in case, it does some initialization called Awake().
        foreach (var cloth in clothList)
        {
            // Normally it is called with Awake(), but if the component is disabled, it will not be executed, so call it manually.
            // Ignored if already run with Awake().
            cloth.Initialize();

            // Turn off auto-build on Start().
            cloth.DisableAutoBuild();
        }

        // Swap the bones of the SkinnedMeshRenderer.
        // This process is a general dress-up process for SkinnedMeshRenderer.
        // Comment out this series of processes when performing this process with functions such as other assets.
        foreach (var sren in skinList)
        {
            var bones = sren.bones;
            Transform[] newBones = new Transform[bones.Length];

            for (int i = 0; i < bones.Length; ++i)
            {
                Transform bone = bones[i];

                if (!targetAvatarBoneMap.TryGetValue(bone.name, out newBones[i]))
                {
                    // Is the bone the renderer itself?
                    if (bone.name == sren.name)
                    {
                        newBones[i] = sren.transform;
                    }
                    else
                    {
                        // bone not found
                        Debug.Log($"[SkinnedMeshRenderer({sren.name})] Unable to map bone [{bone.name}] to target skeleton.");
                    }
                }
            }
            sren.bones = newBones;

            // root bone
            if (targetAvatarBoneMap.ContainsKey(sren.rootBone?.name))
            {
                sren.rootBone = targetAvatarBoneMap[sren.rootBone.name];
            }
        }

        // Here, replace the bones used by the MagicaCloth component.
        foreach (var cloth in clothList)
        {
            // Replaces a component's transform.
            cloth.ReplaceTransform(targetAvatarBoneMap);
        }

        // Move all colliders to the new avatar.
        foreach (var collider in colliderList)
        {
            Transform parent = collider.transform.parent;
            if (parent && targetAvatarBoneMap.ContainsKey(parent.name))
            {
                Transform newParent = targetAvatarBoneMap[parent.name];

                // After changing the parent, you need to write back the local posture and align it.
                var localPosition = collider.transform.localPosition;
                var localRotation = collider.transform.localRotation;
                collider.transform.SetParent(newParent);
                collider.transform.localPosition = localPosition;
                collider.transform.localRotation = localRotation;
            }
        }

        // Finally let's start building the cloth component.
        foreach (var cloth in clothList)
        {
            // I disabled the automatic build, so I build it manually.
            cloth.BuildAndRun();
        }

        // Record information for release.
        einfo.equipObject = gobj;
        einfo.colliderList = colliderList;
    }

    /// <summary>
    /// Removes equipped clothing.
    /// </summary>
    /// <param name="einfo"></param>
    void Remove(EquipInfo einfo)
    {
        Destroy(einfo.equipObject);
        foreach (var c in einfo.colliderList)
        {
            Destroy(c.gameObject);
        }

        einfo.equipObject = null;
        einfo.colliderList.Clear();
    }

    /// <summary>
    /// Setup body001
    /// </summary>
    /// <param equipPrefab="clothPrefab"></param>
    /// 

    void HideBody(GameObject equipPrefab)
    {



        SetupBody setup = equipPrefab.GetComponent<SetupBody>();
        if (setup != null)
        {
            HideByVertexColor(bodyMaterial, "_CutOffHand", Color.red, setup.hideHand);
            HideByVertexColor(bodyMaterial, "_CutOffArm", Color.cyan, setup.hideArm);
            HideByVertexColor(bodyMaterial, "_CutOffSpine", Color.blue, setup.hideSpine);
            HideByVertexColor(bodyMaterial, "_CutOffPelvis", Color.green, setup.hidePelvis);
            HideByVertexColor(bodyMaterial, "_CutOffLeg", Color.yellow, setup.hideLeg);
            HideByVertexColor(bodyMaterial, "_CutOffFoot", Color.magenta, setup.hideFoot);
            HideByVertexColor(bodyMaterial, "_CutOffShoulder", Color.black, setup.hideShoulder);

        }
        else
        {
            Debug.Log("hide body have no setup");
        }

    }
    void DisplayBody(GameObject equipPrefab)
    {
        SetupBody setup = equipPrefab.GetComponent<SetupBody>();
        if (setup != null)
        {
            RemoveHide(bodyMaterial, "_CutOffHand", Color.red, setup.hideHand);
            RemoveHide(bodyMaterial, "_CutOffArm", Color.cyan, setup.hideArm);
            RemoveHide(bodyMaterial, "_CutOffSpine", Color.blue, setup.hideSpine);
            RemoveHide(bodyMaterial, "_CutOffPelvis", Color.green, setup.hidePelvis);
            RemoveHide(bodyMaterial, "_CutOffLeg", Color.yellow, setup.hideLeg);
            RemoveHide(bodyMaterial, "_CutOffFoot", Color.magenta, setup.hideFoot);
            RemoveHide(bodyMaterial, "_CutOffShoulder", Color.black, setup.hideShoulder);
        }
        else
        {
            Debug.Log("hide body have no setup");
        }

    }
    void HideByVertexColor(Material mat, string name, Color color, bool hide)
    {
        if (hide)
        {
            mat.SetColor(name, color);
        }
    }
    void RemoveHide(Material mat, string name, Color color, bool hide)
    {
        if (hide)
        {
            mat.SetColor(name, Color.white);
        }
    }
}
