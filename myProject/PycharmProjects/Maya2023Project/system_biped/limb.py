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


class Limb(IConnectionPointProvider, IConnectionPointUser, ABC):
    def __init__(self, name: str, side: str, bones: list[str]):
        self._limb = CenterOfGravity(name=name, side=side, bones=bones)
        self._fk = FkSystem(cog=self._limb)
        self._ik = IkSystem(cog=self._limb)
        self._mid = MidSystem(ik=self._ik)

        self._side = side
        self._connect_point = f'connect__{side}__{name}__001'
        self._create_connect_point()

        self._ctrl_attr = f'ctrl__{side}__{name}_ikfk__001'
        self._zero_attr = f'zero__{side}__{name}_ikfk__001'
        self._attr_blend = f'{self._ctrl_attr}.ikFkBlend'
        self._reverse_node = f'reverse__{side}__{name}__001'
        self._create_ikfk_attr()
        self._blend_jnt(fk_system=self._fk, ik_system=self._mid)

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

        joints_ik = ik_system.joints_ik
        joints_fk = fk_system.joints_fk

        mytools.blend_orient(attr_ctrl=attr_blend, reverse=reverse_nd, ik_jnt=joints_ik[0], fk_jnt=joints_fk[0],
                             blend_jnt=self._limb.joints[0])
        mytools.blend_orient(attr_ctrl=attr_blend, reverse=reverse_nd, ik_jnt=joints_ik[1], fk_jnt=joints_fk[1],
                             blend_jnt=self._limb.joints[1])
        mytools.blend_orient(attr_ctrl=attr_blend, reverse=reverse_nd, ik_jnt=joints_ik[2], fk_jnt=joints_fk[2],
                             blend_jnt=self._limb.joints[2])
        mytools.blend_scale_x(attr_ctrl=attr_blend, ik_jnt=joints_ik[0], fk_jnt=joints_fk[0],
                              blend_jnt=self._limb.joints[0])
        mytools.blend_scale_x(attr_ctrl=attr_blend, ik_jnt=joints_ik[1], fk_jnt=joints_fk[1],
                              blend_jnt=self._limb.joints[1])

    def _create_connect_point(self):
        jnt_end = self._limb.joints[-1]
        mytools.grp_sub(name=self._connect_point, target=jnt_end)

    def get_connection_point(self, connection_type: ConnectionType, side=''):
        if connection_type.value == ConnectionType.WRIST.value:
            return self._connect_point
        elif connection_type.value == ConnectionType.FOOT.value:
            pass

    def connect_to(self, point_provider: IConnectionPointProvider, connection_type: ConnectionType):
        connect_point = point_provider.get_connection_point(connection_type=connection_type, side=self._side)
        print(connect_point)
        mytools.opm_constraint(connect_point, self._limb.zero_cog)

    def get_ik_handle_control(self):
        return self._ik.ctrl_ikHandle

    def get_fk_end_control(self):
        return self._fk._ctrl_list[-1]

    def get_blend_attribute(self):
        return self._attr_blend

    def get_reverse_node(self):
        return self._reverse_node