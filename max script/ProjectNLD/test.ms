
num = getNumVerts $
global skinMod
global targetId
global selectedId

rollout myRollout "My Window"
(
	 -- ������ť1
    button btn1 "����Ŀ�����" width:100 height:30
    -- �����ı���
    label txtField "Target:" width:200 height:20
    -- ������ť2
    button btn2 "copy weight to target" width:100 height:30
	
    -- ��ť����¼�
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

-- ��ʾ����
createDialog myRollout 300 150

-- ���Ǵ�1����
-- skinOps.GetVertexWeight skinMod a b ��ȡȨ��ֵ�����index Ϊa,ӡ�������Ϊb

-- skinOps.GetVertexWeightBoneID skinMod 1 1����ȡһ����influenceID

-- skinOps.GetSelectedBone skinMod ������ѡ���boneId

-- skinOps.GetVertexWeightCount skinMod 1��һ����influence����������vertex index��1��ʼ������

-- skinOps.GetNumberVertices skinMod ��ģ�͵���

-- ��ȡѡ��Ĺ��� Ӱ��ĵ� id list
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
	
	
	
	