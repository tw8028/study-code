#!/usr/bin/python
# -*- coding:utf-8 -*-
import maya.api.OpenMaya as om2

sel = om2.MGlobal.getActiveSelectionList()
obj = sel.getDependNode(0)

# Check if function set is compatible with the MObject
if obj.hasFn(om2.MFn.kTransform):

    transform_fn = om2.MFnTransform(obj)

    # plug = transform_fn.findPlug('translateY', False)
    # attr_val = plug.asDouble()
    # print('{0} : {1}'.format(plug, attr_val))
    # plug.setDouble(0.5)

    translation = transform_fn.translation(om2.MSpace.kTransform)
    translation[2] = 0
    transform_fn.setTranslation(translation, om2.MSpace.kTransform)


