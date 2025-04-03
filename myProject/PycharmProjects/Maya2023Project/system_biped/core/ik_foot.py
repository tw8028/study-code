import pymel.core as pm
import mytools
from abc import ABC
from system_biped.core.center_of_gravity import CenterOfGravity
from system_biped.interface.joint_limb import IJoint_limb


class IkFoot(IJoint_limb, ABC):
    def __init__(self, cog: CenterOfGravity):
        pass