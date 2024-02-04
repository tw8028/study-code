macroscript AnimationExport
category:"自定义工具"
tooltip:"AnimationExport"
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
	
	)	
ExportSel x
)
--运行前保存当前场景