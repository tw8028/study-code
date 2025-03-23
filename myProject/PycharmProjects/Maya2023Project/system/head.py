import pymel.core as pm
import mytools


# 是否拉伸
# neck joint: ctrl_neck 控制yz轴旋转，无移动。ctrl_head 旋转控制 neck x轴旋转，位移控制 neck joint 拉伸
# head: 控制分两层，父层级方向被重心控制器控制，子层级被 ctrl_head 控制
class Head:
    # name: jnt__c__head__001
    def __init__(self, *, joints: list[str]):
        self.joints = joints
        self.joint_root = f'root__c__neck__001'
        self.joints_fk = [f'jnt__c__{i}_fk__001' for i in joints]
        self.joint_neck_fk = self.joints_fk[0]
        self.joint_head_fk = self.joints_fk[-1]
        self.joint_no_roll_01 = 'jnt__c__neck_no_roll_001'
        self.joint_no_roll_02 = 'jnt__c__neck_no_roll_002'

        self.ctrl_neck = f'ctrl__c__neck__001'
        self.zero_neck = f'zero__c__neck__001'

        self.ctrl_head = f'ctrl__c__head__001'
        self.zero_head = f'zero__c__head__001'
        self.drive_head = f'drive__c__head__001'

    def create(self):
        # create fk joints
        mytools.jnt_target(name=self.joint_root, target=self.joints[0])
        for jnt, jnt_fk in zip(self.joints, self.joints_fk):
            mytools.jnt_target(name=jnt_fk, target=jnt)
        mytools.parent_chain([self.joint_root] + self.joints_fk)

        # create neck controller
        mytools.cv_target(name=self.ctrl_neck, target=self.joint_neck_fk, shape='cube', radius=4)
        mytools.grp_zero(name=self.zero_neck, target=self.ctrl_neck)
        # create head controller
        mytools.cv_target(name=self.ctrl_head, target=self.joint_head_fk, shape='cube', radius=4)
        mytools.grp_zero(name=self.zero_head, target=self.ctrl_head)
        mytools.grp_zero(name=self.drive_head, target=self.zero_head)

        # create no roll joint
        mytools.jnt_target(name=self.joint_no_roll_01, target=self.joints[0])
        mytools.jnt_target(name=self.joint_no_roll_02, target=self.joints[-1])
        pm.parent(self.joint_no_roll_02, self.joint_no_roll_01)
        pm.parent(self.joint_no_roll_01, self.joint_root)
        handle = pm.ikHandle(name=f'handle__c__neck__001', startJoint=self.joint_no_roll_01,
                            endEffector=self.joint_no_roll_02)[0]
        pm.poleVectorConstraint(self.joint_no_roll_01, handle)
        pm.parent(handle, self.ctrl_neck)

    def rig(self):
        input_obj_nd = pm.PyNode(self.zero_neck)
        target_obj_nd = pm.PyNode(self.joint_no_roll_01)
        root_nd = pm.PyNode(self.joint_root)
        name = self.joint_root.split('__', 1)[1]
        blend_matrix_nd = pm.createNode('blendMatrix', name='blendM__' + name)
        blend_matrix_nd.envelope.set(1 / len(self.joints))
        mult_matrix_nd = pm.createNode('multMatrix', name='multM__' + name)
        var = input_obj_nd.worldMatrix[0] >> blend_matrix_nd.inputMatrix  # type:ignore
        var = target_obj_nd.worldMatrix[0] >> blend_matrix_nd.target[0].targetMatrix  # type:ignore
        var = blend_matrix_nd.outputMatrix >> mult_matrix_nd.matrixIn[0]
        var = root_nd.worldInverseMatrix[0] >> mult_matrix_nd.matrixIn[1]  # type:ignore
        for jnt in self.joints_fk:
            jnt_fk_nd = pm.PyNode(jnt)
            var = mult_matrix_nd.matrixSum >> jnt_fk_nd.offsetParentMatrix  # type:ignore

        output_ctrl_neck = mytools.grp_sub(name=f'output_{self.ctrl_neck}', target=self.ctrl_neck)
        pm.matchTransform(output_ctrl_neck, self.joint_head_fk, position=True)
        pm.pointConstraint(output_ctrl_neck, self.drive_head)

    def constraint_deform_joint(self):
        for jnt, jnt_fk in zip(self.joints, self.joints_fk):
            pm.orientConstraint(jnt_fk, jnt)


if __name__ == '__main__':
    head = Head(joints=['neck_01', 'neck_02', 'head'])
    head.create()
    head.rig()
