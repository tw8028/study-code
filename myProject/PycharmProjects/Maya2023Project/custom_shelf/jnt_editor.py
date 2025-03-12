import pymel.core as pm
import tools.jnt as jnt


def _reset(joints):
    for jnt in joints:
        pm.xform(jnt, ro=(0, 0, 0))
        jnt.jointOrient.set(0, 0, 0)


def reset_selection(*args):
    sl = pm.selected()
    _reset(sl)


def reset_children(*args):
    sl = pm.selected()
    children = pm.listRelatives(sl, ad=True)
    _reset(children)


# 生成的 joint 旋转数值为零, jointOrient 不为零
def joint_obj(*args):
    sl = pm.ls(sl=True)
    for obj in sl:
        dummy = pm.group(empty=True)
        pm.delete(pm.parentConstraint(obj, dummy))
        t = pm.xform(dummy, q=True, t=True, ws=True)
        ro = pm.xform(dummy, q=True, ro=True, ws=True)
        pm.select(cl=True)
        pm.joint(position=t, orientation=ro)
        pm.delete(dummy)


# 只镜像 translate 和 rotate, 不镜像 jointOrient
def joint_mirror(*args):
    sl = pm.selected()
    for old_jnt in sl:
        pm.select(cl=True)
        mirror_jnt = pm.joint()
        translate = pm.xform(old_jnt, q=True, t=True)
        rotate = pm.xform(old_jnt, q=True, ro=True)
        pm.xform(mirror_jnt, t=(-translate[0], translate[1], translate[2]))
        pm.xform(mirror_jnt, ro=(rotate[0], -rotate[1], rotate[2]))

        old_name = old_jnt.name()
        if '__r' in old_name:
            new_name = old_name.replace('__r', '__l')
        elif '__l' in old_name:
            new_name = old_name.replace('__l', '__r')
        else:
            new_name = old_name + '_mirrored'
        pm.rename(mirror_jnt, new_name)


def joint_point(*args):
    sl = pm.ls(sl=True, flatten=True)
    for point in sl:
        pm.select(cl=True)
        pm.joint(p=pm.xform(point, q=True, t=True, ws=True))


def locator_point(*args):
    sl = pm.ls(sl=True, flatten=True)
    for point in sl:
        translate = pm.xform(point, q=True, rp=True, ws=True)
        pm.xform(pm.spaceLocator(), t=translate)


def joint_insert():
    start_jnt = pm.selected()[0]
    num_insert = pm.intField('num_insert', q=True, value=True)
    jnt.insert(start_jnt, num_insert)


def joint_on_curve():
    pass


def main():
    win = 'jnt_editor_window'
    if pm.window(win, ex=True):
        pm.deleteUI(win)
    with pm.window(win):
        with pm.columnLayout(rowSpacing=5, columnAttach=('both', 5), adj=True):
            with pm.columnLayout():
                pm.text('Reset jointOrient')
                with pm.rowLayout(numberOfColumns=2):
                    pm.button(label='selected', c=reset_selection)
                    pm.button(label='Children', c=reset_children)
            with pm.columnLayout():
                pm.text('MirrorJnt (rotateY)')
                pm.button(label='MirrorJnt', c=joint_mirror)
            with pm.columnLayout():
                pm.text('create joints')
                with pm.rowLayout(numberOfColumns=5):
                    pm.button(label='on point', c=joint_point)
                    pm.button(label='on obj', c=joint_obj)
                    pm.button(label='locator on point', c=locator_point)
            with pm.columnLayout():
                pm.text('insert joints')
                with pm.rowLayout(numberOfColumns=2):
                    pm.intField('num_insert', w=40)
                    pm.button(label='apply', c=joint_insert)
            with pm.columnLayout():
                pm.text('create joints on curve')
                with pm.rowLayout(numberOfColumns=2):
                    pm.intField('num_on_curve', w=40)
                    pm.button(label='apply', c=joint_on_curve)
        pm.window(win, e=True, title='joint tool', wh=(240, 320))
        pm.showWindow(win)


if __name__ == '__main__':
    main()
