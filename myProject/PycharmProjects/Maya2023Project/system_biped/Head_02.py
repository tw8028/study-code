import pymel.core as pm
import mytools
from system_biped.component import Component


class Head(Component):
    def __init__(self, *, name: str, side: str, joints: list[str]):
        super().__init__(name=name, side=side, joints=joints)

        self.joints_fk = [f'jnt__c__{i}_fk__001' for i in joints]
        self.ctrl_list = [f'ctrl__c__{i}__001' for i in joints]
        self.zero_list = [f'zero__c__{i}__001' for i in joints]
        self.input_list = [f'input__c__{i}__001' for i in joints]

        self.jnt_no_roll_01 = 'jnt__c__neck_no_roll_001'
        self.jnt_no_roll_02 = 'jnt__c__neck_no_roll_002'

        self.constraint_objs = self.joints_fk

    def create(self):
        rig_list = []
        for jnt, jnt_fk, ctrl, zero, input in zip(self.joints, self.joints_fk, self.ctrl_list, self.zero_list,
                                                  self.input_list):
            rig_list.append(mytools.grp_target(name=input, target=jnt))
            rig_list.append(mytools.grp_target(name=zero, target=jnt))
            rig_list.append(mytools.cv_target(name=ctrl, target=jnt, shape='circle', radius=10))
            rig_list.append(mytools.jnt_target(name=ctrl, target=jnt))
        mytools.parent_chain(rig_list)

        # create no roll joint
        mytools.jnt_target(name=self.jnt_root, target=self.joints[0])
        mytools.jnt_target(name=self.jnt_no_roll_01, target=self.joints[0])
        mytools.jnt_target(name=self.jnt_no_roll_02, target=self.joints[-1])
        pm.parent(self.jnt_no_roll_02, self.jnt_no_roll_01)
        pm.parent(self.jnt_no_roll_01, self.jnt_root)
        ik_handle = pm.ikHandle(name=f'handle__c__neck__001', startJoint=self.joint_no_roll_01,
                             endEffector=self.jnt_no_roll_02)[0]
        pm.poleVectorConstraint(self.jnt_no_roll_01, ik_handle)
        pm.parent(ik_handle, self.ctrl_list[0])

