#!/usr/bin/python
# -*- coding:utf-8 -*-

import maya.OpenMaya as om
import maya.OpenMayaMPx as ommpx
import maya.cmds as cmds


class DeformerNode(ommpx.MPxDeformerNode):
    Name = 'deformerNode'
    ID = om.MTypeId(0x100fff)

    def __init__(self):
        super().__init__()

    def deform(self, data_block, geo_iter, matrix, multi_index):
        # geo_iter : MItgeometry object
        # matrix : geometry world transform matrix
        # multi_index : corresponding to the requested output geometry
        envelop = data_block.inputValue(self.envelope).asFloat()
        if envelop == 0:
            return

        geo_iter.reset()
        while not geo_iter.isDone():
            if geo_iter.index() % 2 == 0:
                pt = geo_iter.position()
                # pt.y += 2 * envelop
                pt = pt * matrix
                geo_iter.setPosition(pt)

            geo_iter.next()

    @classmethod
    def creator(cls):
        return DeformerNode()

    @classmethod
    def initialize(cls):
        pass


def initializePlugin(mobject):
    plugin_fn = ommpx.MFnPlugin(mobject, 'teng wei', '1.0')
    try:
        plugin_fn.registerNode(DeformerNode.Name, DeformerNode.ID, DeformerNode.creator, DeformerNode.initialize,
                               ommpx.MPxNode.kDeformerNode)
    except:
        om.MGlobal.displayError('Failed to register node : {0}'.format(DeformerNode.Name))


def uninitializePlugin(mobject):
    plugin_fn = ommpx.MFnPlugin(mobject)
    try:
        plugin_fn.deregisterNode(DeformerNode.ID)
    except:
        om.MGlobal.displayError('Failed to deregister node : {0}'.format(DeformerNode.Name))


def main():
    cmds.file(new=True, force=True)
    plugin_name = 'basic-DeformerNode.py'
    # if it is loaded, reload it
    cmds.evalDeferred('if cmds.pluginInfo("{0}",q=True,loaded=True):cmds.unloadPlugin("{0}")'.format(plugin_name))
    cmds.evalDeferred('if not cmds.pluginInfo("{0}",q=True,loaded=True):cmds.loadPlugin("{0}")'.format(plugin_name))
    # help speed to testing
    cmds.evalDeferred('cmds.file("D:\maya\deformer_text.mb", open=True, force=True)')
    cmds.evalDeferred('cmds.select("nurbsPlane1"); cmds.deformer(type="deformerNode")')


if __name__ == '__main__':
    main()
