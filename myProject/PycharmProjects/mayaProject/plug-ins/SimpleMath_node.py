#!/usr/bin/python
# -*- coding:utf-8 -*-

import maya.api.OpenMaya as om2
import maya.cmds as cmds

maya_useNewAPI = True


class MultiplyNode(om2.MPxNode):
    Name = 'multiplyNode'
    ID = om2.MTypeId(0x100fff)

    multiplicer_obj = None
    multiplicand_obj = None
    product_obj = None

    def __init__(self):
        super().__init__()

    def compute(self, plug, dataBlock):
        # plug needs to be updataed the output
        if plug == MultiplyNode.product_obj:
            multiplicer = dataBlock.inputValue(MultiplyNode.multiplicer_obj).asInt()
            multiplicand = dataBlock.inputValue(MultiplyNode.multiplicand_obj).asFloat()
            product = multiplicer * multiplicand
            product_data_handle = dataBlock.outputValue(MultiplyNode.product_obj)
            product_data_handle.setFloat(product)
            dataBlock.setClean(plug)

    @classmethod
    def creator(cls):
        return MultiplyNode()

    @classmethod
    def initialize(cls):
        numeric_attr = om2.MFnNumericAttribute()
        cls.multiplicer_obj = numeric_attr.create('multiplicer', 'mul', om2.MFnNumericData.kInt, 2)
        numeric_attr.keyable = True

        cls.multiplicand_obj = numeric_attr.create('multiplicand', 'mulc', om2.MFnNumericData.kFloat, 0)
        numeric_attr.keyable = True

        cls.product_obj = numeric_attr.create('product', 'prod', om2.MFnNumericData.kFloat, 0)
        numeric_attr.keyable = False
        numeric_attr.readable = True
        numeric_attr.writable = False
        numeric_attr.storable = False

        cls.addAttribute(cls.multiplicer_obj)
        cls.addAttribute(cls.multiplicand_obj)
        cls.addAttribute(cls.product_obj)
        cls.attributeAffects(cls.multiplicer_obj, cls.product_obj)
        cls.attributeAffects(cls.multiplicand_obj, cls.product_obj)


def initializePlugin(mobject):
    plugin_fn = om2.MFnPlugin(mobject, 'teng wei', '1.0')
    try:
        plugin_fn.registerNode(MultiplyNode.Name, MultiplyNode.ID, MultiplyNode.creator, MultiplyNode.initialize,
                               om2.MPxNode.kDependNode)
    except:
        om2.MGlobal.displayError('Failed to register node : {0}'.format(MultiplyNode.Name))


def uninitializePlugin(mobject):
    plugin_fn = om2.MFnPlugin(mobject)
    try:
        plugin_fn.deregisterNode(MultiplyNode.ID)
    except:
        om2.MGlobal.displayError('Failed to deregister node : {0}'.format(MultiplyNode.Name))


def main():
    cmds.file(new=True, force=True)
    plugin_name = 'SimpleMath_node.py'
    # if it is loaded, reload it
    cmds.evalDeferred('if cmds.pluginInfo("{0}",q=True,loaded=True):cmds.unloadPlugin("{0}")'.format(plugin_name))
    cmds.evalDeferred('if not cmds.pluginInfo("{0}",q=True,loaded=True):cmds.loadPlugin("{0}")'.format(plugin_name))


if __name__ == '__main__':
    main()
