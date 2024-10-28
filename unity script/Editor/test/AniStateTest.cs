using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using UnityEngine.UIElements;

public class AniStateTest : EditorWindow
{
    Animator animator;
    [MenuItem("Test/tools/ani state test")]
    public static void ShowWindow() { GetWindow<AniStateTest>("ani state test"); }

    public void CreateGUI()
    {
        Transform player = Selection.activeTransform;
        animator = player.GetChild(0).GetComponent<Animator>();

        Label lb1 = new Label() { text = "stand" };
        rootVisualElement.Add(lb1);

        Button btn1 = new() { name = "button1", text = "idle" };
        rootVisualElement.Add(btn1);
        btn1.RegisterCallback<ClickEvent>(PlayIdle);

        Button btn2 = new() { name = "button2", text = "attack" };
        rootVisualElement.Add(btn2);
        btn2.RegisterCallback<ClickEvent>(PlayAttack);

        Button btn3 = new() { name = "button3", text = "reload" };
        rootVisualElement.Add(btn3);
        btn3.RegisterCallback<ClickEvent>(PlayReload);

        Label lb2 = new Label() { text = "crawl" };
        rootVisualElement.Add(lb2);


        Button btn4 = new() { name = "button4", text = "idle" };
        rootVisualElement.Add(btn4);
        btn4.RegisterCallback<ClickEvent>(PlayCIdle);

        Button btn5 = new() { name = "button5", text = "attack" };
        rootVisualElement.Add(btn5);
        btn5.RegisterCallback<ClickEvent>(PlayCAttack);

        Button btn6 = new() { name = "button6", text = "reload" };
        rootVisualElement.Add(btn6);
        btn6.RegisterCallback<ClickEvent>(PlayCReload);


        Label lb3 = new Label() { text = "move or stop" };
        rootVisualElement.Add(lb3);

        Button btn7 = new() { name = "button7", text = "move" };
        rootVisualElement.Add(btn7);
        btn7.RegisterCallback<ClickEvent>(PlayMove);

        Button btn8 = new() { name = "button8", text = "stop" };
        rootVisualElement.Add(btn8);
        btn8.RegisterCallback<ClickEvent>(Stop);

        Button btn9 = new() { name = "button9", text = "c_move" };
        rootVisualElement.Add(btn9);
        btn9.RegisterCallback<ClickEvent>(PlayCMove);
    }

    public void PlayIdle(ClickEvent evt)
    {
        animator.Play("idle");
    }

    public void PlayAttack(ClickEvent evt)
    {
        animator.Play("attack");
    }
    public void PlayReload(ClickEvent evt)
    {
        animator.Play("reload");
    }
    public void PlayMove(ClickEvent evt)
    {
        animator.Play("move", 1);
    }
    public void Stop(ClickEvent evt)
    {
        animator.Play("empty", 1);
    }

    public void PlayCIdle(ClickEvent evt)
    {
        animator.Play("c_idle");
    }

    public void PlayCAttack(ClickEvent evt)
    {
        animator.Play("c_attack");
    }
    public void PlayCReload(ClickEvent evt)
    {
        animator.Play("c_reload");
    }

    public void PlayCMove(ClickEvent evt)
    {
        animator.Play("c_move");
    }
}
