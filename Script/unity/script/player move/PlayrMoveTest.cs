using UnityEditor.Animations;
using UnityEngine;
using UnityEngine.InputSystem;

public class PlayrMoveTest : MonoBehaviour
{
    Transform playerTransform;
    Animator animator;
    Transform cameraTransform;
    CharacterController controller;

    public Vector2 moveInput;

    Vector3 dirVector;
    Quaternion nextRotion;


    void Start()
    {
        animator = GetComponent<Animator>();
        playerTransform = this.transform;
        cameraTransform = Camera.main.transform;
        Cursor.lockState = CursorLockMode.Locked;
        controller = GetComponent<CharacterController>();
    }
    void Update()
    {
        CaculateGravity();
        JumpPlayer();
        MovePlayer();

        if (!moveInput.Equals(Vector2.zero))
        {
            RotatePlayer();
            OffsetPlayer();
        }
        else
        {
            animator.SetBool("toLeft", false);
            animator.SetBool("toRight", false);
        }
    }
    public void GetPlayerMoveInput(InputAction.CallbackContext callbackContext)
    {
        moveInput = callbackContext.ReadValue<Vector2>();
    }
    public void GetPlyaerJumpInput(InputAction.CallbackContext callbackContext)
    {
        isJump = callbackContext.ReadValueAsButton();
    }
    public void MovePlayer()
    {
        if (!moveInput.Equals(Vector2.zero))
        {
            animator.SetBool("run", true);

        }
        else if (moveInput.Equals(Vector2.zero) && animator.GetCurrentAnimatorStateInfo(0).IsName("public_run_01"))
        {
            animator.SetBool("run", false);
        }

    }
    public void RotatePlayer()
    {
        //相机投影
        Vector3 cameraProjection = new Vector3(cameraTransform.forward.x, 0, cameraTransform.forward.z).normalized;
        //moveInput.y前后输入，moveInput.x左右输入
        dirVector = cameraProjection * moveInput.y + cameraTransform.right * moveInput.x;

        nextRotion = Quaternion.LookRotation(dirVector, Vector3.up);
        playerTransform.rotation = Quaternion.RotateTowards(playerTransform.rotation, nextRotion, Time.deltaTime * 300);
    }
    private void OffsetPlayer()
    {
        float dot = Vector3.Dot(playerTransform.forward, dirVector);
        //判断旋转左右方向        
        string dir = Vector3.Cross(playerTransform.forward, dirVector).y < 0 ? "toLeft" : "toRight";

        if (dot == 1)
        {
            return;
        }
        else if (dot < 0.94)
        {
            animator.SetBool(dir, true);
        }
        else if (dot >= 0.94)
        {
            animator.SetBool(dir, false);
        }
    }
    float gravity = 9.8f;
    float verticalVelocity = 0f;
    float firstVelocity = 5f;
    bool isJump;
    void CaculateGravity()
    {
        if (controller.isGrounded)
        {
            verticalVelocity = isJump ? firstVelocity : 0;
            return;
        }
        else
        {
            verticalVelocity += -gravity * Time.deltaTime;
        }
    }
    private void JumpPlayer()
    {
        if (isJump)
        {
            animator.SetBool("jump", true);
        }
        if (controller.isGrounded)
        {
            animator.SetBool("jump", false);
        }
    }
    private void OnAnimatorMove()
    {
        Vector3 playerMovement = animator.deltaPosition;
        playerMovement.y = verticalVelocity * Time.deltaTime;
        controller.Move(playerMovement);
    }
}
