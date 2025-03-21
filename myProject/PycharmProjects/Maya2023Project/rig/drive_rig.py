import pymel.core as pm
import parts.attr as attr


def opm_constraint(driver, driven):
    driver_node = pm.PyNode(driver)
    driven_node = pm.PyNode(driven)
    driven_parent = driven_node.getParent()  # type: ignore
    if driven_parent:
        mult_matrix_nd = pm.createNode("multMatrix", n="mult_matrix__" + driver)
        # driver worldMatrix * driven_parent worldInverseMatrix
        var = driver_node.worldMatrix[0] >> mult_matrix_nd.matrixIn[0]  # type: ignore
        var = driven_parent.worldInverseMatrix[0] >> mult_matrix_nd.matrixIn[1]
        var = mult_matrix_nd.matrixSum >> driven_node.offsetParentMatrix  # type: ignore
    else:
        var = driver_node.worldMatrix[0] >> driven_node.offsetParentMatrix  # type: ignore
    attr.zero_transform(driven_node)
