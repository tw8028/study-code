#!/usr/bin/python
# -*- coding:utf-8 -*-
import pymel.core as pm

from package_tools import *

import rig_quinn.config as config

from rig_quinn.head import Head
from rig_quinn.spine import Spine
from rig_quinn.clavicle import Clavicle
from rig_quinn.limb import Limb
from rig_quinn.finger import Finger
from rig_quinn.foot import Foot
from rig_quinn.switch_limb import SwitchLimb


# drive by using offset parent matrix
def connect(driver, driven):
    # create output group on driver 并保持偏移
    output = grp.target(name="output_" + driven, pos=driven)
    pm.parent(output, driver)
    # noinspection PyBroadException
    try:
        driven_parent = pm.listRelatives(driven, parent=True)[0]
        mult_matrix_nd = pm.createNode("multMatrix", n="multMatrix_" + driver)
        # driver worldMatrix * driven_parent worldInverseMatrix
        output.worldMatrix[0] >> mult_matrix_nd.matrixIn[0]
        driven_parent.worldInverseMatrix[0] >> mult_matrix_nd.matrixIn[1]
        mult_matrix_nd.matrixSum >> pm.PyNode(driven).offsetParentMatrix
    except:
        output.worldMatrix[0] >> pm.PyNode(driven).offsetParentMatrix
    pm.xform(driven, t=(0, 0, 0), ro=(0, 0, 0))
    # noinspection PyBroadException
    try:
        pm.xform(driven, t=(0, 0, 0), ro=(0, 0, 0))
        pm.PyNode(driven).jointOrient.set(0, 0, 0)
    except:
        pass


def create():
    rig.constraint_opm('Main', 'root', mo=True)
    foot_l = Foot('foot_l', 'ball_l')
    foot_r = Foot('foot_r', 'ball_r')

    spine = Spine("spine_05", "spine_04", "spine_03", "spine_02", "spine_01", "pelvis")
    spine.create_ikjnts()
    spine.create_cv()

    yield

    spine.create_ctrl()
    spine.constraint_ikjnts()
    clavicle = Clavicle("clavicle_l", "clavicle_r", spine.end_ctrl)

    arm_l = SwitchLimb("upperarm_l",
                       "upperarm_twist_01_l",
                       "upperarm_twist_02_l",
                       "lowerarm_l",
                       "lowerarm_twist_02_l",
                       "lowerarm_twist_01_l",
                       "hand_l",
                       (1, 0, 0))
    connect(clavicle.clavicle_l_ctrl, arm_l.joint_point)

    arm_r = SwitchLimb('upperarm_r',
                       'upperarm_twist_01_r',
                       'upperarm_twist_02_r',
                       'lowerarm_r',
                       'lowerarm_twist_02_r',
                       'lowerarm_twist_01_r',
                       'hand_r',
                       (-1, 0, 0))
    connect(clavicle.clavicle_r_ctrl, arm_r.joint_point)

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

    hand_l = Finger('hand_l', 'thumb_01_l', 'index_01_l', 'middle_01_l', 'ring_01_l', 'pinky_01_l')

    hand_r = Finger('hand_r', 'thumb_01_r', 'index_01_r', 'middle_01_r', 'ring_01_r', 'pinky_01_r')

    foot_l.create()
    connect(foot_l.foot_ctrl, leg_l.handle_offset)

    foot_r.create()
    connect(foot_r.foot_ctrl, leg_r.handle_offset)

    yield


func = create()


def nect_create(*args):
    next(func)


def main():
    win = "quinn_builder"
    if pm.window(win, ex=True):
        pm.deleteUI(win)
    with pm.window(win, wh=(280, 100)):
        with pm.columnLayout():
            pm.frameLayout('quinn rigging builder')
            with pm.columnLayout():
                pm.button(label='step1', c=nect_create)
                pm.button(label='read_shape', c=config.read)
                pm.button(label='write_shape', c=config.write)
        pm.window(win, e=True, title='quinn builder', wh=(240, 120))
        pm.showWindow(win)


if __name__ == '__main__':
    main()
