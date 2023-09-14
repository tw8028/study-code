#!/usr/bin/python
# -*- coding:utf-8 -*-
import sys
import maya.OpenMaya as OpenMaya
import maya.OpenMayaMPx as OpenMayaMPx
import maya.OpenMayaFX as OpenMayaFX

command_name = "vertexPartical"
kHelpFlag = '-h'
kHelpLongFlag = '-help'
kSparesFlag = '-s'
kSparesLongFlag = 'spares'
helpMessage = 'This command is used to attach a particle on each mesh vertex'


class pluginCommand(OpenMayaMPx.MPxCommand):
    spare = None

    def __init__(self):
        OpenMayaMPx.MPxCommand.__init__(self)
        self.undoable = False

    def argument_pares(self, arglist):
        syntax = self.syntax()
        pares_argument = OpenMaya.MArgDatabase(syntax, arglist)
        if pares_argument.isFlagSet(kSparesFlag):
            self.spare = pares_argument.flagArgumentDouble(kSparesFlag, 0)

        if pares_argument.isFlagSet(kSparesLongFlag):
            self.spare = pares_argument.flagArgumentDouble(kSparesLongFlag, 0)

        if pares_argument.isFlagSet(kHelpFlag):
            self.setResult(helpMessage)

        if pares_argument.isFlagSet(kHelpLongFlag):
            self.setResult(helpMessage)

    def isUndoable(self):
        return True

    def undoIt(self):
        print('undo')
        mFnDagNode = OpenMaya.MFnDagNode(self.mObj_particle)
        mDagModifier = OpenMaya.MDagModifier()
        mDagModifier.deleteNode(mFnDagNode.parent(0))
        mDagModifier.doIt()

    def redoIt(self):
        mSel = OpenMaya.MSelectionList()
        mDagPath = OpenMaya.MDagPath()
        mFnMesh = OpenMaya.MFnMesh()
        OpenMaya.MGlobal.getActiveSelectionList(mSel)
        if mSel.length() > 0:
            try:
                mSel.getDagPath(0, mDagPath)
                mFnMesh.setObject(mDagPath)
            except:
                print('select a poly mesh')
                return 'unknown'
        else:
            print('select a poly mesh')
            return 'unkown'
        mPointArray = OpenMaya.MPointArray()
        mFnMesh.getPoints(mPointArray, OpenMaya.MSpace.kWorld)

        # create a particle system
        mFnParticle = OpenMayaFX.MFnParticleSystem()
        self.mObj_particle = mFnParticle.create()
        # to fix maya bug
        mFnParticle = OpenMayaFX.MFnParticleSystem(self.mObj_particle)
        counter = 0
        for i in range(mPointArray.length()):
            if i % self.spare == 0:
                mFnParticle.emit(mPointArray[i])
                counter += 1
        print('Total points :' + str(counter))
        mFnParticle.saveInitialState()

    def doIt(self, arglist):
        print("do it...")
        self.argument_pares(arglist)
        if self.spare is not None:
            self.redoIt()


def creator():
    return OpenMayaMPx.asMPxPtr(pluginCommand())


def syntax_create():
    syntax = OpenMaya.MSyntax()
    syntax.addFlag(kHelpFlag, kHelpLongFlag)
    syntax.addFlag(kSparesFlag, kHelpLongFlag, OpenMaya.MSyntax.kDouble)
    return syntax


def initializePlugin(mobject):
    mplugin = OpenMayaMPx.MFnPlugin(mobject)
    try:
        mplugin.registerCommand(command_name, creator, syntax_create)
    except:
        sys.stderr.write("Failed to register command :" + command_name)


def uninitializePlugin(mobject):
    mplugin = OpenMayaMPx.MFnPlugin(mobject)
    try:
        mplugin.deregisterCommand(command_name)
    except:
        sys.stderr.write("Failed to register command:" + command_name)
