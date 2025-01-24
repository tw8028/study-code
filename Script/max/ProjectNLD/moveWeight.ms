macroscript NLD_move_weight
category:"�Զ��幤��"
tooltip:"Move_Weight"
(
global skinMod 
global targetId

-- ��ȡ��ѡ������Ӱ��ĵ�
fn getVertexList skinMod =	(
	local vertexList=#()
	local vertexCount = skinOps.GetNumberVertices skinMod 
	local boneId = skinOps.GetSelectedBone skinMod 
	for v=1 to vertexCount do
	(
		influenceCount = skinOps.GetVertexWeightCount skinMod v
		for i=1 to influenceCount do
		(
			influenceId = skinOps.GetVertexWeightBoneID skinMod v i
			if influenceId == boneId then
			(
				append vertexList v				
				)
			)
		)
	return vertexList
	)

-- ��һ������Ĳ���
fn setVertexWeight skinMod v targetId selectedId =(
	-- ��ȡ����influence����n
	local n = skinOps.GetVertexWeightCount skinMod v	
	-- ����Ȩ��ֵ
	local weight = 0
	-- influence����
	local arry_i = #()
	-- Ȩ��ֵ����
	local arry_w = #()
	
	-- ����influence������Ȩ��ֵ
	for inf=1 to n do
	(
		id = skinOps.GetVertexWeightBoneID skinMod v inf
		-- Ȩ��ֵ�ۼ�Ŀ�������Ȩ��
		if id == targetId or id == selectedId then
		(
			w = skinOps.GetVertexWeight skinMod v inf
			weight = weight + w
			)
		)
	
	-- �����µ�influence���飬Ȩ��ֵ���飬�����Ƕ�Ӧ��ϵ
	for i=1 to n do
	(
		id = skinOps.GetVertexWeightBoneID skinMod v i
		if id == targetId then
		(
			append arry_i targetId
			append arry_w weight
			)
		else if id == selectedId then
		(
			append arry_i targetId
			append arry_w weight
			)
		else
		(
			append arry_i id
			w = skinOps.GetVertexWeight skinMod v i
			append arry_w w
			)
		)
	skinOps.ReplaceVertexWeights skinMod v arry_i arry_w
	)

-- ����
rollout myRollout "move weight tool"
(
    button btn1 "����Ŀ�����" width:100 height:30
    label txtField "Target Bone:" width:200 height:20
    button btn2 "�ƶ�Ȩ�ص�Ŀ��" width:100 height:30
    -- ��ť����¼�
    on btn1 pressed do
    (
		::skinMod = $.modifiers[#Skin]
		::targetId = skinOps.GetSelectedBone ::skinMod 
		local boneName = skinOps.GetBoneName skinMod ::targetId 1
        txtField.text = "Target Bone:    " + boneName
		)

    on btn2 pressed do
    (
		local vertexList = getVertexList ::skinMod
		local selectedId = skinOps.GetSelectedBone ::skinMod 
		for v in vertexList do
		(
			setVertexWeight ::skinMod v ::targetId selectedId
			)
		)
	)	
-- ��ʾ����
createDialog myRollout 300 150	
)