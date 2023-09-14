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
nodeName = 'wheelNode'
nodeID = OpenMaya.MTypeId(0x100fff)


class WheelNode(OpenMayaMPx.MPxNode):
    inRadius = OpenMaya.MObject()
    inTranslate = OpenMaya.MObject()
    outRotate = OpenMaya.MObject()

    def __init__(self):
        OpenMayaMPx.MPxNode.__init__(self)
    # plug : The parameter informs us of which plug we are cleaning with our computation.
    # dataBlock :
    def compute(self, plug, dataBlock):
        if plug == WheelNode.outRotate:
            # Get inputPlugs
            dateHandleRadius = dataBlock.inputValue(WheelNode.inRadius)
            dateHandleTranslate = dataBlock.inputValue(WheelNode.inTranslate)
            # compute
            inRadiusVal = dateHandleRadius.asFloat()
            inTranslateVal = dateHandleTranslate.asFloat()
            outRotate = inTranslateVal / float(2 * 3.14 * inRadiusVal) * (-360)
            # Get outPlug
            dataHandleRotate = dataBlock.outputValue(WheelNode.outRotate)
            # Set outputValue for Plug
            dataHandleRotate.setFloat(outRotate)
            dataBlock.setClean(plug)
        else:
            return 'unknown'


def creator():
    return OpenMayaMPx.asMPxPtr(WheelNode())


def nodeInitializer():
    # 1.create a function set for numeric attributes
    mFnAttr = OpenMaya.MFnNumericAttribute()
    # 2.create the attributes
    WheelNode.inRadius = mFnAttr.create('radius', 'r', OpenMaya.MFnNumericData.kFloat, 0.0)
    mFnAttr.setReadable(1)
    mFnAttr.setWritable(1)
    mFnAttr.setStorable(1)
    mFnAttr.setKeyable(1)
    WheelNode.inTranslate = mFnAttr.create('translate', 't', OpenMaya.MFnNumericData.kFloat, 0.0)
    mFnAttr.setReadable(1)
    mFnAttr.setWritable(1)
    mFnAttr.setStorable(1)
    mFnAttr.setKeyable(1)
    WheelNode.outRotate = mFnAttr.create('rotate', 'ro', OpenMaya.MFnNumericData.kFloat, 0.0)
    mFnAttr.setReadable(1)
    mFnAttr.setWritable(0)
    mFnAttr.setStorable(0)
    mFnAttr.setKeyable(0)
    # 3.attaching attributes to the Node
    WheelNode.addAttribute(WheelNode.inRadius)
    WheelNode.addAttribute(WheelNode.inTranslate)
    WheelNode.addAttribute(WheelNode.outRotate)
    # 4.design circuitry
    WheelNode.attributeAffects(WheelNode.inRadius, WheelNode.outRotate)
    WheelNode.attributeAffects(WheelNode.inTranslate, WheelNode.outRotate)


def initializePlugin(mobject):
    mplugin = OpenMayaMPx.MFnPlugin(mobject)
    try:
        mplugin.registerNode(nodeName, nodeID, creator, nodeInitializer)
    except:
        sys.stderr.write("Failed to register command :" + nodeName)


def uninitializePlugin(mobject):
    mplugin = OpenMayaMPx.MFnPlugin(mobject)
    try:
        mplugin.deregisterNode(nodeName)
    except:
        sys.stderr.write("Failed to register command:" + nodeName)
