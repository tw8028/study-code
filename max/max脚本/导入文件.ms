macroscript importFBX
category:"自定义工具"
tooltip:"导入fbx"
(
fn import x=(
	files = getFiles "D:\\Art_local\\汇丰1期\\Import\\*.fbx"
	for i in files do(
		importFile i #noPrompt using:maxclass
		)
	)
import x
)