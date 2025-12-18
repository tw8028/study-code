import pymel.core as pm
import mytools
from system_biped.core.ik_system import IkSystem


class MidSystem:
    def __init__(self, ik: IkSystem):
        ik_cog = ik.cog
        name = ik_cog.name
        side = ik_cog.side
        self.grp_rig = ik_cog.grp_rig
        self.ctrl_cog = ik_cog.ctrl_cog
        self.zero_jnt = ik_cog.zero_jnt
        self.joints_ik = ik.joints_ik

        self.joints_mid = [f'jnt__{side}__{name}_mid__00{i + 1}' for i in range(0, len(ik.joints_ik))]
        self._ctrl_mid = f'ctrl__{side}__{name}_mid__001'
        self._zero_mid = f'zero__{side}__{name}_mid__001'

        self._create_mid_jnt()
        self._rig()
        self._stretch()

    def _create_mid_jnt(self):
        for jnt_mid, jnt_ik in zip(self.joints_mid, self.joints_ik):
            mytools.jnt_target(name=jnt_mid, target=jnt_ik)
        mytools.parent_chain(self.joints_mid)
        pm.parent(self.joints_mid[0], self.zero_jnt)

        mytools.cv_and_zero(name=self._ctrl_mid, target=self.joints_ik[1], shape='square', radius=4)
        pm.parent(self._zero_mid, self.grp_rig)

    def _rig(self):
        constraint_mid = pm.orientConstraint(self.joints_ik[0], self.joints_ik[1], self._zero_mid)
        constraint_mid.interpType.set(2)
        pm.pointConstraint(self.joints_ik[1], self._zero_mid)

        aim_vector = (1, 0, 0) if pm.PyNode(self.joints_ik[1]).translateX.get() > 0 else (-1, 0, 0)  # type: ignore
        pm.aimConstraint(self._ctrl_mid, self.joints_mid[0], aimVector=aim_vector, worldUpType='objectrotation',
                         worldUpObject=self.joints_ik[0])
        pm.aimConstraint(self.joints_ik[2], self.joints_mid[1], aimVector=aim_vector, worldUpType='objectrotation',
                         worldUpObject=self.joints_ik[1])
        pm.orientConstraint(self.joints_ik[2], self.joints_mid[2])

    def _stretch(self):
        mytools.stretch_jnt(start_point=self.ctrl_cog, end_point=self._ctrl_mid, joints=[self.joints_mid[0]])
        mytools.stretch_jnt(start_point=self._ctrl_mid, end_point=self.joints_ik[2], joints=[self.joints_mid[1]])
