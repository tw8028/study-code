#!/usr/bin/python
# -*- coding:utf-8 -*-
import pymel.core as pm
import package_tools.cv as cv
import package_tools.rigging as rg


def neck_stretch(jnt0, inset_num):
    jnt1 = pm.listRelatives(jnt0, children=True)[0]
    jnt0_ctrl = pm.circle(nr=(1, 0, 0), c=(0, 0, 0), r=2, n=jnt0 + '_ctrl', ch=False)[0]
    jnt0_ctrl_offset = rg.offset(name=jnt0_ctrl + '_offset', target=jnt0, child=jnt0_ctrl)
    jnt1_ctrl = cv.cube(name=jnt1 + '_ctrl')
    jnt1_ctrl_offset = rg.offset(name=jnt1_ctrl + '_offset', target=jnt1, child=jnt1_ctrl)

    ik_jnt0 = rg.new_jnt(jnt0, n='IK' + jnt0)
    ik_jnt1 = rg.new_jnt(jnt1, n='IK' + jnt1)
    ik_jnt_offset = rg.offset(name=ik_jnt0 + '_offset', target=jnt0, child=ik_jnt0)
    pm.parent(ik_jnt1, ik_jnt0)
    pm.pointConstraint(jnt0_ctrl, ik_jnt0)
    pm.orientConstraint(jnt1_ctrl, ik_jnt1)

    tHandle = pm.ikHandle(n=ik_jnt0 + '_tHandle', sj=ik_jnt0, ee=ik_jnt1)
    pm.poleVectorConstraint(ik_jnt0, tHandle[0])
    pm.parent(tHandle[0], jnt1_ctrl)
    pm.parent(jnt1_ctrl_offset, jnt0_ctrl)
    part_jnts = rg.insert_jnts(jnt0, inset_num)

    rg.stretch_jnt(jnt0_ctrl, jnt1_ctrl, ik_jnt0, jnt0, *part_jnts)
    rg.twist_drive(jnt1_ctrl, ik_jnt0, part_jnts)

    pm.parentConstraint(ik_jnt0, jnt0)
    pm.parentConstraint(ik_jnt1, jnt1)

    system_grp = pm.group(n=jnt0 + '_system', empty=True)
    pm.parent(ik_jnt_offset, jnt0_ctrl_offset, system_grp)


def click(*args):
    jnt = pm.selected()[0]
    num = pm.intField('numJoints', q=True, value=True)
    neck_stretch(jnt, num)


def main():
    if pm.window('rig_neck', ex=True):
        pm.deleteUI('rig_neck')
    with pm.window('rig_neck', wh=(280, 100)):
        with pm.columnLayout():
            pm.frameLayout('select neck joint to create')
            with pm.columnLayout():
                pm.intField('numJoints', w=60)
                pm.button(label='mode 1', c=click)

        pm.window('rig_neck', e=True, title='rig neck', wh=(240, 120))
        pm.showWindow('rig_neck')


if __name__ == '__main__':
    main()
