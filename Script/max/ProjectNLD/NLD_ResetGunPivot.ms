macroscript NLD_ResetGunPivot
category:"自定义工具"
tooltip:"NLD_调整GunPivot"
(
	global pointTransform
	
	fn isSelectOne = (
		if selection.count ==1 then return true else 
			( 
				print "选择一个物体，不要多选"
				messageBox "请选择一个物体，不要多选！" title:"提示"
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
		button btn7 "创建 gun root"  width:100 height:30
		button btn8 "创建 bag root"  width:100 height:30
		
		label label_1 "" width:100 height:10
		button btn4 "重建武器挂点" width:100 height:30
		button btn4_1 "解除挂点约束" width:100 height:30
		button btn9 "unity pivot" width:100 height:30
		 
		
		label label_3 "" width:100 height:20
		label label_2 "复制粘贴transform" width:100 height:20
		button btn5 "复制" width:100 height:30
		button btn6 "粘贴" width:100 height:30
		
		
		label label_4 "" width:100 height:20
		label label_5 "炮台" width:100 height:20
		button btn10 "添加 Fire_skill" width:100 height:20
		
		
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
			w_bone =  $'Weapon*Bone001'[1] --使用通配符返回数组获取武器骨骼
			old_point = $Grip_point01
			if w_bone == undefined or old_point == undefined then print "没有武器骨骼或挂点" else
			(
				old_point.name = "old_point"
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
				
				-- link offset 到武器骨骼 
				lc = Link_Constraint()
				offset.transform.controller = lc
				lc.addTarget w_bone 0  --在0帧
				
				-- 位置约束新挂点到 offset
				pos_constraint = Position_Constraint()
				new_point.pos.controller = pos_constraint
				pos_constraint.constraints.appendTarget offset 50.0
				
				-- 方向约束新挂点到 offset
				ro_constraint = Orientation_Constraint()
				new_point.rotation.controller = ro_constraint
				ro_constraint.constraints.appendTarget offset 50.0
				
			) 
		)
		on btn4_1 pressed do
		(
			obj = $Grip_point01
			trans = obj.transform
			obj.pos.controller = Position_XYZ()
			obj.rotation.controller = Euler_XYZ()
			obj.transform = trans
		)
		
		
		on btn5 pressed do
		(
			if isSelectOne() then
			(
				::pointTransform =  $.transform
			)
		)
		on btn6 pressed do
		(
			if isSelectOne() then
			(
				$.transform = ::pointTransform
			)
		)	
		
		on btn7 pressed do
		(
			root = Point name:"G_Root"
			$Fire.parent = root
			$G_Root.boneEnable = true	
			select $G_G00*
			modPanel.addModToSelection (Skin ()) ui:on
			skinOps.addBone $.modifiers[#Skin] $G_Root -1
		)	
		on btn8 pressed do
		(
			root = Point name:"B_Root"
			$B_Root.boneEnable = true	
			select $G_B00*
			modPanel.addModToSelection (Skin ()) ui:on
			skinOps.addBone $.modifiers[#Skin] $B_Root -1
		)	
		on btn9 pressed do
		(
			if isSelectOne() then
			(
				-- 提取平移变换，结果与 $.pos 一样
				local pos = $.transform.translation
				-- 创建一个新的变换矩阵，使 x 轴与世界坐标的 x 轴一致，y 轴与世界坐标的 z 轴一致
				local newTransform = matrix3 [1, 0, 0] [0, 0, 1] [0, -1, 0] [0, 0, 0]
				-- 矩阵变换后，位置归零
				$.transform = newTransform
				-- 恢复位置
				$.pos = pos
			)
		)
		on btn10 pressed do
		(
			if isSelectOne() then
			(
				local pos = $.transform
				fire_skill = Point size:20
				fire_skill.transform = pos
				fire_skill.parent = $.parent
				fire_skill.name="Fire_skill"
			)
		)
	)
	createDialog ResetGunPivotWindow 270 600
)