using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor;
using System.Linq;

namespace PersonBrowser
{
    public static class BoneHelper
    {
        public const string PELVIS = "Root/Bip001/Bip001 Pelvis";
        public const string SPINE = "Root/Bip001/Bip001 Spine";
        public const string HEAD = "Root/Bip001/Bip001 Spine/Bip001 Spine1/Bip001 Neck/Bip001 Head/";
        public const string GRIP_01 = "Root/Bip001/Bip001 Spine/Bip001 Spine1/Bip001 R Clavicle/Bip001 R UpperArm/Bip001 R Forearm/Bip001 R Hand/Grip_point01/";
        public const string MOUNT_01 = "Root/Bip001/Bip001 Spine/Mount_point01/";

        public static Transform GetBoneByName(Transform root, string str)
        {
            Transform[] allBones = root.transform.GetComponentsInChildren<Transform>();
            return allBones.First(item => item.name.Contains(str));
        }
    }
}

