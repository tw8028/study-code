import pymel.core as pm


# 生成控制点，控制曲线
def loc_ctrl_curve(curve):
    for n in range(curve.controlPoints.get(size=True)):
        locator = pm.spaceLocator()
        pm.xform(locator, t=pm.xform(curve.cv[n], q=True, t=True, ws=True))
        var = locator.getShape().worldPosition >> curve.getShape().controlPoints[n]


# 生成定位点，随曲线运动
def loc_on_curve(curve,*, num):
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


if __name__ == '__main__':
    sl = pm.selected()
    # connect_line(sl[0], sl[1])
    # point_ctrl(sl[0])
    loc_on_curve(sl[0], 5)
