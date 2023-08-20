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

    t_handle = pm.ikHandle(n=ik_jnt0 + '_tHandle', sj=ik_jnt0, ee=ik_jnt1)
    pm.poleVectorConstraint(ik_jnt0, t_handle[0])
    pm.parent(t_handle[0], jnt1_ctrl)
    pm.parent(jnt1_ctrl_offset, jnt0_ctrl)
    part_jnts = rg.insert_jnts(jnt0, inset_num)

    rg.stretch_jnt(jnt0_ctrl, jnt1_ctrl, ik_jnt0, jnt0, *part_jnts)
    rg.twist_drive(jnt1_ctrl, ik_jnt0, part_jnts)

    pm.parentConstraint(ik_jnt0, jnt0)
    pm.parentConstraint(ik_jnt1, jnt1)

    system_grp = pm.group(n=jnt0 + '_system', empty=True)
    pm.parent(ik_jnt_offset, jnt0_ctrl_offset, system_grp)


def neck_mode2(jnt, num):
    neck_base = pm.group(empty=True, n=jnt + '_base')
    pm.delete(pm.parentConstraint(jnt, neck_base))
    neck_ctrl = pm.circle(nr=(1, 0, 0), c=(0, 0, 0), r=2, n=jnt + '_ctrl', ch=False)[0]
    ctrl_offset = rg.offset(name=jnt + '_ctrl_offset', target=jnt, child=neck_ctrl)
    pm.parent(neck_base, ctrl_offset)
    neck_joints = rg.insert_jnts(jnt, num=num)

    amount = 10 / len(neck_joints)
    inbetwent_parent = pm.group(n='Inbetwent_{0}'.format(neck_joints[0]), empty=True)
    pm.delete(pm.parentConstraint(inbetwent_parent, neck_joints[0]))

    def con_inbetwent(_inbetwent, n_value):
        pm.select(neck_ctrl)
        pm.addAttr(ln='w{0}'.format(n_value), min=0, max=10, dv=amount * (n_value + 1), k=True)
        orcon = pm.orientConstraint(neck_ctrl, neck_base, _inbetwent)
        _inbetwent.rotate >> neck_joints[n_value].rotate

        re_node = pm.createNode('reverse', n=_inbetwent + '_re')
        unit_node = pm.createNode('unitConversion', n=_inbetwent + '_unit')
        unit_node.conversionFactor.set(0.1)
        pm.PyNode('{0}.w{1}'.format(neck_ctrl, n_value)) >> unit_node.input
        unit_node.output >> pm.PyNode('{0}.{1}W0'.format(orcon, neck_ctrl))
        unit_node.output >> re_node.inputX
        re_node.outputX >> pm.PyNode('{0}.{1}W1'.format(orcon, neck_base))

    n = 0
    while n > len(neck_joints) - 1:
        inbetwent = pm.group(n='inbetwent_{0}_part{1}'.format(neck_joints[0], n), empty=True)
        align(inbetwent, neck_joints[0])
        con_inbetwent(inbetwent, n)
        pm.parent(inbetwent, inbetwent_parent)
        inbetwent_parent = inbetwent
        n += 1


def click1(*args):
    jnt = pm.selected()[0]
    num = pm.intField('numJoints', q=True, value=True)
    neck_stretch(jnt, num)


def click2(*args):
    jnt = pm.selected()[0]
    num = pm.intField('numJoints', q=True, value=True)
    neck_mode2(jnt, num)


def main():
    if pm.window('rig_neck', ex=True):
        pm.deleteUI('rig_neck')
    with pm.window('rig_neck', wh=(280, 100)):
        with pm.columnLayout():
            pm.frameLayout('select neck joint to create')
            with pm.columnLayout():
                pm.intField('numJoints', w=60)
                pm.button(label='mode 1', c=click1)
                pm.button(label='mode 2', c=click2)
        pm.window('rig_neck', e=True, title='rig neck', wh=(240, 120))
        pm.showWindow('rig_neck')


if __name__ == '__main__':
    main()
