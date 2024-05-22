#!/usr/bin/python
# -*- coding:utf-8 -*-
import pymel.core as pm
import package_tools.jnt as jnt
import package_tools.rig as rig


def added_jnt(*args):
    dict = {'root': ('ik_foot_root', 'ik_hand_root', 'interaction', 'center_of_mass'),
            }
    for i in ['ik_foot_root', 'ik_hand_root', 'interaction', 'center_of_mass']:
        try:
            pm.PyNode(i)
        except:
            jnt.new('root', name=i)
    for i in ('foot_l', 'foot_r'):
        try:
            pm.PyNode('ik_' + i)
            rig.align('ik_' + i, i)

        except:
            jnt.new(i, name='ik_' + i)
            pm.parent('ik_' + i, 'ik_foot_root')
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


def main():
    win = 'added_joint'
    if pm.window(win, ex=True):
        pm.deleteUI(win)
    with pm.window(win, wh=(280, 100)):
        with pm.columnLayout():
            pm.frameLayout('....')
            with pm.columnLayout():
                pm.button(label='step1', c=added_jnt)

        pm.window(win, e=True, title='added joint win', wh=(240, 120))
        pm.showWindow(win)


if __name__ == '__main__':
    main()
