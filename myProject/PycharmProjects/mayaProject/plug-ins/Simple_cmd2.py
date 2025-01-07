#!/usr/bin/python
# -*- coding:utf-8 -*-

import maya.api.OpenMaya as om2
import maya.cmds as cmds

maya_useNewAPI = True


class SimpleCmd(om2.MPxCommand):
    Name = 'simpleCmd'
    Version_flag = ['-v', '-version']
    Translate_flag = ['-t', 'translate', (om2.MSyntax.kDouble, om2.MSyntax.kDouble, om2.MSyntax.kDouble)]

    def __init__(self):
        super().__init__()
        self.undoable = False

    def doIt(self, arg_list):
        # Arguments pares
        try:
            arg_db = om2.MArgDatabase(self.syntax(), arg_list)
        except:
            self.displayError('Error parsing argument')
            raise

        sel_list = arg_db.getObjectList()
        self.sel_obj = sel_list.getDependNode(0)
        # check the type of the selection
        if self.sel_obj.apiType() is not om2.MFn.kTransform:
            raise RuntimeError('This command requires a transform node')

        self.edit = arg_db.isEdit
        self.query = arg_db.isQuery

        self.translate = arg_db.isFlagSet(SimpleCmd.Translate_flag[0])
        if self.translate:
            transform_fn = om2.MFnTransform(self.sel_obj)
            self.orig_translation = transform_fn.translation(om2.MSpace.kTransform)

            if self.edit:
                self.new_translation = [arg_db.flagArgumentDouble(SimpleCmd.Translate_flag[0], 0),
                                        arg_db.flagArgumentDouble(SimpleCmd.Translate_flag[0], 1),
                                        arg_db.flagArgumentDouble(SimpleCmd.Translate_flag[0], 2)]
                self.undoable = True

        self.version_flag_enabled = arg_db.isFlagSet(SimpleCmd.Version_flag[0])

        self.redoIt()

    def redoIt(self):
        transform_fn = om2.MFnTransform(self.sel_obj)
        if self.query:
            if self.translate:
                self.setResult(self.orig_translation)
            else:
                raise RuntimeError('Flag does not support query')

        elif self.edit:
            if self.translate:
                transform_fn.setTranslation(om2.MVector(self.new_translation), om2.MSpace.kTransform)
            else:
                raise RuntimeError('Flag does not support edit')

        elif self.version_flag_enabled:
            self.displayInfo('1.0.0')

    def undoIt(self):
        transform_fn = om2.MFnTransform(self.sel_obj)
        transform_fn.setTranslation(om2.MVector(self.orig_translation), om2.MSpace.kTransform)

    def isUndoable(self):
        return self.undoable

    @classmethod
    def creator(cls):
        return SimpleCmd()

    @classmethod
    def create_syntax(cls):  # When the registerCommand excute it will be called
        syntax = om2.MSyntax()
        syntax.enableEdit = True
        syntax.enableQuery = True

        syntax.addFlag(*cls.Translate_flag)
        syntax.addFlag(*cls.Version_flag)
        syntax.setObjectType(om2.MSyntax.kSelectionList, 1, 1)
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
    plugin_name = 'Simple_cmd2.py'
    # if it is loaded, reload it
    cmds.evalDeferred('if cmds.pluginInfo("{0}",q=True,loaded=True):cmds.unloadPlugin("{0}")'.format(plugin_name))
    cmds.evalDeferred('if not cmds.pluginInfo("{0}",q=True,loaded=True):cmds.loadPlugin("{0}")'.format(plugin_name))


if __name__ == '__main__':
    main()
