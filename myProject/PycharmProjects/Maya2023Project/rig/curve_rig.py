import pymel.core as pm
import parts.attr
import parts.cv
import parts.grp
import parts.utils



# 生成控制点，控制曲线
def loc_ctrl_curve(curve):
    for n in range(curve.controlPoints.get(size=True)):
        locator = pm.spaceLocator()
        pm.xform(locator, t=pm.xform(curve.cv[n], q=True, t=True, ws=True))
        var = locator.getShape().worldPosition >> curve.getShape().controlPoints[n]


# 生成定位点，随曲线运动
def loc_on_curve(curve, num):
    u_value = 1 / (num - 1)
    for n in range(num):
        node_name = 'pocInfo__' + curve.split('__', 1)[1]
        point_info = pm.createNode('pointOnCurveInfo', n=node_name)
        point_info.turnOnPercentage.set(1)
        loc_name = 'loc__' + curve.split('__', 1)[1]
        path_locator = pm.spaceLocator(n=loc_name)
        pm.addAttr(path_locator, ln='u', at='double', min=0, max=1, dv=u_value * n, k=True, writable=True)
        pm.addAttr(path_locator, ln='pos', at='double', min=0, max=1, dv=u_value * n, k=True)
        var = path_locator.u >> point_info.parameter
        var = curve.getShape().worldSpace[0] >> point_info.inputCurve
        var = point_info.result.position >> path_locator.translate


def connect_line(obj_a, obj_b):
    name_id = obj_a.split('__', 1)[1]
    name_obj_a = 'loc__' + name_id
    name_obj_b = 'loc__' + obj_b.split('__', 1)[1]
    name_line = 'line__' + name_id
    name_grp = 'gizmo__' + name_id
    point1 = pm.spaceLocator(n=name_obj_a)
    pm.pointConstraint(obj_a, point1)
    point2 = pm.spaceLocator(n=name_obj_b)
    pm.pointConstraint(obj_b, point2)
    line = pm.curve(d=1, p=[(0, 0, 0), (1, 0, 0)], k=[0, 1], n=name_line)
    line.inheritsTransform.set(0)
    parts.attr.set_display_type(line, display_type=2)
    line_shape = line.getShape()
    var = point1.getShape().worldPosition[0] >> line_shape.controlPoints[0]
    var = point2.getShape().worldPosition[0] >> line_shape.controlPoints[1]
    grp_line = pm.group(name=name_grp, empty=True)
    pm.parent(point1, point2, line, grp_line)
    return grp_line

def pole_ctrl(ik_joint1, ik_joint2, ik_joint3, ctrl_name, zero_name):
    t1 = pm.xform(ik_joint1, q=True, t=True, ws=True)
    t2 = pm.xform(ik_joint2, q=True, t=True, ws=True)
    t3 = pm.xform(ik_joint3, q=True, t=True, ws=True)
    direction = parts.utils.direction_pole(t1, t2, t3)

    parts.cv.cv_create(name=ctrl_name, shape='ball', radius=5)
    zero_grp = parts.grp.grp_zero(name=zero_name, target=ctrl_name)
    pole_position = [x + y * 40 for x, y in zip(t2, direction)]
    pm.xform(zero_name, t=pole_position, worldSpace=True)  # type: ignore
    return zero_grp

if __name__ == '__main__':
    pass
