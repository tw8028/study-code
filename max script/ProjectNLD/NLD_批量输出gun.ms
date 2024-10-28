macroscript NLD_ExpGun
category:"自定义工具"
tooltip:"NLD_批量输出武器"
(
fn gunExport files=(	
	for file in files do(
		loadMaxFile file quite:true useFileUnits:true missingExtFilesAction:#logmsg missingDLLsAction:#logmsg skipXRefs:true
		
		select $G_G00*
		skinMod = $.modifiers[#Skin]
		if skinMod != undefined then (deleteModifier $ 1)
		WorldAlignPivot $
		$.pivot = [0,0,0]
		
		maxName = getFilenameFile maxFileName
		fbxName = substituteString maxName "_skin" "" --remove _skin
		exportPath = maxFilePath + "fbx/"+ fbxName + ".fbx"
		
		pluginManager.loadClass FbxExporter
		FBXExporterSetParam "ResetExport"
		FBXExporterSetParam "Animation" false
		FBXExporterSetParam "Triangulate" true
		
		exportFile exportPath #noPrompt selectedOnly:true using:FBXEXP	
		)
	)	


	rollout exportGunWindow "批量输出武器"
	(
		local filePath = "E:/动作改版/武器/"
		
		button btn1 "G03 半自动（栓动）步枪" width:100 height:30
		button btn2 "G02 狙击步枪" width:100 height:30
		
		button btn3 "G01 突击步枪" width:100 height:30	
		button btn4 "G05 冲锋枪" width:100 height:30
		button btn5 "G08 轻机枪" width:100 height:30
		
		on btn1 pressed do -- G03半自动
		(
			skinfile = filePath + "步枪_bar/*_bar_skin.max"
			files = getFiles skinfile recurse:true
			gunExport files
		)
		on btn2 pressed do -- G02狙击步枪
		(
			skinfile = filePath + "狙击步枪_dmr/*_dmr_skin.max"
			files = getFiles skinfile recurse:true
			gunExport files
		)
		on btn3 pressed do -- G01突击步枪
		(
			skinfile = filePath + "突击步枪_ar/*_ar_skin.max"
			files = getFiles skinfile recurse:true
			gunExport files
		)
		on btn4 pressed do -- G05冲锋枪
		(
			skinfile = filePath + "冲锋枪_sg/*_sg_skin.max"
			files = getFiles skinfile recurse:true
			gunExport files
		)
		on btn5 pressed do -- G08轻机枪
		(
			skinfile = filePath + "轻机枪_lmg/*_lmg_skin.max"
			files = getFiles skinfile recurse:true
			gunExport files
		)
	)
	createDialog exportGunWindow 180 250	
)