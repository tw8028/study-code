from system_biped.core.center_of_gravity import CenterOfGravity


class IkSystem:
    def __init__(self, rig_base: CenterOfGravity):
        self.base = rig_base
