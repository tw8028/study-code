import pymel.core as pm
import math


def normalize(vector):
    sum_of_squares = vector[0] ** 2 + vector[1] ** 2 + vector[2] ** 2
    norm = math.sqrt(sum_of_squares)
    return [i / norm for i in vector]


class Limb:
    def __init__(self, joint1, joint2, joint3, side, type):
        self.joint1 = joint1
        self.joint2 = joint2
        self.joint3 = joint3
        # ik joint
        self.joint1_ik = f'jnt__{side}__{joint1}_ik__001'
        self.joint2_ik = f'jnt__{side}__{joint2}_ik__001'
        self.joint3_ik = f'jnt__{side}__{joint3}_ik__001'
        self.zero_jnt_ik = f'zero__{side}__{type}_jnt_ik__001'
        # fk joint
        self.joint1_fk = f'jnt__{side}__{joint1}_fk__001'
        self.joint2_fk = f'jnt__{side}__{joint2}_fk__001'
        self.joint3_fk = f'jnt__{side}__{joint3}_fk__001'
        self.zero_jnt_fk =  f'zero__{side}__{type}_jnt_fk__001'
        # fk rig
        self.ctrl_joint1_fk = f'ctrl__{side}__{joint1}_fk__001'
        self.ctrl_joint2_fk = f'ctrl__{side}__{joint2}_fk__001'
        self.ctrl_joint3_fk = f'ctrl__{side}__{joint3}_fk__001'
        self.zero_joint1_fk = f'zero__{side}__{joint1}_fk__001'
        self.zero_joint1_fk = f'zero__{side}__{joint1}_fk__001'
        self.zero_joint1_fk = f'zero__{side}__{joint1}_fk__001'



