import pymel.core as pm


def mirror_points(shape):
    size = shape.controlPoints.get(size=True)
    for i in range(size):
        x = shape.controlPoints[i].xValue.get()
        y = shape.controlPoints[i].yValue.get()
        z = shape.controlPoints[i].zValue.get()
        if 'Foot' in shape.name():
            shape.controlPoints[i].xValue.set(-x)
        else:
            shape.controlPoints[i].xValue.set(-x)
            shape.controlPoints[i].yValue.set(-y)
            shape.controlPoints[i].zValue.set(-z)


def mirror_ctrl_curve(target):
    target_name = target.name()
    obj_name = target_name.replace('R_', 'L_') if 'R_' in target_name else target_name.replace('L_', 'R_')
    obj = pm.PyNode(obj_name)
    old_shapes = pm.listRelatives(obj, s=True)
    color = old_shapes[0].overrideColor.get()
    pm.delete(old_shapes)
    copy = pm.duplicate(target, name=obj_name)
    copy_shapes = pm.listRelatives(copy, s=True)
    for i in copy_shapes:
        mirror_points(i)
        pm.parent(i, obj, add=True, s=True)
        i.overrideColor.set(color)
    pm.delete(copy)


if __name__ == '__main__':
    mirror_ctrl_curve(pm.selected()[0])
