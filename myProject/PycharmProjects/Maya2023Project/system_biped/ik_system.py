from rig_base import RigBase


class IkSystem:
    def __init__(self, rig_base: RigBase):
        self.base = rig_base
        self.joints_ik = rig_base.joints_ik
