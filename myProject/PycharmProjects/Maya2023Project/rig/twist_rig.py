import pymel.core as pm
from pymel.core.nodetypes import DependNode


# 1. driver 关节旋转超过180° twist 关节会发生翻转
# 2. driver, no_roll 初始方向必须一致, 通常需要给手/脚创建一个 output 组，方向对齐到手肘/膝盖
def twist_joint(driver, no_roll, driven_objs, ro_direction):
    driver_pn = pm.PyNode(driver)
    no_roll_pn = pm.PyNode(no_roll)
    mult_matrix = pm.createNode('multMatrix', name=driver_pn + '_mm')
    decompose_matrix = pm.createNode('decomposeMatrix', name=driver_pn + '_dpm')
    quat2euler = pm.createNode('quatToEuler', name=driver_pn + '_q2e')

    var = driver_pn.worldMatrix[0] >> mult_matrix.matrixIn[0]  # type:ignore
    var = no_roll_pn.worldInverseMatrix[0] >> mult_matrix.matrixIn[1]  # type:ignore
    var = mult_matrix.matrixSum >> decompose_matrix.inputMatrix
    var = decompose_matrix.outputQuatX >> quat2euler.inputQuatX
    var = decompose_matrix.outputQuatW >> quat2euler.inputQuatW

    n = 1
    for driven in driven_objs:
        driven_pn = pm.PyNode(driven)
        multiply_divide = pm.createNode('multiplyDivide', name=driver_pn + '_md')
        multiply_divide.operation.set(1)  # 乘法
        num = 1 / (len(driven_objs) + 1)  # 如果 twist 有2节，第一节0.33，第二节0.67
        multiply_divide.input2X.set(num * n * ro_direction)  # 数值取决于 twist joint 的链接方式，如果是关节链，则均分。
        n += 1
        var = quat2euler.outputRotateX >> multiply_divide.input1X
        var = multiply_divide.outputX >> driven_pn.rotateX  # type:ignore


def blend_matrix(input: str, target: str, blend_attr: float) -> DependNode:
    input_obj_nd = pm.PyNode(input)
    target_obj_nd = pm.PyNode(target)
    blend_matrix_nd = pm.createNode('blendMatrix', name='blendM_' + input)
    blend_matrix_nd.envelope.set(blend_attr)
    var = input_obj_nd.worldMatrix[0] >> blend_matrix_nd.inputMatrix  # type:ignore
    var = target_obj_nd.worldMatrix[0] >> blend_matrix_nd.target[0].targetMatrix  # type:ignore
    decompose_matrix_nd = pm.createNode('decomposeMatrix', name='decompose_' + input)
    var = blend_matrix_nd.outputMatrix >> decompose_matrix_nd.inputMatrix
    return decompose_matrix_nd


if __name__ == '__main__':
    decompose_nd = blend_matrix(input='zero__c__cube__001', target='ctrl__c__cube__001', blend_attr=0.3333)
    for joint in ['joint1', 'joint2', 'joint3']:
        jnt_nd = pm.PyNode(joint)
        var = decompose_nd.outputRotate >> jnt_nd.rotate  # type:ignore
