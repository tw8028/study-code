import pymel.core as pm
import parts.attr as attr


class Component(object):
    def __init__(self, *, name: str, side: str, joints: list[str]):
        id = '{0}' + f'__{side}__{name}__001'
        self.name = name
        self.side = side
        self.joints = joints

        self.grp_rig = pm.group(name=id.format('rig'), empty=True)  # group on origin
        self.ctrl_cog = id.format('ctrl_cog')  # 重心控制器
        self.zero_cog = id.format('zero_cog')  # 重心 zero 组，链接到父级控制器
        self.jnt_root = id.format('root')  # root joint

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

    def constraint_deform(self):
        if not pm.objExists('constraint'):
            pm.group(name='constraint', empty=True)
        for jnt_rig, jnt in zip(self.constraint_objs, self.joints):
            point_cons = pm.pointConstraint(jnt_rig, jnt)
            orient_cons = pm.orientConstraint(jnt_rig, jnt)
            pm.parent(point_cons, orient_cons, 'constraint')
