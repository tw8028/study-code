import pymel.core as pm
import mytools
from abc import ABC
from system_biped.core.center_of_gravity import CenterOfGravity
from system_biped.interface.joint_limb import IJoint_limb


class IkSystem(IJoint_limb, ABC):
    def __init__(self, cog: CenterOfGravity):
        self.name = cog.name
        self.side = cog.side
        self.grp_rig = cog.grp_rig
        self.joints = cog.joints
        self.ctrl_cog = cog.ctrl_cog
        self.zero_jnt = cog.zero_jnt
        self.joints_ik = [f'jnt__{self.side}__{jnt}_ik__001' for jnt in cog._bones]

        self.side = cog.side
        self.name = cog.name
        self.ik_handle = f'ikHandle__{self.side}__{self.name}__001'
        self.ctrl_ikHandle = f'ctrl__{self.side}__{self.name}_ikHandle__001'
        self.zero_ikHandle = f'zero__{self.side}__{self.name}_ikHandle__001'
        self.ctrl_pole = f'ctrl__{self.side}__{self.name}_pole__001'
        self.zero_pole = f'zero__{self.side}__{self.name}_pole__001'

        self.attr_stretch = f'{self.ctrl_ikHandle}.stretch'

        self._create_ik_jnt()
        self._rig()
        self._stretch()

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

    def _stretch(self):
        pm.addAttr(self.ctrl_ikHandle, longName='stretch', attributeType='bool', defaultValue=1, keyable=True)
        mytools.stretch_ik(attr_stretch=self.attr_stretch, jnt1_offset=self.ctrl_cog,
                           handle_ctrl=self.ctrl_ikHandle, ik_jnt1=self.joints_ik[0], ik_jnt2=self.joints_ik[1],
                           ik_jnt3=self.joints_ik[2])

    def get_rig_joints(self):
        return self.joints_ik
