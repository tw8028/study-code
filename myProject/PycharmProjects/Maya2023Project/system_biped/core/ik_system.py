import pymel.core as pm
import mytools
from system_biped.core.center_of_gravity import CenterOfGravity


class IkSystem:
    def __init__(self, cog: CenterOfGravity):
        self.grp_rig = cog.grp_rig
        self.joints = cog.joints
        self.ctrl_cog = cog.ctrl_cog
        self.zero_jnt = cog.zero_jnt
        self.joints_ik = [jnt.replace('__001', '_ik__001') for jnt in self.joints]

        side = cog.side
        name = cog.name
        self.ik_handle = f'ikHandle__{side}__{name}__001'
        self.ctrl_ikHandle = f'ctrl__{side}__{name}_ikHandle__001'
        self.zero_ikHandle = f'zero__{side}__{name}_ikHandle__001'
        self.ctrl_pole = f'ctrl__{side}__{name}_pole__001'
        self.zero_pole = f'zero__{side}__{name}_pole__001'

        self._create_ik_jnt()
        self._rig()

    def _create_ik_jnt(self):
        for jnt_ik, jnt in zip(self.joints_ik, self.joints):
            mytools.jnt_target(name=jnt_ik, target=jnt)
        mytools.parent_chain(self.joints_ik)
        pm.parent(self.joints_ik[0], self.zero_jnt)

    def _rig(self):
        mytools.cv_and_zero(name=self.ctrl_ikHandle, target=self.joints[2], shape='cube', radius=4)
        ik_handle = pm.ikHandle(name=self.ik_handle, sj=self.joints_ik[0], ee=self.joints_ik[2])[0]  # create ik handle
        ik_handle.visibility.set(0)
        pm.parent(ik_handle, self.ctrl_ikHandle)
        pm.parent(self.zero_ikHandle, self.grp_rig)
        pm.orientConstraint(self.ctrl_ikHandle, self.joints_ik[2])

        mytools.pole_ctrl(self.joints_ik[0], self.joints_ik[1], self.joints_ik[2], self.ctrl_pole, self.zero_pole)
        pm.parent(self.zero_pole, self.grp_rig)
        pm.poleVectorConstraint(self.ctrl_pole, self.ik_handle)
        pm.parent(mytools.connect_line(self.ctrl_pole, self.joints_ik[1]), self.grp_rig)
