import pymel.core as pm
import mytools


class Limb:
    # name: root__r__arm__001
    def __init__(self, *, root_name, joint1, joint2, joint3):
        str_list = root_name.split('__')
        side = str_list[1]
        name = str_list[2]
        self.rig_limb = f'rig__{side}__{name}__001'
        self.joint_root = root_name
        self.ctrl_main = f'ctrl__{side}__{name}__001'
        self.zero_main = f'zero__{side}__{name}__001'
        self.ctrl_attr = f'ctrl__{side}__{name}_attr__001'
        self.zero_attr = f'zero__{side}__{name}_attr__001'
        self.attr_ik_fk_blend = f'{self.ctrl_attr}.ikFkBlend'
        self.reverse_node = f'reverse__{side}__{name}__001'
        self.attr_stretch = f'{self.ctrl_attr}.stretch'
        self.joint1 = joint1
        self.joint2 = joint2
        self.joint3 = joint3

        # ik joint
        self.joint1_ik = f'jnt__{side}__{joint1}_ik__001'
        self.joint2_ik = f'jnt__{side}__{joint2}_ik__001'
        self.joint3_ik = f'jnt__{side}__{joint3}_ik__001'
        # m joint
        self.joint1_m = f'jnt__{side}__{joint1}_m__001'
        self.joint2_m = f'jnt__{side}__{joint2}_m__001'
        self.joint3_m = f'jnt__{side}__{joint3}_m__001'
        # ik rig
        self.ik_handle = f'ik_handle__{side}__{name}__001'
        self.ctrl_ik_handle = f'ctrl__{side}__{name}_ik_handle__001'
        self.zero_ik_handle = f'zero__{side}__{name}_ik_handle__001'
        self.ctrl_pole = f'ctrl__{side}__{name}_pole__001'
        self.zero_pole = f'zero__{side}__{name}_pole__001'
        self.ctrl_mid = f'ctrl__{side}__{name}_mid__001'
        self.zero_mid = f'zero__{side}__{name}_mid__001'

        # fk joint
        self.joint1_fk = f'jnt__{side}__{joint1}_fk__001'
        self.joint2_fk = f'jnt__{side}__{joint2}_fk__001'
        self.joint3_fk = f'jnt__{side}__{joint3}_fk__001'
        # fk rig
        self.ctrl_joint1_fk = f'ctrl__{side}__{joint1}_fk__001'
        self.ctrl_joint2_fk = f'ctrl__{side}__{joint2}_fk__001'
        self.ctrl_joint3_fk = f'ctrl__{side}__{joint3}_fk__001'
        self.zero_joint1_fk = f'zero__{side}__{joint1}_fk__001'
        self.zero_joint2_fk = f'zero__{side}__{joint2}_fk__001'
        self.zero_joint3_fk = f'zero__{side}__{joint3}_fk__001'

        # twist parts
        self.joint_no_roll_01 = f'jnt__{side}__{name}_no_roll__001'
        self.joint_no_roll_02 = f'jnt__{side}__{name}_no_roll__002'
        self.ik_handle_no_roll = f'ik_handle__{side}__{name}_no_roll__001'
        self.drive_no_roll = f'drive__{side}__{name}_no_roll__001'
        self.input_end = f'input__{side}__{name}_end__001'
        self.output_end = f'output__{side}__{name}_end__001'
        self.grp_part_end = f'grp__{side}__{name}_end__001'

    def create_main(self):
        pm.group(name=self.rig_limb, empty=True)
        mytools.jnt_target(name=self.joint_root, target=self.joint1)  # create root joint
        mytools.cv_target(name=self.ctrl_main, target=self.joint1, shape='ball', radius=4)
        mytools.grp_zero(name=self.zero_main, target=self.ctrl_main)  # create root ctrl
        pm.parentConstraint(self.ctrl_main, self.joint_root)

        mytools.cv_create(name=self.ctrl_attr, shape='cross1', radius=3)  # create attr object
        mytools.grp_zero(name=self.zero_attr, target=self.ctrl_attr)
        pm.matchTransform(self.zero_attr, self.zero_main, position=True)
        pm.addAttr(self.ctrl_attr, longName='stretch', attributeType='bool', defaultValue=1, keyable=True)
        pm.addAttr(self.ctrl_attr, longName='ikFkBlend', attributeType='float', minValue=0, maxValue=1, dv=1,
                   keyable=True)

        reverse_nd = pm.createNode('reverse', name=self.reverse_node)
        pm.PyNode(self.attr_ik_fk_blend) >> reverse_nd.inputX  # type: ignore

    def create_fk(self):
        pm.parent(mytools.jnt_target(name=self.joint1_fk, target=self.joint1), self.joint_root)  # create joint1_fk
        pm.parent(mytools.jnt_target(name=self.joint2_fk, target=self.joint2), self.joint1_fk)  # create joint2_fk
        pm.parent(mytools.jnt_target(name=self.joint3_fk, target=self.joint3), self.joint2_fk)  # create joint3_fk

        for joint in [self.joint1_fk, self.joint2_fk, self.joint3_fk]:
            name = joint.split('__', 1)[1]
            ctrl = mytools.cv_target(name='ctrl__' + name, target=joint, shape='circle', radius=10)
            zero = mytools.grp_zero(name='zero__' + name, target=ctrl)
            pm.parent(zero, self.ctrl_main)
            pm.orientConstraint(ctrl, joint)
            var = ctrl.scaleX >> pm.PyNode(joint).scaleX  # type: ignore

        pm.parentConstraint(self.ctrl_joint1_fk, self.zero_joint2_fk, maintainOffset=True)
        pm.parentConstraint(self.ctrl_joint2_fk, self.zero_joint3_fk, maintainOffset=True)

    def create_ik(self):
        pm.parent(mytools.jnt_target(name=self.joint1_ik, target=self.joint1), self.joint_root)  # create joint1_ik
        pm.parent(mytools.jnt_target(name=self.joint2_ik, target=self.joint2), self.joint1_ik)  # create joint2_ik
        pm.parent(mytools.jnt_target(name=self.joint3_ik, target=self.joint3), self.joint2_ik)  # create joint3_ik
        # 创建 ik
        mytools.cv_target(name=self.ctrl_ik_handle, target=self.joint3, shape='cube', radius=4)
        mytools.grp_zero(name=self.zero_ik_handle, target=self.ctrl_ik_handle)
        ik_handle = pm.ikHandle(name=self.ik_handle, sj=self.joint1_ik, ee=self.joint3_ik)[0]  # create ik handle
        ik_handle.visibility.set(0)
        pm.parent(ik_handle, self.ctrl_ik_handle)
        pm.orientConstraint(self.ctrl_ik_handle, self.joint3_ik)
        # 极向量约束
        mytools.pole_ctrl(self.joint1_ik, self.joint2_ik, self.joint3_ik, self.ctrl_pole, self.zero_pole)
        pm.poleVectorConstraint(self.ctrl_pole, self.ik_handle)
        pm.parent(mytools.connect_line(self.ctrl_pole, self.joint2_ik), self.rig_limb)

    # noinspection SpellCheckingInspection
    def create_mid(self):
        pm.parent(mytools.jnt_target(name=self.joint1_m, target=self.joint1), self.joint_root)  # create joint1_m
        pm.parent(mytools.jnt_target(name=self.joint2_m, target=self.joint2), self.joint1_m)  # create joint2_m
        pm.parent(mytools.jnt_target(name=self.joint3_m, target=self.joint3), self.joint2_m)  # create joint3_m

        mytools.cv_create(name=self.ctrl_mid, shape='square', radius=4)
        mytools.grp_zero(name=self.zero_mid, target=self.ctrl_mid)
        pm.parent(self.zero_mid, self.ctrl_main)
        cons = pm.orientConstraint(self.joint1_ik, self.joint2_ik, self.zero_mid)
        cons.interpType.set(2)
        pm.pointConstraint(self.joint2_ik, self.zero_mid)
        # constraint joint mid
        aim_vector = (1, 0, 0) if pm.PyNode(self.joint2).translateX.get() > 0 else (-1, 0, 0)  # type: ignore
        pm.aimConstraint(self.ctrl_mid, self.joint1_m, aimVector=aim_vector, worldUpType='objectrotation',
                         worldUpObject=self.joint1_ik)
        pm.aimConstraint(self.joint3_ik, self.joint2_m, aimVector=aim_vector, worldUpType='objectrotation',
                         worldUpObject=self.joint2_ik)
        pm.orientConstraint(self.joint3_ik, self.joint3_m)

    def create_twist_parts(self):
        # no roll
        pm.parent(mytools.jnt_target(name=self.joint_no_roll_01, target=self.joint1), self.joint_root)
        pm.parent(mytools.jnt_target(name=self.joint_no_roll_02, target=self.joint2), self.joint_no_roll_01)

        handle = pm.ikHandle(name=self.ik_handle_no_roll, startJoint=self.joint_no_roll_01,
                             endEffector=self.joint_no_roll_02)[0]
        pm.poleVectorConstraint(self.joint_no_roll_01, handle)
        pm.parent(mytools.grp_target(name=self.drive_no_roll, target=self.joint1), self.joint_root)
        pm.parent(handle, self.drive_no_roll)

        # blend twist parts
        reverse_nd = self.reverse_node
        mytools.blend_orient(attr_ctrl=self.attr_ik_fk_blend, reverse=reverse_nd, ik_jnt=self.joint1_m,
                             fk_jnt=self.joint1_fk, blend_jnt=self.drive_no_roll)
        mytools.blend_orient(attr_ctrl=self.attr_ik_fk_blend, reverse=reverse_nd, ik_jnt=self.joint1_m,
                             fk_jnt=self.joint1_fk, blend_jnt=self.drive_no_roll)
        # end parts
        pm.parent(pm.group(name=self.output_end, empty=True), pm.group(name=self.input_end, empty=True))
        grp_end = mytools.grp_sub(name=self.grp_part_end, target=self.ctrl_main)
        pm.parent(self.input_end, grp_end)
        mytools.blend_orient(attr_ctrl=self.attr_ik_fk_blend, reverse=reverse_nd, ik_jnt=self.joint3_m,
                             fk_jnt=self.joint3_fk, blend_jnt=self.input_end)
        mytools.blend_translate(attr_ctrl=self.attr_ik_fk_blend, reverse=reverse_nd, ik_jnt=self.joint3_m,
                                fk_jnt=self.joint3_fk, blend_jnt=self.input_end)

        pm.matchTransform(self.output_end, self.joint2, rotation=True)

    def stretch(self):
        mytools.stretch_ik(attr_stretch=self.attr_stretch, jnt1_offset=self.ctrl_main,
                           handle_ctrl=self.ctrl_ik_handle, ik_jnt1=self.joint1_ik, ik_jnt2=self.joint2_ik,
                           ik_jnt3=self.joint3_ik)
        mytools.stretch_jnt(start_point=self.ctrl_main, end_point=self.ctrl_mid, joints=[self.joint1_m])
        mytools.stretch_jnt(start_point=self.ctrl_mid, end_point=self.joint3_ik, joints=[self.joint2_m])
        for joint in [self.joint1, self.joint2]:
            mytools.stretch_yz(joint)

    def blend_deform_joint(self):
        reverse_nd = self.reverse_node
        # blend deform joint
        mytools.blend_orient(attr_ctrl=self.attr_ik_fk_blend, reverse=reverse_nd, ik_jnt=self.joint1_m,
                             fk_jnt=self.joint1_fk, blend_jnt=self.joint1)
        mytools.blend_orient(attr_ctrl=self.attr_ik_fk_blend, reverse=reverse_nd, ik_jnt=self.joint2_m,
                             fk_jnt=self.joint2_fk, blend_jnt=self.joint2)
        mytools.blend_orient(attr_ctrl=self.attr_ik_fk_blend, reverse=reverse_nd, ik_jnt=self.joint3_m,
                             fk_jnt=self.joint3_fk, blend_jnt=self.joint3)
        mytools.blend_scale_x(attr_ctrl=self.attr_ik_fk_blend, ik_jnt=self.joint1_m, fk_jnt=self.joint1_fk,
                              blend_jnt=self.joint1)
        mytools.blend_scale_x(attr_ctrl=self.attr_ik_fk_blend, ik_jnt=self.joint2_m, fk_jnt=self.joint2_fk,
                              blend_jnt=self.joint2)

    def build(self):
        self.create_main()
        self.create_fk()
        self.create_ik()
        self.create_mid()
        self.create_twist_parts()

        self.stretch()
        self.blend_deform_joint()
        pm.parent(self.zero_main, self.zero_attr, self.zero_pole, self.zero_ik_handle, self.rig_limb)

        print(f'limb rig success! >>> {self.joint_root}')


if __name__ == '__main__':
    arm = Limb(root_name='jnt__r__arm__001', joint1='upperarm_r', joint2='lowerarm_r', joint3='hand_r')
    arm.build()
