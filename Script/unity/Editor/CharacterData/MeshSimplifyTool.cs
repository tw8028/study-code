using UltimateGameTools.MeshSimplifier;
using UnityEditor;
using UnityEngine;

namespace Art.temp.Editor.CharacterData
{
    public static class MeshSimplyTool
    {
        static int s_nLastProgress = -1;
        static string s_strLastTitle = "";
        static string s_strLastMessage = "";

        static void Progress(string strTitle, string strMessage, float fT)
        {
            int nPercent = Mathf.RoundToInt(fT * 100.0f);

            if (nPercent != s_nLastProgress || s_strLastTitle != strTitle || s_strLastMessage != strMessage)
            {
                s_strLastTitle = strTitle;
                s_strLastMessage = strMessage;
                s_nLastProgress = nPercent;

                /*if (EditorUtility.DisplayCancelableProgressBar(strTitle, strMessage, fT))
                {
                    Simplifier.Cancelled = true;
                }*/
            }
        }

        public static void Create(MeshSimplify simplify)
        {
            simplify.ComputeData(simplify.m_meshSimplifyRoot == null, Progress);
            simplify.ComputeMesh(simplify.m_meshSimplifyRoot == null, Progress);
            simplify.AssignSimplifiedMesh(simplify.m_meshSimplifyRoot == null);
            SaveMeshAssets(simplify);
        }

        private static void SaveMeshAssets(MeshSimplify meshSimplify)
        {
            GameObject gameObject = meshSimplify.gameObject;

            if (meshSimplify.m_meshSimplifyRoot == null && meshSimplify.m_bEnablePrefabUsage)
            {
                string strMeshAssetPath = meshSimplify.m_strAssetPath;

                if (string.IsNullOrEmpty(strMeshAssetPath))
                {
                    //Debug.Log("Showing file selection panel");

                    strMeshAssetPath = UnityEditor.EditorUtility.SaveFilePanelInProject("Save mesh asset(s)",
                        "mesh_" + gameObject.name + gameObject.GetInstanceID().ToString() + ".asset", "asset",
                        "Please enter a file name to save the mesh asset(s) to");

                    if (strMeshAssetPath.Length == 0)
                    {
                        //Debug.LogWarning("strMeshAssetPath.Length == 0. User cancelled?");
                        return;
                    }

                    //Debug.Log("User selected " + strMeshAssetPath + " using panel.");

                    meshSimplify.m_strAssetPath = strMeshAssetPath;
                }

                int nCounter = 0;

                //Debug.Log("Saving files to " + strMeshAssetPath + ". Exists previously?: " + System.IO.File.Exists(strMeshAssetPath));
                SaveMeshAssetsRecursive(gameObject, gameObject, strMeshAssetPath, true,
                    System.IO.File.Exists(strMeshAssetPath), ref nCounter);
            }
        }

        static bool SaveMeshAssetsRecursive(GameObject root, GameObject gameObject, string strFile,
            bool bRecurseIntoChildren,
            bool bAssetAlreadyCreated, ref int nProgressElementsCounter)
        {
            if (gameObject == null)
            {
                return bAssetAlreadyCreated;
            }

            MeshSimplify meshSimplify = gameObject.GetComponent<MeshSimplify>();

            if (meshSimplify != null && meshSimplify.HasData() && (meshSimplify.m_meshSimplifyRoot == null ||
                                                                   meshSimplify.m_meshSimplifyRoot.gameObject == root))
            {
                int nTotalProgressElements = meshSimplify.m_meshSimplifyRoot != null
                    ? (meshSimplify.m_meshSimplifyRoot.m_listDependentChildren.Count + 1)
                    : 1;

                if (meshSimplify.m_simplifiedMesh != null && MeshSimplify.HasValidMeshData(meshSimplify.gameObject))
                {
                    float fT = (float)nProgressElementsCounter / (float)nTotalProgressElements;
                    Progress("Saving meshes to asset file", meshSimplify.name, fT);

                    if (Simplifier.Cancelled)
                    {
                        return bAssetAlreadyCreated;
                    }

                    if (bAssetAlreadyCreated == false &&
                        UnityEditor.AssetDatabase.Contains(meshSimplify.m_simplifiedMesh) == false)
                    {
                        //Debug.Log("Creating asset " + meshSimplify.m_simplifiedMesh.name);

                        UnityEditor.AssetDatabase.CreateAsset(meshSimplify.m_simplifiedMesh, strFile);
                        bAssetAlreadyCreated = true;
                    }
                    else
                    {
                        if (UnityEditor.AssetDatabase.Contains(meshSimplify.m_simplifiedMesh) == false)
                        {
                            //Debug.Log("Adding asset " + meshSimplify.m_simplifiedMesh.name);

                            UnityEditor.AssetDatabase.AddObjectToAsset(meshSimplify.m_simplifiedMesh, strFile);
                            UnityEditor.AssetDatabase.ImportAsset(
                                UnityEditor.AssetDatabase.GetAssetPath(meshSimplify.m_simplifiedMesh));
                        }
                    }

                    nProgressElementsCounter++;
                }
            }

            return bAssetAlreadyCreated;
        }
    }
}