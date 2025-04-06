from abc import ABC, abstractmethod


class IJoint_limb(ABC):
    @abstractmethod
    def get_rig_joints(self):
        pass


class Ilimb(ABC):
    @abstractmethod
    def get_ik_handle_control(self):
        pass

    @abstractmethod
    def get_fk_end_control(self):
        pass

    @abstractmethod
    def get_blend_attribute(self):
        pass

    @abstractmethod
    def get_reverse_node(self):
        pass
