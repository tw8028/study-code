macroscript NLD_move_weight
category:"自定义工具"
tooltip:"Move_Weight 1.0v"
(
global skinMod 
global targetId

-- 获取所选骨骼，影响的点
-- 下面方法效果相同
-- skinOps.selectVerticesByBone ::skinMod 
-- local vertexList = skinOps.GetSelectedVertices ::skinMod 	
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

-- 对一个顶点的操作
fn setVertexWeight skinMod v targetId selectedId =(
	-- 获取顶点influence数量n
	local n = skinOps.GetVertexWeightCount skinMod v	
	-- 定义权重值
	local weight = 0
	-- influence数组
	local arry_i = #()
	-- 权重值数组
	local arry_w = #()
	
	-- 遍历influence，计算权重值
	for inf=1 to n do
	(
		id = skinOps.GetVertexWeightBoneID skinMod v inf
		-- 权重值累加目标骨骼的权重
		if id == targetId or id == selectedId then
		(
			w = skinOps.GetVertexWeight skinMod v inf
			weight = weight + w
			)
		)
	
	-- 构建新的influence数组，权重值数组，两者是对应关系
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

-- 窗口
rollout myRollout "move weight tool 1.0v"
(
    button btn1 "设置目标骨骼" width:100 height:30
    label txtField "Target Bone:" width:200 height:20
    button btn2 "移动权重到目标" width:100 height:30
	button btn3 "移动整个骨骼链" width:100 height:30
    -- 按钮点击事件
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
		skinOps.SelectBone ::skinMod ::targetId
	)
	
	on btn3 pressed do
	(
		local vertexList = getVertexList ::skinMod
		local selectedId = skinOps.GetSelectedBone ::skinMod 
		local hasChild = true
		while hasChild do
		(
			for v in vertexList do
			(
				setVertexWeight ::skinMod v ::targetId selectedId
			)
			-- 选择子骨骼
			skinOps.selectChild ::skinMod 
			childBone = skinOps.GetSelectedBone ::skinMod
			-- 如果骨骼没变，则没有子骨骼
			if childBone == selectedId then hasChild = false
			-- 获取到子骨骼，重新给变量赋值
			else
			( 
				selectedId = childBone
				vertexList = getVertexList ::skinMod
			)
		)
		skinOps.SelectBone ::skinMod ::targetId
	)
)	
-- 显示窗体
createDialog myRollout 300 150	
)