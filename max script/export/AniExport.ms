macroscript AniExport
category:"custom tools"
tooltip:"Ani_Export"
(
fn AniExport x=(
	sel = selection
	local Alist=#()
	local Blist=#()
	bones = ""
	for item in sel do(
		if findItem Alist item.name==0 then append Alist item.name else append Blist item.name
		)
	for item in Blist do(
		bones = bones + " " + item
		)
	if Blist.count !=0 then throw bones
		
	--find nub bone then deselect it
	--for item in sel do( 
	--	if findString item.name "Nub"!=undefined then deselect item
	--	)
	$Root.boneEnable = true	
	exportPath = maxFilePath + getFilenameFile maxFileName + ".fbx"
	pluginManager.loadClass FbxExporter
	FBXExporterSetParam "ResetExport"
	--FBXExporterSetParam "Animation" false
	FBXExporterSetParam "BakeAnimation" true
	exportFile exportPath #noPrompt selectedOnly:true using:FBXEXP	
	)	
AniExport x
)