macroScript ResetTrans
category:"自定义工具"
tooltip:"RestTrans"
(
fn RestTrans objs=(
	sel = for i in objs collect(i)
	for obj in sel do(
		obj.position = [0,0,0]
		obj.rotation = quat 0 0 0 1
		obj.pivot = [0,0,0]
		)
	)
	
RestTrans selection
)
