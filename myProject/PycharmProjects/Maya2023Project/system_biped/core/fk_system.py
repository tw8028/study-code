import pymel.core as pm
import mytools
from abc import ABC
from system_biped.core.center_of_gravity import CenterOfGravity
from system_biped.interface.joint_limb import IJoint_limb


class FkSystem(IJoint_limb, ABC):
    def __init__(self, cog: CenterOfGravity):
        self._joints = cog.joints
        self._grp_rig = cog.grp_rig
        self._ctrl_cog = cog.ctrl_cog
        self._zero_jnt = cog.zero_jnt
        self._joints_fk = [f'jnt__{cog.side}__{cog.name}_fk__00{i + 1}' for i in range(0, len(cog.joints))]
        self._ctrl_list = [f'ctrl__{cog.side}__{cog.name}_fk__00{i + 1}' for i in range(0, len(cog.joints))]
        self._zero_list = [f'zero__{cog.side}__{cog.name}_fk__00{i + 1}' for i in range(0, len(cog.joints))]

        self._create_fk_jnt()
        self._rig()

    def _create_fk_jnt(self):
        for jnt_fk, jnt in zip(self._joints_fk, self._joints):
            mytools.jnt_target(name=jnt_fk, target=jnt)
        mytools.parent_chain(self._joints_fk)
        pm.parent(self._joints_fk[0], self._zero_jnt)

    def _rig(self):
        ctrl_list = []
        for jnt_fk in self._joints_fk:
            name = jnt_fk.split('__', 1)[1]
            ctrl = mytools.cv_target(name='ctrl__' + name, target=jnt_fk, shape='circle', radius=10)
            zero = mytools.grp_zero(name='zero__' + name, target=ctrl)
            pm.parent(zero, self._ctrl_cog)
            pm.orientConstraint(ctrl, jnt_fk)
            var = ctrl.scaleX >> pm.PyNode(jnt_fk).scaleX  # type: ignore
            if len(ctrl_list):
                pm.parentConstraint(ctrl_list[-1], zero, maintainOffset=True)
            ctrl_list.append(ctrl)

    def get_rig_joints(self):
        return self._joints_fk


if __name__ == '__main__':
    base = CenterOfGravity(name='arm', side='l', bones=['upperarm_l', 'lowerarm_l', 'hand_l'])
    fk = FkSystem(cog=base)
