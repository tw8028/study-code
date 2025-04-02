import pymel.core as pm
import mytools
from abc import ABC
from system_biped.interface.connection import IConnectionPointProvider
from system_biped.interface.connection import IConnectionPointUser
from system_biped.interface.connection import ConnectionType
from system_biped.core.center_of_gravity import CenterOfGravity


class TrunkConnection(IConnectionPointUser, IConnectionPointProvider, ABC):
    def __init__(self, neck, clavicle_l, clavicle_r, hip_l, hip_r):
        self.neck = neck
        self.clavicle_l = clavicle_l
        self.clavicle_r = clavicle_r
        self.shoulder_l = pm.PyNode(clavicle_l).getChildren()  # type:ignore
        self.shoulder_r = pm.PyNode(clavicle_r).getChildren()  # type:ignore
        self.hip_l = hip_l
        self.hip_r = hip_r

        self.ctrl_clavicle_l = 'ctrl__l__clavicle__001'
        self.zero_clavicle_l = 'zero__l__clavicle__001'
        self.ctrl_clavicle_r = 'ctrl__r__clavicle__001'
        self.zero_clavicle_r = 'zero__r__clavicle__001'

        self.connect_neck = 'connect__c__neck__001'
        self.connect_shoulder_l = 'connect__l__shoulder__001'
        self.connect_shoulder_r = 'connect__r__shoulder__001'
        self.connect_hip_l = 'connect__l__hip__001'
        self.connect_hip_r = 'connect__r__hip__001'
