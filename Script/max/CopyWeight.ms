rollout myRollout "copyWeight"
(
    -- ����������ť
    button btnShowMessage1 "copy from" width:80 height:25
    button btnShowMessage2 "paste to" width:80 height:25
	button btnTest "test" width:80 height:25
    -- Ϊ��һ����ť�����¼���������
    on btnShowMessage1 pressed do
    (
        copyBuffer()
    )
    -- Ϊ�ڶ�����ť�����¼���������
    on btnShowMessage2 pressed do
    (
        pasteBuffer()
    )
    -- ���Ӳ����Դ�ֱ�ѵ���ť
	on btnTest pressed do
    (
        test()
    )
)

createdialog myRollout


global skinModifier = undefined

fn copyBuffer =(
	mesh = $
	--print mesh
	skinmodifier = mesh.modifiers[#Skin]
	print "copy from"
	skinOps.copySelectedBone skinmodifier
	)

	
fn pasteBuffer =(
	skinOps.pasteToSelectedBone skinmodifier
	print "paste to" 
	)
	
fn test =(
	skinmodifier = $.modifiers[#Skin]
	skinOps.selectBone skinmodifier 1 -- ѡ������Ϊ1�Ĺ���

    -- ����ѡ��Ĺ�����������
    skinOps.copyWeights skinmodifier

    -- ѡ����һ���������������Ҫճ��������Ϊ2�Ĺ���
    skinOps.selectBone skinmodifier 2

    -- ճ������������ݵ���ǰѡ��Ĺ���
    skinOps.pasteWeights skinmodifier
	)