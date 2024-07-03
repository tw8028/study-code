using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor;
using System.Linq;

namespace PersonBrowser
{
    public static class BoneHelper
    {
        /// <summary>
        /// ªÒ»° magica cloth root bones
        /// </summary>
        /// <param name="bip001"></param>
        /// <returns></returns>
        public static IEnumerable<Transform> GetRootBones(Transform bip001)
        {
            Transform[] allBones = bip001.transform.GetComponentsInChildren<Transform>();
            var dynamicBones = allBones.Where(x => x.name.Contains("Hair") || x.name.Contains("Fabric"));
            var roots = dynamicBones.Where(x => x.parent.name.Contains("Bip001"));
            return roots;
        }
        public static Transform GetBoneByName(Transform root, string str)
        {
            Transform[] allBones = root.transform.GetComponentsInChildren<Transform>();
            return allBones.First(item=>item.name.Contains(str));
        }
    }
}

