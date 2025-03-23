import pymel.core as pm
import mytools


# 是否拉伸
# neck joint: ctrl_neck 控制yz轴旋转，无移动。ctrl_head 旋转控制 neck x轴旋转，位移控制 neck joint 拉伸
# head: 控制分两层，父层级方向被重心控制器控制，子层级被 ctrl_head 控制
class Head:
    # name: jnt__c__head__001
    def __init__(self, *, joints: list[str]):
        self.joints = joints
        self.cvs_fk = [f'cv__c__{i}_fk__001' for i in joints]

        self.ctrl_neck = f'ctrl__c__neck__001'
        self.zero_neck = f'zero__c__neck__001'

        self.ctrl_head = f'ctrl__c__head__001'
        self.zero_head = f'zero__c__head__001'
        self.drive_head = f'drive__c__head__001'

    def create(self):
        # create fk joints
        for jnt, jnt_fk in zip(self.joints, self.cvs_fk):
            mytools.cv_target(name=jnt_fk, target=jnt, shape='ball', radius=2)
        mytools.parent_chain(self.cvs_fk)
        cv_neck_fk = self.cvs_fk[0]
        cv_head_fk = self.cvs_fk[-1]

        # create neck controller
        mytools.cv_target(name=self.ctrl_neck, target=cv_neck_fk, shape='cube', radius=4)
        mytools.grp_zero(name=self.zero_neck, target=self.ctrl_neck)
        # create head controller
        mytools.cv_target(name=self.ctrl_head, target=cv_head_fk, shape='cube', radius=4)
        mytools.grp_zero(name=self.zero_head, target=self.ctrl_head)
        mytools.grp_zero(name=self.drive_head, target=self.zero_head)

        # rig
        decompose_nd = mytools.blend_matrix(input=self.zero_neck, target=self.ctrl_neck,
                                            blend_attr=1 / len(self.joints))
        for cv in self.cvs_fk:
            cv_nd = pm.PyNode(cv)
            var = decompose_nd.outputRotate >> cv_nd.rotate  # type:ignore
        pm.pointConstraint(cv_head_fk, self.drive_head)

    def constraint_deform_joint(self):
        pass


if __name__ == '__main__':
    head = Head(joints=['joint1', 'joint2', 'joint3', 'joint4'])
    head.create()
