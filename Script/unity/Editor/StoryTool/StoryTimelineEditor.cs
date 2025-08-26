using UnityEditor;
using UnityEngine;
using UnityEngine.Playables;
using UnityEngine.Timeline;
using UnityEngine.UIElements;

namespace Art.temp.Editor.StoryTool
{
    public class StoryTimelineEditor : EditorWindow
    {
        private TextField searchField;
        private Vector3 pos;
        private Vector3 ro;
        private Vector3 scale;
        private static PlayableDirector Pd => GameObject.Find("StoryManager/timeline").GetComponent<PlayableDirector>();
        private static TimelineAsset CurrentTimeline => Pd.playableAsset as TimelineAsset;

        [MenuItem("Test/story工具/timeline 编辑")]
        public static void ShowWindow()
        {
            GetWindow<StoryTimelineEditor>("story editor");
        }

        public void CreateGUI()
        {
            var styleSheet = AssetDatabase.LoadAssetAtPath<StyleSheet>("Assets/Art/temp/Editor/CommonUSSFile.uss");
            rootVisualElement.styleSheets.Add(styleSheet);
            // 剧情文字
            Box boxMsg = new();
            rootVisualElement.Add(boxMsg);

            Label labelMsg = new() { text = "剧情文字" };

            searchField = new TextField("Search");
            Button btnSearch = new() { text = "搜索" };
            btnSearch.RegisterCallback<ClickEvent>(_ => { TimelineInfo.SearchMsg(CurrentTimeline, searchField); });

            Button btnCheck = new() { text = "检查" };
            btnCheck.RegisterCallback<ClickEvent>(_ => TimelineInfo.CheckMsg(CurrentTimeline));

            Button btnModify = new() { text = "修改" };
            btnModify.RegisterCallback<ClickEvent>(_ => TimelineInfo.ModifyMsg(CurrentTimeline));

            Button btnJumpBlock = new() { text = "检查自动跳转" };
            btnJumpBlock.RegisterCallback<ClickEvent>(_ => TimelineInfo.CheckJumpNext(CurrentTimeline));

            /*Button btnExport = new() { text = "Export to Json" };
            btnExport.RegisterCallback<ClickEvent>(evt => TimelineInfo.MsgToJson(CurrentTimeline));

            Button btnImport = new() { text = "Import from Json" };
            btnImport.RegisterCallback<ClickEvent>(evt => TimelineInfo.ImportFromJson(CurrentTimeline));*/
            Button btnExportExcel = new() { text = "Export to excel" };
            btnExportExcel.RegisterCallback<ClickEvent>(_ => TimelineInfo.MsgToExcel(CurrentTimeline));

            Button btnImportExcel = new() { text = "Import from excel" };
            btnImportExcel.RegisterCallback<ClickEvent>(_ => TimelineInfo.ImportFromExcel(CurrentTimeline));

            boxMsg.Add(labelMsg);
            boxMsg.Add(searchField);
            boxMsg.Add(btnSearch);
            boxMsg.Add(btnCheck);
            boxMsg.Add(btnModify);
            boxMsg.Add(btnJumpBlock);
            // boxMsg.Add(btnExport);
            // boxMsg.Add(btnImport);
            boxMsg.Add(btnExportExcel);
            boxMsg.Add(btnImportExcel);


            // 剧情角色
            Box boxCharacter = new();
            rootVisualElement.Add(boxCharacter);

            Label label2 = new() { text = "角色" };

            Button characterBtn1 = new() { text = "说活_向右移动 0.1s" };
            characterBtn1.RegisterCallback<ClickEvent>(_ => TimelineInfo.MoveTalkClips(CurrentTimeline));

            Button characterBtn2 = new() { text = "名字_删除无效标签" };
            characterBtn2.RegisterCallback<ClickEvent>(_ => TimelineInfo.RemoveNoneSetNameClips(CurrentTimeline));

            Button characterBtn3 = new() { text = "copy animation clip" };
            characterBtn3.RegisterCallback<ClickEvent>(_ => TimelineInfo.CopyClips("animation"));
            Button characterBtn4 = new() { text = "paste animation clip" };
            characterBtn4.RegisterCallback<ClickEvent>(_ => TimelineInfo.PasteAnimation(CurrentTimeline));

            Button characterBtn5 = new() { text = "copy emoji" };
            characterBtn5.RegisterCallback<ClickEvent>(_ => TimelineInfo.CopyEmojis("emoji"));
            Button characterBtn6 = new() { text = "paste emoji" };
            characterBtn6.RegisterCallback<ClickEvent>(_ => TimelineInfo.PasteEmoji(CurrentTimeline));

            boxCharacter.Add(label2);
            boxCharacter.Add(characterBtn1);
            boxCharacter.Add(characterBtn2);
            boxCharacter.Add(characterBtn3);
            boxCharacter.Add(characterBtn4);
            boxCharacter.Add(characterBtn5);
            boxCharacter.Add(characterBtn6);

            // 相机
            // UI
            // 通用
            Box boxCommon = new();
            rootVisualElement.Add(boxCommon);

            Label labelCommon = new() { text = "通用" };
            Button btnCommon = new() { text = "检查通用 clip" };
            btnCommon.RegisterCallback<ClickEvent>(_ => TimelineInfo.CheckCommon(CurrentTimeline));

            boxCommon.Add(labelCommon);
            boxCommon.Add(btnCommon);

            // tools
            Box boxTool = new();
            rootVisualElement.Add(boxTool);

            Label label3 = new() { text = "tools" };

            // Button btnTool1 = new() { text = "计算移动时间" };
            Button btnTool2 = new() { text = "复制 transform" };
            btnTool2.RegisterCallback<ClickEvent>(_ => CopyTransform());
            Button btnTool3 = new() { text = "粘贴 transform" };
            btnTool3.RegisterCallback<ClickEvent>(_ => PasteTransform());
            Button btnTool4 = new() { text = "Insert Block" };
            btnTool4.RegisterCallback<ClickEvent>(_ => TimelineInfo.InsertBlock(CurrentTimeline));
            Button btnTool5 = new() { text = "生成 player points" };
            btnTool5.RegisterCallback<ClickEvent>(_ => CreatePlayerPoints());

            boxTool.Add(label3);
            // boxTool.Add(btnTool1);
            boxTool.Add(btnTool2);
            boxTool.Add(btnTool3);
            boxTool.Add(btnTool4);
            boxTool.Add(btnTool5);
        }

        /// <summary>
        /// 
        /// </summary>
        public void WalkTime()
        {
            var points = Selection.transforms;
            if (points.Length != 2)
            {
                Debug.LogWarning("请选择两个 player_point");
            }
            else
            {
                float distance = (points[0].position - points[1].position).magnitude * 100;
                float time1 = distance / 64.5f;
                float time2 = distance / 63f;
                string text = $" walk01 需要走 {time1} 秒 \n walk02 需要走 {time2} 秒";
                Debug.Log(text);
            }
        }

        private void CopyTransform()
        {
            Transform trans = Selection.activeTransform;
            pos = trans.localPosition;
            ro = trans.localEulerAngles;
            scale = trans.localScale;
        }

        private void PasteTransform()
        {
            Transform trans = Selection.activeTransform;
            trans.localPosition = pos;
            trans.localEulerAngles = ro;
            trans.localScale = scale;
        }

        private static void CreatePlayerPoints()
        {
            Transform playerPointsRoot = GameObject.Find("StoryManager").transform.Find("player_points");
            Transform playersRoot = GameObject.Find("StoryManager/players").transform;
            for (int i = 1; i < playersRoot.childCount; i++)
            {
                string playerName = playersRoot.GetChild(i).name.Split("_")[3];
                string pointName = $"pos (0) {playerName}";
                GameObject playerPoint = new GameObject(pointName);
                playerPoint.transform.SetParent(playerPointsRoot);
            }
        }
    }
}