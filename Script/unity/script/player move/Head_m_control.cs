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
        //�㼶δ֪����������
        //parentTF = ������transform
        //childName = ����������
        //target = Ҫ�ҵ�Ŀ���transform
        Transform target = parentTF.Find(childName);
        if (target != null)
        {
            return target;
        }
        for (int i = 0; i < parentTF.childCount; i++)  // 0~n-1 �������в���
        {
            target = FindChild(parentTF.GetChild(i), childName); //��������õ�����һ���µı������������¸���target           
            if (target != null)
            {
                return target;
            }
        }
        return null;
    }
}
