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
    def __init__(self, *joints, mode="inbetwent"):
        self.jnts = joints

        self.neck_01 = self.jnts[0]
        self.neck_ctrl = cv.neck(name="neck_ctrl")
        self.neck_offset = grp.offset(name="neck_offset", pos=self.neck_01, child=self.neck_ctrl)

        self.head = self.jnts[-1]
        self.head_ctrl = cv.head("head_ctrl")
        self.head_offset = grp.offset("head_offset", pos=self.head, child=self.head_ctrl)

        self.head_system = pm.group(n="head_system", empty=True)
        if(mode == "inbetwent"):
            self.inbetwent_offset = "Inbetwent_neck_offset"
            self.drive_neck()
            pm.parent(self.inbetwent_offset, self.neck_offset)
            pm.parent(self.neck_offset, self.head_offset, self.head_system)

    def drive_neck(self):
        neck_base = grp.target(name="neck_base", pos=self.neck_ctrl)
        pm.parent(neck_base, self.neck_offset)
        neck_joints = list(self.jnts)
        neck_joints.pop()
        amount = 10 / len(neck_joints)
        inbetwent_parent = pm.group(n=self.inbetwent_offset, empty=True)
        rig.align(inbetwent_parent, neck_joints[0])

        def con_inbetwent(_inbetwent, n_value):
            pm.select(self.neck_ctrl)
            pm.addAttr(ln='w{0}'.format(n_value), min=0, max=10, dv=amount * (n_value + 1), k=True)
            orcon = pm.orientConstraint(self.neck_ctrl, neck_base, _inbetwent)
            # _inbetwent.rotate >> pm.PyNode(neck_joints[n_value]).rotate
            rig.constraint(_inbetwent, neck_joints[n_value], ro=True)

            re_node = pm.createNode('reverse', n=_inbetwent + '_re')
            unit_node = pm.createNode('unitConversion', n=_inbetwent + '_unit')
            unit_node.conversionFactor.set(0.1)
            pm.PyNode('{0}.w{1}'.format("neck_ctrl", n_value)) >> unit_node.input
            unit_node.output >> pm.PyNode('{0}.{1}W0'.format(orcon, "neck_ctrl"))
            unit_node.output >> re_node.inputX
            re_node.outputX >> pm.PyNode('{0}.{1}W1'.format(orcon, neck_base))

        n = 0
        while n < len(neck_joints):
            inbetwent = pm.group(n='inbetwent_{0}_part{1}'.format(neck_joints[0], n), empty=True)
            rig.align(inbetwent, neck_joints[0])

            con_inbetwent(inbetwent, n)
            pm.parent(inbetwent, inbetwent_parent)
            inbetwent_parent = inbetwent
            n += 1

        pm.pointConstraint(self.head, self.head_offset)
        rig.constraint(self.head_ctrl, self.head, ro=True, mo=False)
