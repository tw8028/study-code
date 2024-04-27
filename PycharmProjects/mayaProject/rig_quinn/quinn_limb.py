#!/usr/bin/python
# -*- coding:utf-8 -*-
import pymel.core as pm
import package_tools.cv as cv
import package_tools.grp as grp
import package_tools.jnt as jnt
import package_tools.rig as rig


# mode one: ik + stretch + mid
# mode two: ik + fk + switch

# upperarm_l
# upperarm_twist_01_l
# upperarm_twist_02_l
# lowerarm_l
# lowerarm_twist_02_l
# lowerarm_twist_01_l
# hand_l
class Limb:
    def __init__(self, up, up_t1, up_t2, low, low_t2, low_t1, end):
        self.upper = up
        self.upper_t1 = up_t1
        self.upper_t2 = up_t2
        self.lower = low
        self.lower_t2 = low_t2
        self.lower_t1 = low_t1
        self.end = end
        self.ikjnt01 = jnt.new(up, name=up + "_ik01")
        self.ikjnt02 = jnt.new(low, name=up + "_ik02")
        self.ikjnt03 = jnt.new(end, name=up + "_ik03")

        self.upper_offset = None
        self.mid_ctrl = cv.square(up + "_mid_ctrl")

    def create_ik(self):
        jnt0 = self.ikjnt01
        jnt1 = self.ikjnt02
        jnt2 = self.ikjnt03
        self.upper_offset = pm.group(name=self.upper + "_ikjnt_offset", empty=True)
        rig.align(self.upper_offset, self.upper)
        rig.parent_chain(jnt2, jnt1, jnt0, self.upper_offset)

        handle = pm.ikHandle(n=jnt0 + '_handle', sj=jnt0, ee=jnt2)[0]
        handle.visibility.set(0)
        pole_ctrl = cv.pole(jnt0 + '_poleCtrl')
        pole_offset = grp.offset(jnt0 + '_poleOffset', pos=jnt1, child=pole_ctrl)

        # get the pole_offset vector
        vec0 = pm.xform(jnt0, q=True, t=True, ws=True)
        vec1 = pm.xform(jnt1, q=True, t=True, ws=True)
        vec2 = pm.xform(jnt2, q=True, t=True, ws=True)
        vec_up = rig.normalaize([vec1[n] - vec0[n] for n in range(3)])
        vec_down = rig.normalaize([vec1[n] - vec2[n] for n in range(3)])
        direction_pole_vector = rig.normalaize([vec_up[n] + vec_down[n] for n in range(3)])

        pm.xform(pole_offset, t=[vec1[n] + direction_pole_vector[n] * 40 for n in range(3)], ws=True)

        handle_ctrl = cv.cube(handle + 'Ctrl')
        handle_offset = grp.offset(jnt0 + '_handleOffset', pos=jnt2, child=handle_ctrl)
        pm.parent(handle, handle_ctrl)
        pm.orientConstraint(handle_ctrl, jnt2)
        pm.poleVectorConstraint(pole_ctrl, handle)
        grp_system = pm.group(n='{0}_ikctrl_offset'.format(self.upper), empty=True)
        pm.parent(handle_offset, pole_offset, grp_system)

        def connect(ctrl, joint):
            point1 = pm.spaceLocator(n=ctrl + '_point_loc1')
            pm.parentConstraint(ctrl, point1)
            point2 = pm.spaceLocator(n=ctrl + '_point_loc2')
            pm.parentConstraint(joint, point2)
            line = pm.curve(d=1, p=[(0, 0, 0), (1, 0, 0)], k=[0, 1], name=ctrl + '_line')
            line_shape = line.getShape()
            line_shape.overrideEnabled.set(1)
            line_shape.overrideDisplayType.set(1)
            point1.getShape().worldPosition[0] >> line_shape.controlPoints[0]
            point2.getShape().worldPosition[0] >> line_shape.controlPoints[1]
            grp_line = pm.group(empty=True, name=ctrl + '_line_offset')
            pm.parent(point1, point2, line, grp_line)
            return grp_line

        # create pole vector line
        pm.parent(connect(pole_ctrl, jnt1), grp_system)

    def constraint(self):
        # set middle controller
        mid_offset = grp.offset(name=self.upper + "_mid_offset", pos=self.lower, child=self.mid_ctrl)
        pm.orientConstraint(self.ikjnt01, self.ikjnt02, mid_offset)
        pm.pointConstraint(self.ikjnt02, mid_offset)

        # constraint upper
        pm.pointConstraint(self.ikjnt01, self.upper)
        pm.aimConstraint(self.mid_ctrl, self.upper, worldUpType='objectrotation', worldUpObject=self.ikjnt01)
        # constraint lower
        pm.pointConstraint(self.mid_ctrl, self.lower)
        pm.aimConstraint(self.ikjnt03, self.lower, worldUpType='objectrotation', worldUpObject=self.ikjnt02)
        # constraint end
        pm.parentConstraint(self.ikjnt03, self.end)

    def upper_twist(self):
        pass

    def lower_twist(self):
        driver = grp.target(name=self.ikjnt03 + "_base", pos=self.lower)
        pm.parent(driver, self.ikjnt03)
        pm.xform(driver, t=(0, 0, 0), ro=(0, 0, 0))
        pm.delete(pm.orientConstraint(self.lower, driver))

        rig.twist_drive(driver, self.ikjnt02, self.lower_t2, 1 / 4)
        rig.twist_drive(driver, self.ikjnt02, self.lower_t1, 1 / 2)

    def stretch(self):
        pass

    def create_all(self):
        self.create_ik()
        self.constraint()
        self.lower_twist()
