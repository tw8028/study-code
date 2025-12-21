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
        self._fkSystem = FkSystem(cog=self._limb)
        self._ikSystem = IkSystem(cog=self._limb, no_flip=False)
        self._midSystem = MidSystem(ik=self._ikSystem)

        self._side = side
        self._connect_point = f'connect__{side}__{name}__001'

        self._ctrl_attr = f'ctrl__{side}__{name}_ikfkSwitch__001'
        self._zero_attr = f'zero__{side}__{name}_ikfkSwitch__001'
        self._attr_blend = f'{self._ctrl_attr}.ikFkBlend'
        self._reverse_node = f'reverse__{side}__{name}__001'
        self._create_ikfk_attr()
        self._blend_jnt()
        mytools.grp_sub(name=self._connect_point, target=self._limb.joints[-1])

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

        joints_mid = self._midSystem.joints_mid
        joints_fk = self._fkSystem.joints_fk

        mytools.blend_orient(attr_ctrl=attr_blend, reverse=reverse_nd, ik_jnt=joints_mid[0], fk_jnt=joints_fk[0],
                             blend_jnt=self._limb.joints[0])
        mytools.blend_orient(attr_ctrl=attr_blend, reverse=reverse_nd, ik_jnt=joints_mid[1], fk_jnt=joints_fk[1],
                             blend_jnt=self._limb.joints[1])
        mytools.blend_orient(attr_ctrl=attr_blend, reverse=reverse_nd, ik_jnt=joints_mid[2], fk_jnt=joints_fk[2],
                             blend_jnt=self._limb.joints[2])
        mytools.blend_scale_x(attr_ctrl=attr_blend, ik_jnt=joints_mid[0], fk_jnt=joints_fk[0],
                              blend_jnt=self._limb.joints[0])
        mytools.blend_scale_x(attr_ctrl=attr_blend, ik_jnt=joints_mid[1], fk_jnt=joints_fk[1],
                              blend_jnt=self._limb.joints[1])

    def get_connection_point(self, connection_type=ConnectionType.DEFAULT):
        return self._connect_point

    def connect_to(self, point_provider: IConnectionPointProvider):
        if self._side == 'l':
            connect_point = point_provider.get_connection_point(connection_type=ConnectionType.SHOULDER_L)
        else:
            connect_point = point_provider.get_connection_point(connection_type=ConnectionType.SHOULDER_R)
        mytools.opm_constraint(connect_point, self._limb.zero_cog)
        print(f'to connect {self._limb.zero_cog}')
