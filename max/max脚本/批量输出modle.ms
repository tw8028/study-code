fn skinExport x=(
	sel = for i in x collect(i)
	for i in sel do(
		exportPath = maxFilePath + i.name
		select i
		pluginManager.loadClass FbxExporter
		FBXExporterSetParam "ResetExport"
		FBXExporterSetParam "Animation" false
		--FBXExporterSetParam "BakeAnimation" true
		exportFile exportPath #noPrompt selectedOnly:true using:FBXEXP
		)
	)	
skinExport selection