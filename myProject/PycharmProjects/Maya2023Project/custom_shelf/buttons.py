import pymel.core as pm
import tools.grp as grp
import custom_shelf.cv_editor as cv_editor


def reset(*args):
    objs = pm.selected()
    for obj in objs:
        pm.xform(obj, t=(0, 0, 0), ro=(0, 0, 0))


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


def show_cv_editor(*args):
    cv_editor.main()


def show_jnt_editor():
    pass


def show_skin_editor():
    pass
