import pymel.core as pm
import mytools
from abc import ABC
from system_biped.interface.connection import IConnectionPointProvider
from system_biped.interface.connection import ConnectionType
from system_biped.core.center_of_gravity import CenterOfGravity
from system_biped.core.trunk_connection import TrunkConnection
from system_biped.core.master import Master


class Spine(IConnectionPointProvider, ABC):
    # 肩膀合并到了脊柱中
    def __init__(self, bones: list[str], trunk_connection: TrunkConnection):
        self._jnt_pelvis = bones[0]
        spine = CenterOfGravity(name='spine', side='c', bones=bones[1:])
        self._joints_spine = spine.joints
        self._grp_rig = spine.grp_rig
        self._ctrl_cog = spine.ctrl_cog
        self._zero_jnt = spine.zero_jnt
        self._trunk_connection = trunk_connection

        ctrl = 'ctrl__c__{0}__001'
        zero = 'zero__c__{0}__001'

        self._ctrl_root = ctrl.format('biped')
        self._zero_root = zero.format('biped')
        self._ctrl_pelvis = ctrl.format('pelvis')
        self._zero_pelvis = zero.format('pelvis')
        self._ctrl_spine02 = ctrl.format('spine02')
        self._zero_spine02 = zero.format('spine02')
        self._ctrl_spine03 = ctrl.format('spine03')
        self._zero_spine03 = zero.format('spine03')
        self._ctrl_chest = ctrl.format('chest')
        self._zero_chest = zero.format('chest')
        self._ctrl_end = ctrl.format('spine_end')
        self._zero_end = zero.format('spine_end')

        self._spline_ik = 'spline_ik__c__spine__001'
        self._control_points = []

        self._create_spline_ik()
        self._create_ctrl()
        self._create_shoulder()
        self._create_connect_point()

    def _create_spline_ik(self):
        # start from spine01_ik
        spline_ik = pm.ikHandle(name=self._spline_ik, solver='ikSplineSolver', simplifyCurve=False, parentCurve=False,
                                startJoint=self._joints_spine[0], endEffector=self._joints_spine[-1])
        ik_handle = spline_ik[0]
        curve = spline_ik[2]
        curve.inheritsTransform.set(0)
        pm.parent(ik_handle, curve, self._zero_jnt)
        pm.rename(curve, newname='curve__c__spine_ik__001')

        # create control points
        self._control_points = mytools.loc_ctrl_curve(curve=curve)
        for index, loc in enumerate(self._control_points):
            loc.rename(f'loc__c__spine_ik__00{index + 1}')

        # 拉伸绑定骨骼，蒙皮骨骼并不拉伸
        mytools.stretch_jnt_by_curve(curve, self._joints_spine[1:-1])

    def _create_ctrl(self):
        mytools.cv_and_zero(name=self._ctrl_root, target=self._jnt_pelvis, shape='biped', radius=1)
        mytools.cv_and_zero(name=self._ctrl_pelvis, target=self._joints_spine[1], shape='pelvis', radius=1)
        mytools.cv_and_zero(name=self._ctrl_spine02, target=self._joints_spine[1], shape='circle', radius=13)
        mytools.cv_and_zero(name=self._ctrl_spine03, target=self._joints_spine[2], shape='circle', radius=15)
        mytools.cv_and_zero(name=self._ctrl_chest, target=self._joints_spine[3], shape='cube', radius=10)
        mytools.cv_and_zero(name=self._ctrl_end, target=self._joints_spine[-1], shape='cube', radius=1)

        # 创建控制器层级关系
        pm.parent(self._zero_root, self._ctrl_cog)
        pm.parent(self._zero_pelvis, self._zero_spine02, self._ctrl_root)
        pm.parent(self._zero_spine03, self._ctrl_spine02)
        pm.parent(self._zero_chest, self._ctrl_spine03)
        pm.parent(self._zero_end, self._joints_spine[-1])

        # 控制点p给控制器
        pm.parent(self._control_points[0], self._control_points[1], self._ctrl_pelvis)
        pm.parent(self._control_points[2], self._ctrl_spine02)
        pm.parent(self._control_points[3], self._ctrl_spine03)
        pm.parent(*self._control_points[4:], self._ctrl_chest)

        # pelvis骨骼控制方法：不创建控制骨骼，由pelvis控制器的子物体直接将约束
        output_ctrl_pelvis = mytools.grp_child(name='output__c__pelvis__001', parent=self._ctrl_pelvis,
                                               position=self._jnt_pelvis)
        mytools.opm_constraint(output_ctrl_pelvis, self._jnt_pelvis)

        # twist strat: pelvis controller
        # twist end: chest controller
        ik_handle = pm.PyNode(self._spline_ik)
        ik_handle.dTwistControlEnable.set(True)  # type:ignore
        ik_handle.dWorldUpType.set(4)  # type:ignore
        ctrl_pelvis_nd = pm.PyNode(self._ctrl_pelvis)
        ctrl_chest_nd = pm.PyNode(self._ctrl_chest)
        var = ctrl_pelvis_nd.worldMatrix[0] >> ik_handle.dWorldUpMatrix  # type:ignore
        var = ctrl_chest_nd.worldMatrix[0] >> ik_handle.dWorldUpMatrixEnd  # type:ignore

    def _create_shoulder(self):
        tc = self._trunk_connection
        mytools.cv_and_zero(name=tc.ctrl_clavicle_l, target=tc.clavicle_l, shape='cube', radius=4)
        mytools.cv_and_zero(name=tc.ctrl_clavicle_r, target=tc.clavicle_r, shape='cube', radius=4)
        pm.parent(tc.zero_clavicle_l, tc.zero_clavicle_r, self._ctrl_end)
        l_orient_cons = pm.orientConstraint(tc.ctrl_clavicle_l, tc.clavicle_l)
        r_orient_cons = pm.orientConstraint(tc.ctrl_clavicle_r, tc.clavicle_r)
        l_point_cons = pm.pointConstraint(tc.ctrl_clavicle_l, tc.clavicle_l)
        r_point_cons = pm.pointConstraint(tc.ctrl_clavicle_r, tc.clavicle_r)
        grp_cons = Master.constraint
        if not pm.objExists(grp_cons):
            pm.group(name=grp_cons, empty=True)
        pm.parent(l_orient_cons, r_orient_cons, l_point_cons, r_point_cons, grp_cons)

    def _create_connect_point(self):
        tc = self._trunk_connection
        mytools.grp_child(name=tc.connect_neck, parent=self._ctrl_end, position=tc.neck)
        mytools.grp_child(name=tc.connect_shoulder_l, parent=tc.ctrl_clavicle_l, position=tc.shoulder_l)
        mytools.grp_child(name=tc.connect_shoulder_r, parent=tc.ctrl_clavicle_r, position=tc.shoulder_r)
        mytools.grp_child(name=tc.connect_hip_l, parent=self._ctrl_pelvis, position=tc.hip_l)
        mytools.grp_child(name=tc.connect_hip_r, parent=self._ctrl_pelvis, position=tc.hip_r)

    def get_connection_point(self, connection_type, side):
        tc = self._trunk_connection
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
