macroscript NLD_ResetGunPivot
category:"�Զ��幤��"
tooltip:"NLD_����GunPivot"
(
	global pointTransform
	
	fn isSelectOne = (
		if selection.count ==1 then return true else 
			( 
				print "ѡ��һ�����壬��Ҫ��ѡ"
				messageBox "��ѡ��һ�����壬��Ҫ��ѡ��" title:"��ʾ"
				return false
			)
		)
		
	rollout ResetGunPivotWindow "����GunPivot"
	(
		button btn0 "�������" width:100 height:30
		label textField "scale��" width:200 height:30
		
		button btn1 "rotate x -90" width:100 height:30
		button btn2 "pivot λ����ת����" width:100 height:30
		button btn3 "���� Fire �ҵ�" width:100 height:30
		button btn7 "���� gun root"  width:100 height:30
		button btn8 "���� bag root"  width:100 height:30
		
		label label_1 "" width:100 height:10
		button btn4 "�ؽ������ҵ�" width:100 height:30
		button btn4_1 "����ҵ�Լ��" width:100 height:30
		button btn9 "unity pivot" width:100 height:30
		 
		
		label label_3 "" width:100 height:20
		label label_2 "����ճ��transform" width:100 height:20
		button btn5 "����" width:100 height:30
		button btn6 "ճ��" width:100 height:30
		
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
			w_bone =  $'Weapon*Bone001'[1] --ʹ��ͨ������������ȡ��������
			old_point = $Grip_point01
			if w_bone == undefined or old_point == undefined then print "û������������ҵ�" else
			(
				old_point.name = "old_point"
				new_point = Point name:"Grip_point01" parent:$'Bip001 R Hand'
				
				-- ����offset������Լ���µ������ҵ�
				offset = Point name:"offset" cross:off Box:on
				offset.transform = w_bone.transform
				pos_offset = offset.position
				currentRotation = offset.rotation
				rotationY = angleaxis 90 [0, 1, 0]
				newRotation = currentRotation * rotationY
				offset.rotation = newRotation
				offset.position = pos_offset
				
				-- link offset ���������� 
				lc = Link_Constraint()
				offset.transform.controller = lc
				lc.addTarget w_bone 0  --��0֡
				
				-- λ��Լ���¹ҵ㵽 offset
				pos_constraint = Position_Constraint()
				new_point.pos.controller = pos_constraint
				pos_constraint.constraints.appendTarget offset 50.0
				
				-- ����Լ���¹ҵ㵽 offset
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
				-- ��ȡƽ�Ʊ任������� $.pos һ��
				local pos = $.transform.translation
				-- ����һ���µı任����ʹ x ������������� x ��һ�£�y ������������� z ��һ��
				local newTransform = matrix3 [1, 0, 0] [0, 0, 1] [0, -1, 0] [0, 0, 0]
				-- ����任��λ�ù���
				$.transform = newTransform
				-- �ָ�λ��
				$.pos = pos
			)
		)
	)
	createDialog ResetGunPivotWindow 270 500
)