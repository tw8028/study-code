using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor;
using System.Linq;

namespace PersonBrowser
{
    public static class BoneHelper
    {
        public const string HEAD = "Root/Bip001/Bip001 Spine/Bip001 Spine1/Bip001 Neck/Bip001 Head/";
        public const string GRIP_01 = "Root/Bip001/Bip001 Spine/Bip001 Spine1/Bip001 R Clavicle/Bip001 R UpperArm/Bip001 R Forearm/Bip001 R Hand/Grip_point01/";
        public const string MOUNT_01 = "Root/Bip001/Bip001 Spine/Mount_point01/";

        /// <summary>
        /// ªÒ»° magica cloth root bones
        /// </summary>
        /// <param name="bip001"></param>
        /// <returns></returns>
        public static IEnumerable<Transform> GetRootBones(Transform bip001)
        {
            Transform[] allBones = bip001.transform.GetComponentsInChildren<Transform>();
            var dynamicBones = allBones.Where(x => x.name.Contains("Hair") || x.name.Contains("Fabric"));
            var roots = dynamicBones.Where(x => x.parent.name.Contains("Bip001") && x.childCount != 0);
            return roots;
        }
        public static Transform GetBoneByName(Transform root, string str)
        {
            Transform[] allBones = root.transform.GetComponentsInChildren<Transform>();
            return allBones.First(item => item.name.Contains(str));
        }
    }
}

