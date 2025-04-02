import pymel.core as pm
from system_biped.core.master import Master
from system_biped.interface.connection import ConnectionType

from system_biped.core.trunk_connection import TrunkConnection
from system_biped.core.center_of_gravity import CenterOfGravity
from system_biped.spine import Spine
from system_biped.head import Head
from system_biped.core.fk_system import FkSystem
from system_biped.core.ik_system import IkSystem
from system_biped.core.mid_system import MidSystem


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
    arm_r.build()
    arm_r.connect_to(point_provider=spine, connection_type=ConnectionType.SHOULDER)
    arm_l = Limb(name='arm', side='l', bones=['upperarm_l', 'lowerarm_l', 'hand_l'])
    arm_l.build()
    arm_l.connect_to(point_provider=spine, connection_type=ConnectionType.SHOULDER)


def limb_rig():
    base = CenterOfGravity(name='arm', side='l', bones=['upperarm_l', 'lowerarm_l', 'hand_l'])
    fk = FkSystem(cog=base)
    ik = IkSystem(cog=base)
    mid = MidSystem(ik=ik)
    base.blend_jnt(fk_system=fk, ik_system=mid)


def limb_rig_02():
    arm_l = CenterOfGravity(name='arm', side='l', bones=['upperarm_l', 'lowerarm_l', 'hand_l'])
    fk = FkSystem(cog=arm_l)
    ik = IkSystem(cog=arm_l)
    arm_l.blend_jnt(fk_system=fk, ik_system=ik)


if __name__ == '__main__':
    limb_rig_02()
    pm.select(clear=True)
