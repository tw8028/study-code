#!/usr/bin/python
# -*- coding:utf-8 -*-
import maya.api.OpenMaya as om2

maya_useNewAPI = True

nodeName = 'IKFKSwitchNode'
nodeID = om2.MTypeId(0x100fff)


class CVGNode(om2.MPxNode):
    idCallback = []

    def __init__(self):
        om2.MPxNode.__init__(self)
        for i in self.get_switch_cvs():
            self.idCallback.append(om2.MNodeMessage.addAttributeChangedCallback(i, self.callbackFunc))
        self.idCallback.append(om2.MDGMessage.addNodeRemovedCallback(self.remove, 'dependNode'))

    def get_switch_cvs(self):
        switch_cvs = []
        dagIterator = om2.MItDag(om2.MItDag.kDepthFirst, om2.MFn.kInvalid)
        dagNodeFn = om2.MFnDagNode()
        while (not dagIterator.isDone()):
            curentObj = dagIterator.currentItem()
            dagNodeFn.setObject(curentObj)
            name = dagNodeFn.name()
            if '_switch_ctrl' in name and '_offset' not in name:
                switch_cvs.append(curentObj)
            dagIterator.next()
        return switch_cvs

    def callbackFunc(self, *args):
        sel = om2.MGlobal.getActiveSelectionList()  # return MSelectionList
        # Get attribute by DependencyNode
        dependencyNode_Fn = om2.MFnDependencyNode()
        dependencyNode_Fn.setObject(sel.getDependNode(0))
        plug = dependencyNode_Fn.findPlug('IKFK', False)
        if plug.asFloat() == 0:
            psss
        else:
            pass

    def remove(self, *args):
        try:
            # check if this node exists in the scence
            om2.MSelectionList.add(self.thisMObject())
        except:
            # remove callback
            for i in self.idCallback:
                try:
                    om2.MMessage.removeCallback(i)
                except:
                    pass


def nodeCreator():
    return CVGNode()


def nodeInitializer():
    pass


def initializePlugin(plugin):
    vendor = 'tengwei'
    version = '1.0'
    mplugin = om2.MFnPlugin(plugin, vendor, version)
    try:
        mplugin.registerNode(nodeName, nodeID, nodeCreator, nodeInitializer)
    except:
        print("Failed to register command :" + nodeName)


def uninitializePlugin(plugin):
    mplugin = om2.MFnPlugin(plugin)
    try:
        mplugin.deregisterNode(nodeID)
    except:
        print("Failed to register command:" + nodeName)
