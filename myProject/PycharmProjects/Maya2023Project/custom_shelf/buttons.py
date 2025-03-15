import pymel.core as pm
import mytools
import custom_shelf


def reset():
    sl = pm.selected()
    for obj in sl:
        mytools.attr.reset(obj)


def zero_orient():
    sl = pm.selected()
    for obj in sl:
        mytools.attr.zero_orient(obj)


def set_orient():
    sl = pm.selected()
    mytools.attr.set_orient(sl[0], aim=sl[1], up_obj=sl[2])


def name():
    sl = pm.selected()
    for obj in sl:
        field = obj.rsplit('_', 1)
        if obj.nodeType() == 'joint':
            pm.rename(obj, f'jnt__{field[0]}__{field[1]}__001')
        elif obj.nodeType() == 'transform':
            shape_type = obj.getShape().nodeType()
            if shape_type == 'mesh':
                pm.rename(obj, f'mesh__{field[0]}__{field[1]}__001')
            elif shape_type == 'nurbsCurve':
                pm.rename(obj, f'ctrl__{field[0]}__{field[1]}__001')
            elif shape_type == 'locator':
                pm.rename(obj, f'loc__{field[0]}__{field[1]}__001')
            else:
                pass
        else:
            pass


def grp_master():
    mytools.grp.master()


def grp_zero():
    target = pm.selected()[0]
    grp_name = 'zero__' + target.split('__', 1)[1]
    return mytools.grp.zero(name=grp_name, target=target)


def grp_sub():
    target = pm.selected()[0]
    grp_name = 'sub__' + target.split('__', 1)[1]
    return mytools.grp.sub(name=grp_name, target=target)


def show_cv_editor():
    custom_shelf.cv_editor.main()


def show_jnt_editor():
    custom_shelf.jnt_editor.main()


def show_skin_editor():
    custom_shelf.skin_editor.main()
