import pymel.core as pm
from system_biped.core.spine import Spine
from system_biped.core.head import Head
from system_biped.master import Master
from system_biped.interface.connection import ConnectionType


def new():
    Master.create()
    # spine
    spine = Spine(joints=['pelvis', 'spine_01', 'spine_02', 'spine_03', 'spine_04', 'spine_05'], neck='neck_01',
                  clavicle_l='clavicle_l', clavicle_r='clavicle_r', hip_l='thigh_l', hip_r='thigh_r')
    spine.build()

    # head
    head = Head(joints=['neck_01', 'neck_02', 'head'])
    head.build()
    head.connect_to(provider=spine, connection_type=ConnectionType.NECK)


if __name__ == '__main__':
    new()
