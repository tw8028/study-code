#!/usr/bin/python
# -*- coding:utf-8 -*-
import maya.OpenMaya as om
import maya.OpenMayaMPx as ommpx
import maya.cmds as cmds
import math


class RippleDeformerNode(ommpx.MPxDeformerNode):
    Name = 'rippleDeformerNode'
    ID = om.MTypeId(0x0007F7FE)

    def __init__(self):
        super().__init__()

    def deform(self, data_block, geo_iter, world_matrix, multi_index):
        # geo_iter : MItgeometry object
        # matrix : geometry world transform matrix
        # multi_index : corresponding to the requested output geometry
        envelope = data_block.inputValue(self.envelope).asFloat()
        if envelope == 0:
            return

        # def OpenMaya.MDataBlock.outputArrayValue(plug) -> MArryDataHandle
        input_handle = data_block.outputArrayValue(self.input)
        input_handle.jumpToElement(multi_index)
        # def OpenMaya.MArrayDataHandle.outputValue() -> MDataHandle
        input_element_handle = input_handle.outputValue()

        input_geom = input_element_handle.child(self.inputGeom).asMesh()
        mesh_fn = om.MFnMesh(input_geom)
        normals = om.MFloatVectorArray()
        mesh_fn.getVertexNormals(False, normals, om.MSpace.kObject)

        parameter_val = data_block.inputValue(RippleDeformerNode.parameter).asFloat()
        displace_val = data_block.inputValue(RippleDeformerNode.displace).asFloat()

        while not geo_iter.isDone():
            pt_local = geo_iter.position()
            n = geo_iter.index()
            pt_local.x = pt_local.x + math.sin(n + displace_val) + parameter_val * envelope * normals[n].x
            pt_local.y = pt_local.y + math.sin(n + displace_val) + parameter_val * envelope * normals[n].y
            pt_local.z = pt_local.z + math.sin(n + displace_val) + parameter_val * envelope * normals[n].z
            geo_iter.setPosition(pt_local)

            geo_iter.next()

    @classmethod
    def creator(cls):
        return RippleDeformerNode()

    @classmethod
    def initialize(cls):
        numeric_attr = om.MFnNumericAttribute()

        cls.parameter = numeric_attr.create('parameter', 'p', om.MFnNumericData.kFloat, 0.0)
        numeric_attr.setKeyable(True)
        numeric_attr.setMin(0.0)
        numeric_attr.setMax(1.0)

        cls.displace = numeric_attr.create('dispalce', 'd', om.MFnNumericData.kFloat, 0.0)
        numeric_attr.setKeyable(True)
        numeric_attr.setMin(0.0)
        numeric_attr.setMax(10.0)

        cls.addAttribute(cls.parameter)
        cls.addAttribute(cls.displace)

        # SWIG = simplified wrapper interface generator
        output_geom = ommpx.cvar.MPxGeometryFilter_outputGeom
        cls.attributeAffects(cls.parameter, output_geom)
        cls.attributeAffects(cls.displace, output_geom)


def initializePlugin(mobject):
    plugin_fn = ommpx.MFnPlugin(mobject, 'teng wei', '1.0')
    try:
        plugin_fn.registerNode(RippleDeformerNode.Name,
                               RippleDeformerNode.ID,
                               RippleDeformerNode.creator,
                               RippleDeformerNode.initialize,
                               ommpx.MPxNode.kDeformerNode)
    except:
        om.MGlobal.displayError('Failed to register node : {0}'.format(RippleDeformerNode.Name))


def uninitializePlugin(mobject):
    plugin_fn = ommpx.MFnPlugin(mobject)
    try:
        plugin_fn.deregisterNode(RippleDeformerNode.ID)
    except:
        om.MGlobal.displayError('Failed to deregister node : {0}'.format(RippleDeformerNode.Name))


def main():
    cmds.file(new=True, force=True)
    plugin_name = 'ripple_deformer_node.py'
    # if it is loaded, reload it
    cmds.evalDeferred('if cmds.pluginInfo("{0}",q=True,loaded=True):cmds.unloadPlugin("{0}")'.format(plugin_name))
    cmds.evalDeferred('if not cmds.pluginInfo("{0}",q=True,loaded=True):cmds.loadPlugin("{0}")'.format(plugin_name))
    # help speed to testing
    cmds.evalDeferred('cmds.file(r"D:/maya/ripple_deformer_test.mb", open=True, force=True)')
    cmds.evalDeferred('cmds.select("pSphere1"); cmds.deformer(type="rippleDeformerNode")')


if __name__ == '__main__':
    main()
