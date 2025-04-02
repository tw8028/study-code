from abc import ABC, abstractmethod
from enum import Enum


class ConnectionType(Enum):
    """标准连接点类型枚举"""
    NECK = "neck"  # 颈部连接点(连接头部)
    SHOULDER = "shoulder"  # 肩部连接点
    HIP = "hip"
    WRIST = 'wrist'  # 手腕
    FOOT = 'foot'  # 脚踝


class IConnectionPointProvider(ABC):
    """连接点提供者接口(如Spine类实现此接口)"""

    @abstractmethod
    def get_connection_point(self, connection_type, side):
        """获取指定类型的连接点"""
        pass


class IConnectionPointUser(ABC):
    """连接点使用者接口(如Limb/Head类实现此接口)"""

    @abstractmethod
    def connect_to(self, point_provider: IConnectionPointProvider, connection_type):
        """连接到提供者的指定连接点"""
        pass
