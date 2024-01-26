using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Head_m_control : MonoBehaviour
{
    Transform headTF;
    Transform headCtrlTF;
    void Start()
    {
        headTF = FindChild(this.transform, "Bip001 Head");
        headCtrlTF = FindChild(this.transform, "head_ctrl");
        //headTF = transform.Find("Bip001 Head");
    }
    // Update is called once per frame
    void Update()
    {
        headTF.rotation = headCtrlTF.rotation*Quaternion.Euler(0,90,-90);
    }
    public static Transform FindChild(Transform parentTF, string childName)
    {
        //层级未知查找子物体
        //parentTF = 父物体transform
        //childName = 子物体名称
        //target = 要找的目标的transform
        Transform target = parentTF.Find(childName);
        if (target != null)
        {
            return target;
        }
        for (int i = 0; i < parentTF.childCount; i++)  // 0~n-1 子物体中查找
        {
            target = FindChild(parentTF.GetChild(i), childName); //调用自身得到的是一个新的变量，必须重新赋给target           
            if (target != null)
            {
                return target;
            }
        }
        return null;
    }
}
