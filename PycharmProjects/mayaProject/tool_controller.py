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


def create(*args):
    radio_collection = pm.radioCollection('objType', q=True, select=True)
    shape = pm.radioButton(radio_collection, q=True, label=True)
    r = mc.floatField('radius1', q=True, value=True)
    get_cv(shape, r)


def change_shape(*args):
    objs = pm.selected()
    radio_collection = pm.radioCollection('objType', q=True, select=True)
    shape = pm.radioButton(radio_collection, q=True, label=True)
    r = mc.floatField('radius1', q=True, value=True)
    for obj in objs:
        sel_shape = obj.getShape()
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
        shape = obj.getShape()
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

    mirror_ctrl_curve(pm.selected()[0])


def get_message(*args):
    obj = pm.selected()[0]
    n = obj.controlPoints.get(size=True)
    print(n)
    k = range(n)
    p = [(pm.pointPosition(obj.cv[x])[0], pm.pointPosition(obj.cv[x])[1], pm.pointPosition(obj.cv[x])[2]) for x in k]
    round_p = [(round(x[0], 1), round(x[1], 1), round(x[2], 1)) for x in p]
    print(round_p)


def main():
    name = 'tool_controller'
    if pm.window(name, q=True, ex=True):
        pm.deleteUI(name)
    pm.window(name)
    column = pm.columnLayout()
    pm.frameLayout('select a curve shape to create or change')
    pm.setParent(column)
    pm.gridLayout(numberOfColumns=3, cellWidth=100)
    pm.radioCollection('objType')
    pm.radioButton(label='cube', select=True)
    pm.radioButton(label='circle')
    pm.radioButton(label='rhomb')
    pm.setParent(column)

    pm.rowLayout(numberOfColumns=2)
    pm.floatField('radius1', value=1)
    pm.button(label='Create', c=create)
    pm.setParent(column)
    pm.rowLayout(numberOfColumns=2)
    pm.floatField('radius2', value=1)
    pm.button(label='Change', c=change_shape)
    pm.setParent(column)

    pm.frameLayout('set color for curve')
    pm.setParent(column)
    pm.rowLayout(numberOfColumns=2)
    pm.intField('color', value=13, w=60)
    pm.button(label='apply', c=set_color)
    pm.setParent(column)
    pm.text('index: left(13,20) middle(17,21) right(6,18)')

    pm.frameLayout('others for curve')
    pm.setParent(column)
    pm.button(label='mirror', c=mirror)
    pm.button(label='get message', c=get_message)

    pm.window(name, title='curve tool', e=True, wh=(300, 360))
    pm.showWindow(name)


if __name__ == '__main__':
    main()
