macroscript aniExp
category:"自定义工具"
tooltip:"aniExport"
(
fn ExportSel x=(
	sel = selection
	for i in sel do(
		i.name = substituteString i.name " " "_"
	)
	exportPath = maxFilePath + getFilenameFile maxFileName + ".fbx"
	pluginManager.loadClass FbxExporter
	FBXExporterSetParam "ResetExport"
	--FBXExporterSetParam "Animation" false
	FBXExporterSetParam "BakeAnimation" true
	exportFile exportPath #noPrompt selectedOnly:true using:FBXEXP
	--max reset file
	)	
ExportSel x
)
--运行前保存当前场景