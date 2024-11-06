macroscript SkinExport
category:"custom tools"
tooltip:"Skin_Export"
(
fn SkinExport x=(
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
	
	if findString (getFilenameFile maxFileName) " "!=undefined then throw "文件名有空格"
	
	--find nub bone then deselect it
	--for item in sel do( 
	--	if findString item.name "Nub"!=undefined then deselect item
	--	)
	maxName = getFilenameFile maxFileName
	-- fbxName = substituteString maxName "_skin" "" --remove _skin
	fbxName = (FilterString maxName "_")[1]
	exportPath = maxFilePath + fbxName + ".fbx"
	
	pluginManager.loadClass FbxExporter
	FBXExporterSetParam "ResetExport"
	FBXExporterSetParam "Animation" false
	FBXExporterSetParam "Triangulate" true
	--FBXExporterSetParam "BakeAnimation" true
	exportFile exportPath #noPrompt selectedOnly:true using:FBXEXP	
	)	
SkinExport x
)