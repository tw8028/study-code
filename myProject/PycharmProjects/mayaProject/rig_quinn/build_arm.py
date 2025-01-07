#!/usr/bin/python
# -*- coding:utf-8 -*-
import pymel.core as pm

import package_tools.cv as cv
import package_tools.grp as grp
import package_tools.jnt as jnt
import package_tools.rig as rig


class Arm:
    def __init__(self, chest_end, clavicle, upper, lower, end, aim_vector, stretch=True):
        self.chest_end = chest_end
        self.clavicle = clavicle
        self.upper = upper
        self.lower = lower
        self.end = end
        self.aim_vector = aim_vector

        self.fk_upper = jnt.new(upper, name="FK_" + upper)
        self.fk_lower = jnt.new(lower, name="FK_" + lower)
        self.fk_end = jnt.new(end, name="FK_" + end)
        self.fk_grp = pm.group(n=self.fk_upper + '_grp', empty=True)

        # create clavicle
        self.clavicle_ctrl = cv.cube(name=clavicle + "_ctrl", r=5)
        name = 'L_arm_offset' if '_l' in clavicle.lower() else 'R_arm_offset'
        self.arm_offset = grp.offset(name=name, pos=clavicle, child=self.clavicle_ctrl)
        # noinspection PyBroadException
        try:
            pm.parent(self.arm_offset, 'arm_system')
        except:
            pm.parent(self.arm_offset, pm.group(n='arm_system', empty=1))
        rig.constraint_opm(chest_end, self.arm_offset, mo=True)

        # upper point
        self.upper_point = grp.target(name=upper + '_point', pos=upper)
        pm.parent(self.upper_point, self.clavicle_ctrl)


if __name__ == '__main__':
    arm_l = Arm("spine_05", "clavicle_l", "upperarm_l", "lowerarm_l", "hand_l", (1, 0, 0))
