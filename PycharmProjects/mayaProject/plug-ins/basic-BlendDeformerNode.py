#!/usr/bin/python
# -*- coding:utf-8 -*-

import maya.OpenMaya as om
import maya.OpenMayaMPx as ommpx
import maya.cmds as cmds


class BlendDeformerNode(ommpx.MPxDeformerNode):
    Name = 'blendDeformerNode'
    ID = om.MTypeId(0x100fff)

    def __init__(self):
        super().__init__()

    def deform(self, data_block, geo_iter, matrix, multi_index):
        # geo_iter : MItgeometry object
        # matrix : geometry world transform matrix
        # multi_index : corresponding to the requested output geometry
        envelope = data_block.inputValue(self.envelope).asFloat()
        if envelope == 0:
            return

        blend_weight = data_block.inputValue(BlendDeformerNode.blend_weight).asFloat()
        if blend_weight == 0:
            return

        target_mesh = data_block.inputValue(BlendDeformerNode.blend_mesh).asMesh()
        if target_mesh.isNull():
            return
        target_points = om.MPointArray()
        target_mesh_fn = om.MFnMesh(target_mesh)
        target_mesh_fn.getPoints(target_points)

        gloal_weight = blend_weight * envelope
        geo_iter.reset()
        while not geo_iter.isDone():
            source_pt = geo_iter.position()
            target_pt = target_points[geo_iter.index()]
            final_pt = source_pt + (target_pt - source_pt) * gloal_weight

            geo_iter.setPosition(final_pt)
            geo_iter.next()

    @classmethod
    def creator(cls):
        return BlendDeformerNode()

    @classmethod
    def initialize(cls):
        type_attr = om.MFnTypedAttribute()
        cls.blend_mesh = type_attr.create('blendMesh', 'bMesh', om.MFnData.kMesh)

        numeric_attr = om.MFnNumericAttribute()
        cls.blend_weight = numeric_attr.create('blendWeight', 'bWeight', om.MFnNumericData.kFloat, 0.0)
        numeric_attr.setKeyable(True)
        numeric_attr.setMin(0.0)
        numeric_attr.setMax(1.0)

        cls.addAttribute(cls.blend_mesh)
        cls.addAttribute(cls.blend_weight)

        output_geo = ommpx.cvar.MPxGeometryFilter_outputGeom

        cls.attributeAffects(cls.blend_mesh, output_geo)
        cls.attributeAffects(cls.blend_weight, output_geo)


def initializePlugin(mobject):
    plugin_fn = ommpx.MFnPlugin(mobject, 'teng wei', '1.0')
    try:
        plugin_fn.registerNode(BlendDeformerNode.Name,
                               BlendDeformerNode.ID,
                               BlendDeformerNode.creator,
                               BlendDeformerNode.initialize,
                               ommpx.MPxNode.kDeformerNode)
    except:
        om.MGlobal.displayError('Failed to register node : {0}'.format(BlendDeformerNode.Name))


def uninitializePlugin(mobject):
    plugin_fn = ommpx.MFnPlugin(mobject)
    try:
        plugin_fn.deregisterNode(BlendDeformerNode.ID)
    except:
        om.MGlobal.displayError('Failed to deregister node : {0}'.format(BlendDeformerNode.Name))


def main():
    cmds.file(new=True, force=True)
    plugin_name = 'basic-BlendDeformerNode.py'
    # if it is loaded, reload it
    cmds.evalDeferred('if cmds.pluginInfo("{0}",q=True,loaded=True):cmds.unloadPlugin("{0}")'.format(plugin_name))
    cmds.evalDeferred('if not cmds.pluginInfo("{0}",q=True,loaded=True):cmds.loadPlugin("{0}")'.format(plugin_name))
    # help speed to testing
    cmds.evalDeferred('cmds.file(r"D:/maya/blend_deformer_test.mb", open=True, force=True)')
    cmds.evalDeferred('cmds.select("pSphere1"); cmds.deformer(type="blendDeformerNode")')
    cmds.evalDeferred("cmds.connectAttr('pSphereShape2.outMesh', 'blendDeformerNode1.blendMesh')")


if __name__ == '__main__':
    main()
