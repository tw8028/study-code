#!/usr/bin/python
# -*- coding:utf-8 -*-
import pymel.core as pm
import package_tools.cv as cv
import package_tools.grp as grp
import package_tools.jnt as jnt
import package_tools.rig as rig


class Clavicle:
    # offset connect to chest end controller
    def __init__(self, clavicle_l, clavicle_r, chest_end):
        self.clavicle_l = clavicle_l
        self.clavicle_r = clavicle_r
        self.clavicle_l_ctrl = cv.cube(name=clavicle_l + "_ctrl", r=5)
        self.clavicle_l_offset = grp.offset(name=clavicle_l + "_offset", pos=clavicle_l, child=self.clavicle_l_ctrl)
        self.clavicle_r_ctrl = cv.cube(name=clavicle_r + "_ctrl", r=5)
        self.clavicle_r_offset = grp.offset(name=clavicle_r + "_offset", pos=clavicle_r, child=self.clavicle_r_ctrl)
        pm.parentConstraint(self.clavicle_l_ctrl, clavicle_l)
        pm.parentConstraint(self.clavicle_r_ctrl, clavicle_r)
        pm.parent(self.clavicle_l_offset, self.clavicle_r_offset, chest_end)
