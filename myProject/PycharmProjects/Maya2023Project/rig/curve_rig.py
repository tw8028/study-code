import pymel.core as pm
import tools.attr as attr


def connect_line(obj_a, obj_b):
    name_a = 'loc__' + obj_a.split('__', 1)[1]
    name_b = 'loc__' + obj_b.split('__', 1)[1]
    name_line = 'line__' + obj_a.split('__', 1)[1]
    point1 = pm.spaceLocator(n=name_a)
    pm.pointConstraint(obj_a, point1)
    point2 = pm.spaceLocator(n=name_b)
    pm.pointConstraint(obj_b, point2)
    line = pm.curve(d=1, p=[(0, 0, 0), (1, 0, 0)], k=[0, 1], n=name_line)
    attr.set_display_type(line, 2)
    line_shape = line.getShape()
    point1.getShape().worldPosition[0] >> line_shape.controlPoints[0]
    point2.getShape().worldPosition[0] >> line_shape.controlPoints[1]


# create locators to control cv point
def point_ctrl(curve):
    for n in range(curve.controlPoints.get(size=True)):
        locator = pm.spaceLocator()
        pm.xform(locator, t=pm.xform(curve.cv[n], q=True, t=True, ws=True))
        locator.getShape().worldPosition >> curve.getShape().controlPoints[n]


# create locators which controlled by curve
def path_constraint(curve, num):
    u_value = 1 / (num - 1)
    for n in range(num):
        node_name = 'pocInfo__' + curve.split('__', 1)[1]
        point_info = pm.createNode('pointOnCurveInfo', n=node_name)
        point_info.turnOnPercentage.set(1)
        path_locator = pm.spaceLocator(n='{0}_path{1}'.format(curve, n))
        pm.addAttr(path_locator, ln='u', at='double', min=0, max=1, dv=u_value * n, k=True, writable=True)
        pm.addAttr(path_locator, ln='pos', at='double', min=0, max=1, dv=u_value * n, k=True)
        path_locator.u >> point_info.parameter
        curve.getShape().worldSpace[0] >> point_info.inputCurve
        point_info.result.position >> path_locator.translate


if __name__ == '__main__':
    sl = pm.selected()
    # connect_line(sl[0], sl[1])
    # point_ctrl(sl[0])
    path_constraint(sl[0], 5)
