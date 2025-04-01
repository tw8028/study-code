from abc import ABC, abstractmethod


class IJoint_limb(ABC):
    @abstractmethod
    def get_rig_joints(self):
        pass
