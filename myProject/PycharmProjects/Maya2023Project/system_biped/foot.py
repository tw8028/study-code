import pymel.core as pm
import mytools
from abc import ABC
from system_biped.interface.connection import IConnectionPointProvider
from system_biped.interface.connection import IConnectionPointUser
from system_biped.interface.connection import ConnectionType
from system_biped.core.center_of_gravity import CenterOfGravity
from system_biped.core.fk_system import FkSystem
from system_biped.core.ik_foot import IkFoot
from system_biped.core.mid_system import MidSystem


class Foot(IConnectionPointUser, ABC):
    def __init__(self, name: str, side: str, bones: list[str]):
        self.ball = CenterOfGravity(name=name, side=side, bones=bones)

        self.foot = pm.PyNode(bones[0]).getParent()
        fk = FkSystem(cog=self.ball)

    def connect_to(self, point_provider: IConnectionPointProvider, connection_type):
        connect_point = point_provider.get_connection_point(connection_type=ConnectionType.FOOT, side=self.foot.side)
        mytools.opm_constraint(driver=self.ball.zero_cog, driven=connect_point)


if __name__ == '__main__':
    foot_l = Foot(name='foot_l', side='l', bones=['ball_l', 'heel_l', 'tiptoe_l'])
