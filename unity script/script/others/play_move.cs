using UnityEngine;

public class play_move : MonoBehaviour
{
    // Start is called before the first frame update
    private Animation anim;
    private Transform trans;
    public float speed;

    public float horizontalInput;
    public float verticalInput;
    private Quaternion inputRotate;
    public bool mouseInput;

    void Start()
    {
        anim = this.transform.GetChild(0).GetComponent<Animation>();
        trans = this.transform;
    }

    // Update is called once per frame
    void Update()
    {
        horizontalInput = Input.GetAxis("Horizontal");
        //获取水平输入轴的数值。

        verticalInput = Input.GetAxis("Vertical");
        //获取垂直输入轴的数值。

        mouseInput = Input.GetKey(KeyCode.Mouse0);

        RotatePlayer();
        MovePlayer();
        PlayerTouch();
    }
    public void RotatePlayer()
    {
        if (horizontalInput == 0 & verticalInput == 0)
        {
            return;
        }
        else
        {
            inputRotate = Quaternion.LookRotation(new Vector3(horizontalInput, 0, verticalInput).normalized, Vector3.up);
            trans.rotation = Quaternion.RotateTowards(trans.rotation, inputRotate, Time.deltaTime * 300);
        }
    }
    public void MovePlayer()
    {
        if (horizontalInput == 0 & verticalInput == 0)
        {
            if (anim.IsPlaying("touch"))
            {
                anim.PlayQueued("stand");
            }
            else
            {
                anim.CrossFade("stand", 0.2f);
            }
        }
        else
        {
            anim.CrossFade("walk", 0.2f);
            trans.Translate(Vector3.forward * speed * Time.deltaTime);
        }
    }
    public void PlayerTouch()
    {
        if (!mouseInput)
        {
            return;
        }
        else
        {
            if (!anim.IsPlaying("stand"))
            {
                return;
            }
            else
            {
                anim.CrossFade("touch", 0.1f);
            }
        }
    }
}
