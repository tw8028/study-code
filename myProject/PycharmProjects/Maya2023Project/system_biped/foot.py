import pymel.core as pm
import mytools
from abc import ABC
from system_biped.interface.connection import IConnectionPointProvider
from system_biped.interface.connection import IConnectionPointUser
from system_biped.interface.connection import ConnectionType
from system_biped.core.center_of_gravity import CenterOfGravity
from system_biped.limb import Limb
from system_biped.core.fk_system import FkSystem
from system_biped.core.mid_system import MidSystem


class Foot:
    def __init__(self, name: str, side: str, bones: list[str], leg: Limb):
        self.leg = leg
        self.bone_foot = bones[0]
        self.bone_ball = bones[1]
        self.bone_tiptoe = bones[2]
        self.bone_heel = bones[3]
        self.grp_rig = f'rig__{side}__{name}__001'
        self.grp_jnt = f'zero_jnt__{side}__{name}__001'

        self.ball = f'jnt__{side}__ball__001'
        self.ball_fk = f'jnt__{side}__ball_fk__001'
        self.ctrl_ball_fk = f'ctrl__{side}__ball_fk__001'
        self.zero_ball_fk = f'zero__{side}__ball_fk__001'
        self.input_ball_fk = f'input__{side}__ball_fk__001'

        self.ball_ik = f'jnt__{side}__ball_ik__001'
        self._create_main()
        self._create_fk()

    def _create_main(self):
        pm.group(name=self.grp_rig, empty=True)
        pm.group(name=self.grp_jnt, empty=True)
        pm.parent(self.grp_jnt, self.grp_rig)
        mytools.jnt_target(name=self.ball, target=self.bone_ball)
        pm.parent(self.ball, self.grp_jnt)
        pm.pointConstraint(self.ball, self.bone_ball)
        pm.orientConstraint(self.ball, self.bone_ball)

    def _create_fk(self):
        jnt = mytools.jnt_target(name=self.ball_fk, target=self.ball)
        mytools.cv_and_zero(name=self.ctrl_ball_fk, target=self.ball_fk, shape='circle', radius=4)
        pm.parent(jnt, self.ctrl_ball_fk)

        input = mytools.grp_target(name=self.input_ball_fk, target=self.bone_foot)
        pm.parent(input, self.grp_rig)
        pm.parent(self.zero_ball_fk, input)
        mytools.opm_constraint(self.leg.fk.ctrl_list[-1], input)


if __name__ == '__main__':
    foot_l = Foot(name='foot_l', side='l', bones=['foot_l', 'ball_l', 'tiptoe_l', 'heel_l'])
