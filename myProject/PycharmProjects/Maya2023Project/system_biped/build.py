import pymel.core as pm
from system_biped.core.spine import Spine
from system_biped.core.clavicle import Clavicle
from system_biped.core.head import Head
from system_biped.master import Master


def new():
    Master.create()
    # spine
    spine = Spine(joints=['pelvis', 'spine_01', 'spine_02', 'spine_03', 'spine_04', 'spine_05'])
    spine.build()

    # head
    head = Head(joints=['neck_01', 'neck_02', 'head'])
    head.build()
    pm.orientConstraint(spine.ctrl_cog, head.zero_head)
    pm.parentConstraint(spine.ctrl_end, head.zero_cog, maintainOffset=True)  # connect to spine

    # clavicle
    clavicle_l = Clavicle(side='l', joints=['clavicle_l'])
    clavicle_l.build()
    pm.parentConstraint(spine.ctrl_end, clavicle_l.zero_cog)
    clavicle_r = Clavicle(side='r', joints=['clavicle_r'])
    clavicle_r.build()
    pm.parentConstraint(spine.ctrl_end, clavicle_r.zero_cog)  # connect to spine


if __name__ == '__main__':
    new()
