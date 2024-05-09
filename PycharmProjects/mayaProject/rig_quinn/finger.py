#!/usr/bin/python
# -*- coding:utf-8 -*-
import pymel.core as pm
import package_tools.grp as grp
import package_tools.rig as rig


# ['hand_l','thumb_01_l', 'index_01_l', 'middle_01_l', 'ring_01_l', 'pinky_01_l']
# 这里只创建手指控制器，hand骨骼在limb类中被控制
class Finger:
    def __init__(self, hand, *fingers_roots):
        self.hand = hand
        self.roots = fingers_roots
        self.fingers_system = pm.group(n=hand + '_fingers_system', empty=True)
        self.fingers_offset = pm.group(n=hand + "_fingers_offset", empty=True)

        pm.parent(self.fingers_offset, self.fingers_system)
        # 直接用hand骨骼约束finger_offset
        rig.constraint_opm(hand, self.fingers_offset)
        self.create_fingers()

    def create_fingers(self):
        # 开始时，上一级控制器为空
        def create_finger(jnt, last_ctrl=None, group=None):
            # 在传入的骨骼上创建fk控制器
            ctrl = pm.circle(nr=(1, 0, 0), c=(0, 0, 0), r=2, n=jnt + '_ctrl', ch=False)[0]
            offset = grp.offset(name=jnt + '_ctrl_offset', pos=jnt, child=ctrl)
            rig.constraint_opm(ctrl, jnt)
            # 取第一个offset组
            group = offset if group is None else group
            # 链接上层控制器
            # noinspection PyBroadException
            try:
                pm.parent(offset, last_ctrl)
            except:
                pass
            # 传入新参数，递归
            # noinspection PyBroadException
            try:
                next_jnt = pm.listRelatives(jnt, c=True, type='joint')[0]
                create_finger(next_jnt, ctrl)
            except:
                pass
            return group

        for root in self.roots:
            finger_grp = create_finger(root)
            pm.parent(finger_grp, self.fingers_offset)
