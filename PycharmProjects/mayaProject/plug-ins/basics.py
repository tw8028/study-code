#!/usr/bin/python
# -*- coding:utf-8 -*-
import maya.api.OpenMaya as om2

sel = om2.MGlobal.getActiveSelectionList()  # return MSelectionList
for i in range(sel.length()):
    print('--------')
    obj = sel.getDependNode(i)
    print('apiTypeStr : {0}'.format(obj.apiTypeStr))
    # Check if function set is compatible with the MObject
    if obj.hasFn(om2.MFn.kDependencyNode):
        # Attach supported function set to MObject
        depend_fn = om2.MFnDependencyNode(obj)
        print('Dependency Node : {0}'.format(depend_fn.name()))

        if obj.hasFn(om2.MFn.kTransform):
            # Attach supported function set to MObject
            transform_fn = om2.MFnTransform(obj)
            translnte = transform_fn.translation(om2.MSpace.kTransform)
            rotate = transform_fn.rotation(om2.MSpace.kTransform)
            print('Translate : {0}'.format(translnte))
            print('Rotate : {0}'.format(rotate))

        elif obj.hasFn(om2.MFn.kMesh):
            mesh_fn = om2.MFnMesh(obj)
            print('Mesh Vertices : {0}'.format(mesh_fn.getVertices()))

        elif obj.hasFn(om2.MFn.kCamera):  # cameraShape
            camera_fn = om2.MFnCamera(obj)
            print('Clipping Planes : {0}, {1}'.format(camera_fn.nearClippingPlane, camera_fn.farClippingPlane))

    # Get DagPath
    obj_dag = sel.getDagPath(i)
    try:
        print('Matrix : {0}'.format(obj_dag.inclusiveMatrix()))
    except:
        pass
    if obj_dag.hasFn(om2.MFn.kDagNode):
        # Attach supported function set to MObject
        dag_fn = om2.MFnDagNode(obj_dag)
        print('FullName : {0}'.format(dag_fn.fullPathName()))
        print('Name : {0}'.format(dag_fn.name()))
        try:
            plug = dag_fn.findPlug('translateX', False)
            print('Plug_val : {0}'.format(plug.asFloat()))
        except:
            pass
