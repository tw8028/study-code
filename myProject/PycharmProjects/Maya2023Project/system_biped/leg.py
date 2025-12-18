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
        self._limb = CenterOfGravity(name=name, side=side, bones=bones[:-2])
        self._fk = FkSystem(cog=self._limb)
        self._ik = IkSystem(cog=self._limb)
        self._mid = MidSystem(ik=self._ik)

        self._side = side
        self._ik_joints = self._ik.joints_ik
        self._fk_joints = self._fk.joints_fk

        self._ik_ctrl_handle = self._ik.ctrl_ikHandle
        self._ik_jnt_toe = self._ik_joints[-1]
        self._ik_zero_pole = self._ik.zero_pole

        self._ctrl_attr = f'ctrl__{side}__{name}_ikfk__001'
        self._zero_attr = f'zero__{side}__{name}_ikfk__001'
        self._attr_blend = f'{self._ctrl_attr}.ikFkBlend'
        self._reverse_node = f'reverse__{side}__{name}__001'
        self._create_ikfk_attr()
        self._blend_jnt(fk_system=self._fk, ik_system=self._mid)
        self._foot_ctrl()
        self._no_flip_ik()
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

    def _blend_jnt(self, fk_system, ik_system):
        attr_blend = self._attr_blend
        reverse_nd = self._reverse_node

        joints_ik = self._ik_joints
        joints_fk = self._fk_joints

        mytools.blend_orient(attr_ctrl=attr_blend, reverse=reverse_nd, ik_jnt=joints_ik[0], fk_jnt=joints_fk[0],
                             blend_jnt=self._limb.joints[0])  # thigh
        mytools.blend_orient(attr_ctrl=attr_blend, reverse=reverse_nd, ik_jnt=joints_ik[1], fk_jnt=joints_fk[1],
                             blend_jnt=self._limb.joints[1])  # calf
        mytools.blend_orient(attr_ctrl=attr_blend, reverse=reverse_nd, ik_jnt=joints_ik[2], fk_jnt=joints_fk[2],
                             blend_jnt=self._limb.joints[2])  # foot
        mytools.blend_orient(attr_ctrl=attr_blend, reverse=reverse_nd, ik_jnt=joints_ik[3], fk_jnt=joints_fk[3],
                             blend_jnt=self._limb.joints[3])  # ball/toe

        mytools.blend_scale_x(attr_ctrl=attr_blend, ik_jnt=joints_ik[0], fk_jnt=joints_fk[0],
                              blend_jnt=self._limb.joints[0])
        mytools.blend_scale_x(attr_ctrl=attr_blend, ik_jnt=joints_ik[1], fk_jnt=joints_fk[1],
                              blend_jnt=self._limb.joints[1])

    # ik system 的脚部控制
    def _foot_ctrl(self):
        foot = Foot5ctrl(name='foot', side=self._side, bones=self._joints[2:])
        pm.parent(foot.grp_rig, self._limb.grp_rig)

        # Foot5ctrl系统中ankle_ctrl，控制腿部ik系统中的ikHandle
        pm.parentConstraint(foot.ankle_ctrl, self._ik_ctrl_handle, maintainOffset=True)
        mytools.lock_hide_transform(self._ik_ctrl_handle)
        mytools.set_display_type(self._ik_ctrl_handle, 1)

        # Foot5ctrl系统中toe_ctrl，控制腿部ik系统中的toe/ball骨骼
        pm.orientConstraint(foot.toe_ctrl, self._ik_jnt_toe)

    def _no_flip_ik(self):
        end_ctrl = self._ik_ctrl_handle
        point_top = mytools.grp_sub(name='', target=self._ik_joints[0])
        point_bottom = mytools.grp_sub(name='', target=self._ik_joints[2])
        grp_top = mytools.grp_target(name='', target=point_top)
        grp_bottom = mytools.grp_target(name='', target=point_bottom)

        pm.parent(grp_bottom, point_bottom)
        pm.parent(grp_top, point_top)

        # on top
        top = mytools.jnt_target(name=f'jnt__{self._side}__top__001', target=point_top)
        top_end = mytools.jnt_target(name=f'jnt__{self._side}__top_end__001', target=point_bottom)
        pm.parent(top_end, top)
        pm.parent(top, grp_top)
        top_handle = pm.ikHandle(name=f'jnt__{self._side}__top_ikHandle__001', sj=top, ee=top_end)[0]
        pm.parent(top_handle, grp_bottom)
        top_pv = pm.spaceLocator(name=f'jnt__{self._side}__top_pv__001')
        pm.parent(top_pv, grp_top)
        pm.xform(top_pv, t=(0, 0, 6), ro=(0, 0, 0))
        pm.poleVectorConstraint(top_pv, top_handle)

        # on bottom
        bottom = mytools.jnt_target(name=f'jnt__{self._side}__bottom__001', target=point_bottom)
        bottom_end = mytools.jnt_target(name=f'jnt__{self._side}__bottom_end__001', target=point_top)
        pm.parent(bottom_end,bottom)
        pm.parent(bottom, grp_bottom)
        bottom_handle = pm.ikHandle(name=f'jnt__{self._side}__bottom_ikHandle__001', sj=bottom, ee=bottom_end)[0]
        pm.parent(bottom_handle, grp_top)
        bottom_pv = pm.spaceLocator(name=f'jnt__{self._side}__bottom_pv__001')
        pm.parent(bottom_pv, grp_bottom)
        pm.xform(bottom_pv, t=(0, 0, 6), ro=(0, 0, 0))
        pm.poleVectorConstraint(bottom_pv, bottom_handle)

        # top locator and bot locator 分别被 top and end_ctrl 控制
        top_loc = pm.spaceLocator(name=f'loc__{self._side}__top__001')
        pm.delete(pm.parentConstraint(self._ik_zero_pole,top_loc))
        pm.parent(top_loc, top)

        bottom_loc = pm.spaceLocator(name=f'loc__{self._side}__bottom__001')
        pm.delete(pm.parentConstraint(self._ik_zero_pole, bottom_loc))
        pm.parent(bottom_loc, bottom)

        # pole_offset 同时被 top_lor and bot_loc 约束
        pm.parentConstraint(top_loc, bottom_loc, self._ik_zero_pole)


    def connect_to(self, point_provider: IConnectionPointProvider, connection_type: ConnectionType):
        connect_point = point_provider.get_connection_point(connection_type=connection_type, side=self._side)
        print(connect_point)
        mytools.opm_constraint(connect_point, self._limb.zero_cog)


if __name__ == '__main__':
    leg_l = Leg(name='leg', side='l', bones=['thigh_l', 'calf_l', 'foot_l', 'ball_l', 'tiptoe_l', 'heel_l'])
    print('successful...')
    pm.select(clear=True)
