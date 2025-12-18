import pymel.core as pm
import mytools
from system_biped.core.master import Master


class CenterOfGravity(object):
    def __init__(self, *, name: str, side: str, bones: list[str]):
        name_template = '{0}' + f'__{side}__{name}__001'
        self.name = name
        self.side = side
        self._bones = bones
        self.joints = [f'jnt__{side}__{name}__00{i + 1}' for i in range(0, len(bones))]

        self.grp_rig = name_template.format('rig')  # group on origin
        self.ctrl_cog = name_template.format('ctrl_cog')  # 重心控制器
        self.zero_cog = name_template.format('zero_cog')  # 重心 zero，链接到父级控制器
        self.zero_jnt = name_template.format('zero_jnt')

        self._create_joints()
        self._constraint_bones()

    def _create_joints(self):
        pm.group(name=self.grp_rig, empty=True)
        mytools.cv_and_zero(name=self.ctrl_cog, target=self._bones[0], shape='ball', radius=2)
        pm.parent(self.zero_cog, self.grp_rig)

        for jnt, bone in zip(self.joints, self._bones):
            mytools.jnt_target(name=jnt, target=bone)
        mytools.parent_chain(self.joints)
        mytools.grp_zero(name=self.zero_jnt, target=self.joints[0])
        pm.parent(self.zero_jnt, self.ctrl_cog)

    def _constraint_bones(self):
        grp_cons = Master.constraint
        if not pm.objExists(grp_cons):
            pm.group(name=grp_cons, empty=True)
        for jnt, bone in zip(self.joints, self._bones):
            point_cons = pm.pointConstraint(jnt, bone)
            orient_cons = pm.orientConstraint(jnt, bone)
            pm.parent(point_cons, orient_cons, grp_cons)

        if pm.objExists(Master.ctrl_root):
            pm.parent(self.grp_rig, Master.ctrl_root)


if __name__ == '__main__':
    jnt_system = CenterOfGravity(name='arm', side='l', bones=['upperarm_l', 'lowerarm_l', 'hand_l'])
