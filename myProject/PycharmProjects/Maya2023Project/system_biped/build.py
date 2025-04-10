import pymel.core as pm
from system_biped.core.master import Master
from system_biped.interface.connection import ConnectionType
from system_biped.core.trunk_connection import TrunkConnection
from system_biped.spine import Spine
from system_biped.head import Head
from system_biped.limb import Limb
from system_biped.hand import Hand
from system_biped.foot import Foot


def biped_rig():
    Master.build()
    # spine
    ue_trunk_connection = TrunkConnection(neck='neck_01', clavicle_l='clavicle_l', clavicle_r='clavicle_r',
                                          hip_l='thigh_l', hip_r='thigh_r')
    spine = Spine(bones=['pelvis', 'spine_01', 'spine_02', 'spine_03', 'spine_04', 'spine_05'],
                  trunk_connection=ue_trunk_connection)

    # head
    head = Head(bones=['neck_01', 'neck_02', 'head'])
    head.connect_to(point_provider=spine, connection_type=ConnectionType.NECK)

    # arm
    arm_r = Limb(name='arm', side='r', bones=['upperarm_r', 'lowerarm_r', 'hand_r'])
    arm_r.connect_to(point_provider=spine, connection_type=ConnectionType.SHOULDER)
    arm_l = Limb(name='arm', side='l', bones=['upperarm_l', 'lowerarm_l', 'hand_l'])
    arm_l.connect_to(point_provider=spine, connection_type=ConnectionType.SHOULDER)
    # hand
    hand_l = Hand(name='wrist', side='l',
                  bones=['hand_l', 'thumb_01_l', 'index_01_l', 'middle_01_l', 'ring_01_l', 'pinky_01_l'])
    hand_l.connect_to(point_provider=arm_l, connection_type=ConnectionType.WRIST)
    hand_r = Hand(name='wrist', side='r',
                  bones=['hand_r', 'thumb_01_r', 'index_01_r', 'middle_01_r', 'ring_01_r', 'pinky_01_r'])
    hand_r.connect_to(point_provider=arm_r, connection_type=ConnectionType.WRIST)

    # leg
    leg_l = Limb(name='leg', side='l', bones=['thigh_l', 'calf_l', 'foot_l'])
    leg_l.connect_to(point_provider=spine, connection_type=ConnectionType.HIP)
    leg_r = Limb(name='leg', side='r', bones=['thigh_r', 'calf_r', 'foot_r'])
    leg_r.connect_to(point_provider=spine, connection_type=ConnectionType.HIP)
    # foot
    foot_l = Foot(name='foot_l', side='l', bones=['foot_l', 'ball_l', 'tiptoe_l', 'heel_l'], leg=leg_l)
    foot_l = Foot(name='foot_r', side='r', bones=['foot_r', 'ball_r', 'tiptoe_r', 'heel_r'], leg=leg_r)


if __name__ == '__main__':
    biped_rig()
    pm.select(clear=True)
