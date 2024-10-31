macroscript NLD_ResetGunPivot
category:"自定义工具"
tooltip:"NLD_调整GunPivot"
(
	fn isSelectOne = (
		if selection.count ==1 then return true else 
			( 
				print "选择一个物体，不要多选"
				return false
			)
		)
		
	rollout ResetGunPivotWindow "调整GunPivot"
	(
		button btn0 "检查缩放" width:100 height:30
		label textField "scale：" width:200 height:30
		
		button btn1 "rotate x -90" width:100 height:30
		button btn2 "pivot 位置旋转归零" width:100 height:30
		button btn3 "创建 Fire 挂点" width:100 height:30
		
		
		
		on btn0 pressed do
		(
			if isSelectOne() then
			(
				local m_scale =  $.scale as string
				textField.text = "scale: " + m_scale
			)
		)
		
		on btn1 pressed do
		(
			if isSelectOne() then
			(
				rotate $ (angleaxis -90 [1,0,0])
			)
		)
		
		on btn2 pressed do
		(
			if isSelectOne() then
			(
				$.pivot = [0,0,0]
				WorldAlignPivot $
			)
		)
		
		on btn3 pressed do
		(
			if isSelectOne() then
			(
				gun = $
				fire = Point pos:[0,0,60] size:20
				fire.parent = gun
				fire.name = "Fire"
			)
		)
	)
	createDialog ResetGunPivotWindow 300 250	
)