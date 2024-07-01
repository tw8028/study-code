macroscript MeshesExport
category:"自定义工具"
tooltip:"MeshesExport"
(
fn MeshesExport meshes=(
	sel = for i in meshes collect(i)
	for i in sel do(
		exportPath = maxFilePath + i.name +".fbx"							
		--重命名材质
		i.material.name = i.name + "_a"
		--选择模型
		select i	
		--输出
		
		pluginManager.loadClass FbxExporter
		FBXExporterSetParam "ResetExport"
		FBXExporterSetParam "Animation" false
		--FBXExporterSetParam "BakeAnimation" true
		exportFile exportPath #noPrompt selectedOnly:true using:FBXEXP
		)
	)
	
MeshesExport selection
)
--运行前保存当前场景