import pymel.core as pm
import mytools
from system_biped.component import Component


class Spine(Component):
    # name = jnt__c__spine__001
    def __init__(self, *, name: str, side: str, joints: list[str]):
        super().__init__(name=name, side=side, joints=joints)
        ctrl = 'ctrl__c__{0}__001'
        zero = 'zero__c__{0}__001'

        self.ctrl_pelvis = ctrl.format('pelvis')  # 控制大腿
        self.zero_pelvis = zero.format('pelvis')
        self.ctrl_spine01 = ctrl.format('spine01')
        self.zero_spine01 = zero.format('spine01')
        self.ctrl_spine02 = ctrl.format('spine02')
        self.zero_spine02 = zero.format('spine02')
        self.ctrl_chest = ctrl.format('chest')
        self.zero_chest = zero.format('chest')
        self.ctrl_end = ctrl.format('spine_end')  # 用于控制肩膀
        self.zero_end = zero.format('spine_end')
        self.zero_spline_ik = zero.format('spine_ik')

        self.ik_handle = 'ik_handle__c__spine__001'
        self.loc_list = []

        self.color = 17
        self.ctrl_list = [self.ctrl_pelvis, self.ctrl_cog, self.ctrl_spine01, self.ctrl_spine02, self.ctrl_chest]

    def create_spline_ik(self):
        # create rig joints
        for jnt in self.joints:
            jnt_ik = mytools.jnt_target(name=f'jnt__c__{jnt}_ik__001', target=jnt)
            self.constraint_objs.append(jnt_ik)
        mytools.parent_chain(self.constraint_objs)
        pm.parent(self.constraint_objs[0], mytools.grp_target(name=self.zero_spline_ik, target=self.joints[0]))
        pm.parent(self.zero_spline_ik, self.grp_rig)

        # create spline ik
        spline_ik = pm.ikHandle(name=self.ik_handle, solver='ikSplineSolver', simplifyCurve=False,
                                parentCurve=False, startJoint=self.constraint_objs[1],
                                endEffector=self.constraint_objs[-1])
        ik_handle = spline_ik[0]
        curve = spline_ik[2]
        curve.inheritsTransform.set(0)
        pm.parent(ik_handle, curve, self.zero_spline_ik)
        pm.rename(curve, newname='ik_handle__c__curve__001')
        self.loc_list = mytools.loc_ctrl_curve(curve=curve)
        for i in self.loc_list:
            pm.rename(i, newname=f'loc__c__ctrl_point__001')

    def create_ctrl(self):
        mytools.cv_and_zero(name=self.ctrl_cog, target=self.joints[2], shape='biped_cog', radius=1)
        mytools.cv_and_zero(name=self.ctrl_pelvis, target=self.joints[2], shape='pelvis', radius=1)
        mytools.cv_and_zero(name=self.ctrl_spine01, target=self.joints[2], shape='circle', radius=13)
        mytools.cv_and_zero(name=self.ctrl_spine02, target=self.joints[3], shape='circle', radius=15)
        mytools.cv_and_zero(name=self.ctrl_chest, target=self.joints[4], shape='cube', radius=10)
        mytools.cv_and_zero(name=self.ctrl_end, target=self.joints[-1], shape='cube', radius=1)

        pm.parent(self.zero_pelvis, self.zero_spine01, self.ctrl_cog)
        pm.parent(self.zero_spine02, self.ctrl_spine01)
        pm.parent(self.zero_chest, self.ctrl_spine02)
        pm.parent(self.zero_end, self.constraint_objs[-1])
        pm.parent(self.zero_cog, self.grp_rig)

        pm.parent(self.loc_list[0], self.loc_list[1], self.ctrl_pelvis)
        pm.parent(self.loc_list[2], self.ctrl_spine01)
        pm.parent(self.loc_list[3], self.ctrl_spine02)
        pm.parent(*self.loc_list[4:], self.ctrl_chest)

        pm.parentConstraint(self.ctrl_pelvis, self.constraint_objs[0], maintainOffset=True)

        # twist
        ik_handle = pm.PyNode(self.ik_handle)
        ik_handle.dTwistControlEnable.set(True)  # type:ignore
        ik_handle.dWorldUpType.set(4)  # type:ignore
        ctrl_pelvis_nd = pm.PyNode(self.ctrl_pelvis)
        ctrl_chest_nd = pm.PyNode(self.ctrl_chest)
        var = ctrl_pelvis_nd.worldMatrix[0] >> ik_handle.dWorldUpMatrix  # type:ignore
        var = ctrl_chest_nd.worldMatrix[0] >> ik_handle.dWorldUpMatrixEnd  # type:ignore

    def build(self):
        self.create_spline_ik()
        self.create_ctrl()
        self.constraint_deform()
        self.set_color()


if __name__ == '__main__':
    spine = Spine(name='spine', side='c', joints=['pelvis', 'spine_01', 'spine_02', 'spine_03', 'spine_04', 'spine_05'])
    spine.build()
