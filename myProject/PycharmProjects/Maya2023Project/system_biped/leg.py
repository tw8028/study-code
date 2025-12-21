import pymel.core as pm
import mytools
from abc import ABC
from system_biped.interface.connection import IConnectionPointProvider
from system_biped.interface.connection import IConnectionPointUser
from system_biped.interface.connection import ConnectionType
from system_biped.core.center_of_gravity import CenterOfGravity
from system_biped.core.fk_system import FkSystem
from system_biped.core.ik_system import IkSystem
from system_biped.core.mid_system import MidSystem
from system_biped.core.foot5ctrl import Foot5ctrl


class Leg(IConnectionPointUser, ABC):
    def __init__(self, name: str, side: str, bones: list[str]):
        self._joints = bones
        self._side = side
        self._limb = CenterOfGravity(name=name, side=side, bones=bones[:-2])
        self._fkSystem = FkSystem(cog=self._limb)
        self._ikSystem = IkSystem(cog=self._limb, no_flip=True)
        self._midSystem = MidSystem(ik=self._ikSystem)

        self._joints_mid = self._midSystem.joints_mid
        self._joints_fk = self._fkSystem.joints_fk

        self._ctrl_attr = f'ctrl__{side}__{name}_ikfkSwitch__001'
        self._zero_attr = f'zero__{side}__{name}_ikfkSwitch__001'
        self._attr_blend = f'{self._ctrl_attr}.ikFkBlend'
        self._reverse_node = f'reverse__{side}__{name}__001'
        self._create_ikfk_attr()
        self._blend_jnt()
        self._foot_ctrl()
        pm.delete(bones[-2:])

    def _create_ikfk_attr(self):
        mytools.cv_and_zero(name=self._ctrl_attr, target=self._limb.ctrl_cog, shape='cross1', radius=2)
        mytools.zero_orient(self._zero_attr)
        mytools.lock_hide_transform(self._ctrl_attr)
        pm.parent(self._zero_attr, self._limb.grp_rig)
        pm.addAttr(self._ctrl_attr, longName='ikFkBlend', attributeType='float', minValue=0, maxValue=1, dv=1,
                   keyable=True)
        reverse_nd = pm.createNode('reverse', name=self._reverse_node)
        pm.PyNode(self._attr_blend) >> reverse_nd.inputX  # type: ignore

    def _blend_jnt(self):
        attr_blend = self._attr_blend
        reverse_nd = self._reverse_node
        joints_mid = self._joints_mid
        joints_fk = self._joints_fk
        joints_cog = self._limb.joints

        mytools.blend_orient(attr_ctrl=attr_blend, reverse=reverse_nd, ik_jnt=joints_mid[0], fk_jnt=joints_fk[0],
                             blend_jnt=joints_cog[0])  # thigh
        mytools.blend_orient(attr_ctrl=attr_blend, reverse=reverse_nd, ik_jnt=joints_mid[1], fk_jnt=joints_fk[1],
                             blend_jnt=joints_cog[1])  # calf
        mytools.blend_orient(attr_ctrl=attr_blend, reverse=reverse_nd, ik_jnt=joints_mid[2], fk_jnt=joints_fk[2],
                             blend_jnt=joints_cog[2])  # foot
        mytools.blend_orient(attr_ctrl=attr_blend, reverse=reverse_nd, ik_jnt=joints_mid[3], fk_jnt=joints_fk[3],
                             blend_jnt=joints_cog[3])  # ball/toe

        mytools.blend_scale_x(attr_ctrl=attr_blend, ik_jnt=joints_mid[0], fk_jnt=joints_fk[0],
                              blend_jnt=joints_cog[0])
        mytools.blend_scale_x(attr_ctrl=attr_blend, ik_jnt=joints_mid[1], fk_jnt=joints_fk[1],
                              blend_jnt=joints_cog[1])

    # ik system 的脚部控制
    def _foot_ctrl(self):
        foot = Foot5ctrl(side=self._side, bones=self._joints[2:])
        pm.parent(foot.grp_rig, self._limb.grp_rig)

        # Foot5ctrl系统中ankle_ctrl，控制腿部ik系统中的ikHandle
        ctrl_ikHandle = self._ikSystem.ctrl_ikHandle
        pm.parentConstraint(foot.ankle_ctrl, ctrl_ikHandle, maintainOffset=True)
        mytools.lock_hide_transform(ctrl_ikHandle)
        mytools.set_display_type(ctrl_ikHandle, 2)

        # Foot5ctrl系统中toe_ctrl，控制腿部ik系统中的toe/ball骨骼
        pm.orientConstraint(foot.toe_ctrl, self._joints_mid[-1])

    def connect_to(self, point_provider: IConnectionPointProvider):
        if self._side == 'l':
            connect_point = point_provider.get_connection_point(connection_type=ConnectionType.HIP_L)
        else:
            connect_point = point_provider.get_connection_point(connection_type=ConnectionType.HIP_R)
        mytools.opm_constraint(connect_point, self._limb.zero_cog)
        print(f'to connect {self._limb.zero_cog}')


if __name__ == '__main__':
    leg_l = Leg(name='leg', side='l', bones=['thigh_l', 'calf_l', 'foot_l', 'ball_l', 'tiptoe_l', 'heel_l'])
    print('successful...')
    pm.select(clear=True)
