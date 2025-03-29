import pymel.core as pm
import parts.attr as attr
from system_biped.master import Master


class Component(object):
    def __init__(self, *, name: str, side: str, joints: list[str]):
        name_id = '{0}' + f'__{side}__{name}__001'
        self.name = name
        self.side = side
        self.joints = joints

        self.grp_rig = pm.group(name=name_id.format('rig'), empty=True)  # group on origin
        self.ctrl_cog = name_id.format('ctrl_cog')  # 重心控制器
        self.zero_cog = name_id.format('zero_cog')  # 重心 zero 组，链接到父级控制器
        self.jnt_root = name_id.format('root')  # root joint

        self.color = 1
        self.ctrl_list = []
        self.constraint_objs = []  # 用于约束蒙皮关节

    def set_color(self):
        if self.side == 'c':
            self.color = 21
        elif self.side == 'l':
            self.color = 6
        elif self.side == 'r':
            self.color = 13
        else:
            self.color = 24

        for ctrl in self.ctrl_list:
            attr.set_color(obj=ctrl, color=self.color)

    def constraint_deform(self, point: bool = True):
        grp_cons = Master.constraint
        if not pm.objExists(grp_cons):
            pm.group(name=grp_cons, empty=True)
        for jnt_rig, jnt in zip(self.constraint_objs, self.joints):
            if point:
                point_cons = pm.pointConstraint(jnt_rig, jnt)
                pm.parent(point_cons, grp_cons)
            orient_cons = pm.orientConstraint(jnt_rig, jnt)
            pm.parent(orient_cons, grp_cons)

    def post_process(self, is_point_cons: bool = True):
        self.set_color()
        self.constraint_deform(point=is_point_cons)
        if pm.objExists(Master.ctrl_root):
            pm.parent(self.grp_rig, Master.ctrl_root)
