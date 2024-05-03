#!/usr/bin/python
# -*- coding:utf-8 -*-
import pymel.core as pm
import importlib
import package_tools.grp as grp
import rig_quinn
from rig_quinn.head import Head
from rig_quinn.spine import Spine
from rig_quinn.clavicle import Clavicle
from rig_quinn.limb import Limb
from rig_quinn.hand import Hand
from rig_quinn.foot import Foot


def relord():
    importlib.reload(rig_quinn.head)
    importlib.reload(rig_quinn.spine)
    importlib.reload(rig_quinn.clavicle)
    importlib.reload(rig_quinn.limb)
    importlib.reload(rig_quinn.hand)
    importlib.reload(rig_quinn.foot)


# drive by using offset parent matrix
# 只适用driven父级在原点，否则，使用 package_tools.rig.parent_constraint
def connect(driver, driven):
    # create output group on driver
    output = grp.target(name="output_to_" + driven, pos=driven)
    pm.parent(output, driver)

    output.worldMatrix[0] >> pm.PyNode(driven).offsetParentMatrix
    pm.xform(driven, t=(0, 0, 0), ro=(0, 0, 0))


def create():
    print("a")
    spine = Spine("spine_05", "spine_04", "spine_03", "spine_02", "spine_01", "pelvis")
    spine.create_ikjnts()
    spine.create_cv()
    yield

    spine.create_ctrl()
    spine.constraint_ikjnts()
    clavicle = Clavicle("clavicle_l", "clavicle_r", spine.end_ctrl)

    arm_l = Limb("upperarm_l",
                 "upperarm_twist_01_l",
                 "upperarm_twist_02_l",
                 "lowerarm_l",
                 "lowerarm_twist_02_l",
                 "lowerarm_twist_01_l",
                 "hand_l",
                 (1, 0, 0))
    connect(clavicle.clavicle_l_ctrl, arm_l.upper_offset)

    arm_r = Limb('upperarm_r',
                 'upperarm_twist_01_r',
                 'upperarm_twist_02_r',
                 'lowerarm_r',
                 'lowerarm_twist_02_r',
                 'lowerarm_twist_01_r',
                 'hand_r',
                 (-1, 0, 0))
    connect(clavicle.clavicle_r_ctrl, arm_r.upper_offset)

    leg_l = Limb('thigh_l',
                 'thigh_twist_01_l',
                 'thigh_twist_02_l',
                 'calf_l',
                 'calf_twist_02_l',
                 'calf_twist_01_l',
                 'foot_l',
                 (-1, 0, 0))
    connect(spine.pelvis_ctrl, leg_l.upper_offset)

    leg_r = Limb('thigh_r',
                 'thigh_twist_01_r',
                 'thigh_twist_02_r',
                 'calf_r',
                 'calf_twist_02_r',
                 'calf_twist_01_r',
                 'foot_r',
                 (1, 0, 0))
    connect(spine.pelvis_ctrl, leg_r.upper_offset)

    head = Head("neck_01", "neck_02", "head", mode="inbetwent")
    connect(spine.end_ctrl, head.neck_offset)

    hand_l = Hand('hand_l', 'thumb_01_l', 'index_01_l', 'middle_01_l', 'ring_01_l', 'pinky_01_l')
    hand_l.create_fingers()
    connect(arm_l.end_ctrl, hand_l.hand_offset)

    hand_r = Hand('hand_r', 'thumb_01_r', 'index_01_r', 'middle_01_r', 'ring_01_r', 'pinky_01_r')
    hand_r.create_fingers()
    connect(arm_r.end_ctrl, hand_r.hand_offset)

    foot_l = Foot('foot_l', 'ball_l', 'ball_l_end', 'foot_l_end')
    foot_l.create()
    connect(foot_l.foot_ctrl, leg_l.handle_offset)
    foot_r = Foot('foot_r', 'ball_r', 'ball_r_end', 'foot_r_end')
    foot_r.create()
    connect(foot_r.foot_ctrl, leg_r.handle_offset)
    yield


func = create()


def step1(*args):
    next(func)


def step2(*args):
    next(func)


def main():
    win = "quinn_builder"
    if pm.window(win, ex=True):
        pm.deleteUI(win)
    with pm.window(win, wh=(280, 100)):
        with pm.columnLayout():
            pm.frameLayout('quinn rigging test')
            with pm.columnLayout():
                pm.button(label='step1', c=step1)
                pm.button(label='step2', c=step2)
        pm.window(win, e=True, title='quinn builder', wh=(240, 120))
        pm.showWindow(win)


if __name__ == '__main__':
    relord()
    main()
