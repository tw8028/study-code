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


class Switch:
    def __init__(self, switch_ctrl):
        self.attr = switch_ctrl + '.IKFK'
        self.jnt0 = switch_ctrl.replace('_switch_ctrl', '')
        self.jnt1 = cmds.listRelatives(self.jnt0, children=True)[0]
        print(self.jnt0)

        self.jnt2 = cmds.listRelatives(self.jnt1, children=True)[0]

        self.fkctrl0 = 'FK' + self.jnt0 + '_ctrl'
        self.fkctrl1 = 'FK' + self.jnt1 + '_ctrl'
        self.fkctrl2 = 'FK' + self.jnt2 + '_ctrl'

        self.poleCtrl = 'IK' + self.jnt0 + '_poleCtrl'
        self.handleCtrl = 'IK' + self.jnt0 + '_handleCtrl'


class CVGNode(OpenMayaMPx.MPxNode):
    idCallback = []

    def __init__(self):
        OpenMayaMPx.MPxNode.__init__(self)
        # event callback
        #self.idCallback.append(OpenMaya.MEventMessage.addEventCallback('SelectionChanged', self.callbackFunc))
        # attributeChangedCallback
        self.node = self
        self.idCallback.append(OpenMaya.MNodeMessage.addAttributeChangedCallback(self.node(), self.acf))
        # DG callback
        self.idCallback.append(OpenMaya.MDGMessage.addNodeRemovedCallback(self.remove, 'dependNode'))

    def sel_by_name(self):
        mit_dag

    def acf(self):
        node = OpenMaya.MSelectionList()
        OpenMaya.MGlobal.getActiveSelectionList(node)
        dgNodeFn = OpenMaya.MFnDependencyNode()
        plug1 = OpenMaya.MPlug()
        try:
            node.getDependNode(dgNodeFn)
            plug1 = dgNodeFn.findPlug('IKFK')
        except:
            print('not IK FK Switch')
            return
        plug1_val = plug1.asFloat()
        if plug1_val == 0:
            print('FK mode')
        if plug1_val == 1:
            print('IK mode')

    def callbackFunc(self, *args):
        obj = OpenMaya.MSelectionList()
        OpenMaya.MGlobal.getActiveSelectionList(obj)
        mDagPath = OpenMaya.MDagPath()
        dagNodeFn = OpenMaya.MFnDagNode()
        if obj.length() > 0:
            try:
                obj.getDagPath(0, mDagPath)
                dagNodeFn.setObject(mDagPath)
            except:
                return
        else:
            return
        name = dagNodeFn.name()
        # Get joints name by switch ctrl
        mList = OpenMaya.MSelectionList()
        if '_switch_ctrl' in name:
            jnt0Name = name.replace('_switch_ctrl', '')
            mList.add(jnt0Name)
        else:
            return
        mList.getDagPath(0, mDagPath)
        dagNodeFn.setObject(mDagPath)
        mObj_jnt1 = dagNodeFn.child(0)
        dagNodeFn.setObject(mObj_jnt1)
        jnt1Name = dagNodeFn.name()
        mObj_jnt2 = dagNodeFn.child(0)
        dagNodeFn.setObject(mObj_jnt2)
        jnt2Name = dagNodeFn.name()
        # Get all object names
        ikjnt0_str = 'IK' + jnt0Name
        ikjnt1_str = 'IK' + jnt1Name
        ikjnt2_str = 'IK' + jnt2Name

        fkjnt0_str = 'FK' + jnt0Name
        fkjnt1_str = 'FK' + jnt1Name
        fkjnt2_str = 'FK' + jnt2Name

        fkctrl0_str = 'FK' + jnt0Name + '_ctrl'
        fkctrl1_str = 'FK' + jnt1Name + '_ctrl'
        fkctrl2_str = 'FK' + jnt2Name + '_ctrl'

        poleCtrl = 'IK' + jnt0Name + '_poleCtrl'
        handleCtrl = 'IK' + jnt0Name + '_handleCtrl'
        # check switch_ctrl attribute

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
