using UnityEngine;

public class SpaceTransTest : MonoBehaviour
{
    public Transform trans_a;
    public Transform trans_b;
    public Transform trans_c;
    public Transform IKhandle;
    public Transform pole;

    readonly float eps = 0.01f;
    float lab;
    float lbc;
    Vector3 t_last;
    Vector3 p_last;

    // Start is called before the first frame update
    void Start()
    {
        lab = (trans_b.position - trans_a.position).magnitude;
        lbc = (trans_c.position - trans_b.position).magnitude;
        t_last = IKhandle.position;
        p_last = pole.position;
    }

    // Update is called once per frame
    void Update()
    {

        Vector3 t = IKhandle.position;
        Vector3 p = pole.position;
        Vector3 a = trans_a.position;
        Vector3 b = trans_b.position;
        Vector3 c = trans_c.position;
        if (t == t_last & p == p_last)
        {
            return;
        }
        else
        {
            Calculate(a, b, c, t, p);
            t_last = IKhandle.position;
            p_last = pole.position;
        }
    }
    void Calculate(Vector3 a, Vector3 b, Vector3 c, Vector3 t, Vector3 p)
    {
        float lat = Mathf.Clamp((t - a).magnitude, eps, lab + lbc - eps);

        float angle_a_0 = Mathf.Acos(Mathf.Clamp(Vector3.Dot((c - a).normalized, (b - a).normalized), -1, 1));
        float angle_b_0 = Mathf.Acos(Mathf.Clamp(Vector3.Dot((a - b).normalized, (c - b).normalized), -1, 1));

        float angle_a_1 = Mathf.Acos(Mathf.Clamp((lbc * lbc - lab * lab - lat * lat) / (-2 * lab * lat), -1, 1));
        float angle_b_1 = Mathf.Acos(Mathf.Clamp((lat * lat - lab * lab - lbc * lbc) / (-2 * lab * lbc), -1, 1));

        Vector3 axis0 = Vector3.Cross(c - a, b - a).normalized;
        Quaternion r0 = Quaternion.AngleAxis((angle_a_1 - angle_a_0) * Mathf.Rad2Deg, Quaternion.Inverse(trans_a.rotation) * axis0);
        Quaternion r1 = Quaternion.AngleAxis((angle_b_1 - angle_b_0) * Mathf.Rad2Deg, Quaternion.Inverse(trans_b.rotation) * axis0);
        trans_a.localRotation *= r0;
        trans_b.localRotation *= r1;

        float angle_at_0 = Mathf.Acos(Mathf.Clamp(Vector3.Dot((c - a).normalized, (t - a).normalized), -1, 1));
        Vector3 axis1 = Vector3.Cross(c - a, t - a).normalized;
        Quaternion r2 = Quaternion.AngleAxis(angle_at_0 * Mathf.Rad2Deg, Quaternion.Inverse(trans_a.rotation) * axis1);
        trans_a.localRotation *= r2;

        Vector3 normal_abp = Vector3.Cross(c - a, p - a).normalized;
        float abc_abp = Mathf.Acos(Mathf.Clamp(Vector3.Dot(axis0, normal_abp), -1, 1));
        float len = lab * Mathf.Sin(angle_a_0);
        float lbe = len * Mathf.Sin(abc_abp / 2);
        float angle_p = 2 * Mathf.Asin(lbe / lab) * Mathf.Rad2Deg;


        Vector3 axis3 = c - a;
        Quaternion r3 = Quaternion.AngleAxis(angle_p, axis3);
        Debug.Log(angle_p);
        trans_a.localRotation *= r3;
    }






    Vector3 GetPoleVector(Vector3 a, Vector3 b, Vector3 c)
    {
        Vector3 poleDir = (b - a).normalized + (b - c).normalized;
        Vector3 pole = poleDir * ((b - a).magnitude + (b - c).magnitude);
        return pole;
    }
}
