macroscript NLD_BatchExporter
category:"自定义工具"
tooltip:"NLD_批量输出Fbx"
(
	fn gunExportor =
	(	
		local files = getfiles @"E:\project_A\03_动作\skin_gun\*.max" recurse:true -- 搜索子文件夹
		local exportFolder = @"E:\project_A\03_动作\skin_gun\_fbx"
		
		for maxfile in files do
		(
			loadMaxFile maxfile quiet:true
			
			root = Point name:"G_Root"
			$Fire.parent = root
			root.boneEnable = true	
			select $G_G00*
			modPanel.addModToSelection (Skin ()) ui:on
			skinOps.addBone $.modifiers[#Skin] root -1
			
			selectmore #($Fire, root)
			
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
		
		lc = Link_Constraint()
		trans = $Grip_point01.transform
		$Grip_point01.transform.controller = lc
		lc.addTarget $'Bip001 R Hand' 0  
		$Grip_point01.transform = trans
		
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
		
		exportPath = exportFolder + getFilenameFile maxFileName + ".fbx"
		--exportPath = exportFolder + getFilenameFile maxFileName + ".fbx"
		-- 提前建好文件夹
		-- pluginManager.loadClass FbxExporter
		FBXExporterSetParam "ResetExport"
		FBXExporterSetParam "BakeAnimation" true
		exportFile exportPath #noPrompt selectedOnly:true using:FBXEXP
		resetMaxFile #noPrompt
	)
	
	
	fn skillExporter =
	(
		local files = getFiles @"E:\project_A\03_动作\ani_Skill_player\*.max" recurse:true
		local exportFolder = @"E:\project_A\03_动作\ani_Skill_player"
		
		for maxfile in files do
		(
			loadMaxFile maxfile quite:true #noPrompt
			exportAni exportFolder
		)
	)
	
	
	fn readyExporter =
	(
		local files = getFiles @"E:/动作改版/特定场景用动画/小队预览动画/*.max" recurse:true
		local exportFolder = @"E:/动作改版/特定场景用动画/小队预览动画/fbx/"
		
		for maxfile in files do
		(
			loadMaxFile maxfile quite:true
			exportAni exportFolder
		)
	)
	
	fn victoryExporter =
	(
		local files = getFiles @"E:/动作改版/特定场景用动画/胜利结算动画/*.max" recurse:true
		local exportFolder = @"E:/动作改版/特定场景用动画/胜利结算动画/fbx/"
		
		for maxfile in files do
		(
			loadMaxFile maxfile quite:true
			exportAni exportFolder
		)
	)
	
	fn storyExporter =
	(
		local files = getFiles @"E:/动作改版/剧情动画/*.max" recurse:true
		local exportFolder = @"E:/动作改版/剧情动画/fbx/"
		
		for maxfile in files do
		(
			loadMaxFile maxfile quite:true
			
			$Root.boneEnable = true	
			select #($Root, $Bip001, 
			$'Bip001 Pelvis', $'Bip001 Spine', $'Bip001 Spine1', 
			$'Bip001 Neck', $'Bip001 Head', $'Bip001 HeadNub',
			$'Bip001 L Clavicle', $'Bip001 L UpperArm', $'Bip001 L Forearm', $'Bip001 L Hand', 
			$'Bip001 L Finger0', $'Bip001 L Finger01', 
			$'Bip001 L Finger1', $'Bip001 L Finger11', 
			$'Bip001 L Finger2', $'Bip001 L Finger21',  
			$'Bip001 R Clavicle', $'Bip001 R UpperArm', $'Bip001 R Forearm', $'Bip001 R Hand', 
			$'Bip001 R Finger0', $'Bip001 R Finger01', 
			$'Bip001 R Finger1', $'Bip001 R Finger11', 
			$'Bip001 R Finger2', $'Bip001 R Finger21', 			
			$'Bip001 L Thigh', $'Bip001 L Calf', $'Bip001 L Foot', $'Bip001 L Toe0', 
			$'Bip001 R Thigh', $'Bip001 R Calf', $'Bip001 R Foot', $'Bip001 R Toe0')
			
			fileName = getFilenameFile maxFileName
			-- newName = substituteString fileName "_a001" ""
			exportPath = exportFolder + fileName + ".fbx"
			FBXExporterSetParam "ResetExport"
			FBXExporterSetParam "BakeAnimation" true
			exportFile exportPath #noPrompt selectedOnly:true using:FBXEXP
		)
	)
	
	fn skinExporter =
	(
		delete $'粒子视图*'
		$Root.boneEnable = true	
		
		$Mount_point01.pos = [0, 8.8, 54]
		
		
		-- select bones and model
		select #($'Bip001 L Finger0Nub', $'Bip001 L Finger1Nub', $'Bip001 L Finger2Nub',  $'Bip001 L Toe0Nub',
		$'Bip001 R Finger0Nub', $'Bip001 R Finger1Nub', $'Bip001 R Finger2Nub', $'Bip001 R Toe0Nub', $'Bip001 Footsteps')
		freeze $
		select (for obj in objects where not obj.isHidden and not obj.isFrozen collect obj)
	
		-- check bones name
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
			
		-- check file name
		if findString (getFilenameFile maxFileName) " "!=undefined then throw "文件名有空格"
		
		-- export setting
		maxName = getFilenameFile maxFileName
		fbxName = (FilterString maxName "_")[1]
		exportPath = @"E:\project_A\03_动作\skin_Character\_fbx\" + fbxName + ".fbx"
		
		pluginManager.loadClass FbxExporter
		FBXExporterSetParam "ResetExport"
		FBXExporterSetParam "Animation" false
		FBXExporterSetParam "Triangulate" true
		exportFile exportPath #noPrompt selectedOnly:true using:FBXEXP	
		print "done"
	)	
		
	
	
	rollout exportWindow "批量输出"
	(
		button btn1 "Guns" width:100 height:30
		button btn2 "Animation" width:100 height:30
		button btn3 "Skills" width:100 height:30
		button btn4 "display anim" width:100 height:30
		button btn5 "victory anim" width:100 height:30
		button btn6 "story anim" width:100 height:30
		button btn7 "skin" width:100 height:30
		
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
		on btn4 pressed do
		(
			readyExporter()
		)
		on btn5 pressed do
		(
			victoryExporter()
		)
		on btn6 pressed do
		(
			storyExporter()
		)
		
		on btn7 pressed do
		(
			skinExporter()
		)
	)
	createDialog exportWindow 200 250	
)








