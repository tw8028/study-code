
num = getNumVerts $
global target
global skinMod = $.modifiers[#Skin]

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
        print ("Button 2 pressed. Text: " + txtField.text)
    )
)

-- 显示窗体
createDialog myRollout 300 150

-- 都是从1索引
-- skinOps.GetVertexWeight skinMod 1 1

-- skinOps.GetVertexWeightBoneID skinMod 1 1，获取一个点influenceID

-- skinOps.GetSelectedBone skinMod ，返回选择的boneId

-- skinOps.GetVertexWeightCount skinMod 1，一个点influence数，参数：vertex index（1开始索引）

-- skinOps.GetNumberVertices skinMod ，模型点数

-- 获取选择的骨骼 影响的点 id list
fn getVertexs=
	(
	local influencedVertexList=#()
	local vNum = skinOps.GetNumberVertices skinMod 
	local selectedBone = skinOps.GetSelectedBone skinMod 
	for i=1 to vNum do
		(
		influenceNum = skinOps.GetVertexWeightCount skinMod i
		for j=1 to influenceNum do(
			influence = skinOps.GetVertexWeightBoneID skinMod i j 
			if influence == selectedBone then
				(
				append influencedVertexList i
				-- has find influenced Vertex 将此点权重转移到目标骨骼
				
				)
			)
		)
	return influencedVertexList
	)
	

	
-- 转移权重	
fn switchWeight target=
	(
	
	)
	
	
	
	
	
	
	