rollout myRollout "copyWeight"
(
    -- 创建两个按钮
    button btnShowMessage1 "copy from" width:80 height:25
    button btnShowMessage2 "paste to" width:80 height:25
	button btnTest "test" width:80 height:25
    -- 为第一个按钮添加事件处理程序
    on btnShowMessage1 pressed do
    (
        copyBuffer()
    )
    -- 为第二个按钮添加事件处理程序
    on btnShowMessage2 pressed do
    (
        pasteBuffer()
    )
    -- 添加布局以垂直堆叠按钮
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
	skinOps.selectBone skinmodifier 1 -- 选择索引为1的骨骼

    -- 复制选择的骨骼到剪贴板
    skinOps.copyWeights skinmodifier

    -- 选择另一个骨骼，这里假设要粘贴到索引为2的骨骼
    skinOps.selectBone skinmodifier 2

    -- 粘贴剪贴板的内容到当前选择的骨骼
    skinOps.pasteWeights skinmodifier
	)