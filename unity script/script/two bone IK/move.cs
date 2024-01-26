using UnityEngine;

public class move : MonoBehaviour
{
    Transform trans;

    // Start is called before the first frame update
    void Start()
    {

        trans = transform;
        Debug.Log(trans.localRotation.eulerAngles);
        trans.rotation = Quaternion.AngleAxis(30, trans.up);
        Debug.Log(trans.localRotation.eulerAngles);
    }

    // Update is called once per frame
    void Update()
    {


    }
}
