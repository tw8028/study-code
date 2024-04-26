#!/usr/bin/python
# -*- coding:utf-8 -*-
import pymel.core as pm


#  Create a new joint on the target postion
def new(target, *, name='joint'):
    _roo = pm.xform(target, q=True, roo=True)
    pm.select(target)
    jnt = pm.joint(n=name, roo=_roo)
    pm.select(cl=True)
    return jnt


# Insert part joints
def insert(start_jnt, num=1):
    end_jnt = pm.listRelatives(start_jnt, children=True)[0]
    jnt_offset = pm.PyNode(end_jnt).translateX.get() / (num + 1)
    _roo = pm.xform(start_jnt, q=True, roo=True)
    part_jnts = []
    n = 1
    pm.select(start_jnt)
    while n < num + 1:
        part_pn = pm.PyNode(pm.insertJoint())
        part_jnts.append(part_pn)
        # edit name and position
        pm.joint(part_pn, e=True, co=True, r=True, p=(jnt_offset, 0, 0), n="{0}_part{1}".format(start_jnt, n),
                 roo=_roo)
        n += 1
    return part_jnts
