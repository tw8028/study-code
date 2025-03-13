import pymel.core as pm
import tools.grp as grp
import custom_shelf.cv_editor as cv_editor
import custom_shelf.jnt_editor as jnt_editor
import tools.attr as attr


def reset(*args):
    objs = pm.selected()
    for obj in objs:
        pm.xform(obj, t=(0, 0, 0), ro=(0, 0, 0))


def name():
    sl = pm.selected()
    for obj in sl:
        str = obj.rsplit('_', 1)
        if obj.nodeType() == 'joint':
            pm.rename(obj, f'jnt__{str[1]}__{str[0]}__001')
        elif obj.nodeType() == 'transform':
            type = obj.getShape().nodeType()
            if type == 'mesh':
                pm.rename(obj, f'mesh__{str[1]}__{str[0]}__001')
            elif type == 'nurbsCurve':
                pm.rename(obj, f'ctrl__{str[1]}__{str[0]}__001')
            elif type == 'locator':
                pm.rename(obj, f'loc__{str[1]}__{str[0]}__001')
            else:
                pass
        else:
            pass


def grp_master(*args):
    grp.master()


def grp_zero(*args):
    target = pm.selected()[0]
    grp_name = 'zero__' + target.split('__', 1)[1]
    return grp.zero(grp_name, target)


def grp_sub(*args):
    target = pm.selected()[0]
    grp_name = 'sub__' + target.split('__', 1)[1]
    return grp.sub(grp_name, target)


def orient_obj(*args):
    sl = pm.selected()
    attr.orient(sl[0], sl[1], sl[2])


def show_cv_editor(*args):
    cv_editor.main()


def show_jnt_editor():
    jnt_editor.main()


def show_skin_editor():
    pass
