import pymel.core as pm
import mytools
from system_biped.master import Master


class RigBase(object):
    def __init__(self, *, name: str, side: str, bones: list[str]):
        name_template = '{0}' + f'__{side}__{name}__001'
        self.name = name
        self.side = side
        self._bones = bones
        self.joints = [f'jnt__{side}__{jnt}__001' for jnt in bones]

        self.grp_rig = name_template.format('rig')  # group on origin
        self.ctrl_cog = name_template.format('ctrl_cog')  # 重心控制器
        self.zero_cog = name_template.format('zero_cog')  # 重心 zero 组，链接到父级控制器
        self.grp_jnt = name_template.format('jnt_grp')

    def create(self):
        for jnt, bone in zip(self.joints, self._bones):
            mytools.jnt_target(name=jnt, target=bone)
        mytools.parent_chain(self.joints)
        mytools.grp_zero(name=self.grp_jnt, target=self.joints[0])

        mytools.cv_and_zero(name=self.ctrl_cog, target=self._bones[0], shape='ball', radius=2)

        pm.group(name=self.grp_rig, empty=True)
        pm.parent(self.grp_jnt, self.zero_cog, self.grp_rig)

    def constraint_bones(self):
        grp_cons = Master.constraint
        if not pm.objExists(grp_cons):
            pm.group(name=grp_cons, empty=True)
        for jnt, bone in zip(self.joints, self._bones):
            point_cons = pm.pointConstraint(jnt, bone)
            orient_cons = pm.orientConstraint(jnt, bone)
            pm.parent(point_cons, orient_cons, grp_cons)

        if pm.objExists(Master.ctrl_root):
            pm.parent(self.grp_rig, Master.ctrl_root)

    @staticmethod
    def _create_connect_point(parent, position, connection_type, side):
        # side 表示被链接组件的边
        name = f'connect__{side}__{connection_type.value}__001'
        if pm.objExists(name):
            return pm.PyNode(name)
        return mytools.grp_child(name=name, parent=parent, position=position)


if __name__ == '__main__':
    com = RigBase(name='arm', side='l', bones=['upperarm_l', 'lowerarm_l', 'hand_l'])
    com.create()
