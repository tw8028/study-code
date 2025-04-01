import pymel.core as pm
import mytools
from system_biped.core.fk_system import FkSystem
from system_biped.interface.joint_limb import IJoint_limb


class BlendTwoJnt:
    def __init__(self, fk: FkSystem, ik: IJoint_limb):
        self.grp_rig = fk.grp_rig
        self.ctrl_cog = fk.ctrl_cog
        self.joints = fk.joints
        self.zero_jnt = fk.zero_jnt
        self.joints_fk = fk.joints_fk
        self.joints_ik = ik.get_rig_joints()

        self.ctrl_attr = f'ctrl__{fk.side}__{fk.name}_attr__001'
        self.zero_attr = f'zero__{fk.side}__{fk.name}_attr__001'
        self.attr_ik_fk_blend = f'{self.ctrl_attr}.ikFkBlend'
        self.reverse_node = f'reverse__{fk.side}__{fk.name}__001'


    def add_attr(self):
        # attr object
        mytools.cv_and_zero(name=self.ctrl_attr, target=self.ctrl_cog, shape='cross1', radius=2)
        mytools.zero_orient(self.zero_attr)
        mytools.lock_hide_transform(self.ctrl_attr)
        pm.parent(self.zero_attr, self.grp_rig)
        pm.addAttr(self.ctrl_attr, longName='stretch', attributeType='bool', defaultValue=1, keyable=True)
        pm.addAttr(self.ctrl_attr, longName='ikFkBlend', attributeType='float', minValue=0, maxValue=1, dv=1,
                   keyable=True)

        reverse_nd = pm.createNode('reverse', name=self.reverse_node)
        pm.PyNode(self.attr_ik_fk_blend) >> reverse_nd.inputX  # type: ignore

    def blend(self):
        reverse_nd = self.reverse_node
        # blend joints
        mytools.blend_orient(attr_ctrl=self.attr_ik_fk_blend, reverse=reverse_nd, ik_jnt=self.joints_ik[0],
                             fk_jnt=self.joints_fk[0], blend_jnt=self.joints[0])
        mytools.blend_orient(attr_ctrl=self.attr_ik_fk_blend, reverse=reverse_nd, ik_jnt=self.joints_ik[1],
                             fk_jnt=self.joints_fk[1], blend_jnt=self.joints[1])
        mytools.blend_orient(attr_ctrl=self.attr_ik_fk_blend, reverse=reverse_nd, ik_jnt=self.joints_ik[2],
                             fk_jnt=self.joints_fk[2], blend_jnt=self.joints[2])
        mytools.blend_scale_x(attr_ctrl=self.attr_ik_fk_blend, ik_jnt=self.joints_fk[0], fk_jnt=self.joints_fk[0],
                              blend_jnt=self.joints[0])
        mytools.blend_scale_x(attr_ctrl=self.attr_ik_fk_blend, ik_jnt=self.joints_ik[1], fk_jnt=self.joints_fk[1],
                              blend_jnt=self.joints[1])
