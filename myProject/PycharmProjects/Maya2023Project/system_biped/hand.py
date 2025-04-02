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


class Hand(IConnectionPointUser, ABC):
    def __init__(self, name: str, side: str, bones: list[str]):
        self.name = name
        self.side = side
        self.hand = bones[0]
        self.fingers = bones[1:]
        self.grp_rig = f'rig__{side}__{name}__001'
        self.ctrl_cog = f'ctrl_cog__{side}__{name}__001'
        self.zero_cog = f'zero_cog__{side}__{name}__001'

        self._create_cog()
        self._create_all()

    def _create_cog(self):
        pm.group(name=self.grp_rig, empty=True)
        mytools.cv_and_zero(name=self.ctrl_cog, target=self.hand, shape='ball', radius=2)
        pm.parent(self.zero_cog, self.grp_rig)

    def _create_ctrl(self, bones):
        ctrl_list = [self.ctrl_cog]
        name = bones[0].split('_', 1)[0]
        for index, bone in enumerate(bones):
            zero = f'zero__{self.side}__{name}__00{index + 1}'
            ctrl = f'ctrl__{self.side}__{name}__00{index + 1}'
            mytools.cv_and_zero(name=ctrl, target=bone, shape='circle', radius=2)
            pm.orientConstraint(ctrl, bone)
            pm.pointConstraint(ctrl, bone)
            pm.parent(zero, ctrl_list[-1])
            ctrl_list.append(ctrl)

    def _create_all(self):
        for root in self.fingers:
            joints = mytools.get_children(root=root)
            print(joints)
            self._create_ctrl(joints)

    def connect_to(self, point_provider: IConnectionPointProvider, connection_type):
        connect_point = point_provider.get_connection_point(connection_type=ConnectionType.WRIST, side=self.side)
        mytools.opm_constraint(connect_point, self.zero_cog)


if __name__ == '__main__':
    hand = Hand(name='hand', side='l',
                bones=['hand_l', 'thumb_01_l', 'index_01_l', 'middle_01_l', 'ring_01_l', 'pinky_01_l'])
