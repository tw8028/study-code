from abc import ABC

import pymel.core as pm
import mytools
from system_biped.core.component import Component
from system_biped.interface.connection import IConnectionPointProvider
from system_biped.interface.connection import ConnectionType


class Spine(Component, IConnectionPointProvider, ABC):
    # name = jnt__c__spine__001
    def __init__(self, *, joints: list[str], neck, clavicle_l, clavicle_r, hip_l, hip_r):
        super().__init__(name='spine', side='c', joints=joints)
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
        self.jnt_ik_list = []

        self.ik_handle = 'ik_handle__c__spine__001'
        self.loc_list = []

        self.color = 17
        self.ctrl_list = [self.ctrl_pelvis, self.ctrl_cog, self.ctrl_spine01, self.ctrl_spine02, self.ctrl_chest]

        self.neck = neck
        self.clavicle_l = clavicle_l
        self.clavicle_r = clavicle_r
        self.shoulder_l = pm.PyNode(clavicle_l).getChildren()  # type:ignore
        self.shoulder_r = pm.PyNode(clavicle_r).getChildren()  # type:ignore
        self.hip_l = hip_l
        self.hip_r = hip_r
        self.ctrl_clavicle_l = ctrl.format('clavicle_l')
        self.zero_clavicle_l = zero.format('clavicle_l')
        self.ctrl_clavicle_r = ctrl.format('clavicle_r')
        self.zero_clavicle_r = zero.format('clavicle_r')

    def create_spline_ik(self):
        # create rig joints
        for jnt in self.joints:
            jnt_ik = mytools.jnt_target(name=f'jnt__c__{jnt}_ik__001', target=jnt)
            self.jnt_ik_list.append(jnt_ik)
        mytools.parent_chain(self.jnt_ik_list)
        pm.parent(self.jnt_ik_list[0], mytools.grp_target(name=self.zero_spline_ik, target=self.joints[0]))
        pm.parent(self.zero_spline_ik, self.grp_rig)

        # create spline ik
        spline_ik = pm.ikHandle(name=self.ik_handle, solver='ikSplineSolver', simplifyCurve=False,
                                parentCurve=False, startJoint=self.jnt_ik_list[1],
                                endEffector=self.jnt_ik_list[-1])
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
        pm.parent(self.zero_end, self.jnt_ik_list[-1])
        pm.parent(self.zero_cog, self.grp_rig)

        pm.parent(self.loc_list[0], self.loc_list[1], self.ctrl_pelvis)
        pm.parent(self.loc_list[2], self.ctrl_spine01)
        pm.parent(self.loc_list[3], self.ctrl_spine02)
        pm.parent(*self.loc_list[4:], self.ctrl_chest)

        pm.parentConstraint(self.ctrl_pelvis, self.jnt_ik_list[0], maintainOffset=True)

        # twist
        ik_handle = pm.PyNode(self.ik_handle)
        ik_handle.dTwistControlEnable.set(True)  # type:ignore
        ik_handle.dWorldUpType.set(4)  # type:ignore
        ctrl_pelvis_nd = pm.PyNode(self.ctrl_pelvis)
        ctrl_chest_nd = pm.PyNode(self.ctrl_chest)
        var = ctrl_pelvis_nd.worldMatrix[0] >> ik_handle.dWorldUpMatrix  # type:ignore
        var = ctrl_chest_nd.worldMatrix[0] >> ik_handle.dWorldUpMatrixEnd  # type:ignore

    def create_shoulder(self):
        mytools.cv_and_zero(name=self.ctrl_clavicle_l, target=self.clavicle_l, shape='cube', radius=4)
        mytools.cv_and_zero(name=self.ctrl_clavicle_r, target=self.clavicle_r, shape='cube', radius=4)
        pm.parent(self.zero_clavicle_l, self.zero_clavicle_r, self.ctrl_end)

    def build(self):
        self.create_spline_ik()
        self.create_ctrl()
        self.create_shoulder()
        self.joints = [*self.joints, self.clavicle_l, self.clavicle_r]
        self.constraint_objs = [*self.jnt_ik_list, self.ctrl_clavicle_l, self.ctrl_clavicle_r]
        self.post_process()

    @staticmethod
    def _create_connect_point(connection_type, side, parent, obj_pos):
        name = f'connect__{side}__{connection_type.value}__001'
        if not pm.objExists(name):
            connection_point = mytools.grp_sub(name=f'connect__{side}__{connection_type.value}__001', target=parent)
            pm.matchTransform(connection_point, obj_pos)
            return connection_point
        return pm.PyNode(name)

    def get_connection_point(self, connection_type, side, **kwargs):
        if connection_type == ConnectionType.NECK:
            return self._create_connect_point(connection_type=connection_type, side=side, parent=self.ctrl_end,
                                              obj_pos=self.neck)
        elif connection_type == ConnectionType.SHOULDER:
            if side == 'l':
                return self._create_connect_point(connection_type=connection_type, side=side,
                                                  parent=self.ctrl_clavicle_l, obj_pos=self.shoulder_l)
            if side == 'r':
                return self._create_connect_point(connection_type=connection_type, side=side,
                                                  parent=self.ctrl_clavicle_r, obj_pos=self.shoulder_r)
        elif connection_type == ConnectionType.HIP:
            if side == 'l':
                return self._create_connect_point(connection_type=connection_type, side=side, parent=self.ctrl_pelvis,
                                                  obj_pos=self.hip_l)
            if side == 'r':
                return self._create_connect_point(connection_type=connection_type, side=side, parent=self.ctrl_pelvis,
                                                  obj_pos=self.hip_r)
        else:
            pass


if __name__ == '__main__':
    spine = Spine(joints=['pelvis', 'spine_01', 'spine_02', 'spine_03', 'spine_04', 'spine_05'], neck='neck_01',
                  clavicle_l='clavicle_l', clavicle_r='clavicle_r', hip_l='thigh_l', hip_r='thigh_r')
    spine.build()
