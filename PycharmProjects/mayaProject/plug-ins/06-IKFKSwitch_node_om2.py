#!/usr/bin/python
# -*- coding:utf-8 -*-
import maya.api.OpenMaya as om2
import maya.cmds as cmds

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
        # Get selected
        # return MSelectionList
        sel = om2.MGlobal.getActiveSelectionList()
        # Get attribute by DependencyNode
        dependencyNode_Fn = om2.MFnDependencyNode()
        dependencyNode_Fn.setObject(sel.getDependNode(0))
        try:
            plug = dependencyNode_Fn.findPlug('IKFK', False)
        except:
            return

        ctrl_name = dependencyNode_Fn.name()
        jnt0_name = ctrl_name.replace('_switch_ctrl', '')
        jnt1_name = CVGNode.child_name(jnt0_name)
        jnt2_name = CVGNode.child_name(jnt1_name)
        # FKctrl123 ---> IKjnt123
        if plug.asBool() == False:
            fk_ctrl_0 = 'FK' + jnt0_name + '_ctrl'
            fk_ctrl_1 = 'FK' + jnt1_name + '_ctrl'
            fk_ctrl_2 = 'FK' + jnt2_name + '_ctrl'
            ik_jnt_0 = 'IK' + jnt0_name
            ik_jnt_1 = 'IK' + jnt1_name
            ik_jnt_2 = 'IK' + jnt2_name

            CVGNode.align(ik_jnt_0, fk_ctrl_0)
            CVGNode.align(ik_jnt_1, fk_ctrl_1)
            CVGNode.align(ik_jnt_2, fk_ctrl_2)

        # IKhandle, pole ----> FKjnt2 ,vecor
        else:
            handle_ctrl = 'IK' + jnt0_name + '_handleCtrl'
            pole_ctrl = 'IK' + jnt0_name + '_poleCtrl'
            fk_jnt_0 = 'FK' + jnt0_name
            fk_jnt_1 = 'FK' + jnt1_name
            fk_jnt_2 = 'FK' + jnt2_name

            CVGNode.align(fk_jnt_2, handle_ctrl)

            vector0 = CVGNode.get_vector_by_name(fk_jnt_0)
            vector1 = CVGNode.get_vector_by_name(fk_jnt_1)
            vector2 = CVGNode.get_vector_by_name(fk_jnt_2)

            vector_up = (vector1 - vector0).normalize()
            vector_down = (vector1 - vector2).normalize()
            vector_pole_dir = (vector_up + vector_down).normalize() * 40
            vector_pole = vector1 + vector_pole_dir

            m_list = om2.MSelectionList()
            m_list.add(pole_ctrl)
            pole_ctrl_path = m_list.getDagPath(0)
            transform_fn = om2.MFnTransform(pole_ctrl_path)
            transform_fn.setTranslation(vector_pole, om2.MSpace.kWorld)

    @staticmethod
    def get_vector_by_name(obj_name):
        m_list = om2.MSelectionList()
        m_list.add(obj_name)
        obj_path = m_list.getDagPath(0)
        transform_fn = om2.MFnTransform(obj_path)
        obj_vector = transform_fn.translation(om2.MSpace.kWorld)
        return obj_vector

    @staticmethod
    def child_name(parent_name):
        m_list = om2.MSelectionList()
        m_list.add(parent_name)
        parent_path = m_list.getDagPath(0)
        child_dag_fn = om2.MFnDagNode(parent_path.child(0))
        return child_dag_fn.name()

    @staticmethod
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


def initializePlugin(mobject):
    mplugin = om2.MFnPlugin(mobject, 'teng wei', '1.0')
    try:
        mplugin.registerNode(nodeName, nodeID, nodeCreator, nodeInitializer)
    except:
        print("Failed to register command :" + nodeName)


def uninitializePlugin(mobject):
    mplugin = om2.MFnPlugin(mobject)
    try:
        mplugin.deregisterNode(nodeID)
    except:
        print("Failed to deregister command:" + nodeName)


def main():
    cmds.file(new=True, force=True)
    plugin_name = '06-IKFKSwitch_node_om2.py'
    # if it is loaded, reload it
    cmds.evalDeferred('if cmds.pluginInfo("{0}",q=True,loaded=True):cmds.unloadPlugin("{0}")'.format(plugin_name))
    cmds.evalDeferred('if not cmds.pluginInfo("{0}",q=True,loaded=True):cmds.loadPlugin("{0}")'.format(plugin_name))

    cmds.evalDeferred('cmds.file("D:\maya\callback-test.mb", open=True, force=True)')
    cmds.evalDeferred('cmds.createNode("IKFKSwitchNode")')


if __name__ == '__main__':
    main()
