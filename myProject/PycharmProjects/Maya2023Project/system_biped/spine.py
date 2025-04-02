import pymel.core as pm
import mytools
from abc import ABC
from system_biped.interface.connection import IConnectionPointProvider
from system_biped.interface.connection import IConnectionPointUser
from system_biped.interface.connection import ConnectionType
from system_biped.core.center_of_gravity import CenterOfGravity
from system_biped.core.trunk_connection import TrunkConnection


class Spine(IConnectionPointUser, IConnectionPointProvider, ABC):
    # 肩膀合并到了脊柱中
    def __init__(self, bones: list[str], trunk_connection: TrunkConnection):
        spine = CenterOfGravity(name='spine', side='c', bones=bones)
        self.name = spine.name
        self.side = spine.side
        self.joints = spine.joints
        self.grp_rig = spine.grp_rig
        self.ctrl_cog = spine.ctrl_cog
        self.zero_jnt = spine.zero_jnt
        self.trunk_connection = trunk_connection

        ctrl = 'ctrl__c__{0}__001'
        zero = 'zero__c__{0}__001'

        self.ctrl_root = ctrl.format('biped')
        self.zero_root = zero.format('biped')
        self.ctrl_pelvis = ctrl.format('pelvis')
        self.zero_pelvis = zero.format('pelvis')
        self.ctrl_spine01 = ctrl.format('spine01')
        self.zero_spine01 = zero.format('spine01')
        self.ctrl_spine02 = ctrl.format('spine02')
        self.zero_spine02 = zero.format('spine02')
        self.ctrl_chest = ctrl.format('chest')
        self.zero_chest = zero.format('chest')
        self.ctrl_end = ctrl.format('spine_end')
        self.zero_end = zero.format('spine_end')

        self.spline_ik = 'spline_ik__c__spine__001'
        self.control_points = []

        self._create_spline_ik()
        self._create_ctrl()
        self._create_shoulder()
        self._create_connect_point()

    def _create_spline_ik(self):
        # start from spine01_ik
        spline_ik = pm.ikHandle(name=self.spline_ik, solver='ikSplineSolver', simplifyCurve=False, parentCurve=False,
                                startJoint=self.joints[1], endEffector=self.joints[-1])
        ik_handle = spline_ik[0]
        curve = spline_ik[2]
        curve.inheritsTransform.set(0)
        pm.parent(ik_handle, curve, self.zero_jnt)
        pm.rename(curve, newname='curve__c__spine_ik__001')

        # create control points
        self.control_points = mytools.loc_ctrl_curve(curve=curve)
        for i in self.control_points:
            pm.rename(i, newname=f'loc__c__spine_ik__001')

    def _create_ctrl(self):
        mytools.cv_and_zero(name=self.ctrl_root, target=self.joints[2], shape='biped', radius=1)
        mytools.cv_and_zero(name=self.ctrl_pelvis, target=self.joints[2], shape='pelvis', radius=1)
        mytools.cv_and_zero(name=self.ctrl_spine01, target=self.joints[2], shape='circle', radius=13)
        mytools.cv_and_zero(name=self.ctrl_spine02, target=self.joints[3], shape='circle', radius=15)
        mytools.cv_and_zero(name=self.ctrl_chest, target=self.joints[4], shape='cube', radius=10)
        mytools.cv_and_zero(name=self.ctrl_end, target=self.joints[-1], shape='cube', radius=1)

        # 创建控制器层级关系
        pm.parent(self.zero_root, self.ctrl_cog)
        pm.parent(self.zero_pelvis, self.zero_spine01, self.ctrl_root)
        pm.parent(self.zero_spine02, self.ctrl_spine01)
        pm.parent(self.zero_chest, self.ctrl_spine02)
        pm.parent(self.zero_end, self.joints[-1])

        # 控制点p给控制器
        pm.parent(self.control_points[0], self.control_points[1], self.ctrl_pelvis)
        pm.parent(self.control_points[2], self.ctrl_spine01)
        pm.parent(self.control_points[3], self.ctrl_spine02)
        pm.parent(*self.control_points[4:], self.ctrl_chest)

        # spline ik 不包括 pelvis，直接 pelvis controller output group 控制
        output_ctrl_pelvis = mytools.grp_child(name='output__c__pelvis__001', parent=self.ctrl_pelvis,
                                               position=self.joints[0])
        mytools.opm_constraint(output_ctrl_pelvis, self.joints[0])

        # twist strat: pelvis controller
        # twist end: chest controller
        ik_handle = pm.PyNode(self.spline_ik)
        ik_handle.dTwistControlEnable.set(True)  # type:ignore
        ik_handle.dWorldUpType.set(4)  # type:ignore
        ctrl_pelvis_nd = pm.PyNode(self.ctrl_pelvis)
        ctrl_chest_nd = pm.PyNode(self.ctrl_chest)
        var = ctrl_pelvis_nd.worldMatrix[0] >> ik_handle.dWorldUpMatrix  # type:ignore
        var = ctrl_chest_nd.worldMatrix[0] >> ik_handle.dWorldUpMatrixEnd  # type:ignore

    def _create_shoulder(self):
        tc = self.trunk_connection
        mytools.cv_and_zero(name=tc.ctrl_clavicle_l, target=tc.clavicle_l, shape='cube', radius=4)
        mytools.cv_and_zero(name=tc.ctrl_clavicle_r, target=tc.clavicle_r, shape='cube', radius=4)
        pm.parent(tc.zero_clavicle_l, tc.zero_clavicle_r, self.ctrl_end)
        pm.orientConstraint(tc.ctrl_clavicle_l, tc.clavicle_l)
        pm.orientConstraint(tc.ctrl_clavicle_r, tc.clavicle_r)
        pm.pointConstraint(tc.ctrl_clavicle_l, tc.clavicle_l)
        pm.pointConstraint(tc.ctrl_clavicle_r, tc.clavicle_r)

    def _create_connect_point(self):
        tc = self.trunk_connection
        mytools.grp_child(name=tc.connect_neck, parent=self.ctrl_end, position=tc.neck)
        mytools.grp_child(name=tc.connect_shoulder_l, parent=tc.ctrl_clavicle_l, position=tc.shoulder_l)
        mytools.grp_child(name=tc.connect_shoulder_r, parent=tc.ctrl_clavicle_r, position=tc.shoulder_r)
        mytools.grp_child(name=tc.connect_hip_l, parent=self.ctrl_pelvis, position=tc.hip_l)
        mytools.grp_child(name=tc.connect_hip_r, parent=self.ctrl_pelvis, position=tc.hip_r)

    def get_connection_point(self, connection_type, side):
        tc = self.trunk_connection
        if connection_type.value == ConnectionType.NECK.value:
            return tc.connect_neck
        elif connection_type.value == ConnectionType.SHOULDER.value and side == 'l':
            return tc.connect_shoulder_l
        elif connection_type.value == ConnectionType.SHOULDER.value and side == 'r':
            return tc.connect_shoulder_r
        elif connection_type.value == ConnectionType.HIP.value and side == 'l':
            return tc.connect_hip_l
        elif connection_type.value == ConnectionType.HIP.value and side == 'r':
            return tc.connect_hip_r
