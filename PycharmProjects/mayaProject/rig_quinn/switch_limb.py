#!/usr/bin/python
# -*- coding:utf-8 -*-
"""
aim_vector:表示骨骼x轴方向
joint_point:与肩膀链接点
bot_point:位置同end骨骼，方向同lower骨骼，用于定位 no flip ik bottom
"""
import pymel.core as pm
import package_tools.cv as cv
import package_tools.grp as grp
import package_tools.jnt as jnt
import package_tools.rig as rig


class SwitchLimb:
    def __init__(self, up, up_t1, up_t2, low, low_t2, low_t1, end, aim_vector):
        self.upper = up
        self.upper_t1 = up_t1
        self.upper_t2 = up_t2
        self.lower = low
        self.lower_t2 = low_t2
        self.lower_t1 = low_t1
        self.end = end
        self.aim_vector = aim_vector
        self.grp_system = pm.group(n=up + "_system", empty=True)
        self.joint_point = grp.target(name=up + '_jointPoint', pos=up)

        self.ik_upper = jnt.new(up, name="IK_" + up)
        self.ik_lower = jnt.new(low, name="IK_" + low)
        self.ik_end = jnt.new(end, name="IK_" + end)
        self.ik_grp = pm.group(n=self.ik_upper + "_grp", empty=True)
        self.handle_ctrl = None
        self.handle_offset = None
        self.pole_offset = None
        self.bot_point = None

        self.fk_upper = jnt.new(up, name="FK_" + up)
        self.fk_lower = jnt.new(low, name="FK_" + low)
        self.fk_end = jnt.new(end, name="FK_" + end)
        self.fk_grp = pm.group(n=self.fk_upper + '_grp', empty=True)

        self.create_ikfk()

    def create_ik(self):
        rig.parent_chain(self.ik_end, self.ik_lower, self.ik_upper, self.joint_point)
        # create ik effector
        handle = pm.ikHandle(n=self.ik_upper + '_handle', sj=self.ik_upper, ee=self.ik_end)[0]
        handle.visibility.set(0)
        self.handle_ctrl = cv.cube(handle + 'Ctrl', r=4)
        self.handle_offset = grp.offset(self.ik_upper + '_handleOffset', pos=self.ik_end, child=self.handle_ctrl)
        pm.parent(handle, self.handle_ctrl)
        pm.orientConstraint(self.handle_ctrl, self.ik_end)

        pole_ctrl = cv.pole(self.ik_upper + '_poleCtrl', r=4)
        self.pole_offset = grp.offset(self.ik_upper + '_poleOffset', pos=self.ik_lower, child=pole_ctrl)
        # get the pole_offset vector
        vec0 = pm.xform(self.ik_upper, q=True, t=True, ws=True)
        vec1 = pm.xform(self.ik_lower, q=True, t=True, ws=True)
        vec2 = pm.xform(self.ik_end, q=True, t=True, ws=True)
        vec_up = rig.normalaize([vec1[n] - vec0[n] for n in range(3)])
        vec_down = rig.normalaize([vec1[n] - vec2[n] for n in range(3)])
        direction_pole_vector = rig.normalaize([vec_up[n] + vec_down[n] for n in range(3)])
        pm.xform(self.pole_offset, t=[vec1[n] + direction_pole_vector[n] * 40 for n in range(3)], ws=True)
        pm.poleVectorConstraint(pole_ctrl, handle)

        pm.parent(self.joint_point, self.ik_grp, self.grp_system)
        pm.parent(self.handle_offset, self.pole_offset, self.ik_grp)
        # create pole vector line
        pm.parent(rig.create_line(pole_ctrl, self.ik_lower), self.ik_grp)

    def no_flip_ik(self):
        # create end point 方向与 lower 相同
        self.bot_point = grp.target(name=self.end + '_point', pos=self.end)
        pm.xform(self.bot_point, t=pm.xform(self.end, q=1, t=1, ws=1), ro=pm.xform(self.lower, q=1, ro=1, ws=1))
        # end point 将通过 botNoFilp 影响 ik effector，所以，当end point p给被ik影响的物体，比如ik_end,end等骨骼，会产生循环effect。
        # 这里将end point p给ikhandle控制器
        pm.parent(self.bot_point, self.handle_ctrl)

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
        pm.parent(top_grp, self.joint_point)

    # def create_fk(self):
    #     rig.parent_chain(self.fk_end, self.fk_lower, self.fk_upper)
    #     fkjnt_offset = grp.target(name=self.fk_upper + '_offset', pos=self.upper)
    #     rig.parent_chain(self.fk_upper, fkjnt_offset, self.grp_system)
    #
    #     fk_upper_ctrl = pm.circle(nr=(1, 0, 0), c=(0, 0, 0), r=5, n=self.fk_upper + '_ctrl', ch=False)[0]
    #     self.fk_upper_offset = grp.offset(name=self.fk_upper + '_0ffset', pos=self.fk_upper, child=fk_upper_ctrl)
    #     fk_lower_ctrl = pm.circle(nr=(1, 0, 0), c=(0, 0, 0), r=5, n=self.fk_lower + '_ctrl', ch=False)[0]
    #     fk_lower_offset = grp.offset(name=self.fk_lower + '_offset', pos=self.fk_lower, child=fk_lower_ctrl)
    #     fk_end_ctrl = pm.circle(nr=(1, 0, 0), c=(0, 0, 0), r=5, n=self.fk_end + '_ctrl', ch=False)[0]
    #     fk_end_offset = grp.offset(name=self.fk_end + '_offset', pos=self.fk_end, child=fk_end_ctrl)
    #     pm.parent(fk_end_offset, fk_lower_ctrl)
    #     pm.parent(fk_lower_offset, fk_upper_ctrl)
    #     pm.parent(self.fk_upper_offset, self.jnt_point)
    #     pm.parentConstraint(fk_upper_ctrl, self.fk_upper)
    #     pm.parentConstraint(fk_lower_ctrl, self.fk_lower)
    #     pm.parentConstraint(fk_end_ctrl, self.fk_end)

    def create_fk(self):
        # 这是一个fk缩放方案，关键是 joint_connect方法。
        # fk joint
        rig.parent_chain(self.fk_end, self.fk_lower, self.fk_upper, self.fk_grp, self.grp_system)
        # fk controller
        fk_upper_ctrl = pm.circle(nr=(1, 0, 0), c=(0, 0, 0), r=8, n=self.fk_upper + '_ctrl', ch=False)[0]
        fk_upper_offset = grp.offset(name=self.fk_upper + '_0ffset', pos=self.fk_upper, child=fk_upper_ctrl)
        fk_lower_ctrl = pm.circle(nr=(1, 0, 0), c=(0, 0, 0), r=6, n=self.fk_lower + '_ctrl', ch=False)[0]
        fk_lower_offset = grp.offset(name=self.fk_lower + '_offset', pos=self.fk_lower, child=fk_lower_ctrl)
        fk_end_ctrl = pm.circle(nr=(1, 0, 0), c=(0, 0, 0), r=6, n=self.fk_end + '_ctrl', ch=False)[0]
        fk_end_offset = grp.offset(name=self.fk_end + '_offset', pos=self.fk_end, child=fk_end_ctrl)
        pm.parent(fk_upper_offset, fk_lower_offset, fk_end_offset, self.fk_grp)

        rig.constraint_opm(self.joint_point, fk_upper_offset)
        pm.parent(rig.joint_connect(fk_upper_ctrl, fk_lower_offset), self.fk_grp)
        pm.parent(rig.joint_connect(fk_lower_ctrl, fk_end_offset), self.fk_grp)
        rig.constraint_opm(fk_upper_ctrl, self.fk_upper)
        rig.constraint_opm(fk_lower_ctrl, self.fk_lower)
        rig.constraint_opm(fk_end_ctrl, self.fk_end)

    def constraint(self):
        # add attr for ikfk switch
        attr_obj = 'Main'
        pm.select(attr_obj)
        pm.addAttr(ln=f'{self.upper}_IKFK', at='bool', dv=1, k=1)
        ikfk_attr = pm.PyNode(f'{attr_obj}.{self.upper}_IKFK')
        reverse_nd = pm.createNode('reverse', n=self.upper + '_IKFK_reverse')
        ikfk_attr >> reverse_nd.inputX

        def connect_attr(ik_jnt, fk_jnt, skin_jnt):
            con = pm.parentConstraint(ik_jnt, fk_jnt, skin_jnt)
            ikfk_attr >> pm.PyNode(f'{con}.{ik_jnt}W0')
            reverse_nd.outputX >> pm.PyNode(f'{con}.{fk_jnt}W1')

            # 使用 blendTwoAttr节点，Switch缩放
            blend_node = pm.createNode('blendTwoAttr', n=skin_jnt + '_bta')
            ikfk_attr >> blend_node.attributesBlender
            # attributesBlender 值为0，input[0] 权重为100,
            fk_jnt.scaleX >> blend_node.input[0]
            # ik input 值为1，input[1] 权重为100，
            ik_jnt.scaleX >> blend_node.input[1]
            blend_node.output >> pm.PyNode(skin_jnt).scaleX

        # noinspection PyBroadException
        try:
            connect_attr(self.ik_upper, self.fk_upper, self.upper)
            connect_attr(self.ik_lower, self.fk_lower, self.lower)
            connect_attr(self.ik_end, self.fk_end, self.end)
        except:
            print("error connect attr")
        # set visibility
        reverse_nd.outputX >> self.fk_grp.visibility
        ikfk_attr >> self.ik_grp.visibility

    def upper_twist(self):
        no_roll = grp.target(name=self.upper + "_twistNoroll", pos=self.joint_point)
        # no_roll p给jointPoint，不随upper骨骼旋转
        pm.parent(no_roll, self.joint_point)
        # 反向驱动
        rig.twist_drive(self.upper, no_roll, self.upper_t1, -1 / 2)

    def lower_twist(self):
        driver = grp.target(name="twistDriver_" + self.end, pos=self.end)
        pm.delete(pm.orientConstraint(self.lower, driver))
        pm.parentConstraint(self.end, driver, mo=1)
        pm.parent(driver, self.grp_system)
        # 根据 lower,lower_twist_02,lower_twist_01 骨骼蒙皮分配 twist 幅度，一般靠近手肘的骨骼不分配 twist
        rig.twist_drive(driver, self.lower, self.lower_t2, 1 / 3)
        rig.twist_drive(driver, self.lower, self.lower_t1, 2 / 3)

    def stretch(self):
        rig.stretch_ikjnt(self.joint_point, self.handle_ctrl, self.ik_upper, self.ik_lower, self.ik_end)
        # 拉伸fk骨骼，pass
        # scaleConstraint对骨骼使用有问题，这里使用 blendTwoAttr node 缩放蒙皮骨骼

    def create_ikfk(self):
        self.create_ik()
        # self.no_flip_ik()
        self.create_fk()
        self.stretch()
        self.constraint()
        self.upper_twist()
        self.lower_twist()
