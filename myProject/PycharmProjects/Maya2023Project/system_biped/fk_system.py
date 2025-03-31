import pymel.core as pm
import mytools
from system_biped.rig_base import RigBase


class FkSystem:
    def __init__(self, rig_base: RigBase):
        self._base = rig_base
        self._joints = self._base.joints
        self.joints_fk = [jnt.replace('__001', '_fk__001') for jnt in self._joints]
        self.ctrl_list = ['ctrl__' + jnt.split('__', 1)[1] for jnt in self.joints_fk]
        self.zero_list = ['zero__' + jnt.split('__', 1)[1] for jnt in self.joints_fk]

    def create(self):
        for jnt_fk, jnt in zip(self.joints_fk, self._joints):
            mytools.jnt_target(name=jnt_fk, target=jnt)
        mytools.parent_chain(self.joints_fk)
        pm.parent(self.joints_fk[0], self._base.grp_jnt)

        ctrl_list = []
        for jnt_fk in self.joints_fk:
            name = jnt_fk.split('__', 1)[1]
            ctrl = mytools.cv_target(name='ctrl__' + name, target=jnt_fk, shape='circle', radius=10)
            zero = mytools.grp_zero(name='zero__' + name, target=ctrl)
            pm.parent(zero, self._base.ctrl_cog)
            pm.orientConstraint(ctrl, jnt_fk)
            var = ctrl.scaleX >> pm.PyNode(jnt_fk).scaleX  # type: ignore
            if len(ctrl_list):
                pm.parentConstraint(ctrl_list[-1], zero, maintainOffset=True)
            ctrl_list.append(ctrl)

if __name__ == '__main__':
    com = RigBase(name='arm', side='l', bones=['upperarm_l', 'lowerarm_l', 'hand_l'])
    com.create()
    fk = FkSystem(com)
    fk.create()
