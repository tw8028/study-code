
num = getNumVerts $
global skinMod 
global targetId

rollout myRollout "My Window"
(
    button btn1 "设置目标骨骼" width:100 height:30
   
    label txtField "Target:" width:200 height:20

    button btn2 "移动权重到目标" width:100 height:30
	
	button btn3 "test" width:100 height:30
	
	
    -- 按钮点击事件
    on btn1 pressed do
    (
		skinMod = $.modifiers[#Skin]
		targetId = skinOps.GetSelectedBone skinMod 
		boneName = skinOps.GetBoneName skinMod targetId 1
        txtField.text = "Target:    " + boneName
		)

    on btn2 pressed do
    (
		a = getVertexs skinMod
		selectedId = skinOps.GetSelectedBone skinMod 
		for i in a do
		(
			setVertexWeight i targetId selectedId
			)
		)
	
	
	on btn3 pressed do
	(
		skinMod = $.modifiers[#Skin]
		skinOps.ReplaceVertexWeights skinMod 1 #(11,21,9) #(0.1,2,0.2)	
		m = skinOps.GetVertexWeight skinMod 1 1
		print m
		)
	)
-- 显示窗体
createDialog myRollout 300 150

-- 都是从1索引
-- skinOps.GetVertexWeight skinMod a b 获取a点，b骨骼权重值

-- skinOps.GetVertexWeightBoneID skinMod 1 1，获取一个点influenceID

-- skinOps.GetSelectedBone skinMod ，返回选择的boneId

-- skinOps.GetVertexWeightCount skinMod 1，一个点influence数，参数：vertex index（1开始索引）

-- skinOps.GetNumberVertices skinMod ，模型点数

-- 获取选择的骨骼 影响的点 id list
fn getVertexs skinMod =	(
	local influencedVertexList=#()
	local vNum = skinOps.GetNumberVertices skinMod 
	local selectedBone = skinOps.GetSelectedBone skinMod 
	for i=1 to vNum do -- i ding
	(
		influenceNum = skinOps.GetVertexWeightCount skinMod i
		for j=1 to influenceNum do
		(
			influenceId = skinOps.GetVertexWeightBoneID skinMod i j 
			if influenceId == selectedBone then
			(
				append influencedVertexList i				
				)
			)
		)
	return influencedVertexList
	)
	
fn setVertexWeight v targetId selectedId =(
	n = skinOps.GetVertexWeightCount skinMod v	
	hasTargetId = false
	weight_t = 0
	
	infArry = #()
	weightArry = #()
	
	for j=1 to n do
	(
		influenceId = skinOps.GetVertexWeightBoneID skinMod v j 		
		if influenceId == targetId or influenceId == selectedId then
		(
			w1 = skinOps.GetVertexWeight skinMod v j
			weight_t = weight_t + w1
			)
		)
	print weight_t
	for i=1 to n do
	(
		influenceId = skinOps.GetVertexWeightBoneID skinMod v i
		if influenceId == targetId then
		(
			append infArry targetId
			print infArry[i]
			append weightArry weight_t
			)
		else if influenceId == selectedId then
		(
			append infArry targetId
			append weightArry weight_t
			)
		else
		(
			append infArry influenceId
			w = skinOps.GetVertexWeight skinMod v i
			append weightArry w
			)
		)
	skinOps.ReplaceVertexWeights skinMod v infArry weightArry	
		
	-- for i in infArry do print i
	)
	
	