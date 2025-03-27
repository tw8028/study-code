import pymel.core as pm
from system_biped.spine import Spine
from system_biped.clavicle import Clavicle
from system_biped.head import Head
from system_biped.limb import Limb
from system_biped.master import Master


def new():
    master = Master()
    master.create()
    # spine
    spine = Spine(joints=['pelvis', 'spine_01', 'spine_02', 'spine_03', 'spine_04', 'spine_05'])
    spine.build()
    pm.parentConstraint(master.ctrl_world,spine.zero_cog, maintainOffset=True)

    # head
    head = Head(joints=['neck_01', 'neck_02', 'head'])
    head.build()
    pm.orientConstraint(spine.ctrl_cog, head.drive_head)
    pm.parent(head.joint_root, spine.jnt_list_rig[-1])
    pm.parentConstraint(spine.ctrl_end, head.zero_neck, maintainOffset=True)  # connect to spine

    # clavicle
    clavicle_l = Clavicle(name='{0}__l__clavicle__001', clavicle='clavicle_l')
    clavicle_l.build()
    clavicle_r = Clavicle(name='{0}__r__clavicle__001', clavicle='clavicle_r')
    clavicle_r.build()
    pm.parent(clavicle_l.zero, clavicle_r.zero, spine.ctrl_end)  # connect to spine

    # arm: joint 冻结变换后反向缩放才有效
    arm_r = Limb(root_name='jnt__r__arm__001', joint1='upperarm_r', joint2='lowerarm_r', joint3='hand_r')
    arm_r.build()
    pm.pointConstraint(clavicle_r.shoulder, arm_r.zero_main)
    arm_l = Limb(root_name='jnt__l__arm__001', joint1='upperarm_l', joint2='lowerarm_l', joint3='hand_l')
    arm_l.build()
    pm.pointConstraint(clavicle_l.shoulder, arm_l.zero_main)

    # leg
    leg_r = Limb(root_name='jnt__r__leg__001', joint1='thigh_r', joint2='calf_r', joint3='foot_r')
    leg_r.build()
    pm.parentConstraint(spine.ctrl_pelvis, leg_r.zero_main, maintainOffset=True)
    leg_l = Limb(root_name='jnt__l__leg__001', joint1='thigh_l', joint2='calf_l', joint3='foot_l')
    leg_l.build()
    pm.parentConstraint(spine.ctrl_pelvis, leg_l.zero_main, maintainOffset=True)


if __name__ == '__main__':
    new()
