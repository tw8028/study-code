from abc import ABC

import pymel.core as pm
import mytools
from system_biped.core.component import Component
from system_biped.interface.connection import IConnectionPointUser
from system_biped.interface.connection import IConnectionPointProvider
from system_biped.interface.connection import ConnectionType


class Head(Component, IConnectionPointUser, ABC):
    def __init__(self, *, joints: list[str]):
        super().__init__(name='head', side='c', joints=joints)

        self.joints_fk = [f'jnt__c__{i}_fk__001' for i in joints]
        self.ctrl_list = [f'ctrl__c__{i}_fk__001' for i in joints]
        self.zero_list = [f'zero__c__{i}_fk__001' for i in joints]
        self.input_list = [f'input__c__{i}_fk__001' for i in joints]

        self.jnt_noRoll_01 = 'jnt__c__neck_noRoll_001'
        self.jnt_noRoll_02 = 'jnt__c__neck_noRoll_002'
        self.base = 'base__c__neck__001'

        self.ctrl_head = 'ctrl__c__head__001'
        self.zero_head = 'zero__c__head__001'

        self.constraint_objs = self.joints_fk[0:-1]

    def create(self):
        rig_list = []
        for jnt, jnt_fk, ctrl, zero, input in zip(self.joints, self.joints_fk, self.ctrl_list, self.zero_list,
                                                  self.input_list):
            rig_list.append(mytools.grp_target(name=input, target=jnt))
            rig_list.append(mytools.grp_target(name=zero, target=jnt))
            rig_list.append(mytools.cv_target(name=ctrl, target=jnt, shape='circle', radius=2))
            rig_list.append(mytools.jnt_target(name=jnt_fk, target=jnt))
        mytools.parent_chain(rig_list)

        # create no roll joint
        mytools.jnt_target(name=self.jnt_root, target=self.joints[0])
        mytools.jnt_target(name=self.jnt_noRoll_01, target=self.joints[0])
        mytools.jnt_target(name=self.jnt_noRoll_02, target=self.joints[-1])
        pm.parent(self.jnt_noRoll_02, self.jnt_noRoll_01)
        pm.parent(self.jnt_noRoll_01, self.jnt_root)
        ik_handle = pm.ikHandle(name=f'ik_handle__c__neck__001', startJoint=self.jnt_noRoll_01,
                                endEffector=self.jnt_noRoll_02)[0]
        pm.poleVectorConstraint(self.jnt_noRoll_01, ik_handle)
        zero_ik_handle = mytools.grp_zero(name='zero__c__neck_ikHandle__001', target=ik_handle)

        mytools.cv_and_zero(name=self.ctrl_cog, target=self.joints[0], shape='circle', radius=5)
        mytools.grp_sub(name='base__c__neck__001', target=self.zero_cog)
        pm.parent(self.input_list[0], self.jnt_root, self.zero_cog)
        pm.parent(zero_ik_handle, self.ctrl_cog)
        pm.parent(self.zero_cog, self.grp_rig)

        # head
        mytools.cv_and_zero(name=self.ctrl_head, target=self.joints[-1], shape='cube', radius=4)
        pm.parent(self.zero_head, self.jnt_noRoll_02)
        pm.orientConstraint(self.ctrl_head, self.joints[-1])

    def rig(self):
        base_nd = pm.PyNode(self.base)
        ctrl_nd = pm.PyNode(self.jnt_noRoll_01)
        for input in self.input_list[0:-1]:
            input_nd = pm.PyNode(input)
            attr_name = input.split('__')[2] + 'Bias'
            pm.addAttr(self.ctrl_cog, longName=attr_name, attributeType='float', minValue=0, maxValue=1, dv=0.5,
                       keyable=True)
            blend_matrix_nd = pm.createNode('blendMatrix', name='blendMatrix__' + attr_name)
            mult_matrix_nd = pm.createNode('multMatrix', name='multMatrix__' + attr_name)
            var = base_nd.worldMatrix[0] >> blend_matrix_nd.inputMatrix  # type:ignore
            var = ctrl_nd.worldMatrix[0] >> blend_matrix_nd.target[0].targetMatrix  # type:ignore

            var = pm.PyNode(f'{self.ctrl_cog}.{attr_name}') >> blend_matrix_nd.target[0].rotateWeight  # type:ignore
            var = blend_matrix_nd.outputMatrix >> mult_matrix_nd.matrixIn[0]
            var = input_nd.getParent().worldInverseMatrix[0] >> mult_matrix_nd.matrixIn[1]  # type:ignore
            decompose_nd = pm.createNode('decomposeMatrix', name='decompose__' + attr_name)
            var = mult_matrix_nd.matrixSum >> decompose_nd.inputMatrix
            var = decompose_nd.outputRotate >> input_nd.rotate  # type:ignore

            # twist neck
            mytools.twist_joint(driver=self.ctrl_head, no_roll=self.jnt_noRoll_01,
                                driven_objs=self.zero_list[0:-1], ro_direction=1, is_chain=True)

    def build(self):
        self.create()
        self.rig()
        self.post_process()

    def connect_to(self, provider: IConnectionPointProvider, connection_type=ConnectionType.NECK, **kwargs):
        connect_point = provider.get_connection_point(connection_type=connection_type)
        mytools.opm_constraint(connect_point, self.zero_cog)


if __name__ == '__main__':
    head = Head(joints=['neck_01', 'neck_02', 'head'])
    head.build()
