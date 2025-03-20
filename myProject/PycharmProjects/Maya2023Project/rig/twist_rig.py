import pymel.core as pm


def twist_joint(driver, no_roll, driven, value):
    driver_pn = pm.PyNode(driver)
    no_roll_pn = pm.PyNode(no_roll)
    mult_matrix = pm.createNode('multMatrix', name=driver_pn + '_mm')
    decompose_matrix = pm.createNode('decomposeMatrix', name=driver_pn + '_dpm')
    quat2euler = pm.createNode('quatToEuler', name=driver_pn + '_q2e')
    multiply_divide = pm.createNode('multiplyDivide', name=driver_pn + '_md')
    # 相乘
    multiply_divide.operation.set(1)
    multiply_divide.input2X.set(value)

    driver_pn.worldMatrix[0] >> mult_matrix.matrixIn[0]
    no_roll_pn.worldInverseMatrix[0] >> mult_matrix.matrixIn[1]

    mult_matrix.matrixSum >> decompose_matrix.inputMatrix
    decompose_matrix.outputQuatX >> quat2euler.inputQuatX
    decompose_matrix.outputQuatW >> quat2euler.inputQuatW
    quat2euler.outputRotateX >> multiply_divide.input1X
    multiply_divide.outputX >> pm.PyNode(driven).rotateX


def twist_upper(jnt_upper, jnt_twist_01, jnt_twist_02, x_axis):
    upper = pm.PyNode(jnt_upper)
    twist_01 = pm.PyNode(jnt_twist_01)
    twist_02 = pm.PyNode(jnt_twist_02)
    grp = pm.group(name=f'{upper}_twist_grp', empty=True)


def twist_lower():
    pass


if __name__ == '__main__':
    pass
