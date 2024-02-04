macroscript aniExp
category:"自定义工具"
tooltip:"aniExport"
(
fn aniExport x=(
	files = getFiles @"D:\\Art_local\\动作\\Export\\Ani\\*.max"
	--文件放入输出文件夹
	for i in files do(
		loadMaxFile i quite:true useFileUnits:true allowPrompts:false
		select #($Bip001, $Bip001_Head, $Bip001_L_Calf, 
			$Bip001_L_Clavicle, $Bip001_L_Finger0, $Bip001_L_Finger01,
			$Bip001_L_Finger1, $Bip001_L_Finger02, $Bip001_L_Finger2,
			$Bip001_L_Finger3, $Bip001_L_Finger4, $Bip001_L_Finger11,
			$Bip001_L_Finger12, $Bip001_L_Finger21, $Bip001_L_Finger22,
			$Bip001_L_Finger31, $Bip001_L_Finger32, $Bip001_L_Finger41,
			$Bip001_L_Finger42, $Bip001_L_Foot, $Bip001_L_Forearm,
			$Bip001_L_ForeTwist, $Bip001_L_Hand, $Bip001_L_Thigh, 
			$Bip001_L_Toe0, $Bip001_L_UpperArm, $Bip001_Neck,
			$Bip001_Pelvis, $Bip001_R_Calf, $Bip001_R_Clavicle,
			$Bip001_R_Finger0, $Bip001_R_Finger01, $Bip001_R_Finger1,
			$Bip001_R_Finger02, $Bip001_R_Finger2, $Bip001_R_Finger3, 
			$Bip001_R_Finger4, $Bip001_R_Finger11, $Bip001_R_Finger12,
			$Bip001_R_Finger21, $Bip001_R_Finger22, $Bip001_R_Finger31,
			$Bip001_R_Finger32, $Bip001_R_Finger41, $Bip001_R_Finger42, 
			$Bip001_R_Foot, $Bip001_R_Forearm, $Bip001_R_ForeTwist,
			$Bip001_R_Hand, $Bip001_R_Thigh, $Bip001_R_Toe0,
			$Bip001_R_UpperArm, $Bip001_Spine, $Bip001_Spine1, $Bip001_Spine2)
		selectmore #($HF_Body_all,$HF_Head)
		exportPath = @"D:\\Art_local\\动作\\Export\\Ani\\fbx\\"+ getFilenameFile maxFileName
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