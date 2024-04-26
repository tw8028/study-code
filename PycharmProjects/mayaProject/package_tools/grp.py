#!/usr/bin/python
# -*- coding:utf-8 -*-
import pymel.core as pm


# create offset group for child on the target position
# do not use joint in child
def offset(name='offset', *, pos, child):
    grp = pm.group(empty=True, n=name)
    _roo = pm.xform(pos, q=True, roo=True)
    pm.parent(child, grp)
    pm.xform(child, t=(0, 0, 0), ro=(0, 0, 0), roo=_roo)
    pm.parent(grp, pos)
    pm.xform(grp, t=(0, 0, 0), ro=(0, 0, 0), roo=_roo)
    pm.parent(grp, w=True)
    return grp


# create a group on the target position
def target(name='group', *, pos):
    grp = pm.group(empty=True, n=name)
    _roo = pm.xform(pos, q=True, roo=True)
    pm.parent(grp, pos)
    pm.xform(grp, t=(0, 0, 0), ro=(0, 0, 0), roo=_roo)
    pm.parent(grp, w=True)
    return grp
