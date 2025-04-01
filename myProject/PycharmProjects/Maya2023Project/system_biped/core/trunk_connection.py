import pymel.core as pm
import mytools
from abc import ABC
from system_biped.interface.connection import IConnectionPointProvider
from system_biped.interface.connection import IConnectionPointUser
from system_biped.interface.connection import ConnectionType
from system_biped.core.center_of_gravity import CenterOfGravity


class TrunkConnection(IConnectionPointUser, IConnectionPointProvider, ABC):
    def __init__(self, neck, clavicle_l, clavicle_r, hip_l, hip_r):
        self.clavicle_l = clavicle_l
        self.clavicle_r = clavicle_r

        self.neck = neck
        self.shoulder_l = pm.PyNode(clavicle_l).getChildren()  # type:ignore
        self.shoulder_r = pm.PyNode(clavicle_r).getChildren()  # type:ignore
        self.hip_l = hip_l
        self.hip_r = hip_r

        ctrl = 'ctrl__c__{0}__001'
        zero = 'zero__c__{0}__001'
        self.ctrl_clavicle_l = ctrl.format('clavicle_l')
        self.zero_clavicle_l = zero.format('clavicle_l')
        self.ctrl_clavicle_r = ctrl.format('clavicle_r')
        self.zero_clavicle_r = zero.format('clavicle_r')

    def create_shoulder(self):
        mytools.cv_and_zero(name=self.ctrl_clavicle_l, target=self.clavicle_l, shape='cube', radius=4)
        mytools.cv_and_zero(name=self.ctrl_clavicle_r, target=self.clavicle_r, shape='cube', radius=4)
        pm.parent(self.zero_clavicle_l, self.zero_clavicle_r, self.ctrl_end)

