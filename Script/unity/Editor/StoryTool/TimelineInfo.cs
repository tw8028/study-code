using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using Art.temp.Editor.CharacterData;
using Gameplay.Story.Cmp;
using Gameplay.Story.Cmp.Timeline.CommonAction;
using Gameplay.Story.Cmp.Timeline.MsgAction;
using Gameplay.Story.Cmp.Timeline.PlayerTalkAction;
using Gameplay.Story.Cmp.Timeline.SendEventAction;
using Gameplay.Story.Cmp.Timeline.SetNameAction;
using NPOI.XSSF.UserModel;
using Sirenix.Utilities;
using UnityEditor;
using UnityEditor.Timeline;
using UnityEngine;
using UnityEngine.Timeline;
using UnityEngine.UIElements;
using Object = UnityEngine.Object;
#if UNITY_ANDROID
#endif


namespace Art.temp.Editor.StoryTool
{
    public static class TimelineInfo
    {
        // 获取指定 track 的 clips
        private static TimelineClip[] GetClips<T>(TimelineAsset timeline) where T : TrackAsset
        {
            return timeline.GetOutputTracks().OfType<T>().SelectMany(a=>a.GetClips()).ToArray();
        }

        // 获取指定 track
        private static TrackAsset[] GetTracks<T>(TimelineAsset timeline) where T : TrackAsset
        {
            return timeline.GetOutputTracks().OfType<T>().ToArray<TrackAsset>();
        }

        /// <summary>
        /// 序列化 block data 用于导出
        /// </summary>
        /// <param name="timeline"></param>
        /// <returns></returns>
        private static MsgClip[] GetMsgClipData(TimelineAsset timeline)
        {
            var clips = GetClips<MsgActionTrack>(timeline);
            var talkClips = GetClips<PlayerTalkActionTrack>(timeline);

            var msgArray = new MsgClip[clips.Length];
            for (int i = 0; i < clips.Length; i++)
            {
                var msgClip = clips[i].asset as MsgActionClip;
                var i1 = i;
                var speakerInBlock = talkClips.Where(talk =>
                    talk.start > clips[i1].start - 0.15d && talk.end < clips[i1].end + 0.65d);
                if (!msgClip) continue;
                MsgClip msgClipData = new()
                {
                    blockId = msgClip.blockId,
                    msg = msgClip.msg,
                    extMsg = msgClip.extMsgs.Length > 0 ? msgClip.extMsgs : null,
                    speakers = speakerInBlock.Select(t => t.GetParentTrack().parent.name).ToArray()
                };
                msgArray[i] = msgClipData;
            }

            return msgArray;
        }

        /// <summary>
        /// 替换角色 prefab 和 动画
        /// </summary>
        /// <param name="timeline"></param>
        public static void CheckAnimationClip(TimelineAsset timeline)
        {
            var animationTracks = GetTracks<AnimationTrack>(timeline);
            foreach (var track in animationTracks)
            {
                var clips = track.GetClips();
                foreach (var clip in clips)
                {
                    if (!clip.animationClip)
                    {
                        Debug.LogError($"动画丢失: {track.parent.name}: {clip.start}");
                    }
                    else
                    {
                        string clipName = clip.animationClip.name;
                        /* if (clipName.Contains("_crawl_") || clipName.Contains("_stand_") || clipName.Contains("_common"))
                         {
                             string path = AssetDatabase.GetAssetPath(clip.animationClip);
                             Debug.LogWarning($"使用了战斗动画:{path}");
                         }

                         else if (clipName.Contains("ready"))
                         {
                             string path = AssetDatabase.GetAssetPath(clip.animationClip);
                             Debug.LogWarning($"使用了ready动画:{path}");
                         }*/
                        if (!clipName.StartsWith("compressed"))
                        {
                            Debug.LogWarning($"未压缩动画: {track.parent.name}: {clip.start}");
                        }
                    }
                }
            }
        }

        public static void ReplaceAllAnimations(TimelineAsset timeline)
        {
            var clips = TimelineInfo.GetClips<AnimationTrack>(timeline);
            // 处理 old clip 名
            foreach (TimelineClip clip in clips)
            {
                string displayName = clip.displayName;

                if (displayName.EndsWith("crawl_idle001"))
                {
                    displayName = "ani_common_s_crawl_idle001";
                }
                // ReSharper disable once StringLiteralTypo
                else if (displayName.EndsWith("crawl_moveforward001"))
                {
                    // ReSharper disable once StringLiteralTypo
                    displayName = "ani_common_s_crawl_moveforward001";
                }
                else if (displayName.Contains("attack002"))
                {
                    displayName = displayName.Replace("attack002", "attack001");
                }
                else if (displayName.StartsWith("ani_s_sit"))
                {
                    if (displayName.Contains("_end"))
                    {
                        displayName = displayName.Replace("_end", "_loop");
                    }

                    if (displayName.Contains("_start"))
                    {
                        displayName = displayName.Replace("_start", "_loop");
                    }
                }

                clip.displayName = displayName;
            }

            foreach (var clip in clips)
            {
                string displayName = clip.displayName;
                string path = $"Assets/Art/Animations/compressedShow/compressed_{displayName}.anim";

                var clipAsset = AssetDatabase.LoadAssetAtPath<AnimationClip>(path);
                if (clip.asset is AnimationPlayableAsset playableAsset)
                {
                    playableAsset.clip = clipAsset;
                }
            }
        }

        public static void ReplaceAllCharacters(Transform root)
        {
            int n = root.childCount;
            var oldPlayers = new Transform[n];
            string[] playerNames = new string[n];
            string[] nameId = new string[n];
            int[] playerIds = new int[n];
            for (int i = 0; i < oldPlayers.Length; i++)
            {
                oldPlayers[i] = root.GetChild(i);
                playerNames[i] = oldPlayers[i].name;
                playerIds[i] = oldPlayers[i].GetComponent<CmpStoryPlayer>().playerId;
                nameId[i] = oldPlayers[i].GetChild(0).name;
            }

            for (int i = 0; i < playerNames.Length; i++)
            {
                if (playerNames[i].Split('_')[2] == "100")
                {
                    continue;
                }

                GameObject playerPrefab = AnimHelper.FindDisplayPrefab(nameId[i]);
                if (playerPrefab == null)
                {
                    Debug.LogWarning($"无法找到 {playerNames[i]} 对应 prefab");
                    continue;
                }

                Object.DestroyImmediate(oldPlayers[i].gameObject);
                GameObject prefabInstance = (GameObject)PrefabUtility.InstantiatePrefab(playerPrefab, root);
                prefabInstance.name = playerNames[i];
                var cmpStoryPlayer = prefabInstance.AddComponent<CmpStoryPlayer>();
                cmpStoryPlayer.playerId = playerIds[i];
                Debug.Log($"替换 prefab: {playerNames[i]}");
            }
        }

        public static void ReplaceSelectedCharacter(Transform root)
        {
            GameObject go = Selection.activeGameObject;
            // 销毁前记录名字
            string playerName = go.name;

            GameObject playerPrefab = AnimHelper.FindDisplayPrefab(go.transform.GetChild(0).name);
            if (playerPrefab != null)
            {
                int playerId = go.GetComponent<CmpStoryPlayer>().playerId;
                Object.DestroyImmediate(go);
                GameObject playerInstance = (GameObject)PrefabUtility.InstantiatePrefab(playerPrefab, root);
                playerInstance.name = playerName;
                var cmpStoryPlayer = playerInstance.AddComponent<CmpStoryPlayer>();
                cmpStoryPlayer.playerId = playerId;
                Debug.Log($"替换角色: {playerName}");
            }
            else
            {
                Debug.LogError($"无法找到对应角色 prefab：{playerName}");
            }
        }


        /// <summary>
        ///  导出文本
        /// </summary>
        /// <returns></returns>
        public static TimelineAsset[] GetTimelineAssets()
        {
            string assetPath = "Assets/Art/Story/{0}/{0}.playable";
            string[] idName = new string[]
            {
                "story_0_1_1",
                "story_0_1_2",
                "story_0_1_3",
                "story_0_1_4",
                "story_1_1_1",
                "story_1_1_2",
                "story_1_1_3",
                "story_1_1_4",
                "story_1_1_5",
                "story_1_1_6",
                "story_1_1_7",
                "story_1_1_8",
                "story_1_1_9",
                "story_1_1_10",
                "story_1_1_11"
            };

            return idName.Select(t => AssetDatabase.LoadAssetAtPath<TimelineAsset>(string.Format(assetPath, t)))
                .ToArray();
        }

        public static void MsgToExcel(TimelineAsset timeline)
        {
            string excelPath = $"Assets/Art/temp/Story_Text/{timeline.name}.xlsx";
            if (File.Exists(excelPath))
            {
                File.Delete(excelPath);
            }

            var newExcel = new XSSFWorkbook();
            var sheet = newExcel.CreateSheet();
            var headers = new[]
            {
                "blockId",
                "speaker",
                "msg",
                "exMsg1",
                "exMsg2",
                "exMsg3",
                "exMsg4"
            };
            var headRow = sheet.CreateRow(0);
            for (int i = 0; i < headers.Length; i++)
            {
                var cell = headRow.CreateCell(i);
                cell.SetCellValue(headers[i]);
            }

            var msgClipData = TimelineInfo.GetMsgClipData(timeline);
            for (int j = 0; j < msgClipData.Length; j++)
            {
                // set blockId
                var row = sheet.CreateRow(j + 1);
                var cellBlockId = row.CreateCell(0);
                cellBlockId.SetCellValue(msgClipData[j].blockId);

                // set speakers
                var cellSpeaker = row.CreateCell(1);
                if (msgClipData[j].speakers.Length > 0)
                {
                    string str = string.Join("、", msgClipData[j].speakers);
                    cellSpeaker.SetCellValue(str);
                }

                // set msg
                if (msgClipData[j].extMsg is null)
                {
                    // set msg
                    var cellMsg = row.CreateCell(2);
                    cellMsg.SetCellValue(msgClipData[j].msg);
                }
                else
                {
                    // set exMsg
                    for (int k = 0; k < msgClipData[j].extMsg.Length; k++)
                    {
                        var cellExtMsg = row.CreateCell(k + 3);
                        cellExtMsg.SetCellValue(msgClipData[j].extMsg[k]);
                    }
                }
            }

            // save file
            using (FileStream fs = File.OpenWrite(excelPath))
            {
                newExcel.Write(fs);
            }

            Debug.Log($"导出: {excelPath}");
            AssetDatabase.Refresh();
        }

        public static void ImportFromExcel(TimelineAsset timeline)
        {
            string excelPath = $"Assets/Art/temp/Story_Text/{timeline.name}.xlsx";
            if (!File.Exists(excelPath))
            {
                Debug.LogWarning($"not find file: {excelPath}");
                return;
            }

            using var fs = new FileStream(excelPath, FileMode.Open, FileAccess.Read);
            var newExcel = new XSSFWorkbook(fs);
            var sheet = newExcel.GetSheetAt(0);

            // get data
            List<MsgActionClip> clipData = new();
            for (int i = 1; i <= sheet.LastRowNum; i++)
            {
                var row = sheet.GetRow(i);
                if (row == null)
                {
                    continue;
                }

                if (row.GetCell(0) is null)
                {
                    continue;
                }

                MsgActionClip msgClip = ScriptableObject.CreateInstance<MsgActionClip>();
                msgClip.blockId = (int)row.GetCell(0).NumericCellValue;
                msgClip.msg = row.GetCell(2) != null ? row.GetCell(2).StringCellValue : string.Empty;

                var numbers = new[] { 3, 4, 5, 6 };
                var extMsgCells = numbers.Select(x => row.GetCell(x)).Where(c => c is not null);
                msgClip.extMsgs = extMsgCells.Select(c => c.StringCellValue).ToArray();

                clipData.Add(msgClip);
            }

            // check data
            var msgClips = GetClips<MsgActionTrack>(timeline);
            if (clipData.Count() != msgClips.Count())
            {
                Debug.LogError("数据不匹配，停止导入，检查 excel 文件");
                return;
            }

            // set data
            Debug.Log($"导入: {excelPath}, endId = {clipData[clipData.Count() - 1].blockId}");
            foreach (var clp in msgClips)
            {
                var msgClip = clp.asset as MsgActionClip;
                var clipInfo = clipData.First(data =>
                {
                    if (!msgClip) return false;
                    return data.blockId == msgClip.blockId;
                });
                if (clipInfo.msg != string.Empty)
                {
                    if (msgClip)
                    {
                        if (msgClip.msg != clipInfo.msg)
                        {
                            Debug.Log(msgClip.blockId);
                            Debug.Log(msgClip.msg);
                            Debug.LogWarning(clipInfo.msg);
                            msgClip.msg = clipInfo.msg;
                        }
                    }
                }

                if (clipInfo.extMsgs is null) continue;
                if (msgClip)
                {
                    if (clipInfo.extMsgs.SequenceEqual(msgClip.extMsgs)) continue;
                    Debug.Log(msgClip.blockId);
                    Debug.Log(string.Join("|", msgClip.extMsgs));
                    Debug.LogWarning(string.Join("|", clipInfo.extMsgs));
                    msgClip.extMsgs = clipInfo.extMsgs;
                }
            }

            TimelineEditor.Refresh(RefreshReason.ContentsModified);
            EditorUtility.SetDirty(timeline);
            AssetDatabase.SaveAssets();
        }


        /// <summary>
        /// 搜索 检查 修改剧情文本
        /// </summary>
        /// <param name="timeline"></param>
        /// <param name="searchField"></param>
        public static void SearchMsg(TimelineAsset timeline, TextField searchField)
        {
            var msgClips = GetClips<MsgActionTrack>(timeline);
            foreach (var clip in msgClips)
            {
                if (clip.asset is not MsgActionClip msgClip) return;
                string[] messages = msgClip.extMsgs.Length == 0 ? new[] { msgClip.msg } : msgClip.extMsgs;
                foreach (string msg in messages)
                {
                    if (msg == null)
                    {
                        return;
                    }

                    if (searchField.value == "")
                    {
                        Debug.Log("输入搜索内容");
                    }

                    if (msg.Contains(searchField.value))
                    {
                        Debug.LogWarning($"{msgClip.blockId}:搜索({searchField.value})    {msg}");
                    }
                }
            }
        }

        public static void CheckMsg(TimelineAsset timeline)
        {
            Debug.Log(timeline.name);
            var msgClips = GetClips<MsgActionTrack>(timeline);
            foreach (var clip in msgClips)
            {
                // 检查文本长度
                if (clip.asset is not MsgActionClip msgClip) return;
                string[] messages = msgClip.extMsgs.Length == 0 ? new[] { msgClip.msg } : msgClip.extMsgs;
                foreach (string msg in messages)
                {
                    if (msg != null)
                    {
                        if (msg.Length > 54)
                        {
                            Debug.LogWarning($"{msgClip.blockId}:文本太长    {msg}");
                        }
                    }
                    else
                    {
                        Debug.LogError($"{msgClip.blockId}:空文本");
                    }
                }

                // 检查字符
                string originMsg = msgClip.msg;
                if (ContainsNonChinesePunctuation(originMsg))
                {
                    Debug.LogWarning($"{msgClip.blockId}:文本不规范   {originMsg}");
                }

                foreach (string t in msgClip.extMsgs)
                {
                    if (ContainsNonChinesePunctuation(t))
                    {
                        Debug.LogWarning($"{msgClip.blockId}:文本不规范   {t}");
                    }
                }
            }
        }

        public static void ModifyMsg(TimelineAsset timeline)
        {
            Debug.Log(timeline.name);
            var msgClips = GetClips<MsgActionTrack>(timeline);
            foreach (var clip in msgClips)
            {
                if (clip.asset is not MsgActionClip msgClip) return;
                // 修改 msg
                string originMsg = msgClip.msg;
                if (ContainsNonChinesePunctuation(originMsg))
                {
                    string re = ReplaceText(originMsg);
                    msgClip.msg = re;
                    Debug.LogWarning($"{msgClip.blockId}:坏文本   {originMsg}");
                    Debug.Log($"{msgClip.blockId}:修改为   {re}");
                }

                // 修改 exMsg
                for (int i = 0; i < msgClip.extMsgs.Length; i++)
                {
                    if (!ContainsNonChinesePunctuation(msgClip.extMsgs[i])) continue;
                    string re = ReplaceText(msgClip.extMsgs[i]);
                    msgClip.extMsgs[i] = re;
                    Debug.LogWarning($"{msgClip.blockId}:坏文本   {msgClip.extMsgs[i]}");
                    Debug.Log($"{msgClip.blockId}:修改为   {re}");
                }
            }

            TimelineEditor.Refresh(RefreshReason.ContentsModified);
            EditorUtility.SetDirty(timeline);
            AssetDatabase.SaveAssets();
        }

        public static void CheckJumpNext(TimelineAsset timeline)
        {
            TimelineClip[] msgClips = GetClips<MsgActionTrack>(timeline);
            IEnumerable<MsgActionClip> clips = msgClips.Select(timelineClip => timelineClip.asset)
                .OfType<MsgActionClip>().Where(clip => clip.autoJumpNext && !string.IsNullOrEmpty(clip.msg));
            IEnumerable<int> ids = clips.Select(clip => clip.blockId);
            Debug.LogWarning("自动跳转下一个 block: " + string.Join(", ", ids));
        }

        private static bool ContainsNonChinesePunctuation(string input)
        {
            const string pattern = @"[^A-Z\u4e00-\u9fa5\w\s，。？！、；·：“”‘’%（）《》……【】——\u002d]" + // 非法字符
                                   @"|([(—)]{3,}|[…]{3,})|——\u2026|(\u2026——)" + // ……—— 连用
                                   @"|(?<!\u2026)\u2026(?!\u2026)" + // 单独存在的…
                                   @"|，$" + // 逗号结尾
                                   @"|[\u8bf6]" + // 诶
                                   @"|！……|？……";

            bool match = Regex.IsMatch(input, pattern);
            return match;
        }

        private static string ReplaceText(string text)
        {
            // 确定的修改
            string replacedText = Regex.Replace(text,
                @"(?<!\u2026)\u2026(?!\u2026)|[「」诶~]|！……|？……",
                match => match.Value switch
                {
                    "\u2026" => "……",
                    "「" => "“",
                    "」" => "”",
                    "诶" => "哎",
                    "~" => "——",
                    "！……" => "！",
                    "？……" => "？",
                    _ => throw new NotImplementedException()
                });
            return replacedText;
        }

        /// <summary>
        /// setName 删除空白和重复
        /// </summary>
        /// <param name="timeline"></param>
        public static void RemoveNoneSetNameClips(TimelineAsset timeline)
        {
            var setNameTracks = TimelineInfo.GetTracks<SetNameActionTrack>(timeline);
            foreach (var track in setNameTracks)
            {
                // 删除空白

                var noneNameClips = track.GetClips().Where(c => ((SetNameActionClip)c.asset).setName == "");
                noneNameClips.ForEach(c => timeline.DeleteClip(c));

                // 
                var singleClips = track.GetClips().DistinctBy(c => ((SetNameActionClip)c.asset).setName);
                var exceptClips = track.GetClips().Except(singleClips);
                exceptClips.ForEach(a => timeline.DeleteClip(a));

                // 
                var names = track.GetClips().Select(c => ((SetNameActionClip)c.asset).setName);
                Debug.Log(string.Join(",", names));
            }

            TimelineEditor.Refresh(RefreshReason.ContentsModified);
        }

        /// <summary>
        /// 说话 向右移动0.1s，并检查
        /// </summary>
        /// <param name="timeline"></param>
        public static void MoveTalkClips(TimelineAsset timeline)
        {
            TimelineClip[] blockClips = TimelineInfo.GetClips<MsgActionTrack>(timeline);
            TimelineClip[] talkClips = TimelineInfo.GetClips<PlayerTalkActionTrack>(timeline);
            Debug.Log(timeline.name);
            foreach (TimelineClip clip in blockClips)
            {
                TimelineClip[] speakers = talkClips.Where(c =>
                    c.start > clip.start - 0.15d && c.end < clip.end + 0.65d).ToArray();
                speakers.ForEach(c => c.start = clip.start + 0.1d);

                if (clip.asset is not MsgActionClip blockAsset) return;
                var names = speakers.Select(t => t.GetParentTrack().parent.name).ToArray();
                if (speakers.Count() > 1)
                {
                    Debug.LogWarning($"block:{blockAsset.blockId} 多个说话者 [{string.Join(", ", names)}]");
                }

                if (!string.IsNullOrEmpty(blockAsset.msg))
                {
                    if (!speakers.Any())
                    {
                        Debug.LogWarning($"block:{blockAsset.blockId} 没有说话者");
                    }
                }
                else
                {
                    if (speakers.Any())
                    {
                        Debug.LogWarning($"block:{blockAsset.blockId} 无效的说话标签[{string.Join(", ", names)}]");
                    }
                }
            }

            TimelineEditor.Refresh(RefreshReason.ContentsModified);
            EditorUtility.SetDirty(timeline);
            AssetDatabase.SaveAssets();
        }

        /// <summary>
        /// 通用 检查丢失目标物体
        /// </summary>
        /// <param name="timeline"></param>
        public static void CheckCommon(TimelineAsset timeline)
        {
            Debug.Log("check common");
            TimelineClip[] commonClips = GetClips<CommonActionTrack>(timeline);
            foreach (TimelineClip cl in commonClips)
            {
                if (cl.asset is not CommonActionClip commonClip) return;
                if (commonClip.objFullPath != null)
                {
                    GameObject obj = GameObject.Find(commonClip.objFullPath);
                    if (!obj)
                    {
                        Debug.Log($"{timeline.name}, 位置: {cl.start}, obj: {commonClip.objFullPath}");
                    }
                }
                else
                {
                    Debug.LogWarning($"未指定: {cl.start}");
                }
            }

            var msgClips = GetClips<MsgActionTrack>(timeline);
            var eventClips = GetClips<SendEventActionTrack>(timeline);
            var disableClicks = eventClips.Where(e => ((SendEventActionClip)e.asset).eventKey == "DISABLE_CLICK")
                .ToArray();
            foreach (TimelineClip msg in msgClips)
            {
                var disableClick =
                    disableClicks.SingleOrDefault(d => d.start > msg.start - 0.2d && d.end < msg.end + 0.2d);
                if (disableClick == null) continue;
                if (msg.asset is not MsgActionClip msgAsset) return;
                if (Math.Abs(msg.start - disableClick.start) > 0.000000f)
                {
                    Debug.LogError($"错误位置: {msgAsset.blockId} {disableClick.start}");
                }

                if (msgAsset.autoJumpNext == false)
                {
                    Debug.LogError($"禁止点击需要设置跳转: {msgAsset.blockId}");
                }
            }
        }


        private struct MsgData
        {
            public int blockId;
            public string msg;
            public string[] extMsgArray;
            public bool autoJumpNext;
            public double start;
            public double duration;
        }

        /// <summary>
        /// 插入 block 
        /// </summary>
        /// <param name="timeline"></param>
        /// 
        public static void InsertBlock(TimelineAsset timeline)
        {
            var clips = TimelineInfo.GetClips<MsgActionTrack>(timeline);
            var selected = TimelineEditor.selectedClip;
            if (selected.asset is not MsgActionClip selectedAsset) return;
            // selected 之后的所有 clip
            var fromSelectedClips = clips.SkipWhile(c => ((MsgActionClip)c.asset).blockId <= selectedAsset.blockId)
                .ToArray();
            // selected 之后的所有 msg 数据
            var fromSelectedData = fromSelectedClips.Select(m => new MsgData
            {
                blockId = ((MsgActionClip)m.asset).blockId,
                msg = ((MsgActionClip)m.asset).msg,
                extMsgArray = ((MsgActionClip)m.asset).extMsgs,
                autoJumpNext = ((MsgActionClip)m.asset).autoJumpNext,
                start = m.start,
                duration = m.duration
            });

            // delete 后面的 clips
            fromSelectedClips.ForEach(a => timeline.DeleteClip(a));
            // set selected msg
            selected.duration -= 0.5d;
            selectedAsset.autoJumpNext = false;

            // 创建 insert block
            var track = TimelineInfo.GetTracks<MsgActionTrack>(timeline);
            var newClip = track[0].CreateClip<MsgActionClip>();
            if (newClip.asset is not MsgActionClip newClipAsset) return;
            newClip.start = selected.end;
            newClip.duration = 0.5d;
            newClipAsset.blockId = selectedAsset.blockId + 1;
            newClipAsset.autoJumpNext = true;

            // rebuild 
            foreach (var item in fromSelectedData)
            {
                var msg = track[0].CreateClip<MsgActionClip>();
                msg.start = item.start;
                msg.duration = item.duration;
                if (msg.asset is not MsgActionClip msgAsset) return;
                msgAsset.blockId = item.blockId + 1;
                msgAsset.msg = item.msg;
                msgAsset.extMsgs = item.extMsgArray;
                msgAsset.autoJumpNext = item.autoJumpNext;
            }

            TimelineEditor.Refresh(RefreshReason.ContentsModified);
            EditorUtility.SetDirty(timeline);
        }
    }
}