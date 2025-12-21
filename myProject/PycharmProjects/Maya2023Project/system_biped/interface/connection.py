from abc import ABC, abstractmethod
from enum import Enum


class ConnectionType(Enum):
    """标准连接点类型枚举"""
    NECK = "neck"  # 颈部连接点(连接头部)
    SHOULDER_L = "shoulder_l"  # 肩部连接点
    SHOULDER_R = "shoulder_r"
    HIP_L = "hip_l"
    HIP_R = "hip_r"

    DEFAULT = "default"


class IConnectionPointProvider(ABC):
    """连接点提供者接口(Spine,Limb类实现此接口)"""
    # spine需要connection_type参数，因为提供多个连接点，需要选择
    @abstractmethod
    def get_connection_point(self, connection_type=ConnectionType.DEFAULT):
        """获取指定类型的连接点"""
        pass


class IConnectionPointUser(ABC):
    """连接点使用者接口(Head/Limb/Hand/Leg类实现此接口)"""

    @abstractmethod
    def connect_to(self, point_provider: IConnectionPointProvider):
        """连接到提供者的指定连接点"""
        pass
