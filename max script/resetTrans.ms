macroScript ResetTrans
category:"�Զ��幤��"
tooltip:"RestTrans"
(
fn RestTrans objs=(
	sel = for i in objs collect(i)
	for obj in sel do(
		obj.position = [0,0,0]
		obj.rotation = quat 0 0 0 1
		)
	)
	
RestTrans selection
)