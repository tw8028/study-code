import pymel.core as pm
import mytools
from system_biped.core.center_of_gravity import CenterOfGravity


class FkSystem:
    def __init__(self, cog: CenterOfGravity):
        self.joints = cog.joints
        self.ctrl_cog = cog.ctrl_cog
        self.zero_jnt = cog.zero_jnt
        self.joints_fk = [jnt.replace('__001', '_fk__001') for jnt in self.joints]
        self.ctrl_list = ['ctrl__' + jnt.split('__', 1)[1] for jnt in self.joints_fk]
        self.zero_list = ['zero__' + jnt.split('__', 1)[1] for jnt in self.joints_fk]

        self._create_fk_jnt()
        self._rig()

    def _create_fk_jnt(self):
        for jnt_fk, jnt in zip(self.joints_fk, self.joints):
            mytools.jnt_target(name=jnt_fk, target=jnt)
        mytools.parent_chain(self.joints_fk)
        pm.parent(self.joints_fk[0], self.zero_jnt)

    def _rig(self):
        ctrl_list = []
        for jnt_fk in self.joints_fk:
            name = jnt_fk.split('__', 1)[1]
            ctrl = mytools.cv_target(name='ctrl__' + name, target=jnt_fk, shape='circle', radius=10)
            zero = mytools.grp_zero(name='zero__' + name, target=ctrl)
            pm.parent(zero, self.ctrl_cog)
            pm.orientConstraint(ctrl, jnt_fk)
            var = ctrl.scaleX >> pm.PyNode(jnt_fk).scaleX  # type: ignore
            if len(ctrl_list):
                pm.parentConstraint(ctrl_list[-1], zero, maintainOffset=True)
            ctrl_list.append(ctrl)


if __name__ == '__main__':
    base = CenterOfGravity(name='arm', side='l', bones=['upperarm_l', 'lowerarm_l', 'hand_l'])
    fk = FkSystem(cog=base)
