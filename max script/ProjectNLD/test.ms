--此脚本必须在skin modifier被激活的情况下使用

global skinMod 
global targetId

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
rollout myRollout "move weight tool"
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
		-- 选择骨骼影响的点集合
		skinOps.selectVerticesByBone ::skinMod 
		local vertexList = skinOps.GetSelectedVertices ::skinMod 	
		local selectedId = skinOps.GetSelectedBone ::skinMod 
		for v in vertexList do
		(
			setVertexWeight ::skinMod v ::targetId selectedId
		)
	)

	on btn3 pressed do
	(
		local selectedId = skinOps.GetSelectedBone ::skinMod
		skinOps.selectVerticesByBone ::skinMod 
		local vertexList = skinOps.GetSelectedVertices ::skinMod 	
		local hasChild = true
		while hasChild do
		(
			for v in vertexList do
			(
				setVertexWeight ::skinMod v ::targetId selectedId
			)
			skinOps.selectChild ::skinMod 
			if selectedId == (skinOps.GetSelectedBone ::skinMod) then hasChild = false
			else
			( 
				selectedId = skinOps.GetSelectedBone ::skinMod
				skinOps.selectVerticesByBone ::skinMod 
				vertexList = skinOps.GetSelectedVertices ::skinMod 	
			)
			print selectedId
		)
	)
)
-- 显示窗体
createDialog myRollout 300 150	
	