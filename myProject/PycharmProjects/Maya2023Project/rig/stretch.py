import pymel.core as pm


def stretch_ik(*, attr_obj, jnt1_offset, handle_ctrl, ik_jnt1, ik_jnt2, ik_jnt3):
    """距离大于 ik handle 的极限，则拉伸，否则不拉伸

    :param attr_obj: 拉伸属性开关
    :param jnt1_offset: 起点
    :param handle_ctrl: 末端控制器
    :param ik_jnt1: 用于计算骨骼长度
    :param ik_jnt2: 用于计算骨骼长度
    :param ik_jnt3: 用于计算骨骼长度
    :return: none
    """
    stretch_obj = pm.PyNode(attr_obj)
    start = pm.PyNode(jnt1_offset)
    end = pm.PyNode(handle_ctrl)
    jnt1 = pm.PyNode(ik_jnt1)
    jnt2 = pm.PyNode(ik_jnt2)
    jnt3 = pm.PyNode(ik_jnt3)

    length = abs(jnt2.translateX.get()) + abs(jnt3.translateX.get())  # type:ignore
    distance_between = pm.createNode('distanceBetween', name='distance__' + handle_ctrl)
    multiply_divide = pm.createNode('multiplyDivide', name='multiply__' + handle_ctrl)
    multiply_divide.operation.set(2)
    multiply_divide.input2X.set(length)

    condition = pm.createNode('condition', name='condition__' + handle_ctrl)
    condition.secondTerm.set(length)
    condition.operation.set(2)
    condition.colorIfFalseR.set(length)

    blend_attr = pm.createNode('blendTwoAttr', name='blendAttr__' + handle_ctrl)

    var = start.worldMatrix[0] >> distance_between.inMatrix1  # type:ignore
    var = end.worldMatrix[0] >> distance_between.inMatrix2  # type:ignore
    var = distance_between.distance >> condition.firstTerm
    var = distance_between.distance >> condition.colorIfTrue.colorIfTrueR

    var = condition.secondTerm >> blend_attr.input[0]
    var = condition.outColor.outColorR >> blend_attr.input[1]
    var = blend_attr.output >> multiply_divide.input1.input1X
    pm.addAttr(stretch_obj, longName='stretch', attributeType='bool', defaultValue=1, keyable=True)
    var = stretch_obj.stretch >> blend_attr.attributesBlender  # type:ignore
    var = multiply_divide.outputX >> jnt1.scaleX  # type:ignore
    var = multiply_divide.outputX >> jnt2.scaleX  # type:ignore


def stretch_jnt(*, start_point, end_point, joints):
    """根据两点距离，计算缩放，x轴拉伸的同时，yz轴变细

    :param start_point: 起点
    :param end_point: 末端控制器
    :param joints: 拉伸的骨骼 list
    :return: none
    """
    start = pm.PyNode(start_point)
    end = pm.PyNode(end_point)
    distance_nd = pm.createNode('distanceBetween', name='distance__' + end)
    var = start.worldMatrix[0] >> distance_nd.inMatrix1  # type:ignore
    var = end.worldMatrix[0] >> distance_nd.inMatrix2  # type:ignore
    divide_nd = pm.createNode('multiplyDivide', name='divide__' + end)
    divide_nd.operation.set(2)
    divide_nd.input2X.set(distance_nd.distance.get())
    var = distance_nd.distance >> divide_nd.input1X
    # sqrt
    sqrt_nd = pm.createNode('multiplyDivide', name='sqrt__' + end)
    sqrt_nd.operation.set(3)
    sqrt_nd.input2X.set(0.5)
    # reciprocal
    reciprocal_nd = pm.createNode('multiplyDivide', name='reciprocal__' + end)
    reciprocal_nd.operation.set(2)
    reciprocal_nd.input1X.set(1)

    var = divide_nd.outputX >> sqrt_nd.input1X
    var = sqrt_nd.outputX >> reciprocal_nd.input2X
    for i in joints:
        try:
            jnt = pm.PyNode(i)
            var = divide_nd.outputX >> jnt.scaleX  # type:ignore
            var = reciprocal_nd.outputX >> jnt.scaleY  # type:ignore
            var = reciprocal_nd.outputX >> jnt.scaleZ  # type:ignore
        except pm.MayaObjectError:
            print("无效的 driven")


def main():
    obj = 'ctrl__r__arm__001'
    jnt1_offset = 'zero__r__arm__001'
    handle_ctrl = 'ctrl__r__arm_ik_handle__001'
    ik_jnt1 = 'jnt__r__joint1_ik__001'
    ik_jnt2 = 'jnt__r__joint2_ik__001'
    ik_jnt3 = 'jnt__r__joint3_ik__001'

    stretch_ik(attr_obj=obj, jnt1_offset=obj, handle_ctrl=handle_ctrl, ik_jnt1=ik_jnt1, ik_jnt2=ik_jnt2,
               ik_jnt3=ik_jnt3)


if __name__ == '__main__':
    main()
