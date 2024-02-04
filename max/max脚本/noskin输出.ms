macroscript meshesExport
category:"自定义工具"
tooltip:"meshesExport"
(
fn meshesExport meshes=(
	sel = for i in meshes collect(i)
	for i in sel do(
		exportPath = maxFilePath + i.name +".fbx"		
		--选择模型
		select i				
		--重命名材质
		i.material.name = i.name + "_a"
		--输出
		
		pluginManager.loadClass FbxExporter
		FBXExporterSetParam "ResetExport"
		FBXExporterSetParam "Animation" false
		--FBXExporterSetParam "BakeAnimation" true
		exportFile exportPath #noPrompt selectedOnly:true using:FBXEXP
		)
	)	
meshesExport selection
)
--运行前保存当前场景