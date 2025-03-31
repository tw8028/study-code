import pymel.core as pm
from system_biped.core.spine import Spine
from system_biped.core.head import Head
from system_biped.master import Master
from system_biped.interface.connection import ConnectionType


def biped_rig():
    Master.create()
    # spine
    spine = Spine(bones=['pelvis', 'spine_01', 'spine_02', 'spine_03', 'spine_04', 'spine_05'], neck='neck_01',
                  clavicle_l='clavicle_l', clavicle_r='clavicle_r', hip_l='thigh_l', hip_r='thigh_r')
    spine.build()

    # head
    head = Head(bones=['neck_01', 'neck_02', 'head'])
    head.build()
    head.connect_to(point_provider=spine, connection_type=ConnectionType.NECK)


if __name__ == '__main__':
    biped_rig()
    pm.select(clear=True)
