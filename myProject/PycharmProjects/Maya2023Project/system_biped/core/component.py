import pymel.core as pm
import mytools
from system_biped.master import Master


class Component(object):
    def __init__(self, *, name: str, side: str, bones: list[str]):
        name_id = '{0}' + f'__{side}__{name}__001'
        self.name = name
        self.side = side
        self.bones = bones
        self.joints = [f'jnt__{side}__{jnt}__001' for jnt in bones]

        self.grp_rig = name_id.format('rig')  # group on origin
        self.ctrl_cog = name_id.format('ctrl_cog')  # 重心控制器
        self.zero_cog = name_id.format('zero_cog')  # 重心 zero 组，链接到父级控制器
        self.grp_jnt = name_id.format('jnt_grp')

        self._create()

    def _create(self):
        pm.group(name=self.grp_rig, empty=True)
        mytools.cv_and_zero(name=self.ctrl_cog, target=self.bones[0], shape='ball', radius=2)
        pm.parent(self.zero_cog, self.grp_rig)

        for jnt, bone in zip(self.joints, self.bones):
            mytools.jnt_target(name=jnt, target=bone)
        mytools.grp_child(name=self.grp_jnt, parent=self.ctrl_cog, position=self.bones[0])
        mytools.parent_chain([self.grp_jnt, *self.joints])

    def constraint_bones(self, point: bool = True, orient: bool = True):
        grp_cons = Master.constraint
        if not pm.objExists(grp_cons):
            pm.group(name=grp_cons, empty=True)
        for jnt, bone in zip(self.joints, self.bones):
            if point:
                point_cons = pm.pointConstraint(jnt, bone)
                pm.parent(point_cons, grp_cons)
            if orient:
                orient_cons = pm.orientConstraint(jnt, bone)
                pm.parent(orient_cons, grp_cons)

        if pm.objExists(Master.ctrl_root):
            pm.parent(self.grp_rig, Master.ctrl_root)
