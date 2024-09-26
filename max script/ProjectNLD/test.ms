
num = getNumVerts $
global skinMod
global targetId
global selectedId

rollout myRollout "My Window"
(
	 -- 创建按钮1
    button btn1 "设置目标骨骼" width:100 height:30
    -- 创建文本框
    label txtField "Target:" width:200 height:20
    -- 创建按钮2
    button btn2 "copy weight to target" width:100 height:30
	
    -- 按钮点击事件
    on btn1 pressed do
    (
		target = skinOps.GetSelectedBone skinMod 
        print ("get target bone " + txtField.text)
    )

    on btn2 pressed do
    (
        for i in selection do print i.
    )
)

-- 显示窗体
createDialog myRollout 300 150

-- 都是从1索引
-- skinOps.GetVertexWeight skinMod a b 获取权重值，点的index 为a,印象物序号为b

-- skinOps.GetVertexWeightBoneID skinMod 1 1，获取一个点influenceID

-- skinOps.GetSelectedBone skinMod ，返回选择的boneId

-- skinOps.GetVertexWeightCount skinMod 1，一个点influence数，参数：vertex index（1开始索引）

-- skinOps.GetNumberVertices skinMod ，模型点数

-- 获取选择的骨骼 影响的点 id list
fn getVertexs skinMod =
	(
	local influencedVertexList=#()
	local vNum = skinOps.GetNumberVertices skinMod 
	local selectedBone = skinOps.GetSelectedBone skinMod 
	for i=1 to vNum do -- i ding
		(
		influenceNum = skinOps.GetVertexWeightCount skinMod i
		for j=1 to influenceNum do(
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
	n = skinOps.GetVertexWeightCount skinMod i	
	hasTargetId = false
	index_t = 0
	index_s = 0
	
	for j=1 to n do
		(
			influenceId skinOps.GetVertexWeightBoneID skinMod v j 
			if influenceId == targetId then
			(
				hasTargetId = true
				index_t = j	
				)
			if influenceId == selectedId then
			(
				index_s = j
				)
		
	infArry = #()
	index_s = 
	
		
		
	)
	
	
	
	