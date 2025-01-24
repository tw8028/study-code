using UnityEngine;

[RequireComponent(typeof(Animator))]
public class IKControl : MonoBehaviour
{
    private Animator animator;
    private float timer = 0f;
    private int idBaseSpeed;
    private int idOnShake;
    private float ikTimer = 0f;

    public bool ikActive = false;
    void Start()
    {
        animator = GetComponent<Animator>();
        idBaseSpeed = Animator.StringToHash("speed");
        idOnShake = Animator.StringToHash("shake");
        animator.SetFloat(idBaseSpeed, 1.0f);
    }
    void Update()
    {
        if (ikActive)
        {
            timer += Time.deltaTime;
            animator.SetBool(idOnShake, true);
            if (timer < 0.7f)
            {
                float t = timer / 0.7f;
                animator.SetFloat(idBaseSpeed, Mathf.LerpUnclamped(0f, 1f, t));
            }
            else
            {
                animator.SetFloat(idBaseSpeed, 1f);
                animator.SetBool(idOnShake, false);
                if (timer >= 1.2)
                {
                    ikActive = false;
                    timer = 0f;
                }
            }
        }
    }
    void OnAnimatorIK()
    {
        if (ikActive)
        {
            ikTimer = 0f;
            animator.SetIKPositionWeight(AvatarIKGoal.LeftFoot, 1);
            animator.SetIKPositionWeight(AvatarIKGoal.RightFoot, 1);
            animator.SetIKRotationWeight(AvatarIKGoal.LeftFoot, 1);
            animator.SetIKRotationWeight(AvatarIKGoal.RightFoot, 1);
        }
        else
        {
            if (ikTimer < 0.7f)
            {
                float t = ikTimer / 0.7f;
                float weight = Mathf.LerpUnclamped(1, 0, t);
                ikTimer += Time.deltaTime;
                animator.SetIKPositionWeight(AvatarIKGoal.LeftFoot, weight);
                animator.SetIKPositionWeight(AvatarIKGoal.RightFoot, weight);
                animator.SetIKRotationWeight(AvatarIKGoal.LeftFoot, weight);
                animator.SetIKRotationWeight(AvatarIKGoal.RightFoot, weight);
            }
            else
            {
                animator.SetIKPositionWeight(AvatarIKGoal.LeftFoot, 0);
                animator.SetIKPositionWeight(AvatarIKGoal.RightFoot, 0);
                animator.SetIKRotationWeight(AvatarIKGoal.LeftFoot, 0);
                animator.SetIKRotationWeight(AvatarIKGoal.RightFoot, 0);
            }
        }
    }
}
