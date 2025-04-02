import pymel.core as pm
import mytools
from abc import ABC
from system_biped.interface.connection import IConnectionPointProvider
from system_biped.interface.connection import IConnectionPointUser
from system_biped.interface.connection import ConnectionType
from system_biped.core.center_of_gravity import CenterOfGravity
from system_biped.core.fk_system import FkSystem
from system_biped.core.ik_system import IkSystem
from system_biped.core.mid_system import MidSystem


class Limb(IConnectionPointProvider, IConnectionPointUser, ABC):
    def __init__(self, name: str, side: str, bones: list[str]):
        self.limb = CenterOfGravity(name=name, side=side, bones=bones)
        fk = FkSystem(cog=self.limb)
        ik = IkSystem(cog=self.limb)
        mid = MidSystem(ik=ik)
        self.limb.blend_jnt(fk_system=fk, ik_system=mid)

        self.side = side
        self.connect_point = f'connect__{side}__{name}__001'
        self._create_connect_point()

    def _create_connect_point(self):
        jnt_end = self.limb.joints[-1]
        mytools.grp_sub(name=self.connect_point, target=jnt_end)

    def get_connection_point(self, connection_type=ConnectionType.WRIST, side=''):
        return self.connect_point

    def connect_to(self, point_provider: IConnectionPointProvider, connection_type: ConnectionType):
        connect_point = point_provider.get_connection_point(connection_type=connection_type, side=self.side)
        print(connect_point)
        mytools.opm_constraint(connect_point, self.limb.zero_cog)
