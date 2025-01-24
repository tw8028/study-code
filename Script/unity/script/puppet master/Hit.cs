using RootMotion.Dynamics;
using System.Collections;
using UnityEngine;

public class Hit : MonoBehaviour
{
    public Animator animator;

    private Rigidbody rb_head;
    private Rigidbody rb_spine;
    private Rigidbody rb_pelvis;
    private PuppetMaster pm;
    private bool pmActive;
    private float timer;
    private Transform cameraTransform;

    // Start is called before the first frame update
    void Start()
    {
        Init();
    }

    // Update is called once per frame
    void Update()
    {
        AnimSpeedLerp();
    }
    void OnGUI()
    {
        if (GUI.Button(new Rect(100, 350, 100, 30), "hit_head"))
        {
            pm.mode = PuppetMaster.Mode.Active;
            pmActive = true;
            StartCoroutine(HitDelay(rb_head, 30f));
        }

        if (GUI.Button(new Rect(100, 400, 100, 30), "hit_spine"))
        {
            pm.mode = PuppetMaster.Mode.Active;
            pmActive = true;
            StartCoroutine(HitDelay(rb_spine, 100f));
        }

        if (GUI.Button(new Rect(100, 450, 100, 30), "hit_pelvis"))
        {
            pm.mode = PuppetMaster.Mode.Active;
            pmActive = true;
            StartCoroutine(HitDelay(rb_pelvis, 200f));
        }
    }
    void Init()
    {
        pm = transform.Find("PuppetMaster").GetComponent<PuppetMaster>();

        rb_head = transform.Find("PuppetMaster/Bip001_Pelvis/Bip001_Spine1/Bip001_Head").GetComponent<Rigidbody>();
        rb_spine = transform.Find("PuppetMaster/Bip001_Pelvis/Bip001_Spine1").GetComponent<Rigidbody>();
        rb_pelvis = transform.Find("PuppetMaster/Bip001_Pelvis").GetComponent<Rigidbody>();

        pm.mode = PuppetMaster.Mode.Disabled;
        pmActive = false;

        cameraTransform = Camera.main.transform;
    }
    void AnimSpeedLerp()
    {
        if (pmActive)
        {
            timer += Time.deltaTime;
            if (timer < 0.7f)
            {
                float t = timer / 0.7f;
                animator.speed = Mathf.LerpUnclamped(0f, 1f, t);
            }
            else
            {
                animator.speed = 1f;
                if (timer >= 1.5f)
                {
                    pmActive = false;
                    pm.mode = PuppetMaster.Mode.Disabled;
                    timer = 0f;
                }
            }
        }
    }

    IEnumerator HitDelay(Rigidbody rb, float m_thrust)
    {
        yield return new WaitForSeconds(0.01f);
        rb.AddForce(cameraTransform.forward * m_thrust, ForceMode.Impulse);
    }
}
