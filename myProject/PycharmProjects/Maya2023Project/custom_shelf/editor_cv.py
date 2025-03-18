import pymel.core as pm
import mytools.cv as cv
import mytools.grp
import rig


def create(*args):
    radio_collection = pm.radioCollection('cv_type', q=True, select=True)
    shape = pm.radioButton(radio_collection, q=True, label=True)
    radius = pm.floatField('radius1', q=True, value=True)
    if pm.selected():
        return cv.ctrl(name=shape, target=pm.selected()[0], shape=shape, radius=radius)
    return cv.create(name=shape, shape=shape, radius=radius)


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


def zero_grp(*args):
    ctrl = pm.selected()[0]
    name = f'zero__c__{ctrl}_001'
    mytools.grp.zero(name=name, target=ctrl)


def match_freeze(*args):
    obj = pm.selected()[0]
    if obj.getParent() is not None:
        # match pivots to parent
        pm.matchTransform(obj, obj.getParent(), pivots=True)
        # freeze transformation
        pm.makeIdentity(obj, apply=True, translate=True, rotate=True, scale=True)
    else:
        pm.warning(f'{obj} 需要有父节点')


def connect(*args):
    sl = pm.selected()
    rig.curve_rig.connect_line(sl[0], sl[1])


def mirror(*args):
    raise NotImplementedError('未实现的功能')


def point_ctrl(*args):
    sl = pm.selected()
    rig.curve_rig.loc_ctrl_curve(sl[0])


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
    rig.curve_rig.loc_on_curve(sl[0], num=num)


def show_window():
    name = 'my_curve_editor_window'
    if pm.window(name, q=True, ex=True):
        print(f'delete win: {name}')
        pm.deleteUI(name, window=True)
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
                with pm.columnLayout():
                    pm.button(label='zero group', command=zero_grp)
                    pm.button(label='Match pivots to parent and Freeze', command=match_freeze)

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
