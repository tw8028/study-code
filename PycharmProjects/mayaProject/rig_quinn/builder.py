#!/usr/bin/python
# -*- coding:utf-8 -*-
import pymel.core as pm
from rig_quinn.quinn_head import Head
from rig_quinn.quinn_spine import Spine
from rig_quinn.quinn_clavicle import Clavicle
from rig_quinn.quinn_limb import Limb


def create():
    spine = Spine("spine_05", "spine_04", "spine_03", "spine_02", "spine_01", "pelvis")
    spine.create_cv()
    yield

    spine.create_ctrl()
    clavicle_l = Clavicle("clavicle_l", "clavicle_r", spine.end_ctrl)

    arm_l = Limb("upperarm_l",
                 "upperarm_twist_01_l",
                 "upperarm_twist_02_l",
                 "lowerarm_l",
                 "lowerarm_twist_02_l",
                 "lowerarm_twist_01_l",
                 "hand_l")
    arm_l.create_all()
    pm.parentConstraint(clavicle_l.clavicle_l_ctrl, arm_l.upper_offset, mo=True)
    yield


global build


def step1(*args):
    global build
    build = create()
    next(build)


def step2(*args):
    global build
    next(build)


def main():
    win = "quinn_builder"
    if pm.window(win, ex=True):
        pm.deleteUI(win)
    with pm.window(win, wh=(280, 100)):
        with pm.columnLayout():
            pm.frameLayout('quinn rigging test')
            with pm.columnLayout():
                pm.button(label='spine_step1', c=step1)
                pm.button(label='spine_step2', c=step2)
        pm.window(win, e=True, title='quinn builder', wh=(240, 120))
        pm.showWindow(win)


if __name__ == '__main__':
    main()
