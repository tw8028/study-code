#!/usr/bin/python
# -*- coding:utf-8 -*-

import maya.api.OpenMaya as om2
import maya.cmds as cmds

maya_useNewAPI = True


class SimpleCmd(om2.MPxCommand):
    Name = 'simpleCmd'
    Version_flag = ['-v', '-version']
    Name_flag = ['-n', '-name']

    def __init__(self):
        super().__init__()
        self.undoable = False

    def doIt(self, arg_list):
        # Arguments pares
        try:
            arg_db = om2.MArgDatabase(self.syntax(), arg_list)
        except:
            self.displayError('Error parsing argumentxx')
            raise

        version_flag_enabled = arg_db.isFlagSet(SimpleCmd.Version_flag[0])
        if version_flag_enabled:
            # setResult = return
            # self.setResult('1.0.0')
            self.displayInfo('1.0.0')
        else:
            sel_list = arg_db.getObjectList()
            for i in range(sel_list.length()):
                depend_fn = om2.MFnDependencyNode(sel_list.getDependNode(i))
                print(depend_fn.name())

    def undoIt(self):
        pass

    def redoIt(self):
        pass

    def isUndoable(self):
        return self.undoable

    @classmethod
    def creator(cls):
        return SimpleCmd()

    @classmethod
    def create_syntax(cls):  # When the registerCommand excute it will be called
        syntax = om2.MSyntax()
        syntax.addFlag(SimpleCmd.Version_flag[0], SimpleCmd.Version_flag[1])
        syntax.setObjectType(om2.MSyntax.kSelectionList)
        syntax.useSelectionAsDefault(True)
        return syntax


def initializePlugin(mobject):
    plugin_fn = om2.MFnPlugin(mobject, 'teng wei', '1.0')
    try:
        plugin_fn.registerCommand(SimpleCmd.Name, SimpleCmd.creator, SimpleCmd.create_syntax)
    except:
        om2.MGlobal.displayError('Failed to register command : {0}'.format(SimpleCmd.Name))


def uninitializePlugin(mobject):
    plugin_fn = om2.MFnPlugin(mobject)
    try:
        plugin_fn.deregisterCommand(SimpleCmd.Name)
    except:
        om2.MGlobal.displayError('Failed to deregister command : {0}'.format(SimpleCmd.Name))


def main():
    cmds.file(new=True, force=True)
    plugin_name = 'Simple_cmd.py'
    # if it is loaded, reload it
    cmds.evalDeferred('if cmds.pluginInfo("{0}",q=True,loaded=True):cmds.unloadPlugin("{0}")'.format(plugin_name))
    cmds.evalDeferred('if not cmds.pluginInfo("{0}",q=True,loaded=True):cmds.loadPlugin("{0}")'.format(plugin_name))


if __name__ == '__main__':
    main()
