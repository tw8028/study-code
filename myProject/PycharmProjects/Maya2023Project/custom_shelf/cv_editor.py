import pymel.core as pm
import tools.cv as cv
import rig.curve_rig as curve_rig


def create(*args):
    radio_collection = pm.radioCollection('cv_type', q=True, select=True)
    shape = pm.radioButton(radio_collection, q=True, label=True)
    radius = pm.floatField('radius1', q=True, value=True)
    return  cv.create(shape,shape,radius)

def change(*args):
    objs = pm.selected()
    for obj in objs:
        old_shape = obj.getShape()
        name = old_shape.name()
        # create a new curve
        new_curve = create()
        new_shape = new_curve.getShape()
        new_shape.overrideEnabled.set(1)
        new_shape.overrideColor.set(old_shape.overrideColor.get())
        pm.parent(new_shape, obj, add=True, s=True)
        pm.delete(old_shape, new_curve)
        pm.rename(new_shape, name)


def connect(*args):
    sl = pm.selected()
    cv.connect_line(sl[0], sl[1])


def mirror(*args):
    raise NotImplementedError('未实现的功能')


def point_ctrl(*args):
    sl = pm.selected()
    curve_rig.ctrl_by_loc(sl[0])


def get_message(*args):
    obj = pm.selected()[0]
    n = obj.controlPoints.get(size=True)
    print(n)
    k = range(n)
    p = [(pm.pointPosition(obj.cv[x])[0], pm.pointPosition(obj.cv[x])[1], pm.pointPosition(obj.cv[x])[2]) for x in k]
    round_p = [(round(x[0], 1), round(x[1], 1), round(x[2], 1)) for x in p]
    print(round_p)


def path_cons(*args):
    sl = pm.selected()
    num = pm.intField('path_num', q=True, v=True)
    curve_rig.loc_on_curve(sl[0], num)


def main():
    name = 'curve_editor_window'
    if pm.window(name, q=True, ex=True):
        pm.deleteUI(name)
    with pm.window(name):
        with pm.columnLayout(rowSpacing=20, adj=True):
            with pm.frameLayout('create a curve or change the shape'):
                with pm.gridLayout(numberOfColumns=2, cellWidth=100):
                    pm.radioCollection('cv_type')
                    pm.radioButton(label='cube', select=True)
                    pm.radioButton(label='ball')
                    pm.radioButton(label='arrow1')
                    pm.radioButton(label='arrow2')
                    pm.radioButton(label='cross1')
                    pm.radioButton(label='cross2')
                    pm.radioButton(label='square')
                    pm.radioButton(label='triangle')

                with pm.rowLayout(numberOfColumns=3):
                    pm.floatField('radius1', value=1, w=60)
                    pm.button(label='Create', command=create)
                    pm.button(label='Change', command=change)

            with pm.frameLayout('others for curve'):
                with pm.columnLayout():
                    pm.button(label='connect line', command=connect)
                    pm.button(label='mirror', command=mirror)
                    pm.button(label='point ctrl', command=point_ctrl)
                    pm.button(label='get message', command=get_message)
                with pm.rowLayout(nc=2):
                    pm.intField('path_num', value=0, w=60)
                    pm.button(label='pathConstraint', command=path_cons)

        pm.window(name, e=True, title='Curve Editor', wh=(240, 360))
        pm.showWindow(name)


if __name__ == '__main__':
    main()
