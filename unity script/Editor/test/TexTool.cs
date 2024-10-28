using CharacterBuilder;
using Gameplay.Utils;
using NPOI.Util;
using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEditor.Search;
using UnityEngine;
using System.IO;
using UnityEngine.UIElements;

public class TexTool : EditorWindow
{
    ObjectField emojiTexField;
    ObjectField mainTexField;
    Texture2D emojiTex;
    Texture2D mainTex;
    string savePath = "D:/GitHub/NLDClient/ProjectNLD/Assets/Art/temp/new_t.png";

   
    public static void ShowWindow() { GetWindow<TexTool>("修改 表情贴图"); }

    public void CreateGUI()
    {
        emojiTexField = new ObjectField("emoji");
        mainTexField = new ObjectField("main");
        Button btn1 = new() { name = "button1", text = "apply" };
        rootVisualElement.Add(btn1);
        btn1.RegisterCallback<ClickEvent>(_SaveAndReloadTexture2D);

        rootVisualElement.Add(mainTexField);
        rootVisualElement.Add(emojiTexField);
        rootVisualElement.Add(btn1);
    }
    private void _SaveAndReloadTexture2D(ClickEvent evt)
    {

        var t2d = _DrawEmojiToMainTex();
        var bytes = t2d.EncodeToPNG();
        Debug.Log("aa");
        File.WriteAllBytes(savePath, bytes);
        AssetDatabase.Refresh();
    }

    private Texture2D _DrawEmojiToMainTex()
    {
        mainTex = mainTexField.value as Texture2D;
        emojiTex = emojiTexField.value as Texture2D;
        if (emojiTex == null || mainTex == null)
        {
            DebugUtil.LogError("找不到表情贴图");
            return null;
        }

        var shader = Shader.Find("Unlit/DrawFace");
        var material = new Material(shader);
        material.SetTexture("_MainTex", mainTex);
        material.SetTexture("_FaceTex", emojiTex);
        // material.SetTexture("_FaceMask", maskTex);
        // material.SetColor("_EyebowsColor", eyebowsColor);
        // material.SetColor("_EyeColor", eyesColor);

        // 创建一个新的贴图
        var newTex = new Texture2D(mainTex.width, mainTex.height, TextureFormat.RGBA32, false);

        // 画到新的贴图上
        var rt = RenderTexture.GetTemporary(mainTex.width, mainTex.height, 0, RenderTextureFormat.ARGB32);
        Graphics.Blit(mainTex, rt, material);
        RenderTexture.active = rt;
        newTex.ReadPixels(new Rect(0, 0, mainTex.width, mainTex.height), 0, 0);
        newTex.Apply();
        RenderTexture.active = null;
        RenderTexture.ReleaseTemporary(rt);

        return newTex;
    }
}
