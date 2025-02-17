import pymel.core as pm


# offset parent matrix
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
    try:
        pm.xform(driven, t=(0, 0, 0), ro=(0, 0, 0))
        driven_node.jointOrient.set(0, 0, 0)
    except:
        pass
    # 设置原来transform，保持偏移
    if mo:
        pm.xform(driven, t=_t, ro=_ro, ws=1)


def main():
    sel = pm.selected()
    constraint_opm(sel[0], sel[1], mo=True)


if __name__ == '__main__':
    main()
