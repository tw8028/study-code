import pymel.core as pm
import mytools
from system_biped.core.master import Master
from system_biped.interface.joint_limb import IJoint_limb


class CenterOfGravity(object):
    def __init__(self, *, name: str, side: str, bones: list[str]):
        name_template = '{0}' + f'__{side}__{name}__001'
        self.name = name
        self.side = side
        self._bones = bones
        self.joints = [f'jnt__{side}__{jnt}__001' for jnt in bones]
        # self.joints_fk = [f'jnt__{side}__{jnt}_fk__001' for jnt in bones]
        # self.joints_ik = [f'jnt__{side}__{jnt}_ik__001' for jnt in bones]
        # self.joints_mid = [f'jnt__{side}__{jnt}_mid__001' for jnt in bones]

        self.grp_rig = name_template.format('rig')  # group on origin
        self.ctrl_cog = name_template.format('ctrl_cog')  # 重心控制器
        self.zero_cog = name_template.format('zero_cog')  # 重心 zero，链接到父级控制器
        self.zero_jnt = name_template.format('zero_jnt')

        self._create()
        self._constraint_bones()

    def _create(self):
        pm.group(name=self.grp_rig, empty=True)
        mytools.cv_and_zero(name=self.ctrl_cog, target=self._bones[0], shape='ball', radius=2)
        pm.parent(self.zero_cog, self.grp_rig)

        for jnt, bone in zip(self.joints, self._bones):
            mytools.jnt_target(name=jnt, target=bone)
        mytools.parent_chain(self.joints)
        mytools.grp_zero(name=self.zero_jnt, target=self.joints[0])
        pm.parent(self.zero_jnt, self.ctrl_cog)

    def _constraint_bones(self):
        grp_cons = Master.constraint
        if not pm.objExists(grp_cons):
            pm.group(name=grp_cons, empty=True)
        for jnt, bone in zip(self.joints, self._bones):
            point_cons = pm.pointConstraint(jnt, bone)
            orient_cons = pm.orientConstraint(jnt, bone)
            pm.parent(point_cons, orient_cons, grp_cons)

        if pm.objExists(Master.ctrl_root):
            pm.parent(self.grp_rig, Master.ctrl_root)

    @staticmethod
    def _create_connect_point(parent, position, connection_type, side):
        # side 表示被链接组件的边
        name = f'connect__{side}__{connection_type.value}__001'
        if pm.objExists(name):
            return pm.PyNode(name)
        return mytools.grp_child(name=name, parent=parent, position=position)

    def blend_jnt(self, fk_system: IJoint_limb, ik_system: IJoint_limb):
        ctrl_attr = f'ctrl__{self.side}__{self.name}_ikfk__001'
        zero_attr = f'zero__{self.side}__{self.name}_ikfk__001'
        attr_blend = f'{ctrl_attr}.ikFkBlend'
        reverse_node = f'reverse__{self.side}__{self.name}__001'

        mytools.cv_and_zero(name=ctrl_attr, target=self.ctrl_cog, shape='cross1', radius=2)
        mytools.zero_orient(zero_attr)
        mytools.lock_hide_transform(ctrl_attr)
        pm.parent(zero_attr, self.grp_rig)
        pm.addAttr(ctrl_attr, longName='ikFkBlend', attributeType='float', minValue=0, maxValue=1, dv=1, keyable=True)

        reverse_nd = pm.createNode('reverse', name=reverse_node)
        pm.PyNode(attr_blend) >> reverse_nd.inputX  # type: ignore

        joints_ik = ik_system.get_rig_joints()
        joints_fk = fk_system.get_rig_joints()

        mytools.blend_orient(attr_ctrl=attr_blend, reverse=reverse_nd, ik_jnt=joints_ik[0], fk_jnt=joints_fk[0],
                             blend_jnt=self.joints[0])
        mytools.blend_orient(attr_ctrl=attr_blend, reverse=reverse_nd, ik_jnt=joints_ik[1], fk_jnt=joints_fk[1],
                             blend_jnt=self.joints[1])
        mytools.blend_orient(attr_ctrl=attr_blend, reverse=reverse_nd, ik_jnt=joints_ik[2], fk_jnt=joints_fk[2],
                             blend_jnt=self.joints[2])
        mytools.blend_scale_x(attr_ctrl=attr_blend, ik_jnt=joints_ik[0], fk_jnt=joints_fk[0], blend_jnt=self.joints[0])
        mytools.blend_scale_x(attr_ctrl=attr_blend, ik_jnt=joints_ik[1], fk_jnt=joints_fk[1], blend_jnt=self.joints[1])


if __name__ == '__main__':
    jnt_system = CenterOfGravity(name='arm', side='l', bones=['upperarm_l', 'lowerarm_l', 'hand_l'])
