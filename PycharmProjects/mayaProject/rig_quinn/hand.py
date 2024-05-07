#!/usr/bin/python
# -*- coding:utf-8 -*-
import pymel.core as pm
import package_tools.grp as grp
import package_tools.rig as rig


# ['hand_l','thumb_01_l', 'index_01_l', 'middle_01_l', 'ring_01_l', 'pinky_01_l']
class Hand:
    def __init__(self, hand, *fingers_roots):
        self.hand = hand
        self.roots = fingers_roots
        self.hand_offset = grp.target(name=hand + "_offset", pos=hand)
        self.hand_offset.inheritsTransform.set(0)

    def create_fingers(self):
        # 开始父物体可以为空
        def create_finger(jnt, upper_ctrl=None, group= None):
            # 在传入的骨骼上创建ik控制器
            offset = pm.group(empty=True, n=jnt + '_ctrl_offset')
            ctrl = pm.circle(nr=(1, 0, 0), c=(0, 0, 0), r=2, n=jnt + '_ctrl', ch=False)[0]
            rig.align(offset, jnt)
            rig.align(ctrl, jnt)
            pm.parentConstraint(ctrl, jnt)
            pm.parent(ctrl, offset)
            # 取第一个offset组
            group = offset if group is None else group
            # 链接上层控制器
            try:
                pm.parent(offset, upper_ctrl)
            except Exception:
                pass
            # 递归，给骨骼和父物体重新赋值
            try:
                create_finger(pm.listRelatives(jnt, c=True, type='joint')[0], ctrl)
            except:
                pass
            return group

        for root in self.roots:
            finger_grp = create_finger(root)
            pm.parent(finger_grp, self.hand_offset)