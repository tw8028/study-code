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
    spine = Spine(name='spine', side='c', joints=['pelvis', 'spine_01', 'spine_02', 'spine_03', 'spine_04', 'spine_05'])
    spine.build()
    pm.parentConstraint(master.ctrl_world, spine.zero_cog, maintainOffset=True)

    # head
    head = Head(name='neck', side='c', joints=['neck_01', 'neck_02', 'head'])
    head.build()
    pm.orientConstraint(spine.ctrl_cog, head.input_list[-1])
    pm.parentConstraint(spine.ctrl_end, head.zero_cog, maintainOffset=True)  # connect to spine

    # clavicle
    clavicle_l = Clavicle(name='clavicle', side='l', joints=['clavicle_l'])
    clavicle_l.build()
    pm.parentConstraint(spine.ctrl_end, clavicle_l.zero_cog)
    clavicle_r = Clavicle(name='clavicle', side='r', joints=['clavicle_r'])
    clavicle_r.build()
    pm.parentConstraint(spine.ctrl_end, clavicle_r.zero_cog)  # connect to spine


if __name__ == '__main__':
    new()
