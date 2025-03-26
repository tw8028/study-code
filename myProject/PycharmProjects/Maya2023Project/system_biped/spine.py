import pymel.core as pm
import mytools


class Spine:
    # name = jnt__c__spine__001
    def __init__(self, *, joints: list[str]):
        self.rig_spine = f'rig__c__spine__001'
        self.spines = joints
        self.spines_ik = []
        self.loc_list = []

        self.ctrl_cog = f'ctrl__c__spine_cog__001'
        self.zero_cog = f'zero__c__spine_cog__001'
        self.ctrl_pelvis = f'ctrl__c__pelvis__001'  # 控制大腿
        self.zero_pelvis = f'zero__c__pelvis__001'
        self.ctrl_spine01 = f'ctrl__c__spine_01__001'
        self.zero_spine01 = f'zero__c__spine_01__001'
        self.ctrl_spine02 = f'ctrl__c__spine_02__001'
        self.zero_spine02 = f'zero__c__spine_02__001'
        self.ctrl_chest = f'ctrl__c__chest__001'
        self.zero_chest = f'zero__c__chest__001'
        self.ctrl_end = f'ctrl__c__spine_end__001'  # 用于控制肩膀
        self.zero_end = f'zero__c__spine_end__001'

        self.ik_handle = 'ik_handle__c__spine__001'

    def create_spline_ik(self):
        pm.group(name=self.rig_spine, empty=True)
        for jnt in self.spines:
            jnt_ik = mytools.jnt_target(name=f'jnt__c__{jnt}_ik__001', target=jnt)
            self.spines_ik.append(jnt_ik)
        mytools.parent_chain(self.spines_ik)
        spline_ik = pm.ikHandle(name=self.ik_handle, solver='ikSplineSolver', simplifyCurve=False,
                                parentCurve=False, startJoint=self.spines_ik[1], endEffector=self.spines_ik[-1])
        ik_handle = spline_ik[0]
        curve = spline_ik[2]
        pm.parent(ik_handle, curve, self.rig_spine)
        pm.rename(curve, newname='ik_handle__c__curve__001')
        self.loc_list = mytools.loc_ctrl_curve(curve=curve)
        for i in self.loc_list:
            pm.rename(i, newname=f'loc__c__ctrl_point__001')

    def create_ctrl(self):
        mytools.cv_target(name=self.ctrl_cog, target=self.spines[2], shape='circle_linear', radius=17)
        mytools.grp_zero(name=self.zero_cog, target=self.ctrl_cog)
        mytools.cv_target(name=self.ctrl_pelvis, target=self.spines[2], shape='cube', radius=10)
        mytools.grp_zero(name=self.zero_pelvis, target=self.ctrl_pelvis)
        mytools.cv_target(name=self.ctrl_spine01, target=self.spines[2], shape='circle', radius=15)
        mytools.grp_zero(name=self.zero_spine01, target=self.ctrl_spine01)
        mytools.cv_target(name=self.ctrl_spine02, target=self.spines[3], shape='circle', radius=15)
        mytools.grp_zero(name=self.zero_spine02, target=self.ctrl_spine02)
        mytools.cv_target(name=self.ctrl_chest, target=self.spines[4], shape='cube', radius=10)
        mytools.grp_zero(name=self.zero_chest, target=self.ctrl_chest)
        mytools.cv_target(name=self.ctrl_end, target=self.spines[-1], shape='cube', radius=1)
        mytools.grp_zero(name=self.zero_end, target=self.ctrl_end)

        pm.parent(self.zero_pelvis, self.zero_spine01, self.ctrl_cog)
        pm.parent(self.zero_spine02, self.ctrl_spine01)
        pm.parent(self.zero_chest, self.ctrl_spine02)
        pm.parentConstraint(self.spines_ik[-1], self.zero_end)

        pm.parent(self.loc_list[0], self.loc_list[1], self.ctrl_pelvis)
        pm.parent(self.loc_list[2], self.ctrl_spine01)
        pm.parent(self.loc_list[3], self.ctrl_spine02)
        pm.parent(*self.loc_list[4:], self.ctrl_chest)

        pm.parentConstraint(self.ctrl_pelvis, self.spines_ik[0], maintainOffset=True)
        pm.parent(self.zero_cog, self.rig_spine)
        pm.parent(self.zero_end, self.rig_spine)

        # twist
        ik_handle = pm.PyNode(self.ik_handle)
        ik_handle.dTwistControlEnable.set(True)  # type:ignore
        ik_handle.dWorldUpType.set(4)  # type:ignore
        ctrl_pelvis_nd = pm.PyNode(self.ctrl_pelvis)
        ctrl_chest_nd = pm.PyNode(self.ctrl_chest)
        var = ctrl_pelvis_nd.worldMatrix[0] >> ik_handle.dWorldUpMatrix  # type:ignore
        var = ctrl_chest_nd.worldMatrix[0] >> ik_handle.dWorldUpMatrixEnd  # type:ignore

    def constraint_deform_joint(self):
        for jnt_ik, jnt in zip(self.spines_ik, self.spines):
            pm.orientConstraint(jnt_ik, jnt)
        pm.pointConstraint(self.spines_ik[0], self.spines[0])

    def build(self):
        self.create_spline_ik()
        self.create_ctrl()
        self.constraint_deform_joint()


if __name__ == '__main__':
    spine = Spine(joints=['pelvis', 'spine_01', 'spine_02', 'spine_03', 'spine_04', 'spine_05'])
    spine.create_spline_ik()
    spine.create_ctrl()
