#!/usr/bin/python
# -*- coding:utf-8 -*-

import maya.api.OpenMaya as om2
import maya.cmds as cmds

maya_useNewAPI = True


# This command is used to align two selected objects
class AlignCmd(om2.MPxCommand):
    Name = 'alignCmd'
    Translate_flag = ['-t', 'translate', om2.MSyntax.kBoolean]
    Rotate_flag = ['-ro', 'rotate', om2.MSyntax.kBoolean]

    def __init__(self):
        super().__init__()
        self.undoable = False

    def doIt(self, arg_list):
        # Arguments pares
        try:
            arg_db = om2.MArgDatabase(self.syntax(), arg_list)
        except:
            self.displayError('Error parsing argument')
            return

        try:
            self.sel_list = arg_db.getObjectList()
        except:
            return

        self.obj_paths = []
        for i in range(self.sel_list.length()):
            obj_path = self.sel_list.getDagPath(i)
            # if obj_path.apiType() is not om2.MFn.kTransform:
            #     raise RuntimeError('This command requires transform node')
            self.obj_paths.append(obj_path)

        self.target_matrix = self.obj_paths[0].inclusiveMatrix()

        self.translate_enable = arg_db.isFlagSet(AlignCmd.Translate_flag[0])
        self.translate = arg_db.flagArgumentBool(AlignCmd.Translate_flag[0], 0)
        self.rotate_enable = arg_db.isFlagSet(AlignCmd.Rotate_flag[0])
        self.rotate = arg_db.flagArgumentBool(AlignCmd.Rotate_flag[0], 0)

        self.redoIt()

    def redoIt(self):
        for obj_path in self.obj_paths[1:]:
            obj_parent_reverse_matrix = obj_path.exclusiveMatrixInverse()
            new_obj_matrix = self.target_matrix * obj_parent_reverse_matrix
            # Convers MMatrix to MTransformationMatrix
            new_tm = om2.MTransformationMatrix(new_obj_matrix)
            transform_fn = om2.MFnTransform(obj_path)
            if self.translate_enable:
                if self.translate is not False:
                    transform_fn.setTranslation(new_tm.translation(om2.MSpace.kTransform), om2.MSpace.kTransform)
            if self.rotate_enable:
                if self.rotate is not False:
                    transform_fn.setRotation(new_tm.rotation(om2.MSpace.kTransform), om2.MSpace.kTransform)

    def undoIt(self):
        pass

    def isUndoable(self):
        return self.undoable

    @classmethod
    def creator(cls):
        return AlignCmd()

    @classmethod
    def create_syntax(cls):  # When the registerCommand excute it will be called
        syntax = om2.MSyntax()

        syntax.addFlag(*cls.Translate_flag)
        syntax.addFlag(*cls.Rotate_flag)
        syntax.setObjectType(om2.MSyntax.kSelectionList, 2)
        syntax.useSelectionAsDefault(True)
        return syntax


def initializePlugin(mobject):
    plugin_fn = om2.MFnPlugin(mobject, 'teng wei', '1.0')
    try:
        plugin_fn.registerCommand(AlignCmd.Name, AlignCmd.creator, AlignCmd.create_syntax)
    except:
        om2.MGlobal.displayError('Failed to register command : {0}'.format(AlignCmd.Name))


def uninitializePlugin(mobject):
    plugin_fn = om2.MFnPlugin(mobject)
    try:
        plugin_fn.deregisterCommand(AlignCmd.Name)
    except:
        om2.MGlobal.displayError('Failed to deregister command : {0}'.format(AlignCmd.Name))


def main():
    cmds.file(new=True, force=True)
    plugin_name = 'align_cmd.py'
    # if it is loaded, reload it
    cmds.evalDeferred('if cmds.pluginInfo("{0}",q=True,loaded=True):cmds.unloadPlugin("{0}")'.format(plugin_name))
    cmds.evalDeferred('if not cmds.pluginInfo("{0}",q=True,loaded=True):cmds.loadPlugin("{0}")'.format(plugin_name))

    cmds.evalDeferred('cmds.file(r"D:/maya/align_text.mb", open=True, force=True)')
    # cmds.evalDeferred('cmds.select("pCube1", "pCylinder1"); cmds.alignCmd(t=True,ro=True)')


if __name__ == '__main__':
    main()
