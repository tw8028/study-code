import pymel.core as pm
import mytools
from abc import ABC
from system_biped.interface.connection import IConnectionPointProvider
from system_biped.interface.connection import IConnectionPointUser
from system_biped.interface.connection import ConnectionType
from system_biped.core.master import Master


class Hand(IConnectionPointUser, ABC):
    def __init__(self, name: str, side: str, bones: list[str]):
        self._name = name
        self._side = side
        self._hand = bones[0]
        self._fingers = bones[1:]
        self._grp_rig = f'rig__{side}__{name}__001'
        self._ctrl_cog = f'ctrl_cog__{side}__{name}__001'
        self._zero_cog = f'zero_cog__{side}__{name}__001'

        self._create_cog()
        self._create_all()

    def _create_cog(self):
        pm.group(name=self._grp_rig, empty=True)
        mytools.cv_and_zero(name=self._ctrl_cog, target=self._hand, shape='ball', radius=2)
        pm.parent(self._zero_cog, self._grp_rig)
        if pm.objExists(Master.ctrl_root):
            pm.parent(self._grp_rig, Master.ctrl_root)

    def _create_ctrl(self, bones):
        grp_cons = Master.constraint
        if not pm.objExists(grp_cons):
            pm.group(name=grp_cons, empty=True)

        ctrl_list = [self._ctrl_cog]
        name = bones[0].split('_', 1)[0]
        for index, bone in enumerate(bones):
            zero = f'zero__{self._side}__{name}__00{index + 1}'
            ctrl = f'ctrl__{self._side}__{name}__00{index + 1}'
            mytools.cv_and_zero(name=ctrl, target=bone, shape='circle', radius=2)
            orient_cons = pm.orientConstraint(ctrl, bone)
            point_cons = pm.pointConstraint(ctrl, bone)
            pm.parent(orient_cons, point_cons, grp_cons)
            pm.parent(zero, ctrl_list[-1])
            ctrl_list.append(ctrl)

    def _create_all(self):
        for root in self._fingers:
            joints = mytools.get_children(root=root)
            print(joints)
            self._create_ctrl(joints)

    def connect_to(self, point_provider: IConnectionPointProvider, connection_type):
        connect_point = point_provider.get_connection_point(connection_type=ConnectionType.WRIST, side=self._side)
        mytools.opm_constraint(connect_point, self._zero_cog)


if __name__ == '__main__':
    hand = Hand(name='hand', side='l',
                bones=['hand_l', 'thumb_01_l', 'index_01_l', 'middle_01_l', 'ring_01_l', 'pinky_01_l'])
