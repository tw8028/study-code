import pymel.core as pm


def stretch_ik(attr_obj, jnt1_offset, handle_ctrl, ik_jnt1, ik_jnt2, ik_jnt3):
    """实现 ik 骨骼拉伸效果

    :param attr_obj: 拉伸效果开关
    :param jnt1_offset: 起点
    :param handle_ctrl: 末端控制器
    :param ik_jnt1:
    :param ik_jnt2:
    :param ik_jnt3:
    :return: none
    """
    switch = pm.PyNode(attr_obj)
    start = pm.PyNode(jnt1_offset)
    end = pm.PyNode(handle_ctrl)
    jnt1 = pm.PyNode(ik_jnt1)
    jnt2 = pm.PyNode(ik_jnt2)
    jnt3 = pm.PyNode(ik_jnt3)

    length = abs(jnt2.translateX.get()) + abs(jnt3.translateX.get())
    distance_between = pm.createNode('distanceBetween', name=handle_ctrl + '_db')
    multiply_divide = pm.createNode('multiplyDivide', name=handle_ctrl + '_md')
    multiply_divide.operation.set(2)
    multiply_divide.input2X.set(length)

    condition = pm.createNode('condition', name=handle_ctrl + '_condition')
    condition.secondTerm.set(length)
    condition.operation.set(2)
    condition.colorIfFalseR.set(length)

    blend_attr = pm.createNode('blendTwoAttr', name=handle_ctrl + '_blendAttr')

    start.worldMatrix[0] >> distance_between.inMatrix1
    end.worldMatrix[0] >> distance_between.inMatrix2
    distance_between.distance >> condition.firstTerm
    distance_between.distance >> condition.colorIfTrue.colorIfTrueR

    condition.secondTerm >> blend_attr.input[0]
    condition.outColor.outColorR >> blend_attr.input[1]
    blend_attr.output >> multiply_divide.input1.input1X
    pm.addAttr(switch, ln='stretch', at='bool', dv=1, k=1)
    switch.stretch >> blend_attr.attributesBlender
    multiply_divide.outputX >> jnt1.scaleX
    multiply_divide.outputX >> jnt2.scaleX


def stretch_jnt(start, end_ctrl, joints):
    """实现骨骼链拉伸，并且拉伸的同时改变粗细

    :param start: 起点
    :param end_ctrl: 末端控制器
    :param joints: 拉伸的骨骼 list
    :return: none
    """
    start_pn = pm.PyNode(start)
    end_pn = pm.PyNode(end_ctrl)
    distance_between = pm.createNode('distanceBetween', name=end_pn + '_db')
    start_pn.worldMatrix[0] >> distance_between.inMatrix1
    end_pn.worldMatrix[0] >> distance_between.inMatrix2
    md = pm.createNode('multiplyDivide', name=end_pn + '_md')
    md.operation.set(2)
    md.input2X.set(distance_between.distance.get())
    distance_between.distance >> md.input1X
    # sqrt
    sqrt = pm.createNode('multiplyDivide', name=end_pn + '_sqrt')
    sqrt.operation.set(3)
    sqrt.input2X.set(0.5)
    # reciprocal
    reciprocal = pm.createNode('multiplyDivide', name=end_pn + '_reciprocal')
    reciprocal.operation.set(2)
    reciprocal.input1X.set(1)

    md.outputX >> sqrt.input1X
    sqrt.outputX >> reciprocal.input2X
    for i in joints:
        try:
            jnt = pm.PyNode(i)
            md.outputX >> jnt.scaleX
            reciprocal.outputX >> jnt.scaleY
            reciprocal.outputX >> jnt.scaleZ
        except pm.MayaObjectError:
            print("无效的 driven")


def main():
    objs = pm.selected()
    point1 = objs[0:1][0]
    point2 = objs[-1:][0]
    joints = objs[1:-1]
    stretch_jnt(point1, point2, joints)
    print('end')


if __name__ == '__main__':
    obj = pm.polyCube(name='abb')[0]
    stretch_ik(obj, 'joint1_offset', 'handle_ctrl', 'joint1', 'joint2', 'joint3')
