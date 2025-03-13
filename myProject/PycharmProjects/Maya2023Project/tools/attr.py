import pymel.core as pm


def reset(obj):
    pm.xform(obj, t=(0, 0, 0), ro=(0, 0, 0))
    # noinspection PyBroadException
    try:
        pm.PyNode(obj).jointOrient.set(0, 0, 0)
    except:
        pass


def reset_orient(obj):
    pm.xform(obj, ro=(0, 0, 0))
    # noinspection PyBroadException
    try:
        pm.PyNode(obj).jointOrient.set(0, 0, 0)
    except:
        pass


def lock_hide_transform(obj):
    node = pm.PyNode(obj)
    lock_and_hide(node.translateX)
    lock_and_hide(node.translateY)
    lock_and_hide(node.translateZ)
    lock_and_hide(node.rotateX)
    lock_and_hide(node.rotateY)
    lock_and_hide(node.rotateZ)
    lock_and_hide(node.scaleX)
    lock_and_hide(node.scaleY)
    lock_and_hide(node.scaleZ)


def lock_and_hide(attr):
    pm.setAttr(attr, lock=True)
    pm.setAttr(attr, keyable=False)
    pm.setAttr(attr, channelBox=False)


def set_color(obj, color):
    for shape in pm.listRelatives(obj, s=True):
        shape.overrideEnabled.set(1)
        shape.overrideColor.set(color)


def set_display_type(obj, display_type):
    for shape in pm.listRelatives(obj, s=True):
        shape.overrideEnabled.set(1)
        shape.overrideDisplayType.set(display_type)


def orient(obj, aim, up_obj):
    aim_constraint = pm.aimConstraint(aim, obj, aimVector=(1, 0, 0), worldUpType='object', worldUpObject=up_obj)
    pm.delete(aim_constraint)


def parent_align(obj, parent):
    pm.parent(obj, parent)
    pm.xform(obj, roo=pm.xform(parent, q=True, roo=True))
    reset(obj)


# offsetParentMatrix
def opm_constraint(driver, driven, *, mo=False):
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
