using System.Collections;
using System.Collections.Generic;
using Unity.VisualScripting;
using UnityEngine;

public class CameraFollow : MonoBehaviour
{
    public Vector3 offset;
    public Vector3 targetPostion;
    Transform cameraTF;
    Transform playerTF;
    void Start()
    {
        cameraTF = transform;
        playerTF = GameObject.FindWithTag("Player").transform;
        offset = playerTF.position - cameraTF.position;
    }

    // Update is called once per frame
    void Update()
    {
        targetPostion = playerTF.position - offset;
        cameraTF.position = Vector3.Lerp(cameraTF.position, targetPostion, Time.deltaTime * 10);
    }
}
