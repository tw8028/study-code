#!/usr/bin/python
# -*- coding:utf-8 -*-
import maya.api.OpenMaya as om2

switch_cvs = []
dagIterator = om2.MItDag(om2.MItDag.kDepthFirst, om2.MFn.kInvalid)
dagNodeFn = om2.MFnDagNode()
while (not dagIterator.isDone()):
    curentObj = dagIterator.currentItem()
    dagNodeFn.setObject(curentObj)
    name = dagNodeFn.name()
    if '_switch_ctrl' in name:
        if dagNodeFn.typeName == 'nurbsCurve':  # return shape
            root = name.split('_switch')[0]
            print('root joint : ' + root)
            switch_cvs.append(root)
    dagIterator.next()

