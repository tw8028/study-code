import pymel.core as pm
import mytools


# 需要先确定脚尖，脚后跟的位置，预先创建heal，toes_end，绑定完成后删除
class Foot:
    # name = '{0}__r__{1}__001'
    def __init__(self, *, name, foot, toe, tiptoe, heel):
        self.foot = foot
        self.toe = toe
        self.tiptoe = tiptoe
        self.heel = heel
        self.ctrl_heel = name.format('ctrl', 'heel')
        self.zero_heel = name.format('zero', 'heel')
        self.ctrl_ankle = name.format('ctrl', 'ankle')  # control ik handle 和 joint3_fk
        self.zero_ankle = name.format('zero', 'ankle')
        self.ctrl_tiptoe = name.format('ctrl', 'tiptoe')
        self.zero_tiptoe = name.format('zero', 'tiptoe')
        self.ctrl_toe = name.format('ctrl', 'toe')
        self.zero_toe = name.format('zero', 'toe')
        self.ctrl_roll = name.format('ctrl', 'roll')
        self.zero_roll = name.format('zero', 'roll')

    def create(self):
        mytools.cv_target(name=self.ctrl_ankle, target=self.toe, shape='triangle', radius=1.2)
        mytools.grp_zero(name=self.zero_ankle, target=self.ctrl_ankle)
        mytools.cv_target(name=self.ctrl_toe, target=self.toe, shape='triangle', radius=1)
        mytools.grp_zero(name=self.zero_toe, target=self.ctrl_toe)

        mytools.cv_target(name=self.ctrl_tiptoe, target=self.tiptoe, shape='ball', radius=1)
        mytools.grp_zero(name=self.zero_tiptoe, target=self.ctrl_tiptoe)

        mytools.cv_target(name=self.ctrl_roll, target=self.toe, shape='circle_linear', radius=2)
        mytools.grp_zero(name=self.zero_roll, target=self.ctrl_roll)

        mytools.cv_target(name=self.ctrl_heel, target=self.heel, shape='cube', radius=2)
        mytools.grp_zero(name=self.zero_heel, target=self.ctrl_heel)

        pm.parent(self.zero_ankle, self.zero_toe, self.ctrl_tiptoe)
        pm.parent(self.zero_tiptoe, self.ctrl_roll)
        pm.parent(self.zero_roll, self.ctrl_heel)


if __name__ == '__main__':
    foot = Foot(name='{0}__l__{1}__001', foot='foot_l', toe='ball_l', tiptoe='tiptoe_l', heel='heel_l')
    foot.create()
