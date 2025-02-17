#!/usr/bin/python
# -*- coding:utf-8 -*-
import pymel.core as pm


# create rig group
def rig_group(*args):
    pm.group(empty=True, name='Group')
    pm.group(empty=True, name='Geometry')
    pm.group(empty=True, name='DeformationSystem')
    pm.group(empty=True, name='MotionSystem')
    pm.parent('Geometry', 'DeformationSystem', 'MotionSystem', 'Group')

    pm.group(empty=True, name='MainSystem')
    pm.circle(nr=(0, 1, 0), r=30, name='world_ctrl', ch=False)
    pm.circle(nr=(0, 1, 0), r=25, name='local_ctrl', ch=False)
    pm.circle(nr=(0, 1, 0), r=20, name='Main', ch=False)
    group_p = 'MotionSystem'
    for i in ['MainSystem', 'world_ctrl', 'local_ctrl', 'Main']:
        pm.parent(i, group_p)
        group_p = i


# create offset group
def offset_grp(*args):
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

def main():
    if pm.window('Tools', ex=True):
        pm.deleteUI('Tools')
    pm.window('Tools')
    pm.columnLayout()
    pm.button(label='rig group', c=rig_group)
    pm.button(label='offset', c=offset_grp)

    pm.window('Tools', e=True, wh=(200, 200))
    pm.showWindow('Tools')


if __name__ == '__main__':
    main()
