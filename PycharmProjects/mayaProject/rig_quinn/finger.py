#!/usr/bin/python
# -*- coding:utf-8 -*-
import pymel.core as pm
import package_tools.grp as grp
import package_tools.rig as rig


# 开始时，last_ctrl 可以为空
def create_fk(last_ctrl, jnt):
    # 创建fk控制器并约束骨骼
    ctrl = pm.circle(nr=(1, 0, 0), c=(0, 0, 0), r=2, n=jnt + '_ctrl', ch=False)[0]
    offset = grp.offset(name=jnt + '_ctrl_offset', pos=jnt, child=ctrl)
    rig.constraint_opm(ctrl, jnt)
    # p给上层控制器
    pm.parent(offset, last_ctrl)
    # try：传入子骨骼，递归
    # noinspection PyBroadException
    try:
        next_jnt = pm.listRelatives(jnt, c=True, type='joint')[0]
        create_fk(ctrl, next_jnt)
    except:
        pass


# ['hand_l','thumb_01_l', 'index_01_l', 'middle_01_l', 'ring_01_l', 'pinky_01_l']
# 这里只创建手指控制器，hand骨骼在limb类中被控制
class Finger:
    def __init__(self, hand, *fingers_roots):
        self.roots = fingers_roots
        name = 'L_fingers_offset' if '_l' in hand.lower() else 'R_fingers_offset'
        self.fingers_offset = pm.group(n=name, empty=True)
        # 先创建父物体，再用矩阵约束
        # noinspection PyBroadException
        try:
            pm.parent(self.fingers_offset, 'finger_system')
        except:
            pm.parent(self.fingers_offset, pm.group(n='finger_system', empty=1))
        # 直接用hand骨骼约束fingers_offset
        rig.constraint_opm(hand, self.fingers_offset)
        self.create_fingers()

    def create_fingers(self):
        for root in self.roots:
            create_fk(self.fingers_offset, root)


if __name__ == '__main__':
    # example
    Finger('hand_l', 'thumb_01_l', 'index_01_l')
    Finger('hand_r', 'thumb_01_r', 'index_01_r')
