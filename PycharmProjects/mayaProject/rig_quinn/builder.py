#!/usr/bin/python
# -*- coding:utf-8 -*-

import pymel.core as pm
import package_tools.grp as grp
import package_tools.rig as rig
import package_tools.jnt as jnt
import rig_quinn.config as config

from rig_quinn.clavicle import Clavicle
from rig_quinn.finger import Finger
from rig_quinn.foot import Foot
from rig_quinn.head import Head
from rig_quinn.limb import Limb
from rig_quinn.spine import Spine
from rig_quinn.switch_limb import SwitchLimb
from rig_quinn.twist import Twist


# 添加stretch twist属性，使用属性开启关闭功能
# drive by using offset parent matrix
def connect(driver, driven):
    driven_nd= pm.PyNode(driven)
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
        mult_matrix_nd.matrixSum >> driven_nd.offsetParentMatrix
    except:
        output.worldMatrix[0] >> driven_nd.offsetParentMatrix
    pm.xform(driven, t=(0, 0, 0), ro=(0, 0, 0))
    # noinspection PyBroadException
    try:
        pm.xform(driven, t=(0, 0, 0), ro=(0, 0, 0))
        driven_nd.jointOrient.set(0, 0, 0)
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

    arm_l = SwitchLimb("upperarm_l", "lowerarm_l", "hand_l", (1, 0, 0))
    connect(clavicle.clavicle_l_ctrl, arm_l.joint_point)

    arm_r = SwitchLimb('upperarm_r', 'lowerarm_r', 'hand_r', (-1, 0, 0))
    connect(clavicle.clavicle_r_ctrl, arm_r.joint_point)

    leg_l = Limb('thigh_l', 'calf_l', 'foot_l', (-1, 0, 0))
    connect(spine.pelvis_ctrl, leg_l.upper_offset)

    leg_r = Limb('thigh_r', 'calf_r', 'foot_r', (1, 0, 0))
    connect(spine.pelvis_ctrl, leg_r.upper_offset)

    head = Head("neck_01", "neck_02", "head", mode="inbetwent")
    connect(spine.end_ctrl, head.neck_offset)

    Finger('hand_l', 'thumb_01_l', 'index_01_l', 'middle_01_l', 'ring_01_l', 'pinky_01_l')

    Finger('hand_r', 'thumb_01_r', 'index_01_r', 'middle_01_r', 'ring_01_r', 'pinky_01_r')

    foot_l.create()
    connect(foot_l.foot_ctrl, leg_l.handle_offset)

    foot_r.create()
    connect(foot_r.foot_ctrl, leg_r.handle_offset)

    upper_l_twist = Twist('upperarm_l', upper=True, x_axis=1)
    upper_l_twist.create('upperarm_twist_01_l', -2 / 3)
    upper_l_twist.create('upperarm_twist_02_l', -1 / 3)

    lower_l_twist = Twist('lowerarm_l', 'hand_l')
    lower_l_twist.create('lowerarm_twist_02_l', 1 / 3)
    lower_l_twist.create('lowerarm_twist_01_l', 2 / 3)

    upper_r_twist = Twist('upperarm_r', upper=True, x_axis=-1)
    upper_r_twist.create('upperarm_twist_01_r', -2 / 3)
    upper_r_twist.create('upperarm_twist_02_r', -1 / 3)

    lower_r_twist = Twist('lowerarm_r', 'hand_r')
    lower_r_twist.create('lowerarm_twist_02_r', 1 / 3)
    lower_r_twist.create('lowerarm_twist_01_r', 2 / 3)

    thigh_l_twist = Twist('thigh_l', upper=True, x_axis=-1)
    thigh_l_twist.create('thigh_twist_01_l', -2 / 3)
    thigh_l_twist.create('thigh_twist_02_l', -1 / 3)

    calf_l_twist = Twist('calf_l', 'foot_l')
    calf_l_twist.create('calf_twist_02_l', 1 / 3)
    calf_l_twist.create('calf_twist_01_l', 2 / 3)

    thigh_r_twist = Twist('thigh_r', upper=True, x_axis=1)
    thigh_r_twist.create('thigh_twist_01_r', -2 / 3)
    thigh_r_twist.create('thigh_twist_02_r', -1 / 3)

    calf_r_twist = Twist('calf_r', 'foot_r')
    calf_r_twist.create('calf_twist_02_r', 1 / 3)
    calf_r_twist.create('calf_twist_01_r', 2 / 3)

    reset_added_jnt()
    yield


func = create()


def nect_create(*args):
    next(func)


def select_skin_jnt(*args):
    jnts = ['pelvis', 'spine_01', 'spine_02', 'spine_03', 'spine_04', 'spine_05', 'neck_01', 'neck_02', 'head',
            'clavicle_l', 'upperarm_l', 'lowerarm_l', 'lowerarm_twist_02_l', 'lowerarm_twist_01_l', 'hand_l',
            'middle_01_l', 'middle_02_l', 'middle_03_l', 'pinky_01_l', 'pinky_02_l', 'pinky_03_l', 'ring_01_l',
            'ring_02_l', 'ring_03_l', 'thumb_01_l', 'thumb_02_l', 'thumb_03_l', 'index_01_l', 'index_02_l',
            'index_03_l', 'upperarm_twist_01_l', 'upperarm_twist_02_l', 'clavicle_r', 'upperarm_r', 'lowerarm_r',
            'lowerarm_twist_02_r', 'lowerarm_twist_01_r', 'hand_r', 'middle_01_r', 'middle_02_r', 'middle_03_r',
            'pinky_01_r', 'pinky_02_r', 'pinky_03_r', 'ring_01_r', 'ring_02_r', 'ring_03_r', 'thumb_01_r', 'thumb_02_r',
            'thumb_03_r', 'index_01_r', 'index_02_r', 'index_03_r', 'upperarm_twist_01_r', 'upperarm_twist_02_r',
            'thigh_l', 'calf_l', 'foot_l', 'ball_l', 'calf_twist_02_l', 'calf_twist_01_l', 'thigh_twist_01_l',
            'thigh_twist_02_l', 'thigh_r', 'calf_r', 'foot_r', 'ball_r', 'calf_twist_02_r', 'calf_twist_01_r',
            'thigh_twist_01_r', 'thigh_twist_02_r']
    pm.select(jnts)


def reset_added_jnt(*args):
    for i in ['ik_foot_root', 'ik_hand_root', 'interaction', 'center_of_mass']:
        # noinspection PyBroadException
        try:
            pm.PyNode(i)
        except:
            jnt.new('root', name=i)
    for i in ('foot_l', 'foot_r'):
        # noinspection PyBroadException
        try:
            pm.PyNode('ik_' + i)
            rig.align('ik_' + i, i)

        except:
            jnt.new(i, name='ik_' + i)
            pm.parent('ik_' + i, 'ik_foot_root')
    # noinspection PyBroadException
    try:
        pm.PyNode('ik_hand_gun')
        rig.align('ik_hand_gun', 'hand_r')
        rig.align('ik_hand_l', 'hand_l')

    except:
        jnt.new('hand_r', name='ik_hand_gun')
        jnt.new('hand_r', name='ik_hand_r')
        jnt.new('hand_l', name='ik_hand_l')
        pm.parent('ik_hand_gun', 'ik_hand_root')
        pm.parent('ik_hand_r', 'ik_hand_l', 'ik_hand_gun')


def select_ctrl(*args):
    ctrls = ['End_ctrl', 'index_03_l_ctrl', 'IK_upperarm_l_handleCtrl', 'Root_ctrl', 'IK_upperarm_l_poleCtrl',
             'foot_r_midCtrl', 'IK_upperarm_r_handleCtrl', 'neck_ctrl', 'index_02_l_ctrl', 'clavicle_r_ctrl',
             'ring_02_l_ctrl', 'thumb_02_l_ctrl', 'index_01_l_ctrl', 'thumb_02_r_ctrl', 'ring_01_r_ctrl',
             'index_01_r_ctrl', 'middle_01_l_ctrl', 'index_02_r_ctrl', 'thumb_01_r_ctrl', 'thumb_03_l_ctrl',
             'pinky_02_l_ctrl', 'foot_r_frontCtrl', 'middle_01_r_ctrl', 'pinky_01_l_ctrl', 'thigh_r_mid_ctrl',
             'pinky_01_r_ctrl', 'Spine1_ctrl', 'thigh_l_mid_ctrl', 'Pelvis_ctrl', 'foot_r_toesCtrl', 'ring_02_r_ctrl',
             'foot_r_ankleCtrl', 'foot_l_ankleCtrl', 'head_ctrl', 'IK_upperarm_r_poleCtrl', 'ring_03_r_ctrl',
             'middle_03_r_ctrl', 'middle_02_l_ctrl', 'thumb_01_l_ctrl', 'ring_01_l_ctrl', 'thumb_03_r_ctrl',
             'IK_thigh_r_poleCtrl', 'foot_l_backCtrl', 'pinky_02_r_ctrl', 'middle_03_l_ctrl', 'Chest_ctrl',
             'middle_02_r_ctrl', 'foot_r_backCtrl', 'IK_thigh_l_poleCtrl', 'ring_03_l_ctrl', 'pinky_03_r_ctrl',
             'pinky_03_l_ctrl', 'foot_l_frontCtrl', 'index_03_r_ctrl', 'clavicle_l_ctrl', 'foot_l_toesCtrl', 'Main',
             'Spine2_ctrl', 'spine_curve', 'foot_l_midCtrl']
    pm.select(ctrls)


def main():
    win = "quinn_builder"
    if pm.window(win, ex=True):
        pm.deleteUI(win)
    with pm.window(win, wh=(280, 100)):
        with pm.columnLayout():
            pm.frameLayout('rigging builder')
            with pm.columnLayout():
                pm.button(label='next_func for builder', c=nect_create)

            pm.frameLayout('shape config')
            with pm.columnLayout():
                pm.button(label='read_base', c=config.read_base)
                pm.button(label='read_local', c=config.read_local)
                pm.button(label='write_local', c=config.write)

            pm.frameLayout('skin tools')
            with pm.columnLayout():
                pm.button(label='select skin jnt', c=select_skin_jnt)
                pm.button(label='select controller', c=select_ctrl)

        pm.window(win, e=True, title='quinn builder', wh=(240, 300))
        pm.showWindow(win)


if __name__ == '__main__':
    main()
