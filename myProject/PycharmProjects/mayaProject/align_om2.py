#!/usr/bin/python
# -*- coding:utf-8 -*-
import maya.api.OpenMaya as om2


def align(target, obj):
    obj_list = om2.MSelectionList()
    # Parameters: pattern - string
    # Parameters: item - MObject, MDagPath, MPlug or tuple of (MDagPath, MObject)
    obj_list.add(target)
    obj_list.add(obj)
    target_path = obj_list.getDagPath(0)
    obj_path = obj_list.getDagPath(1)

    # compute matrix
    target_matrix = target_path.inclusiveMatrix()
    obj_parent_reverse_matrix = obj_path.exclusiveMatrixInverse()
    new_obj_matrix = target_matrix * obj_parent_reverse_matrix

    # set matrix
    new_transformation_Matrix = om2.MTransformationMatrix(new_obj_matrix)
    transform_fn = om2.MFnTransform(obj_path)
    transform_fn.setTransformation(new_transformation_Matrix)


def main():
    sel = om2.MGlobal.getActiveSelectionList()

    for i in range(1, sel.length()):
        target = sel.getDagPath(0)
        obj = sel.getDagPath(i)
        align(target, obj)


if __name__ == '__main__':
    main()
