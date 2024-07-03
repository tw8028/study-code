macroscript MeshesExport
category:"�Զ��幤��"
tooltip:"MeshesExport"
(
fn MeshesExport meshes=(
	sel = for i in meshes collect(i)
	for i in sel do(
		exportPath = maxFilePath + i.name +".fbx"							
		--����������
		i.material.name = i.name + "_a"
		--ѡ��ģ��
		select i	
		--���
		
		pluginManager.loadClass FbxExporter
		FBXExporterSetParam "ResetExport"
		FBXExporterSetParam "Animation" false
		--FBXExporterSetParam "BakeAnimation" true
		exportFile exportPath #noPrompt selectedOnly:true using:FBXEXP
		)
	)
	
MeshesExport selection
)
--����ǰ���浱ǰ����