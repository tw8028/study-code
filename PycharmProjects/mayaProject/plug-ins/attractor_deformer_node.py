#!/usr/bin/python
# -*- coding:utf-8 -*-
import maya.OpenMaya as om
import maya.OpenMayaMPx as ommpx
import maya.cmds as cmds


class AttractorDeformerNode(ommpx.MPxDeformerNode):
    Name = 'attractorDeformerNode'
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

        max_distance = data_block.inputValue(AttractorDeformerNode.max_distance).asFloat()
        if max_distance == 0:
            return

        target_position = data_block.inputValue(AttractorDeformerNode.target_position).asFloatVector()
        # note: can't multiply vector to matrix
        target_position = om.MPoint(target_position) * world_matrix.inverse()
        target_position = om.MFloatVector(target_position)

        # def OpenMaya.MDataBlock.outputArrayValue(plug) -> MArryDataHandle
        input_handle = data_block.outputArrayValue(self.input)
        input_handle.jumpToElement(multi_index)
        # def OpenMaya.MArrayDataHandle.outputValue() -> MDataHandle
        input_element_handle = input_handle.outputValue()

        input_geom = input_element_handle.child(self.inputGeom).asMesh()
        mesh_fn = om.MFnMesh(input_geom)

        normals = om.MFloatVectorArray()
        mesh_fn.getVertexNormals(False, normals)

        geo_iter.reset()
        while not geo_iter.isDone():
            pt_local = geo_iter.position()

            # vector from geom's vetrix  to target
            target_vector = target_position - om.MFloatVector(pt_local)
            distance = target_vector.length()

            if distance <= max_distance:
                normal = om.MVector(normals[geo_iter.index()])
                normal = om.MFloatVector(normal)
                angle = normal.angle(target_vector)
                if angle <= 0.5 * 3.14159265:
                    offset = target_vector * ((max_distance - distance) / max_distance)
                    new_pt_local = pt_local + om.MVector(offset)
                    geo_iter.setPosition(new_pt_local)

            geo_iter.next()

    @classmethod
    def creator(cls):
        return AttractorDeformerNode()

    @classmethod
    def initialize(cls):
        numeric_attr = om.MFnNumericAttribute()

        cls.max_distance = numeric_attr.create('maximunDistance', 'maxDist', om.MFnNumericData.kFloat, 1.0)
        numeric_attr.setKeyable(True)
        numeric_attr.setMin(0.0)
        numeric_attr.setMin(2.0)

        cls.target_position = numeric_attr.createPoint('targetPosition', 'targetPos')
        numeric_attr.setKeyable(True)

        cls.addAttribute(cls.max_distance)
        cls.addAttribute(cls.target_position)

        output_geom = ommpx.cvar.MPxGeometryFilter_outputGeom
        cls.attributeAffects(cls.max_distance, output_geom)
        cls.attributeAffects(cls.target_position, output_geom)


def initializePlugin(mobject):
    plugin_fn = ommpx.MFnPlugin(mobject, 'teng wei', '1.0')
    try:
        plugin_fn.registerNode(AttractorDeformerNode.Name,
                               AttractorDeformerNode.ID,
                               AttractorDeformerNode.creator,
                               AttractorDeformerNode.initialize,
                               ommpx.MPxNode.kDeformerNode)
    except:
        om.MGlobal.displayError('Failed to register node : {0}'.format(AttractorDeformerNode.Name))


def uninitializePlugin(mobject):
    plugin_fn = ommpx.MFnPlugin(mobject)
    try:
        plugin_fn.deregisterNode(AttractorDeformerNode.ID)
    except:
        om.MGlobal.displayError('Failed to deregister node : {0}'.format(AttractorDeformerNode.Name))


def main():
    cmds.file(new=True, force=True)
    plugin_name = 'attractor_deformer_node.py'
    # if it is loaded, reload it
    cmds.evalDeferred('if cmds.pluginInfo("{0}",q=True,loaded=True):cmds.unloadPlugin("{0}")'.format(plugin_name))
    cmds.evalDeferred('if not cmds.pluginInfo("{0}",q=True,loaded=True):cmds.loadPlugin("{0}")'.format(plugin_name))
    # help speed to testing
    cmds.evalDeferred('cmds.file(r"D:/maya/attractor_deformer_test.mb", open=True, force=True)')
    cmds.evalDeferred('cmds.select("pSphere1"); cmds.deformer(type="attractorDeformerNode")')


if __name__ == '__main__':
    main()
