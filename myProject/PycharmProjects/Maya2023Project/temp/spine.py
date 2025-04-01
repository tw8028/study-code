import pymel.core as pm
import mytools
from abc import ABC
from temp.component import Component
from system_biped.interface.connection import IConnectionPointProvider
from system_biped.interface.connection import ConnectionType


class Spine(Component, IConnectionPointProvider, ABC):
    # 肩膀合并到了脊柱中
    def __init__(self, *, bones: list[str], neck, clavicle_l, clavicle_r, hip_l, hip_r):
        super().__init__(name='spine', side='c', bones=bones)
        ctrl = 'ctrl__c__{0}__001'
        zero = 'zero__c__{0}__001'

        self.ctrl_root = ctrl.format('biped')
        self.zero_root = zero.format('biped')
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

        self.joints_spline_ik = self.joints
        self.ik_handle = 'ik_handle__c__spine__001'
        self.control_points = []

        self.clavicle_l = clavicle_l
        self.clavicle_r = clavicle_r
        self.ctrl_clavicle_l = ctrl.format('clavicle_l')
        self.zero_clavicle_l = zero.format('clavicle_l')
        self.ctrl_clavicle_r = ctrl.format('clavicle_r')
        self.zero_clavicle_r = zero.format('clavicle_r')

        self.neck = neck
        self.shoulder_l = pm.PyNode(clavicle_l).getChildren()  # type:ignore
        self.shoulder_r = pm.PyNode(clavicle_r).getChildren()  # type:ignore
        self.hip_l = hip_l
        self.hip_r = hip_r

    def create_spline_ik(self):

        # start from spine01_ik
        spline_ik = pm.ikHandle(name=self.ik_handle, solver='ikSplineSolver', simplifyCurve=False, parentCurve=False,
                                startJoint=self.joints_spline_ik[1], endEffector=self.joints_spline_ik[-1])
        ik_handle = spline_ik[0]
        curve = spline_ik[2]
        curve.inheritsTransform.set(0)
        pm.parent(ik_handle, curve, self.grp_jnt)
        pm.rename(curve, newname='curve__c__spine_ik__001')

        # create control points
        self.control_points = mytools.loc_ctrl_curve(curve=curve)
        for i in self.control_points:
            pm.rename(i, newname=f'loc__c__spine_ik__001')

    def create_ctrl(self):
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
        pm.parent(self.zero_end, self.joints_spline_ik[-1])

        # 控制点p给控制器
        pm.parent(self.control_points[0], self.control_points[1], self.ctrl_pelvis)
        pm.parent(self.control_points[2], self.ctrl_spine01)
        pm.parent(self.control_points[3], self.ctrl_spine02)
        pm.parent(*self.control_points[4:], self.ctrl_chest)

        # spline ik 不包括 pelvis，直接 pelvis controller output group 控制
        output_pelvis = mytools.grp_child(name='output__c__pelvis__001', parent=self.ctrl_pelvis,
                                          position=self.bones[0])
        mytools.opm_constraint(output_pelvis, self.joints_spline_ik[0])

        # twist strat: pelvis controller
        # twist end: chest controller
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

        # 添加约束对
        self.bones = [*self.bones, self.clavicle_l, self.clavicle_r]
        self.joints = [*self.joints, self.ctrl_clavicle_l, self.ctrl_clavicle_r]
        self.constraint_bones()

    # 通过 type 和 side 创建不同的连接点
    def get_connection_point(self, connection_type, side):
        print(f"[DEBUG] 输入参数类型检查:")
        print(f"connection_type 类型: {type(connection_type)}")
        print(f"ConnectionType.NECK 类型: {type(ConnectionType.NECK)}")
        print(f"id(connection_type): {id(connection_type)}")
        print(f"id(ConnectionType.NECK): {id(ConnectionType.NECK)}")
        print(f"值比较: {connection_type.value == ConnectionType.NECK.value}")
        print(f"枚举相等比较: {connection_type == ConnectionType.NECK}")
        print(f"枚举身份比较: {connection_type is ConnectionType.NECK}")

        if connection_type.value == ConnectionType.NECK.value:
            return self._create_connect_point(connection_type=connection_type, side=side, parent=self.ctrl_end,
                                              position=self.neck)
        elif connection_type.value == ConnectionType.SHOULDER.value:
            if side == 'l':
                return self._create_connect_point(connection_type=connection_type, side=side,
                                                  parent=self.ctrl_clavicle_l, position=self.shoulder_l)
            if side == 'r':
                return self._create_connect_point(connection_type=connection_type, side=side,
                                                  parent=self.ctrl_clavicle_r, position=self.shoulder_r)
        elif connection_type.value == ConnectionType.HIP.value:
            if side == 'l':
                return self._create_connect_point(connection_type=connection_type, side=side, parent=self.ctrl_pelvis,
                                                  position=self.hip_l)
            if side == 'r':
                return self._create_connect_point(connection_type=connection_type, side=side, parent=self.ctrl_pelvis,
                                                  position=self.hip_r)
        else:
            print(f'error type or side: {connection_type.value}')


if __name__ == '__main__':
    spine = Spine(bones=['pelvis', 'spine_01', 'spine_02', 'spine_03', 'spine_04', 'spine_05'], neck='neck_01',
                  clavicle_l='clavicle_l', clavicle_r='clavicle_r', hip_l='thigh_l', hip_r='thigh_r')
    spine.build()
