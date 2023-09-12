#!/usr/bin/python
# -*- coding:utf-8 -*-
import maya.api.OpenMaya as om2

sel = om2.MGlobal.getActiveSelectionList()  # return MSelectionList
# get name by dag
#
# dag_Fn = om2.MFnDagNode()
# dag_Fn.setObject(sel.getDagPath(0))
# print(dagNodeFn.name())
#

# get name by dg
#
dg_Fn = om2.MFnDependencyNode()
dg_Fn.setObject(sel.getDependNode(0))
plug = dg_Fn.findPlug('IKFK', False)
print(plug.asFloat())

dag_Fn = om2.MFnDagNode()
dag_Fn.setObject(sel.getDagPath(0))
plug2 = dag_Fn.findPlug('IKFK',False)
print(plug2.asFloat())