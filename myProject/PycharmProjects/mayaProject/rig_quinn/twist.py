#!/usr/bin/python
# -*- coding:utf-8 -*-
import pymel.core as pm
import package_tools.jnt as jnt
import package_tools.grp as grp
import package_tools.rig as rig


# driver 与 driven 不能反，即不能两头控制。
def twist_drive(no_roll, driver, driven, value):
    driver_pn = pm.PyNode(driver)
    no_roll_pn = pm.PyNode(no_roll)
    mult_matrix = pm.createNode('multMatrix', name=driver_pn + '_mm')
    decompose_matrix = pm.createNode('decomposeMatrix', name=driver_pn + '_dpm')
    quat2euler = pm.createNode('quatToEuler', name=driver_pn + '_q2e')
    multiply_divide = pm.createNode('multiplyDivide', name=driver_pn + '_md')
    multiply_divide.operation.set(1)
    multiply_divide.input2X.set(value)

    driver_pn.worldMatrix[0] >> mult_matrix.matrixIn[0]
    no_roll_pn.worldInverseMatrix[0] >> mult_matrix.matrixIn[1]

    mult_matrix.matrixSum >> decompose_matrix.inputMatrix
    decompose_matrix.outputQuatX >> quat2euler.inputQuatX
    decompose_matrix.outputQuatW >> quat2euler.inputQuatW
    quat2euler.outputRotateX >> multiply_divide.input1X
    multiply_divide.outputX >> pm.PyNode(driven).rotateX


class Twist:
    # 对上臂创建twist，bottom可为空
    def __init__(self, top, bottom=None, *, upper=False, x_axis=1):
        self.grp = pm.group(n=f'{top}_twistGrp', empty=True)
        # noinspection PyBroadException
        try:
            pm.parent(self.grp, 'twist_system')
        except:
            pm.parent(self.grp, pm.group(n='twist_system', empty=True))
        if upper:
            jnt_t1 = jnt.new(top, name='t1_' + top)
            jnt_t2 = jnt.new(jnt_t1, name='t2_' + top)
            t1_offset = grp.offset(name=jnt_t1 + '_offset', pos=top, child=jnt_t1)
            jnt_t2.translateX.set(20 * x_axis)
            handle = pm.ikHandle(n=jnt_t1 + '_Handle', sj=jnt_t1, ee=jnt_t2)[0]
            pm.poleVectorConstraint(jnt_t1, handle)
            pm.parent(t1_offset, handle, self.grp)
            # note: 此处必须用点约束
            rig.constraint(top, t1_offset, t=True)
            rig.constraint_opm(top, handle, mo=True)
            self.noroll = jnt_t1
            self.driver = top
        else:
            bot_driver = pm.group(n=top + '_driver', empty=True)
            pm.parent(bot_driver, self.grp)
            rig.constraint_opm(bottom, bot_driver)
            pm.xform(bot_driver, ro=pm.xform(top, q=1, ro=1, ws=1), ws=1)
            self.noroll = top
            self.driver = bot_driver

        self.top = top

    # 传入被控制的twist骨骼并设置权重
    def create(self, twist_jnt, weight):
        twist_drive(self.noroll, self.driver, twist_jnt, weight)
        # stretch twist joint
        pm.PyNode(self.top).scaleX >> pm.PyNode(twist_jnt).scaleX


if __name__ == '__main__':
    # example
    # upper_l_twist = Twist('upperarm_l', upper=True, x_axis=1)
    # upper_l_twist.create('upperarm_twist_01_l', -2 / 3)
    # upper_l_twist.create('upperarm_twist_02_l', -1 / 3)
    #
    # lower_l_twist = Twist('lowerarm_l', 'hand_l')
    # lower_l_twist.create('lowerarm_twist_02_l', 1 / 3)
    # lower_l_twist.create('lowerarm_twist_01_l', 2 / 3)

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
