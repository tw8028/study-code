#!/usr/bin/python
# -*- coding:utf-8 -*-
import pymel.core as pm
import package_tools.cv as cv
import package_tools.grp as grp
import package_tools.jnt as jnt
import package_tools.rig as rig


# mode: ik + mid + stretch + no_flip_ik
# upperArm_l
# lowerArm_l
# hand_l
class Limb:
    def __init__(self, upper, lower, end, aim_vector):
        self.grp_system = pm.group(n=upper + "_system", empty=True)
        self.upper = upper
        self.lower = lower
        self.end = end
        self.aim_vector = aim_vector

        self.ik_upper = jnt.new(upper, name="IK_" + upper)
        self.ik_lower = jnt.new(lower, name="IK_" + lower)
        self.ik_end = jnt.new(end, name="IK_" + end)

        self.upper_offset = None
        self.mid_ctrl = cv.square(upper + "_mid_ctrl")
        self.end_ctrl = None
        self.handle_offset = None
        self.pole_offset = None
        self.bot_point = None
        # noinspection PyBroadException
        try:
            self.stretch_attr = pm.PyNode('Main.stretch')
        except:
            # add attr for stretch
            pm.addAttr('Main', ln='stretch', at='bool', dv=1, k=1)
            self.stretch_attr = pm.PyNode('Main.stretch')

        self.create_all()

    def create_ik(self):
        upper = self.ik_upper
        lower = self.ik_lower
        end = self.ik_end
        self.upper_offset = pm.group(name=self.upper + "_ikjnt_offset", empty=True)
        rig.align(self.upper_offset, self.upper)
        rig.parent_chain(end, lower, upper, self.upper_offset)

        handle = pm.ikHandle(n=upper + '_handle', sj=upper, ee=end)[0]
        handle.visibility.set(0)
        pole_ctrl = cv.pole(upper + '_poleCtrl', r=5)
        pole_offset = grp.offset(upper + '_poleOffset', pos=lower, child=pole_ctrl)
        self.pole_offset = pole_offset

        # get the pole_offset vector
        vec0 = pm.xform(upper, q=True, t=True, ws=True)
        vec1 = pm.xform(lower, q=True, t=True, ws=True)
        vec2 = pm.xform(end, q=True, t=True, ws=True)
        vec_up = rig.normalize([vec1[n] - vec0[n] for n in range(3)])
        vec_down = rig.normalize([vec1[n] - vec2[n] for n in range(3)])
        direction_pole_vector = rig.normalize([vec_up[n] + vec_down[n] for n in range(3)])

        pm.xform(pole_offset, t=[vec1[n] + direction_pole_vector[n] * 40 for n in range(3)], ws=True)

        handle_ctrl = cv.cube(handle + 'Ctrl', r=4)
        handle_offset = grp.offset(upper + '_handleOffset', pos=end, child=handle_ctrl)
        pm.parent(handle, handle_ctrl)
        pm.orientConstraint(handle_ctrl, end)
        pm.poleVectorConstraint(pole_ctrl, handle)
        grp_ikctrl = pm.group(n='{0}_ikctrl_grp'.format(self.upper), empty=True)
        pm.parent(handle_offset, pole_offset, grp_ikctrl)

        self.end_ctrl = handle_ctrl
        self.handle_offset = handle_offset
        pm.parent(self.upper_offset, grp_ikctrl, self.grp_system)

        def create_line(ctrl, joint):
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
            grp_line.inheritsTransform.set(0)
            pm.parent(point1, point2, line, grp_line)
            return grp_line

        # create pole vector line
        pm.parent(create_line(pole_ctrl, lower), grp_ikctrl)

    # set middle controller and constraint joints
    def constraint(self):
        # set middle controller
        mid_offset = grp.offset(name=self.upper + "_mid_offset", pos=self.lower, child=self.mid_ctrl)
        pm.orientConstraint(self.ik_upper, self.ik_lower, mid_offset)
        pm.pointConstraint(self.ik_lower, mid_offset)
        pm.parent(mid_offset, self.grp_system)

        # constraint upper
        pm.pointConstraint(self.ik_upper, self.upper)
        pm.aimConstraint(self.mid_ctrl, self.upper, aimVector=self.aim_vector, worldUpType='objectrotation',
                         worldUpObject=self.ik_upper)
        # constraint lower
        pm.pointConstraint(self.mid_ctrl, self.lower)
        pm.aimConstraint(self.ik_end, self.lower, aimVector=self.aim_vector, worldUpType='objectrotation',
                         worldUpObject=self.ik_lower)
        # constraint end
        rig.constraint_opm(self.ik_end, self.end)

    def stretch(self):
        # 首先拉伸ik骨骼，ik骨骼的拉伸 将带动 mid_ctrl 的位置，利用其位置计算 蒙皮骨骼的拉伸
        rig.stretch_ikjnt(self.stretch_attr, self.upper_offset, self.end_ctrl, self.ik_upper, self.ik_lower,
                          self.ik_end)
        rig.stretch_jnt(self.upper_offset, self.mid_ctrl, self.upper)
        rig.stretch_jnt(self.mid_ctrl, self.end_ctrl, self.lower)

    def no_flip_ik(self):
        self.bot_point = grp.target(name=self.end + '_point', pos=self.end_ctrl)
        pm.parent(self.bot_point, self.end_ctrl)
        pm.xform(self.bot_point, ro=pm.xform(self.lower, q=1, ro=1, ws=1), ws=True)
        top_grp = grp.target(name=self.upper + '_topNoFlip_grp', pos=self.upper)
        bot_grp = grp.target(name=self.upper + '_botNoFlip_grp', pos=self.bot_point)
        # on top
        top = jnt.new(self.upper, name=self.upper + '_topNoFlip')
        top_end = jnt.new(self.bot_point, name=self.upper + '_topNoFlipEnd')
        pm.parent(top_end, top)
        pm.parent(top, top_grp)

        top_handle = pm.ikHandle(n=self.upper + '_topHandle', sj=top, ee=top_end)[0]
        pm.parent(top_handle, bot_grp)
        top_pv = pm.spaceLocator(n=self.upper + '_topNoFlip_pv')
        pm.parent(top_pv, top_grp)
        pm.xform(top_pv, t=(0, 0, 6), ro=(0, 0, 0))
        pm.poleVectorConstraint(top_pv, top_handle)

        # on bottom
        bot = jnt.new(self.bot_point, name=self.upper + '_botNoFlip')
        bot_end = jnt.new(self.upper, name=self.upper + '_botNoFlipEnd')
        pm.parent(bot_end, bot)
        pm.parent(bot, bot_grp)

        bot_handle = pm.ikHandle(n=self.upper + '_botHandle', sj=bot, ee=bot_end)[0]
        pm.parent(bot_handle, top_grp)
        bot_pv = pm.spaceLocator(n=self.upper + '_botNoFlip_pv')
        pm.parent(bot_pv, bot_grp)
        pm.xform(bot_pv, t=(0, 0, 6), ro=(0, 0, 0))
        pm.poleVectorConstraint(bot_pv, bot_handle)

        # # top locator and bot locator 分别被 top and end_ctrl 控制
        top_loc = pm.spaceLocator(n=self.upper + '_toploc')
        rig.align(top_loc, self.pole_offset)
        pm.parent(top_loc, top)

        bot_loc = pm.spaceLocator(n=self.upper + '_botloc')
        rig.align(bot_loc, self.pole_offset)
        pm.parent(bot_loc, bot)

        # pole_offset 同时被 top_lor and bot_loc 约束
        pm.parentConstraint(top_loc, bot_loc, self.pole_offset)

        pm.parent(bot_grp, self.bot_point)
        pm.parent(top_grp, self.upper_offset)

    def create_all(self):
        self.create_ik()
        self.constraint()
        self.stretch()
        self.no_flip_ik()


if __name__ == '__main__':
    leg_l = Limb('thigh_l', 'calf_l', 'foot_l', (-1, 0, 0))
