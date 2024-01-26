using System.Collections;
using System.Collections.Generic;
using Unity.VisualScripting;
using UnityEngine;

public class text1 : MonoBehaviour
{
    // Start is called before the first frame update
    public Vector3 fw;
    void Start()
    {
            
    }

    // Update is called once per frame
    void Update()
    {
        fw = this.transform.forward;
    }
}
