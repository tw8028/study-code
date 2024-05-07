#!/usr/bin/python
# -*- coding:utf-8 -*-
import pymel.core as pm
import package_tools.grp as grp
import package_tools.cv as cv
import package_tools.rig as rig
import package_tools.jnt as jnt


class Foot:

    def __init__(self, foot, ball):
        self.foot = foot
        self.ball = ball
        self.foot_end = jnt.new(foot, name=foot + '_end')
        pm.xform(self.foot_end, t=(-8, 5, 0) if '_l' in self.foot else (8, -5, 0))
        self.ball_end = jnt.new(ball, name=ball + '_end')
        pm.xform(self.ball_end, t=(7, 0, 0) if '_l' in self.foot else (-7, 0, 0))

        self.foot_trp = pm.group(empty=True, n=self.foot + '_grp')
        self.foot_ctrl = None

    def create(self):
        # back
        back_ctrl = cv.heel(self.foot + '_backCtrl')
        back_offset = grp.offset(name=self.foot + '_backOffset', pos=self.foot_end, child=back_ctrl)
        # mid
        mid_ctrl = cv.sole(self.foot + '_midCtrl')
        mid_offset = grp.offset(name=self.foot + '_midOffset', pos=self.ball, child=mid_ctrl)
        rig.align(mid_offset, self.foot_end, t=False, ro=True)
        # front
        front_ctrl = cv.tip(self.foot + '_frontCtrl')
        front_offset = grp.offset(name=self.foot + '_frontOffset', pos=self.ball_end, child=front_ctrl)
        rig.align(front_offset, self.foot_end, t=False, ro=True)
        # ankle
        ankle_ctrl = cv.ankle(self.foot + '_ankleCtrl')
        ankle_offset = grp.offset(name=self.foot + '_ankleOffset', pos=self.ball, child=ankle_ctrl)
        rig.align(ankle_offset, self.foot_end, t=False, ro=True)
        self.foot_ctrl = ankle_ctrl
        # toes
        toes_ctrl = cv.toes(self.foot + '_toesCtrl')
        toes_offset = grp.offset(name=self.foot + '_toesOffset', pos=self.ball, child=toes_ctrl)
        rig.align(toes_offset, self.foot_end, t=False, ro=True)
        # parent
        pm.parent(ankle_offset, toes_offset, front_ctrl)
        pm.parent(front_offset, mid_ctrl)
        pm.parent(mid_offset, back_ctrl)
        pm.parent(back_offset, self.foot_trp)
        # constraint deform
        pm.pointConstraint(toes_ctrl, self.ball)
        pm.orientConstraint(toes_ctrl, self.ball, mo=True)

        for i in [mid_ctrl, front_ctrl, ankle_ctrl, toes_ctrl]:
            i.translate.set(lock=True)
        pm.delete(self.foot_end, self.ball_end)
