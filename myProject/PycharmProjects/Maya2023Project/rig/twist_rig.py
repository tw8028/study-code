import pymel.core as pm


def twist_joint(driver, no_roll, driven_objs):
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

    for driven in driven_objs:
        driven_pn = pm.PyNode(driven)
        multiply_divide = pm.createNode('multiplyDivide', name=driver_pn + '_md')
        # 相乘
        multiply_divide.operation.set(1)
        multiply_divide.input2X.set(0.5)
        var = quat2euler.outputRotateX >> multiply_divide.input1X
        var = multiply_divide.outputX >> driven_pn.rotateX  # type:ignore


def twist_upper(jnt_upper, jnt_twist_01, jnt_twist_02, x_axis):
    upper = pm.PyNode(jnt_upper)
    twist_01 = pm.PyNode(jnt_twist_01)
    twist_02 = pm.PyNode(jnt_twist_02)
    grp = pm.group(name=f'{upper}_twist_grp', empty=True)


def twist_lower():
    pass


if __name__ == '__main__':
    twist_joint(driver='joint1', no_roll='joint2', driven_objs=['joint3_t1', 'joint4_t2'])
