fn skinExport x=(
	files = getFiles @"D:\\export\*.max"
	--文件放入临时输出文件夹
	for i in files do(
		loadMaxFile i quite:true useFileUnits:true allowPrompts:false
		select selectionSets["ani"]
		--设置选择集
		exportPath = @"D:\\export\\skin\\"+ getFilenameFile maxFileName
		--提前建好文件夹
		pluginManager.loadClass FbxExporter
		FBXExporterSetParam "ResetExport"
		FBXExporterSetParam "Animation" false
		exportFile exportPath #noPrompt selectedOnly:true using:FBXEXP
		)
	max reset file
	)	
skinExport x
--运行前保存当前场景