import pymel.core as pm


def twist_joint(driver: str, no_roll: str, driven_objs: list[str], ro_direction: int, is_chain: bool):
    """控制 driven_objs 的x轴旋转

    :param driver: 关节旋转超过180° twist 关节会发生翻转
    :param no_roll: 初始方向必须与 driver 一致
    :param driven_objs:
    :param ro_direction: 值为1或者-1
    :return: None
    """
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
        multiply_divide.input2X.set(num * n * ro_direction)  # 数值取决于 twist joint 的链接方式
        if not is_chain:
            n += 1  # 如果是关节链，则均分，n 始终为1
        var = quat2euler.outputRotateX >> multiply_divide.input1X
        var = multiply_divide.outputX >> driven_pn.rotateX  # type:ignore


if __name__ == '__main__':
    pass
