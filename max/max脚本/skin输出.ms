macroscript skinExport
category:"自定义工具"
tooltip:"skinExport"
(
fn skinExport x=(
	sel = for i in x collect(i)
	for i in sel do(
		exportPath = maxFilePath + i.name +".fbx"
		envPath = maxFilePath + @"/env"
		makeDir envPath
		envFile = envPath + "//"+i.name + ".env"
		--选择模型
		select i
		--保存封套
		skinOps.saveEnvelope $.modifiers[#Skin] envFile
		--重命名材质
		i.material.name = i.name + "_a"
		--输出
		selectmore #($Bip001, $Bip001_Head, $Bip001_L_Calf, 
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
		pluginManager.loadClass FbxExporter
		FBXExporterSetParam "ResetExport"
		FBXExporterSetParam "Animation" false
		--FBXExporterSetParam "BakeAnimation" true
		exportFile exportPath #noPrompt selectedOnly:true using:FBXEXP
		)
	)	
skinExport selection
)
--运行前保存当前场景