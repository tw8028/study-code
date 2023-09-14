#!/usr/bin/python
# -*- coding:utf-8 -*-
import sys
import maya.OpenMaya as OpenMaya
import maya.OpenMayaMPx as OpenMayaMPx

command_name = "pluginCommand"


class pluginCommand(OpenMayaMPx.MPxCommand):
    def __init__(self):
        OpenMayaMPx.MPxCommand.__init__(self)

    def doIt(self, arglist):
        print("do it...")


def creator():
    return OpenMayaMPx.asMPxPtr(pluginCommand())


def initializePlugin(mobject):
    mplugin = OpenMayaMPx.MFnPlugin(mobject)
    try:
        mplugin.registerCommand(command_name, creator)
    except:
        sys.stderr.write("Failed to register command :" + command_name)


def uninitializePlugin(mobject):
    mplugin = OpenMayaMPx.MFnPlugin(mobject)
    try:
        mplugin.deregisterCommand(command_name)
    except:
        sys.stderr.write("Failed to register command:" + command_name)
