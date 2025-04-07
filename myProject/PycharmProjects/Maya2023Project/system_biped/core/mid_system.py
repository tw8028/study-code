import pymel.core as pm
import mytools
from abc import ABC
from system_biped.core.ik_system import IkSystem
from system_biped.interface.joint_limb import IJoint_limb


class MidSystem(IJoint_limb, ABC):
    def __init__(self, ik: IkSystem):
        self.name = ik.name
        self.side = ik.side
        self.grp_rig = ik.grp_rig
        self.ctrl_cog = ik.ctrl_cog
        self.zero_jnt = ik.zero_jnt
        self.joints_ik = ik.joints_ik

        self._joints_mid = [f'jnt__{ik.side}__{ik.name}_mid__00{i + 1}' for i in range(0, len(ik._joints))]
        self._ctrl_mid = f'ctrl__{ik.side}__{ik.name}_mid__001'
        self._zero_mid = f'zero__{ik.side}__{ik.name}_mid__001'

        self._create_mid_jnt()
        self._rig()
        self._stretch()

    def _create_mid_jnt(self):
        for jnt_mid, jnt_ik in zip(self._joints_mid, self.joints_ik):
            mytools.jnt_target(name=jnt_mid, target=jnt_ik)
        mytools.parent_chain(self._joints_mid)
        pm.parent(self._joints_mid[0], self.zero_jnt)

        mytools.cv_and_zero(name=self._ctrl_mid, target=self.joints_ik[1], shape='square', radius=4)
        pm.parent(self._zero_mid, self.grp_rig)

    def _rig(self):
        constraint_mid = pm.orientConstraint(self.joints_ik[0], self.joints_ik[1], self._zero_mid)
        constraint_mid.interpType.set(2)
        pm.pointConstraint(self.joints_ik[1], self._zero_mid)

        aim_vector = (1, 0, 0) if pm.PyNode(self.joints_ik[1]).translateX.get() > 0 else (-1, 0, 0)  # type: ignore
        pm.aimConstraint(self._ctrl_mid, self._joints_mid[0], aimVector=aim_vector, worldUpType='objectrotation',
                         worldUpObject=self.joints_ik[0])
        pm.aimConstraint(self.joints_ik[2], self._joints_mid[1], aimVector=aim_vector, worldUpType='objectrotation',
                         worldUpObject=self.joints_ik[1])
        pm.orientConstraint(self.joints_ik[2], self._joints_mid[2])

    def _stretch(self):
        mytools.stretch_jnt(start_point=self.ctrl_cog, end_point=self._ctrl_mid, joints=[self._joints_mid[0]])
        mytools.stretch_jnt(start_point=self._ctrl_mid, end_point=self.joints_ik[2], joints=[self._joints_mid[1]])

    def get_rig_joints(self):
        return self._joints_mid
