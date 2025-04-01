import pymel.core as pm
import mytools
from system_biped.component import Component


# neck: ctrl_head 控制 neck x轴旋转
# head: 父层级被重心控制，子层级被 ctrl_head 控制
class Head(Component):
    # name: jnt__c__head__001
    def __init__(self, *, name: str, side: str, bones: list[str]):
        super().__init__(name=name, side=side, bones=bones)
        self.joints_fk = [f'jnt__c__{i}_fk__001' for i in bones]
        self.joint_neck_fk = self.joints_fk[0]
        self.joint_head_fk = self.joints_fk[-1]
        self.joint_no_roll_01 = 'jnt__c__neck_no_roll_001'
        self.joint_no_roll_02 = 'jnt__c__neck_no_roll_002'

        self.ctrl_neck = f'ctrl__c__neck__001'
        self.zero_neck = f'zero__c__neck__001'

        self.ctrl_head = f'ctrl__c__head__001'
        self.zero_head = f'zero__c__head__001'
        self.input_head = f'input__c__head__001'

        self.ctrl_list = [self.ctrl_neck, self.ctrl_head]
        self.constraint_objs = [*self.joints_fk[0:-1], self.ctrl_head]

    def create(self):
        # create fk joints
        mytools.jnt_target(name=self.jnt_root, target=self.bones[0])
        for jnt, jnt_fk in zip(self.bones, self.joints_fk):
            mytools.jnt_target(name=jnt_fk, target=jnt)
        mytools.parent_chain([self.jnt_root] + self.joints_fk)

        # create neck controller
        mytools.cv_target(name=self.ctrl_neck, target=self.joint_neck_fk, shape='circle', radius=6)
        mytools.grp_zero(name=self.zero_neck, target=self.ctrl_neck)
        # create head controller
        mytools.cv_target(name=self.ctrl_head, target=self.joint_head_fk, shape='cube', radius=6)
        mytools.grp_zero(name=self.zero_head, target=self.ctrl_head)
        mytools.grp_zero(name=self.input_head, target=self.zero_head)
        pm.group(name=self.grp_rig, empty=True)
        pm.parent(self.zero_neck, self.input_head, self.grp_rig)

        # create no roll joint
        mytools.jnt_target(name=self.joint_no_roll_01, target=self.bones[0])
        mytools.jnt_target(name=self.joint_no_roll_02, target=self.bones[-1])
        pm.parent(self.joint_no_roll_02, self.joint_no_roll_01)
        pm.parent(self.joint_no_roll_01, self.jnt_root)
        mytools.zero_orient(self.joint_no_roll_02)
        handle = pm.ikHandle(name=f'handle__c__neck__001', startJoint=self.joint_no_roll_01,
                             endEffector=self.joint_no_roll_02)[0]
        pm.poleVectorConstraint(self.joint_no_roll_01, handle)
        pm.parent(handle, self.ctrl_neck)
        pm.orientConstraint(self.ctrl_head, self.joint_no_roll_02, maintainOffset=True)

    def rig(self):
        input_obj_nd = pm.PyNode(self.zero_neck)
        target_obj_nd = pm.PyNode(self.joint_no_roll_01)
        root_nd = pm.PyNode(self.jnt_root)
        name = self.jnt_root.split('__', 1)[1]
        blend_matrix_nd = pm.createNode('blendMatrix', name='blendM__' + name)
        blend_matrix_nd.envelope.set(1 / len(self.bones))
        mult_matrix_nd = pm.createNode('multMatrix', name='multM__' + name)
        var = input_obj_nd.worldMatrix[0] >> blend_matrix_nd.inputMatrix  # type:ignore
        var = target_obj_nd.worldMatrix[0] >> blend_matrix_nd.target[0].targetMatrix  # type:ignore
        var = blend_matrix_nd.outputMatrix >> mult_matrix_nd.matrixIn[0]
        var = root_nd.worldInverseMatrix[0] >> mult_matrix_nd.matrixIn[1]  # type:ignore
        decompose_nd = pm.createNode('decomposeMatrix', name='decompose__' + name)
        var = mult_matrix_nd.matrixSum >> decompose_nd.inputMatrix
        for jnt in self.joints_fk:
            jnt_fk_nd = pm.PyNode(jnt)
            var = decompose_nd.outputRotate >> jnt_fk_nd.rotate  # type:ignore

        pm.pointConstraint(self.joint_no_roll_02, self.input_head)

        # twist neck
        mytools.twist_joint(driver=self.joint_no_roll_02, no_roll=self.joint_no_roll_01,
                            driven_objs=self.joints_fk[0:-1], ro_direction=1, is_chain=True)

    def constraint_deform_joint(self):
        for jnt, jnt_fk in zip(self.bones[0:-1], self.joints_fk[0:-1]):
            pm.orientConstraint(jnt_fk, jnt)
        pm.orientConstraint(self.ctrl_head, self.bones[-1])

    def build(self):
        self.create()
        self.rig()
        self.set_color()
        self.constraint_deform(point=False)


if __name__ == '__main__':
    head = Head(name='neck', side='c', bones=['neck_01', 'neck_02', 'head'])
    head.build()
