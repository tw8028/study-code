import pymel.core as pm
import mytools.jnt as jnt
import mytools.attr as attr


# 只镜像 translate 和 rotate, 不镜像 jointOrient
def joint_mirror(*args):
    sl = pm.selected()
    for old_jnt in sl:
        jnt.mirror(old_jnt)


def joint_point(*args):
    sl = pm.ls(sl=True, flatten=True)
    for point in sl:
        pm.select(cl=True)
        pm.joint(p=pm.xform(point, q=True, t=True, ws=True))


# 生成的 joint 旋转数值为零, jointOrient 不为零
def joint_target(*args):
    sl = pm.ls(sl=True)
    for obj in sl:
        jnt.new(name='jnt__c__joint__001', target=obj)


def locator_point(*args):
    sl = pm.ls(sl=True, flatten=True)
    for point in sl:
        t = pm.xform(point, q=True, t=True, ws=True)
        loc = pm.spaceLocator()
        pm.xform(loc, t=t)


def locator_target(*args):
    sl = pm.selected()
    for target in sl:
        loc = pm.spaceLocator()
        pm.parent(loc, target)
        attr.reset(loc)
        pm.parent(loc, world=True)


def locator_center(*args):
    sl = pm.selected()
    loc = pm.spaceLocator()
    con = pm.pointConstraint(sl[0], sl[1], loc)
    pm.delete(con)


def joint_insert(*args):
    start_jnt = pm.selected()[0]
    num_insert = pm.intField('num_insert', q=True, value=True)
    jnt.insert(start_jnt, num_insert)


def joint_on_curve(*args):
    curve = pm.selected()[0]
    num = pm.intField('num_on_curve', q=True, value=True)
    jnt.on_curve(curve, num)


def show_window():
    name = 'my_jnt_editor_window'
    if pm.window(name, ex=True):
        print(f'delete win: {name}')
        pm.deleteUI(name, window=True)
    with pm.window(name):
        with pm.columnLayout(rowSpacing=5, columnAttach=('both', 5), adj=True):
            with pm.columnLayout():
                pm.text('MirrorJnt (rotateY)')
                pm.button(label='MirrorJnt', c=joint_mirror)
            with pm.columnLayout():
                pm.text('create joints')
                with pm.rowLayout(numberOfColumns=5):
                    pm.button(label='on point', c=joint_point)
                    pm.button(label='on target', c=joint_target)
            with pm.columnLayout():
                pm.text('create locator')
                with pm.rowLayout(numberOfColumns=5):
                    pm.button(label='on point', c=locator_point)
                    pm.button(label='on target', c=locator_target)
                    pm.button(label='on center', c=locator_center)
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
        pm.window(name, e=True, title='joint tool', wh=(240, 320))
        pm.showWindow(name)
