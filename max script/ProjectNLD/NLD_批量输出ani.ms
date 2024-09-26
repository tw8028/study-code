macroscript NLD_ExpAni
category:"自定义工具"
tooltip:"NLD_输出ani"
(
fn aniExport x=(
	files = getFiles @"E:\project_A\03_动作\角色技能\max\A00008*.max"
	--文件放入输出文件夹
	for i in files do(
		loadMaxFile i quite:true useFileUnits:true missingExtFilesAction:#logmsg missingDLLsAction:#logmsg skipXRefs:true
		frameRate = 30
		
		select $Bip001*			
		selectmore #($Root,$Grip_point01,$Grip_point02,$Mount_point01,$Mount_point02,$Mount_point03,$Mount_point04,$Mount_point05)
		sel = selection
		for item in sel do
			( 
			if findString item.name "Nub"!=undefined then deselect item
			if findString item.name "Footsteps"!=undefined then deselect item
			)
		
		exportPath = "E:/project_A/03_动作/角色技能/export/"+ getFilenameFile maxFileName+ ".fbx"
		--提前建好文件夹
		pluginManager.loadClass FbxExporter
		FBXExporterSetParam "ResetExport"
		FBXExporterSetParam "BakeAnimation" true
		exportFile exportPath #noPrompt selectedOnly:true using:FBXEXP
		)
	--max reset file
	)	
aniExport x
)
--运行前保存当前场景