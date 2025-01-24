using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class play_ani : MonoBehaviour
{
    // Start is called before the first frame update
    private Animation anim;
    private float delayTime = 6;
    void Start()
    {
        anim = GetComponent<Animation>();
    }

    // Update is called once per frame
    void Update()
    {     
        if(Time.time>=delayTime)
        {
            delayTime += 6;
            anim.Play("Take 001");
        }    
    }
}
