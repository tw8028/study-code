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
from system_biped.interface.joint_limb import IJoint_limb


class Limb(IConnectionPointProvider, IConnectionPointUser, ABC):
    def __init__(self, name: str, side: str, bones: list[str]):
        self.limb = CenterOfGravity(name=name, side=side, bones=bones)
        fk = FkSystem(cog=self.limb)
        ik = IkSystem(cog=self.limb)
        mid = MidSystem(ik=ik)

        self.side = side
        self.connect_point = f'connect__{side}__{name}__001'
        self._create_connect_point()

        self.ctrl_attr = f'ctrl__{side}__{name}_ikfk__001'
        self.zero_attr = f'zero__{side}__{name}_ikfk__001'
        self.attr_blend = f'{self.ctrl_attr}.ikFkBlend'
        self.reverse_node = f'reverse__{side}__{name}__001'
        self._create_ikfk_attr()
        self._blend_jnt(fk_system=fk, ik_system=mid)

    def _create_ikfk_attr(self):
        mytools.cv_and_zero(name=self.ctrl_attr, target=self.limb.ctrl_cog, shape='cross1', radius=2)
        mytools.zero_orient(self.zero_attr)
        mytools.lock_hide_transform(self.ctrl_attr)
        pm.parent(self.zero_attr, self.limb.grp_rig)
        pm.addAttr(self.ctrl_attr, longName='ikFkBlend', attributeType='float', minValue=0, maxValue=1, dv=1,
                   keyable=True)
        reverse_nd = pm.createNode('reverse', name=self.reverse_node)
        pm.PyNode(self.attr_blend) >> reverse_nd.inputX  # type: ignore

    def _blend_jnt(self, fk_system: IJoint_limb, ik_system: IJoint_limb):
        attr_blend = self.attr_blend
        reverse_nd = self.reverse_node

        joints_ik = ik_system.get_rig_joints()
        joints_fk = fk_system.get_rig_joints()

        mytools.blend_orient(attr_ctrl=attr_blend, reverse=reverse_nd, ik_jnt=joints_ik[0], fk_jnt=joints_fk[0],
                             blend_jnt=self.limb.joints[0])
        mytools.blend_orient(attr_ctrl=attr_blend, reverse=reverse_nd, ik_jnt=joints_ik[1], fk_jnt=joints_fk[1],
                             blend_jnt=self.limb.joints[1])
        mytools.blend_orient(attr_ctrl=attr_blend, reverse=reverse_nd, ik_jnt=joints_ik[2], fk_jnt=joints_fk[2],
                             blend_jnt=self.limb.joints[2])
        mytools.blend_scale_x(attr_ctrl=attr_blend, ik_jnt=joints_ik[0], fk_jnt=joints_fk[0],
                              blend_jnt=self.limb.joints[0])
        mytools.blend_scale_x(attr_ctrl=attr_blend, ik_jnt=joints_ik[1], fk_jnt=joints_fk[1],
                              blend_jnt=self.limb.joints[1])

    def _create_connect_point(self):
        jnt_end = self.limb.joints[-1]
        mytools.grp_sub(name=self.connect_point, target=jnt_end)

    def get_connection_point(self, connection_type: ConnectionType, side=''):
        if connection_type.value == ConnectionType.WRIST.value:
            return self.connect_point
        elif connection_type.value == ConnectionType.FOOT.value:
            pass

    def connect_to(self, point_provider: IConnectionPointProvider, connection_type: ConnectionType):
        connect_point = point_provider.get_connection_point(connection_type=connection_type, side=self.side)
        print(connect_point)
        mytools.opm_constraint(connect_point, self.limb.zero_cog)
