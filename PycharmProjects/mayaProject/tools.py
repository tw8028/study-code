#!/usr/bin/python
# -*- coding:utf-8 -*-
import pymel.core as pm


# 1:create rig group
# 2:copy skin
# 3 create offset
# 4 create locators to control cv
# 5 pathConstraint locators on cv


# create main
def rig_group(*args):
    pm.group(empty=True, name='Group')
    pm.group(empty=True, name='DeformationSystem')
    pm.group(empty=True, name='MotionSystem')
    pm.group(empty=True, name='Geometry')
    pm.parent('Geometry', 'DeformationSystem', 'MotionSystem', 'Group')

    pm.group(empty=True, name='MainSystem')
    pm.circle(nr=(0, 1, 0), r=30, name='Main', ch=False)
    pm.group(empty=True, name='world_offset')
    pm.circle(nr=(0, 1, 0), r=25, name='world_ctrl', ch=False)
    pm.group(empty=True, name='local_offset')
    pm.circle(nr=(0, 1, 0), r=20, name='local_ctrl', ch=False)
    group_p = 'MotionSystem'
    for i in ['MainSystem', 'Main', 'world_offset', 'world_ctrl', 'local_offset', 'local_ctrl']:
        pm.parent(i, group_p)
        group_p = i


# copy skin from mesh a to mesh b
def copy_skin(*args):
    objs = pm.ls(sl=True)
    jot = pm.skinCluster(objs[0], q=True, inf=True)
    pm.select(jot)
    pm.select(objs[1], add=True)
    # create skin for mesh b
    pm.skinCluster(toSelectedBones=True)
    pm.select(objs)
    pm.copySkinWeights(noMirror=True, ia=('closestJoint', 'oneToOne'), sa='closestPoint')


def create_offset(*args):
    def create(obj):
        offset = pm.group(empty=True, n=obj + '_offset')
        _roo = pm.xform(obj, q=True, roo=True)
        pm.parent(offset, obj)
        pm.xform(offset, t=(0, 0, 0), ro=(0, 0, 0), roo=_roo)
        pm.parent(offset, w=True)
        pm.parent(obj, offset)

    objs = pm.ls(sl=True)
    for i in objs:
        create(i)


def locator_point(point):
    p = pm.xform(point, q=True, t=True, ws=True)
    loctor = pm.spaceLocator()
    pm.xform(loctor, t=p)
    return loctor


# create cv point ctrl
def point_ctrl(*args):
    obj = pm.selected()[0]
    for n in range(obj.controlPoints.get(size=True)):
        locatro_shap = locator_point(obj.cv[n]).getShape()
        locatro_shap.worldPosition >> obj.getShape().controlPoints[n]


# create cv pathConstraint
def path_cons(*args):
    obj = pm.selected()[0]
    num = pm.intField('path_num', q=True, v=True)
    u_value = 1 / (num - 1)
    for n in range(num):
        point_info = pm.createNode('pointOnCurveInfo', n='{0}_pocInfo{1}'.format(obj, n))
        path_locator = pm.spaceLocator(n='{0}_path{1}'.format(obj, n))
        pm.addAttr(path_locator, ln='u', at='double', min=0, max=1, dv=u_value * n, k=True)
        path_locator.u >> point_info.parameter
        obj.getShape().worldSpace[0] >> point_info.inputCurve
        point_info.result.position >> path_locator.translate


def main():
    if pm.window('Tools', ex=True):
        pm.deleteUI('Tools')
    pm.window('Tools')
    column = pm.columnLayout()
    pm.button(label='create main', c=rig_group)
    pm.button(label='copy skin', c=copy_skin)
    pm.button(label='create offset', c=create_offset)

    pm.text('curve ctrl tools')
    pm.button(label='cv point ctrl', c=point_ctrl)
    pm.rowLayout(nc=2)
    pm.intField('path_num', value=0, w=40)
    pm.button(label='pathConstraint', c=path_cons)
    pm.setParent(column)

    pm.window('Tools', title='Tools', e=True, wh=(240, 300))
    pm.showWindow('Tools')


if __name__ == '__main__':
    main()
