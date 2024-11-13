macroscript NLD_BatchExporter
category:"自定义工具"
tooltip:"NLD_批量输出Fbx"
(
	fn gunExportor =
	(	
		local files = getfiles @"E:/动作改版/Guns（标准）/*.max" recurse:true -- 搜索子文件夹
		local exportFolder = @"E:/动作改版/Guns（标准）/_fbx/"
		
		for maxfile in files do
		(
			loadMaxFile maxfile quiet:true
			select $G_G00*
			selectmore $Fire
			
			pluginManager.loadClass FbxExporter
			FBXExporterSetParam "ResetExport"
			FBXExporterSetParam "Animation" false
			FBXExporterSetParam "Triangulate" true
			
			exportPath = exportFolder + getFilenameFile maxFileName + ".fbx"
			exportFile exportPath #noPrompt selectedOnly:true using:FBXEXP	
		)
	)	
	
	
	fn exportAni exportFolder = 
	(
		frameRate = 30
		$Root.boneEnable = true	
		select #($Root, $Bip001, 
		$'Bip001 Pelvis', $'Bip001 Spine', $'Bip001 Spine1', 
		$'Bip001 Neck', $'Bip001 Head', $'Bip001 HeadNub',
		$'Bip001 L Clavicle', $'Bip001 L UpperArm', $'Bip001 L Forearm', $'Bip001 L Hand', 
		$'Bip001 L Finger0', $'Bip001 L Finger01', 
		$'Bip001 L Finger1', $'Bip001 L Finger11', 
		$'Bip001 L Finger2', $'Bip001 L Finger21', $Grip_point02, 
		$'Bip001 R Clavicle', $'Bip001 R UpperArm', $'Bip001 R Forearm', 
		$'Bip001 R Hand', 
		$'Bip001 R Finger0', $'Bip001 R Finger01', 
		$'Bip001 R Finger1', $'Bip001 R Finger11', 
		$'Bip001 R Finger2', $'Bip001 R Finger21', 
		$Grip_point01, 
		$'Bip001 L Thigh', $'Bip001 L Calf', $'Bip001 L Foot', $'Bip001 L Toe0', 
		$'Bip001 R Thigh', $'Bip001 R Calf', $'Bip001 R Foot', $'Bip001 R Toe0')
		
		exportPath = exportFolder + "ani_" + getFilenameFile maxFileName + ".fbx"
		--exportPath = exportFolder + getFilenameFile maxFileName + ".fbx"
		-- 提前建好文件夹
		-- pluginManager.loadClass FbxExporter
		FBXExporterSetParam "ResetExport"
		FBXExporterSetParam "BakeAnimation" true
		exportFile exportPath #noPrompt selectedOnly:true using:FBXEXP
	)
	
	
	fn skillExporter =
	(
		local files = getFiles @"E:/动作改版/Skill_player/A00010*.max" recurse:true
		local exportFolder = @"E:/动作改版/Skill_player/fbx/"
		
		for maxfile in files do
		(
			loadMaxFile maxfile quite:true
			exportAni exportFolder
		)
	)
	
	rollout exportWindow "批量输出"
	(
		button btn1 "Guns" width:100 height:30
		button btn2 "Animation" width:100 height:30
		button btn3 "Skills" width:100 height:30
		
		on btn1 pressed do 
		(
			gunExportor()
		)
		on btn2 pressed do 
		(
			exportAni maxFilePath
		)
		on btn3 pressed do 
		(
			skillExporter()
		)	
	)
	createDialog exportWindow 200 250	
)








