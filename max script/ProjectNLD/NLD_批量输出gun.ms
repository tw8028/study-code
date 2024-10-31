macroscript NLD_ExpGun
category:"自定义工具"
tooltip:"NLD_批量输出武器"
(
fn gunExport files=(	
	for file in files do(
		loadMaxFile file 
		
		select $G_G00*
		selectmore $Fire
		
		maxName = getFilenameFile maxFileName
		exportPath =  "E:/动作改版/Guns（标准）/_fbx/"+ maxName + ".fbx"
		
		pluginManager.loadClass FbxExporter
		FBXExporterSetParam "ResetExport"
		FBXExporterSetParam "Animation" false
		FBXExporterSetParam "Triangulate" true
		
		exportFile exportPath #noPrompt selectedOnly:true using:FBXEXP	
		)
	)	

	rollout exportGunWindow "批量输出武器"
	(
		local filePath = "E:/动作改版/Guns（标准）/"
		
		button btn1 "export all" width:100 height:30
		
		on btn1 pressed do 
		(
			maxfile = "E:/动作改版/Guns（标准）/*_sg.max"
			-- recurse 搜索子文件夹
			files = getFiles maxfile recurse:true
			gunExport files
		)
	
	)
	createDialog exportGunWindow 180 250	
)