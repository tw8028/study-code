using UnityEditor;
using UnityEngine;
using CriWare;
using UnityEngine.UIElements;
using System.Linq;
using System.Collections.Generic;
using System;
using NPOI.SS.Formula.Functions;

namespace PersonBrowser
{
    public record Player
    {
        public string id;
        public Color color;
    }

    public class AudioBrowserWindow : EditorWindow
    {
        VisualElement voiceView;
        VisualElement soundView;
        VisualElement subView;

        IEnumerable<string> soundNames;
        IEnumerable<string> voiceNames;

        [MenuItem("Test/prefab工具/声音")]
        public static void ShowEditor()
        {
            var win = GetWindow<AudioBrowserWindow>("Audio Browser");
            win.minSize = new Vector2(900, 700);
        }
        public void CreateGUI()
        {
            if (!CriAtomPlugin.isInitialized)
            {
                CriAtomPlugin.InitializeLibrary();
            }
            CriAtomExAcb acbFile1 = CriAtomExAcb.LoadAcbFile(null, "Assets/AudioCPK/CueSheet_Sound.acb", null);
            var sound = acbFile1.GetCueInfoList();
            soundNames = sound.Select(a => a.name).Where(a => a.Split('_')[1] == "Skill");
            CriAtomExAcb acbFile2 = CriAtomExAcb.LoadAcbFile(null, "Assets/AudioCPK/CueSheet_VOICE.acb", null);
            var voice = acbFile2.GetCueInfoList();
            voiceNames = voice.Select(a => a.name);



            var players = CreatePlayers(voiceNames, soundNames);
            // 创建界面
            var view = new TwoPaneSplitView(0, 200, TwoPaneSplitViewOrientation.Horizontal);
            subView = new TwoPaneSplitView(0, 200, TwoPaneSplitViewOrientation.Horizontal);
            var personView = new ListView();
            voiceView = new VisualElement();
            soundView = new VisualElement();

            rootVisualElement.Add(view);
            view.Add(personView);
            view.Add(subView);
            subView.Add(voiceView);
            subView.Add(soundView);

            /*foreach (var id in greenIds)
            {
                Debug.Log(id);
            }*/

            personView.makeItem = () => new Label();
            personView.bindItem = (item, index) =>
            {
                (item as Label).text = players[index].id;
                (item as Label).style.color = players[index].color;
            };
            personView.itemsSource = players;
            personView.selectionChanged += OnIDSelectionChange;


        }
        private void OnIDSelectionChange(IEnumerable<object> selectedItems)
        {

            var selected = selectedItems.First() as Player;
            // Debug.Log(str);
            var voiceList = voiceNames.Where(a => a.Split('_')[1] == selected.id).ToList();
            var soundList = soundNames.Where(a => a.Split('_')[2] == selected.id).ToList();

            showSubView(voiceView, voiceList);
            showSubView(soundView, soundList);
        }
        private void showSubView(VisualElement view, List<string> cues)
        {
            view.Clear();
            TextElement text = new();
            view.Add(text);

            string result = string.Join(Environment.NewLine, cues);
            text.text = result;

        }

        public static List<Player> CreatePlayers(IEnumerable<string> voices, IEnumerable<string> sounds)
        {
            List<Player> players = new List<Player>();
            for (int i = 0; i < 110; i++)
            {
                Player player = new Player();
                player.id = $"{100001 + i}";
                bool hasVoice = voices.Any(name => name.Split('_')[1].Equals(player.id));
                bool hasSound = sounds.Any(name => name.Split('_')[2].Equals(player.id));

                player.color = Color.gray;
                if (hasVoice || hasSound)
                {
                    player.color = Color.blue;
                }
                if (hasVoice && hasSound)
                {
                    player.color = Color.green;
                }

                players.Add(player);
            }
            return players;
        }
    }
}