import pymel.core as pm
import mytools
from system_biped.core.center_of_gravity import CenterOfGravity


class IkSystem:
    def __init__(self, cog: CenterOfGravity):
        self.cog = cog
        name = cog.name
        side = cog.side
        self._joints = cog.joints
        self._grp_rig = cog.grp_rig
        self._ctrl_cog = cog.ctrl_cog
        self._zero_jnt = cog.zero_jnt
        self.joints_ik = [f'jnt__{cog.side}__{cog.name}_ik__00{i + 1}' for i in range(0, len(cog.joints))]

        self._ik_handle = f'ikHandle__{side}__{name}__001'
        self.ctrl_ikHandle = f'ctrl__{side}__{name}_ikHandle__001'
        self._zero_ikHandle = f'zero__{side}__{name}_ikHandle__001'
        self._ctrl_pole = f'ctrl__{side}__{name}_pole__001'
        self._zero_pole = f'zero__{side}__{name}_pole__001'

        self.attr_stretch = f'{self.ctrl_ikHandle}.stretch'

        self._create_ik_jnt()
        self._rig()
        self._stretch()

    def _create_ik_jnt(self):
        for jnt_ik, jnt in zip(self.joints_ik, self._joints):
            mytools.jnt_target(name=jnt_ik, target=jnt)
        mytools.parent_chain(self.joints_ik)
        pm.parent(self.joints_ik[0], self._zero_jnt)

    def _rig(self):
        mytools.cv_and_zero(name=self.ctrl_ikHandle, target=self._joints[2], shape='cube', radius=4)
        ik_handle = pm.ikHandle(name=self._ik_handle, sj=self.joints_ik[0], ee=self.joints_ik[2])[0]  # create ik handle
        ik_handle.visibility.set(0)
        pm.parent(ik_handle, self.ctrl_ikHandle)
        pm.parent(self._zero_ikHandle, self._grp_rig)
        pm.orientConstraint(self.ctrl_ikHandle, self.joints_ik[2])

        mytools.pole_ctrl(self.joints_ik[0], self.joints_ik[1], self.joints_ik[2], self._ctrl_pole, self._zero_pole)
        pm.parent(self._zero_pole, self._grp_rig)
        pm.poleVectorConstraint(self._ctrl_pole, self._ik_handle)
        pm.parent(mytools.connect_line(self._ctrl_pole, self.joints_ik[1]), self._grp_rig)

    def _stretch(self):
        pm.addAttr(self.ctrl_ikHandle, longName='stretch', attributeType='bool', defaultValue=1, keyable=True)
        mytools.stretch_ik(attr_stretch=self.attr_stretch, jnt1_offset=self._ctrl_cog,
                           handle_ctrl=self.ctrl_ikHandle, ik_jnt1=self.joints_ik[0], ik_jnt2=self.joints_ik[1],
                           ik_jnt3=self.joints_ik[2])
