#!/usr/bin/python
# -*- coding:utf-8 -*-
import pymel.core as pm
import package_tools.cv as cv
import package_tools.grp as grp
import package_tools.jnt as jnt
import package_tools.rig as rig


class Head:
    # neck_01 >> neck_02 >> neck_n >>>> head
    # joints must be freeze transformation
    def __init__(self, neck_ctrl, *joints):
        self.jnts = joints

        self.neck_01 = self.jnts[0]
        self.neck_ctrl = neck_ctrl
        self.neck_offset = pm.listRelatives(self.neck_ctrl, parent=True)

        self.head = self.jnts[-1]
        self.head_ctrl = cv.head("head_ctrl")
        self.head_offset = grp.offset("head_offset", pos=self.head, child=self.head_ctrl)

    def dirve_neck(self):
        neck_base = grp.target(name="neck_base", pos=self.neck_ctrl)
        pm.parent(neck_base, self.neck_offset)
        neck_joints = list(self.jnts)
        neck_joints.pop()
        print(neck_joints)
        amount = 10 / len(neck_joints)
        inbetwent_parent = pm.group(n='Inbetwent_{0}'.format(neck_joints[0]), empty=True)
        pm.delete(pm.parentConstraint(neck_joints[0], inbetwent_parent))

        def con_inbetwent(_inbetwent, n_value):
            pm.select(self.neck_ctrl)
            pm.addAttr(ln='w{0}'.format(n_value), min=0, max=10, dv=amount * (n_value + 1), k=True)
            orcon = pm.orientConstraint(self.neck_ctrl, neck_base, _inbetwent)
            _inbetwent.rotate >> pm.PyNode(neck_joints[n_value]).rotate

            re_node = pm.createNode('reverse', n=_inbetwent + '_re')
            unit_node = pm.createNode('unitConversion', n=_inbetwent + '_unit')
            unit_node.conversionFactor.set(0.1)
            pm.PyNode('{0}.w{1}'.format(self.neck_ctrl, n_value)) >> unit_node.input
            unit_node.output >> pm.PyNode('{0}.{1}W0'.format(orcon, self.neck_ctrl))
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

        self.head_offset = grp.offset(name='head_ctrl_offset', pos=self.head, child=self.head_ctrl)
        pm.orientConstraint(self.head_ctrl, self.head)
        pm.pointConstraint(self.head, self.head_offset)


def test():
    Head("Neck_ctrl", "neck_01", "neck_02", "head").dirve_neck()


if __name__ == '__main__':
    pass
