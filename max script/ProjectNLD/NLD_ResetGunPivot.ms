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
		
		label label_1 "" width:100 height:10
		button btn4 "重建武器挂点" width:100 height:30
		
		
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
		
		on btn4 pressed do
		(
			w_bone =  $Weapon*Bone001[1] --使用通配符返回数组获取武器骨骼
			w_point = $Grip_point01
			if w_bone == undefined or w_point == undefined then print "没有武器骨骼或挂点" else
			(
				w_point.name = "old_point"
				new_point = Point name:"Grip_point01" parent:$'Bip001 R Hand'
				
				-- 创建offset，用于约束新的武器挂点
				offset = Point name:"offset" cross:off Box:on
				offset.transform = w_bone.transform
				pos_offset = offset.position
				currentRotation = offset.rotation
				rotationY = angleaxis 90 [0, 1, 0]
				newRotation = currentRotation * rotationY
				offset.rotation = newRotation
				offset.position = pos_offset
				link offset w_bone
				
				-- new point 约束到 offset
				pos_con = Position_Constraint()
				addnode pos_con new_point
				addtarget pos_con offset 1.0
			) 
		)
	)
	createDialog ResetGunPivotWindow 300 250	
)