import pymel.core as pm
import package_tools.rigging as rg
import package_tools.cv as cv


def create_cv(obj,shape,radius):
    if shape == 'circle':
        # circle return list
        return pm.circle(nr=(1, 0, 0), c=(0, 0, 0), r=radius, n=obj, ch=False)[0]
    if shape == 'cube':
        return cv.cube(name=obj, r=radius)
    if shape == 'rhomb':
        return cv.rhomb(name=obj, r=radius)


def change_shape(obj, shape, radius):
    sel_shape = obj.getShape()
    target_curve = create_cv(obj,shape,radius)
    target_shape = target_curve.getShape()
    target_shape.overrideEnabled.set(1)
    target_shape.overrideColor.set(sel_shape.overrideColor.get())
    pm.parent(target_shape, obj, add=True, s=True)
    pm.delete(sel_shape, target_curve)


def shape_click(*args):
    shape = pm.radioButton(pm.radioCollection('shapes', q=True, select=True), q=True, label=True)
    R = pm.floatField('radius', q=True, value=True)
    for obj in pm.selected():
        change_shape(obj, shape, R)


def color_click(*args):
    objs = pm.selected()
    rg.set_color(pm.intField('color', q=True, value=True), objs)


if __name__ == '__main__':
    name = 'ChangeController'
    if pm.window(name, q=True, ex=True):
        pm.deleteUI(name)
    pm.window(name)
    column = pm.columnLayout()
    pm.frameLayout('change the shape')
    pm.setParent(column)
    pm.gridLayout(numberOfColumns=2, cellWidth=120)
    pm.radioCollection('shapes')
    pm.radioButton(label='circle')
    pm.radioButton(label='cube')
    pm.radioButton(label='rhomb')
    pm.setParent(column)
    pm.rowLayout(numberOfColumns=2)
    pm.floatField('radius', value=1)
    pm.button(label='apply', c=shape_click)
    pm.setParent(column)

    pm.frameLayout('color:left(13,20) middle(17,21) right(6,18)')
    pm.setParent(column)
    pm.rowLayout(numberOfColumns=2)
    pm.intField('color', value=13)
    pm.button(label='apply', c=color_click)

    pm.window(name, title='change controller', e=True, wh=(300, 360))
    pm.showWindow(name)
