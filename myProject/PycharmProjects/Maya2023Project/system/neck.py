import pymel.core as pm
import mytools

# 是否拉伸
# neck joint: ctrl_neck 控制yz轴旋转，无移动。ctrl_head 旋转控制 neck x轴旋转，位移 neck joint 拉伸
# head: 控制分两层，父层级方向被重心控制器控制，子层级被 ctrl_head 控制
class Neck:
    # name: jnt__c__neck__001
    def __init__(self, *, name, necks, head):
        self.name = name
        self.jnt_necks = necks
        self.jnt_head = head