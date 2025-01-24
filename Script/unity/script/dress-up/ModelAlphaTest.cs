using UnityEngine;


public class ModelAlphaTest : MonoBehaviour
{
    public bool hideHand;
    public bool hideArm;
    public bool hideSpine;
    public bool hidePelvis;
    public bool hideLeg;
    public bool hideFoot;

    private Material mat;


    void Start()
    {
        mat = GetComponent<Renderer>().material;
    }

    void Update()
    {

    }

    void HideByVertexColor(string name, Color color, bool hide)
    {
        if (hide)
        {
            mat.SetColor(name, color);
        }
    }
    void RemoveHide(string name, Color color, bool hide)
    {
        if (hide)
        {
            mat.SetColor(name, Color.white);
        }
    }
    private void OnGUI()
    {
        if (GUI.Button(new Rect(100, 600, 100, 30), "hide"))
        {
            HideByVertexColor("_CutOffHand", Color.red, hideHand);
            HideByVertexColor("_CutOffArm", Color.cyan, hideArm);
            HideByVertexColor("_CutOffSpine", Color.blue, hideSpine);
            HideByVertexColor("_CutOffPelvis", Color.green, hidePelvis);
            HideByVertexColor("_CutOffLeg", Color.yellow, hideLeg);
            HideByVertexColor("_CutOffFoot", Color.magenta, hideFoot);
        }
        if (GUI.Button(new Rect(200, 600, 100, 30), "display"))
        {
            RemoveHide("_CutOffHand", Color.red, hideHand);
            RemoveHide("_CutOffArm", Color.cyan, hideArm);
            RemoveHide("_CutOffSpine", Color.blue, hideSpine);
            RemoveHide("_CutOffPelvis", Color.green, hidePelvis);
            RemoveHide("_CutOffLeg", Color.yellow, hideLeg);
            RemoveHide("_CutOffFoot", Color.magenta, hideFoot);
        }
    }
}
