macroscript NLD_ExpAni
category:"自定义工具"
tooltip:"NLD_批量输出biped角色动画"
(
fn aniExport x=(
	files = getFiles @"E:\project_A\03_动作\角色技能\max\A00008*.max"
	--文件放入输出文件夹
	for i in files do(
		loadMaxFile i quite:true useFileUnits:true missingExtFilesAction:#logmsg missingDLLsAction:#logmsg skipXRefs:true
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
		
		sel = selection
	
		--for item in sel do
			--( 
			--if findString item.name "Nub"!=undefined then deselect item
			--if findString item.name "Footsteps"!=undefined then deselect item
			--)
		
	
			
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