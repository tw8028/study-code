#!/usr/bin/python
# -*- coding:utf-8 -*-
import pymel.core as pm
import package_tools.cv as cv
import package_tools.grp as grp
import package_tools.jnt as jnt
import package_tools.rig as rig


def neck_stretch(neck_01, inset_num):
    head = pm.listRelatives(neck_01, children=True)[0]
    neck_ctrl = pm.circle(nr=(1, 0, 0), c=(0, 0, 0), r=2, n=neck_01 + '_ctrl', ch=False)[0]
    neck_offset = grp.offset(name=neck_ctrl + '_offset', pos=neck_01, child=neck_ctrl)
    head_ctrl = cv.cube(name=head + '_ctrl')
    head_offset = grp.offset(name=head_ctrl + '_offset', pos=head, child=head_ctrl)

    ik_jnt0 = jnt.new(neck_01, name='IK_jnt0')
    ik_jnt1 = jnt.new(head, name='IK_jnt1')
    ik_offset = pm.group(n="IK_offset", empty=True)
    pm.parent(ik_jnt1, ik_jnt0)
    pm.parent(ik_jnt0,ik_offset)
    pm.pointConstraint(neck_ctrl, ik_jnt0)
    pm.orientConstraint(head_ctrl, ik_jnt1)

    t_handle = pm.ikHandle(n='IK_tHandle', sj=ik_jnt0, ee=ik_jnt1)
    pm.poleVectorConstraint(ik_jnt0, t_handle[0])
    pm.parent(t_handle[0], head_ctrl)
    pm.parent(head_offset, neck_ctrl)
    part_jnts = jnt.insert(neck_01, inset_num)

    rig.stretch_jnt(neck_ctrl, head_ctrl, ik_jnt0, neck_01, *part_jnts)
    rig.twist_drive(head_ctrl, ik_jnt0, part_jnts, inset_num)

    pm.parentConstraint(ik_jnt0, neck_01)
    pm.parentConstraint(ik_jnt1, head)

    system_grp = pm.group(n='neck_system', empty=True)
    pm.parent(ik_offset, neck_offset, system_grp)


def neck_mode2(neck_01, num):
    jnt_end = neck_01.getChildren()[0]
    neck_base = pm.group(empty=True, n=neck_01 + '_base')
    pm.delete(pm.parentConstraint(neck_01, neck_base))
    neck_ctrl = pm.circle(nr=(1, 0, 0), c=(0, 0, 0), r=2, n=neck_01 + '_ctrl', ch=False)[0]
    ctrl_offset = grp.offset(name=neck_01 + '_ctrl_offset', pos=neck_01, child=neck_ctrl)
    pm.parent(neck_base, ctrl_offset)
    neck_joints = [neck_01] + jnt.insert(neck_01, num=num)

    amount = 10 / len(neck_joints)
    inbetwent_parent = pm.group(n='Inbetwent_{0}'.format(neck_joints[0]), empty=True)
    pm.delete(pm.parentConstraint(neck_joints[0], inbetwent_parent))

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
    while n < len(neck_joints):
        inbetwent = pm.group(n='inbetwent_{0}_part{1}'.format(neck_joints[0], n), empty=True)
        pm.delete(pm.parentConstraint(neck_joints[0], inbetwent))
        con_inbetwent(inbetwent, n)
        pm.parent(inbetwent, inbetwent_parent)
        inbetwent_parent = inbetwent
        n += 1
    head_ctrl = cv.cube(name=jnt_end + '_ctrl', r=10)
    head_ctrl_offset = grp.offset(name=jnt_end + '_ctrl_offset', pos=jnt_end, child=head_ctrl)
    pm.orientConstraint(head_ctrl, jnt_end)
    pm.pointConstraint(jnt_end,head_ctrl_offset)

def click1(*args):
    neck_01 = pm.selected()[0]
    num = pm.intField('numJoints', q=True, value=True)
    neck_stretch(neck_01, num)


def click2(*args):
    neck_01 = pm.selected()[0]
    num = pm.intField('numJoints', q=True, value=True)
    neck_mode2(neck_01, num)


def main():
    if pm.window('rig_neck', ex=True):
        pm.deleteUI('rig_neck')
    with pm.window('rig_neck', wh=(280, 100)):
        with pm.columnLayout():
            pm.frameLayout('select neck joint to create')
            with pm.columnLayout():
                pm.intField('numJoints')
                pm.button(label='mode 1', c=click1)
                pm.button(label='mode 2', c=click2)
        pm.window('rig_neck', e=True, title='rig neck', wh=(240, 120))
        pm.showWindow('rig_neck')


if __name__ == '__main__':
    main()
