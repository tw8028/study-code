import pymel.core as pm
import mytools
from abc import ABC
from system_biped.core.center_of_gravity import CenterOfGravity
from system_biped.interface.connection import IConnectionPointUser
from system_biped.interface.connection import IConnectionPointProvider
from system_biped.interface.connection import ConnectionType


# neck: ctrl_head 控制 neck x轴旋转
# head: 父层级被重心控制，子层级被 ctrl_head 控制
class Head(IConnectionPointUser, ABC):
    def __init__(self, *, bones: list[str]):
        head = CenterOfGravity(name='head', side='c', bones=bones)
        self.grp_rig = head.grp_rig
        self.ctrl_cog = head.ctrl_cog
        self.zero_cog = head.zero_cog
        self.zero_jnt = head.zero_jnt
        self.joints = head.joints

        self.ctrl_fk_list = [f'ctrl__c__{i}_fk__001' for i in bones]
        self.zero_fk_list = [f'zero__c__{i}_fk__001' for i in bones]
        self.input_fk_list = [f'input__c__{i}_fk__001' for i in bones]

        self.jnt_noRoll_01 = 'jnt__c__neck_noRoll_001'
        self.jnt_noRoll_02 = 'jnt__c__neck_noRoll_002'
        self.base = 'base__c__neck__001'

        self.ctrl_head = 'ctrl__c__head__001'
        self.zero_head = 'zero__c__head__001'
        self.ctrl_neck = 'ctrl__c__neck__001'
        self.zero_neck = 'zero__c__neck__001'

        self._create()
        self._rig()

    def _create(self):
        rig_list = []
        for jnt, ctrl, zero, grp_input in zip(self.joints, self.ctrl_fk_list, self.zero_fk_list, self.input_fk_list):
            rig_list.append(mytools.grp_target(name=zero, target=jnt))
            rig_list.append(mytools.grp_target(name=grp_input, target=jnt))
            rig_list.append(mytools.cv_target(name=ctrl, target=jnt, shape='circle', radius=3))
        mytools.parent_chain([self.ctrl_cog, *rig_list])

        for jnt_fk, jnt in zip(self.ctrl_fk_list, self.joints):
            pm.orientConstraint(jnt_fk, jnt)

        # neck
        mytools.cv_and_zero(name=self.ctrl_neck, target=self.joints[0], shape='circle', radius=6)
        pm.parent(self.zero_neck, self.ctrl_cog)

        # no roll joint
        mytools.jnt_target(name=self.jnt_noRoll_01, target=self.joints[0])
        mytools.jnt_target(name=self.jnt_noRoll_02, target=self.joints[-1])
        pm.parent(self.jnt_noRoll_02, self.jnt_noRoll_01)
        pm.parent(self.jnt_noRoll_01, self.zero_jnt)
        ik_handle = pm.ikHandle(name=f'ik_handle__c__neck__001', startJoint=self.jnt_noRoll_01,
                                endEffector=self.jnt_noRoll_02)[0]
        pm.poleVectorConstraint(self.jnt_noRoll_01, ik_handle)
        zero_ik_handle = mytools.grp_zero(name='zero__c__neck_ikHandle__001', target=ik_handle)
        pm.parent(zero_ik_handle, self.ctrl_neck)

        # head
        mytools.cv_and_zero(name=self.ctrl_head, target=self.joints[-1], shape='cube', radius=4)
        pm.parent(self.zero_head, self.jnt_noRoll_02)
        pm.orientConstraint(self.ctrl_head, self.joints[-1])

        # base
        mytools.grp_sub(name=self.base, target=self.ctrl_cog)

    def _rig(self):
        base_nd = pm.PyNode(self.base)
        ctrl_nd = pm.PyNode(self.jnt_noRoll_01)
        n = 1
        for grp_input in self.input_fk_list[0:-1]:
            input_nd = pm.PyNode(grp_input)
            attr_name = grp_input.split('__')[2] + 'Bias'
            m = n / (len(self.input_fk_list) - 1)
            pm.addAttr(self.ctrl_neck, longName=attr_name, at='float', minValue=0, maxValue=1, dv=m, keyable=True)
            n += 1
            blend_matrix_nd = pm.createNode('blendMatrix', name='blendMatrix__' + attr_name)
            mult_matrix_nd = pm.createNode('multMatrix', name='multMatrix__' + attr_name)
            var = base_nd.worldMatrix[0] >> blend_matrix_nd.inputMatrix  # type:ignore
            var = ctrl_nd.worldMatrix[0] >> blend_matrix_nd.target[0].targetMatrix  # type:ignore

            var = pm.PyNode(f'{self.ctrl_neck}.{attr_name}') >> blend_matrix_nd.target[0].rotateWeight  # type:ignore
            var = blend_matrix_nd.outputMatrix >> mult_matrix_nd.matrixIn[0]
            var = input_nd.getParent().worldInverseMatrix[0] >> mult_matrix_nd.matrixIn[1]  # type:ignore
            decompose_nd = pm.createNode('decomposeMatrix', name='decompose__' + attr_name)
            var = mult_matrix_nd.matrixSum >> decompose_nd.inputMatrix
            var = decompose_nd.outputRotate >> input_nd.rotate  # type:ignore

            # twist neck
            mytools.twist_joint(driver=self.ctrl_head, no_roll=self.jnt_noRoll_01,
                                driven_objs=self.input_fk_list[0:-1], ro_direction=1, is_chain=True)

    def connect_to(self, point_provider: IConnectionPointProvider, connection_type: ConnectionType):
        connect_point = point_provider.get_connection_point(connection_type=connection_type, side='c')
        print(connect_point)
        mytools.opm_constraint(connect_point, self.zero_cog)


if __name__ == '__main__':
    head = Head(bones=['neck_01', 'neck_02', 'head'])
