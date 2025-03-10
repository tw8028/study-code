import pymel.core as pm


# p 给目标并对其目标
def parent_align(child, parent):
    _roo = pm.xform(parent, q=True, roo=True)
    pm.parent(child, parent)
    pm.xform(child, t=(0, 0, 0), ro=(0, 0, 0), roo=_roo)
    # noinspection PyBroadException
    try:
        pm.PyNode(child).jointOrient.set(0, 0, 0)
    except:
        pass


# offset parent matrix
# 代替一对一父子约束，无权重设置
def constraint_opm(driver, driven, *, mo=False):
    driver_node = pm.PyNode(driver)
    driven_node = pm.PyNode(driven)
    # 获取 driven transform
    _t = pm.xform(driven, q=1, t=1, ws=1)
    _ro = pm.xform(driven, q=1, ro=1, ws=1)

    driven_parent = driven_node.getParent()
    if driven_parent:
        mult_matrix_nd = pm.createNode("multMatrix", n="multMatrix_" + driver)
        # driver worldMatrix * driven_parent worldInverseMatrix
        driver_node.worldMatrix[0] >> mult_matrix_nd.matrixIn[0]
        driven_parent.worldInverseMatrix[0] >> mult_matrix_nd.matrixIn[1]
        mult_matrix_nd.matrixSum >> driven_node.offsetParentMatrix
    else:
        driver_node.worldMatrix[0] >> driven_node.offsetParentMatrix
    # noinspection PyBroadException
    try:
        driven_node.jointOrient.set(0, 0, 0)
    except:
        pass
    # 是否保持偏移
    if mo:
        pm.xform(driven, t=_t, ro=_ro, ws=1)
    else:
        pm.xform(driven, t=(0, 0, 0), ro=(0, 0, 0))


def main():
    sel = pm.selected()
    constraint_opm(sel[0], sel[1])


if __name__ == '__main__':
    main()
