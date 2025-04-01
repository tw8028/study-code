import pymel.core as pm
import mytools
from abc import ABC
from system_biped.interface.connection import IConnectionPointProvider
from system_biped.interface.connection import IConnectionPointUser
from system_biped.interface.connection import ConnectionType
from system_biped.core.center_of_gravity import CenterOfGravity


class Spine(IConnectionPointUser, IConnectionPointProvider, ABC):
    # 肩膀合并到了脊柱中
    def __init__(self, spine: CenterOfGravity):
        self.name = spine.name
        self.side = spine.side
        self.joints = spine.joints
        self.grp_rig = spine.grp_rig
        self.ctrl_cog = spine.ctrl_cog
        self.zero_jnt = spine.zero_jnt

        ctrl = 'ctrl__c__{0}__001'
        zero = 'zero__c__{0}__001'

        self.ctrl_root = ctrl.format('biped')
        self.zero_root = zero.format('biped')
        self.ctrl_pelvis = ctrl.format('pelvis')
        self.zero_pelvis = zero.format('pelvis')
        self.ctrl_spine01 = ctrl.format('spine01')
        self.zero_spine01 = zero.format('spine01')
        self.ctrl_spine02 = ctrl.format('spine02')
        self.zero_spine02 = zero.format('spine02')
        self.ctrl_chest = ctrl.format('chest')
        self.zero_chest = zero.format('chest')
        self.ctrl_end = ctrl.format('spine_end')
        self.zero_end = zero.format('spine_end')

        self.spline_ik = 'spline_ik__c__spine__001'
        self.control_points = []

        self.clavicle_l = clavicle_l
        self.clavicle_r = clavicle_r

        self.neck = neck
        self.shoulder_l = pm.PyNode(clavicle_l).getChildren()  # type:ignore
        self.shoulder_r = pm.PyNode(clavicle_r).getChildren()  # type:ignore
        self.hip_l = hip_l
        self.hip_r = hip_r
