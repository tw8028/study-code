#!/usr/bin/python
# -*- coding:utf-8 -*-
import maya.OpenMaya as OpenMaya
import maya.OpenMayaMPx as OpenMayaMPx

# attributes ---> plug
# date_block ----> data_handle
# 1.create function
# 2.initialize
# 3.initializePlugin
# 4.uninitializePlugin
nodeName = 'CVGKNode'
nodeID = OpenMaya.MTypeId(0x100fff)


class CVGNode(OpenMayaMPx.MPxNode):
    idCallback = []

    def __init__(self):
        OpenMayaMPx.MPxNode.__init__(self)
        # event callback
        self.idCallback.append(OpenMaya.MEventMessage.addEventCallback('SelectionChanged', self.callbackFunc))
        # DG callback
        self.idCallback.append(OpenMaya.MDGMessage.addNodeRemovedCallback(self.remove, 'dependNode'))

    @staticmethod
    def get_sel_name():
        obj = OpenMaya.MSelectionList()
        OpenMaya.MGlobal.getActiveSelectionList(obj)
        mDagPath = OpenMaya.MDagPath()
        dagNodeFn = OpenMaya.MFnDagNode()
        try:
            obj.getDagPath(0, mDagPath)
            dagNodeFn.setObject(mDagPath)
            return dagNodeFn.name()
        except:
            pass


    def callbackFunc(self, *args):
        print(CVGNode.get_sel_name())

    def remove(self, *args):
        try:
            # check if this node exists in the scence
            OpenMaya.MSelectionList.add(self.thisMObject())
        except:
            # remove callback
            for i in range(len(self.idCallback)):
                try:
                    OpenMaya.MEventMessage.removeCallback(self.idCallback[i])
                except:
                    pass
                try:
                    OpenMaya.MDGMessage.removeCallback(self.idCallback[i])
                except:
                    pass


def creator():
    return OpenMayaMPx.asMPxPtr(CVGNode())


def nodeInitializer():
    pass


def initializePlugin(mobject):
    mplugin = OpenMayaMPx.MFnPlugin(mobject, 'tengwei', '1.0')
    try:
        mplugin.registerNode(nodeName, nodeID, creator, nodeInitializer)
    except:
        print("Failed to register command :" + nodeName)


def uninitializePlugin(mobject):
    mplugin = OpenMayaMPx.MFnPlugin(mobject)
    try:
        mplugin.deregisterNode(nodeID)
    except:
        print("Failed to register command:" + nodeName)
