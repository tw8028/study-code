import pymel.core as pm


def zero_transform(obj):
    obj_node = pm.PyNode(obj)
    if obj_node.hasAttr('jointOrient'):  # type: ignore
        obj_node.jointOrient.set(0, 0, 0)  # type: ignore
    pm.xform(obj_node, t=(0, 0, 0), ro=(0, 0, 0), scale=(1, 1, 1))


def zero_orient(obj):
    obj_node = pm.PyNode(obj)
    if obj_node.hasAttr('jointOrient'):  # type: ignore
        obj_node.jointOrient.set(0, 0, 0)  # type: ignore
    pm.xform(obj_node, ro=(0, 0, 0))


def set_orient(obj, aim_obj, up_obj):
    aim_constraint = pm.aimConstraint(aim_obj, obj, aimVector=(1, 0, 0), worldUpType='object', worldUpObject=up_obj)
    pm.delete(aim_constraint)


def lock_hide_transform(obj):
    node = pm.PyNode(obj)
    attributes = ['translateX', 'translateY', 'translateZ',
                  'rotateX', 'rotateY', 'rotateZ',
                  'scaleX', 'scaleY', 'scaleZ']
    for attr in attributes:
        lock_and_hide(node.attr(attr))  # type: ignore


def lock_and_hide(attr):
    pm.setAttr(attr, lock=True, keyable=False, channelBox=False)


def displayable(attr):
    pm.setAttr(attr, keyable=False, channelBox=True, lock=False)


def set_color(obj, color):
    for shape in pm.listRelatives(obj, s=True):
        shape.overrideEnabled.set(1)
        shape.overrideColor.set(color)


def set_display_type(obj, display_type):
    for shape in pm.listRelatives(obj, s=True):
        shape.overrideEnabled.set(1)
        shape.overrideDisplayType.set(display_type)


def get_children(root):
    if not pm.PyNode(root).getChildren():  # type:ignore
        return [root]
    child = pm.PyNode(root).getChildren()[0]  # type:ignore
    return [root] + get_children(child)


if __name__ == '__main__':
    sl = pm.selected()[0]
    joints = get_children(root=sl)
    print(joints)
