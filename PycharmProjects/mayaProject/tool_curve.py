#!/usr/bin/python
# -*- coding:utf-8 -*-

# tool_controller

# 1:create
# 2:change shape
# 3:set color
# 4:get message
# 5:mirror


import pymel.core as pm


def get_cv(shape, radius, *, name='curve1'):
    if shape == 'circle':
        # circle return list
        return pm.circle(nr=(1, 0, 0), c=(0, 0, 0), r=radius, n=name, ch=False)[0]
    if shape == 'cube':
        points = [(-1, -1, 1), (1, -1, 1), (1, -1, -1), (-1, -1, -1), (-1, -1, 1), (-1, 1, 1), (1, 1, 1), (1, -1, 1),
                  (1, 1, 1), (1, 1, -1), (1, -1, -1), (1, 1, -1), (-1, 1, -1), (-1, -1, -1), (-1, 1, -1), (-1, 1, 1)]
        return pm.curve(n=name, d=1, p=[tuple(radius * x for x in i) for i in points], k=range(16))
    if shape == 'rhomb':
        points = [(-1, 0, 0), (0, 0, -1), (1, 0, 0), (0, 0, 1), (-1, 0, 0), (0, 1, 0), (1, 0, 0), (0, -1, 0),
                  (-1, 0, 0), (0, 0, -1), (0, 1, 0), (0, 0, 1), (0, -1, 0), (0, 0, -1)]
        return pm.curve(n=name, d=1, p=[tuple(radius * x for x in i) for i in points], k=range(14))
    if shape == 'arrow_up':
        points = [(-1.0, 2.0, 0.0), (-2.0, 2.0, 0.0), (0.0, 4.0, 0.0), (2.0, 2.0, 0.0), (1.0, 2.0, 0.0),
                  (1.0, -2.0, 0.0), (-1.0, -2.0, 0.0), (-1.0, 2.0, 0.0)]
        return pm.curve(n=name, d=1, p=[tuple(radius * x for x in i) for i in points], k=range(8))
    if shape == 'arrow2':
        points = [(0, 1, 0), (3, 1, 0), (3, 2, 0), (5, 0, 0), (3, -2, 0), (3, -1, 0), (-3, -1, 0), (-3, -2, 0),
                  (-5, 0, 0), (-3, 2, 0), (-3, 1, 0), (0, 1, 0)]
        return pm.curve(n=name, d=1, p=[tuple(radius * x for x in i) for i in points], k=range(12))
    if shape == 'square':
        points = [(0.0, 1.0, 1.0), (0.0, -1.0, 1.0), (0.0, -1.0, -1.0), (0.0, 1.0, -1.0), (0.0, 1.0, 1.0)]
        return pm.curve(n=name, d=1, p=[tuple(radius * x for x in i) for i in points], k=range(5))
    if shape == 'cross1':
        points = [(-1, 1, 0), (-1, 3, 0), (1, 3, 0), (1, 1, 0), (3, 1, 0), (3, -1, 0), (1, -1, 0), (1, -3, 0),
                  (-1, -3, 0), (-1, -1, 0), (-3, -1, 0), (-3, 1, 0), (-1, 1, 0)]
        return pm.curve(n=name, d=1, p=[tuple(radius * x for x in i) for i in points], k=range(13))
    if shape == 'cross2':
        points = [(-1, 1, 0), (-1, 7, 0), (1, 7, 0), (1, 1, 0), (7, 1, 0), (7, -1, 0), (1, -1, 0), (1, -7, 0),
                  (-1, -7, 0), (-1, -1, 0), (-7, -1, 0), (-7, 1, 0), (-1, 1, 0)]
        return pm.curve(n=name, d=1, p=[tuple(radius * x for x in i) for i in points], k=range(13))
    if shape == 'triangle':
        points = [(0.0, 0.0, 0.0), (-1.0, 2.0, 0.0), (1.0, 2.0, 0.0), (0.0, 0.0, 0.0), (0.0, -3.0, 0.0)]
        return pm.curve(n=name, d=1, p=[tuple(radius * x for x in i) for i in points], k=range(5))
    if shape == 'None':
        return
    if shape == 'foot_R_ctrl':
        p1 = [(3.2, 0.0, 0.8), (-3.2, 0.0, 0.6), (-5.9, 0.0, 19.6), (-5.6, 0.0, 26.3), (-0.0, 0.0, 31.1),
              (4.4, 0.0, 28.1), (5.8, 0.0, 21.2), (3.2, 0.0, 0.8)]
        k1 = range(8)
        p2 = [(-6.1, 2.2, 18.3), (-3.4, 5.0, -0.2), (2.9, 5.0, 0.4), (5.3, 2.7, 16.5)]
        k2 = range(4)
        cv1 = pm.curve(d=1, p=p1, k=k1, n=name)
        cv2 = pm.curve(d=1, p=p2, k=k2, n=name)
        pm.parent(pm.listRelatives(cv2, s=True)[0], cv1, add=True, s=True)
        pm.delete(cv2)
        return cv1
    if shape == 'roll_ctrl':
        c1 = pm.circle(nr=(1, 0, 0), c=(0, 0, 0), r=radius, n=name, ch=False)
        c2 = pm.circle(nr=(0, 1, 0), c=(0, 0, 0), r=radius, n=name, ch=False)
        c3 = pm.circle(nr=(0, 0, 1), c=(0, 0, 0), r=radius, n=name, ch=False)
        pm.parent(pm.listRelatives(c2, s=True)[0], c1, add=True, s=True)
        pm.delete(c2)
        pm.parent(pm.listRelatives(c3, s=True)[0], c1, add=True, s=True)
        pm.delete(c3)
        return c1


def create(*args):
    radio_collection = pm.radioCollection('obj_type', q=True, select=True)
    shape = pm.radioButton(radio_collection, q=True, label=True)
    r = pm.floatField('radius1', q=True, value=True)
    get_cv(shape, r)


def change_shape(*args):
    objs = pm.selected()
    radio_collection = pm.radioCollection('obj_type', q=True, select=True)
    shape = pm.radioButton(radio_collection, q=True, label=True)
    r = pm.floatField('radius1', q=True, value=True)
    for obj in objs:
        sel_shape = obj.getShape()
        # create a new curve
        target_curve = get_cv(shape, r, name=obj)
        target_shape = target_curve.getShape()
        target_shape.overrideEnabled.set(1)
        target_shape.overrideColor.set(sel_shape.overrideColor.get())
        pm.parent(target_shape, obj, add=True, s=True)
        pm.delete(sel_shape, target_curve)


def set_color(*args):
    objs = pm.selected()
    color = pm.intField('color', q=True, value=True)
    for obj in objs:
        for shape in pm.listRelatives(obj, s=True):
            shape.overrideEnabled.set(1)
            shape.overrideColor.set(color)


def mirror(*args):
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
        try:
            target_name = target_name.replace('_r', '_l') if '_r' in target_name else target_name.replace('_l', '_r')
            print(f'{target_name}')
        except:
            pass
        try:
            target_name = target_name.replace('_R', '_L') if '_R' in target_name else target_name.replace('_L', '_R')
            print(f'{target_name}')
        except:
            pass
        obj = pm.PyNode(target_name)
        old_shapes = pm.listRelatives(obj, s=True)
        color = old_shapes[0].overrideColor.get()
        pm.delete(old_shapes)
        copy = pm.duplicate(target, name=obj)
        copy_shapes = pm.listRelatives(copy, s=True)
        for i in copy_shapes:
            mirror_points(i)
            pm.parent(i, obj, add=True, s=True)
            i.overrideColor.set(color)
        pm.delete(copy)

    mirror_ctrl_curve(pm.selected()[0])


def get_message(*args):
    obj = pm.selected()[0]
    n = obj.controlPoints.get(size=True)
    print(n)
    k = range(n)
    p = [(pm.pointPosition(obj.cv[x])[0], pm.pointPosition(obj.cv[x])[1], pm.pointPosition(obj.cv[x])[2]) for x in k]
    round_p = [(round(x[0], 1), round(x[1], 1), round(x[2], 1)) for x in p]
    print(round_p)


# create cv point ctrl
def point_ctrl(*args):
    obj = pm.selected()[0]
    for n in range(obj.controlPoints.get(size=True)):
        locator = pm.spaceLocator()
        pm.xform(locator, t=pm.xform(obj.cv[n], q=True, t=True, ws=True))
        locator.getShape().worldPosition >> obj.getShape().controlPoints[n]


# create cv pathConstraint
def path_cons(*args):
    obj = pm.selected()[0]
    num = pm.intField('path_num', q=True, v=True)
    u_value = 1 / (num - 1)
    for n in range(num):
        point_info = pm.createNode('pointOnCurveInfo', n='{0}_pocInfo{1}'.format(obj, n))
        point_info.turnOnPercentage.set(1)
        path_locator = pm.spaceLocator(n='{0}_path{1}'.format(obj, n))
        pm.addAttr(path_locator, ln='u', at='double', min=0, max=1, dv=u_value * n, k=True, writable=True)
        pm.addAttr(path_locator, ln='pos', at='double', min=0, max=1, dv=u_value * n, k=True)
        path_locator.u >> point_info.parameter
        obj.getShape().worldSpace[0] >> point_info.inputCurve
        point_info.result.position >> path_locator.translate


def connect(*args):
    objs = pm.selected()
    point1 = pm.spaceLocator(n=objs[0] + '_point_loc')
    pm.parentConstraint(objs[0], point1)
    point2 = pm.spaceLocator(n=objs[1] + '_point_loc')
    pm.parentConstraint(objs[1], point2)
    line = pm.curve(d=1, p=[(0, 0, 0), (1, 0, 0)], k=[0, 1])
    line_shape = line.getShape()
    line_shape.overrideEnabled.set(1)
    line_shape.overrideDisplayType.set(1)
    point1.getShape().worldPosition[0] >> line_shape.controlPoints[0]
    point2.getShape().worldPosition[0] >> line_shape.controlPoints[1]


def main():
    name = 'tool_curve_win'
    if pm.window(name, q=True, ex=True):
        pm.deleteUI(name)
    with pm.window(name):
        with pm.columnLayout(rowSpacing=20, adj=True):
            with pm.frameLayout('create a curve or change the shape'):
                with pm.gridLayout(numberOfColumns=2, cellWidth=100):
                    pm.radioCollection('obj_type')
                    pm.radioButton(label='cube', select=True)
                    pm.radioButton(label='circle')
                    pm.radioButton(label='rhomb')
                    pm.radioButton(label='square')
                    pm.radioButton(label='arrow_up')
                    pm.radioButton(label='arrow2')
                    pm.radioButton(label='cross1')
                    pm.radioButton(label='cross2')
                    pm.radioButton(label='triangle')
                    pm.radioButton(label='None')

                    pm.radioButton(label='foot_R_ctrl')
                    pm.radioButton(label='roll_ctrl')

                with pm.rowLayout(numberOfColumns=3):
                    pm.floatField('radius1', value=1)
                    pm.button(label='Create', c=create)
                    pm.button(label='Change', c=change_shape)
            with pm.frameLayout('set color for curve'):
                with pm.rowLayout(numberOfColumns=2):
                    pm.intField('color', value=13, w=60)
                    pm.button(label='apply', c=set_color)
                pm.text('index: left(13,20) middle(17,21) right(6,18)')
            with pm.frameLayout('others for curve'):
                with pm.columnLayout():
                    pm.button(label='connect line', c=connect)
                    pm.button(label='mirror', c=mirror)
                    pm.button(label='get message', c=get_message)
                    pm.button(label='point ctrl', c=point_ctrl)
                with pm.rowLayout(nc=2):
                    pm.intField('path_num', value=0, w=40)
                    pm.button(label='pathConstraint', c=path_cons)

        pm.window(name, e=True, title='curve tool', wh=(240, 360))
        pm.showWindow(name)


if __name__ == '__main__':
    main()
