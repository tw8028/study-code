import pymel.core as pm
import mytools
import rig


class Limb:
    # name: jnt__r__arm__001
    def __init__(self, *, name, joint1, joint2, joint3):
        str_list = name.split('__', 3)
        side = str_list[1]
        name_id = str_list[2]
        self.name_id = f'{str_list[2]}_{str_list[1]}'
        self.joint_limb = name
        self.ctrl_main = f'ctrl__{side}__{name_id}__001'
        self.zero_main = f'zero__{side}__{name_id}__001'
        self.ctrl_attr = f'ctrl__{side}__{name_id}_attr__001'
        self.zero_attr = f'zero__{side}__{name_id}_attr__001'
        self.attr_ik_fk_blend = f'{self.ctrl_attr}.ikFkBlend'
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
        self.ik_handle = f'ik_handle__{side}__{name_id}__001'
        self.ctrl_ik_handle = f'ctrl__{side}__{name_id}_ik_handle__001'
        self.zero_ik_handle = f'zero__{side}__{name_id}_ik_handle__001'
        self.ctrl_pole = f'ctrl__{side}__{name_id}_pole__001'
        self.zero_pole = f'zero__{side}__{name_id}_pole__001'
        self.ctrl_mid = f'ctrl__{side}__{name_id}_mid__001'
        self.zero_mid = f'zero__{side}__{name_id}_mid__001'

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

    def create_main(self):
        mytools.jnt.new(name=self.joint_limb, target=self.joint1)  # create root joint
        mytools.cv.ctrl(name=self.ctrl_main, target=self.joint1, shape='ball', radius=4)
        mytools.grp.zero(name=self.zero_main, target=self.ctrl_main)  # create root ctrl
        pm.parentConstraint(self.ctrl_main, self.joint_limb)

        mytools.cv.create(name=self.ctrl_attr, shape='cross1', radius=4)  # create attr object
        mytools.grp.zero(name=self.zero_attr, target=self.ctrl_attr)
        pm.addAttr(self.ctrl_attr, longName='stretch', attributeType='bool', defaultValue=1, keyable=True)
        pm.addAttr(self.ctrl_attr, longName='ikFkBlend', attributeType='float', minValue=0, maxValue=1, dv=0,
                   keyable=True)

    def create_fk(self):
        pm.parent(mytools.jnt.new(name=self.joint1_fk, target=self.joint1), self.joint_limb)  # create joint1_fk
        pm.parent(mytools.jnt.new(name=self.joint2_fk, target=self.joint2), self.joint1_fk)  # create joint2_fk
        pm.parent(mytools.jnt.new(name=self.joint3_fk, target=self.joint3), self.joint2_fk)  # create joint3_fk

        for joint in [self.joint1_fk, self.joint2_fk, self.joint3_fk]:
            name = joint.split('__', 1)[1]
            ctrl = mytools.cv.ctrl(name='ctrl__' + name, target=joint, shape='circle', radius=10)
            zero = mytools.grp.zero(name='zero__' + name, target=ctrl)
            pm.parent(zero, self.ctrl_main)
            pm.orientConstraint(ctrl, joint)
            var = ctrl.scaleX >> pm.PyNode(joint).scaleX  # type: ignore

        pm.parentConstraint(self.ctrl_joint1_fk, self.zero_joint2_fk, maintainOffset=True)
        pm.parentConstraint(self.ctrl_joint2_fk, self.zero_joint3_fk, maintainOffset=True)

    def create_ik(self):
        pm.parent(mytools.jnt.new(name=self.joint1_ik, target=self.joint1), self.joint_limb)  # create joint1_ik
        pm.parent(mytools.jnt.new(name=self.joint2_ik, target=self.joint2), self.joint1_ik)  # create joint2_ik
        pm.parent(mytools.jnt.new(name=self.joint3_ik, target=self.joint3), self.joint2_ik)  # create joint3_ik
        # 创建 ik
        mytools.cv.ctrl(name=self.ctrl_ik_handle, target=self.joint3, shape='cube', radius=4)
        mytools.grp.zero(name=self.zero_ik_handle, target=self.ctrl_ik_handle)
        ik_handle = pm.ikHandle(name=self.ik_handle, sj=self.joint1_ik, ee=self.joint3_ik)[0]  # create ik handle
        ik_handle.visibility.set(0)
        pm.parent(ik_handle, self.ctrl_ik_handle)
        pm.orientConstraint(self.ctrl_ik_handle, self.joint3_ik)
        # 极向量约束
        rig.curve_rig.pole_ctrl(self.joint1_ik, self.joint2_ik, self.joint3_ik, self.ctrl_pole, self.zero_pole)
        pm.poleVectorConstraint(self.ctrl_pole, self.ik_handle)
        rig.curve_rig.connect_line(self.ctrl_pole, self.joint2_ik)

    # noinspection SpellCheckingInspection
    def create_mid(self):
        pm.parent(mytools.jnt.new(name=self.joint1_m, target=self.joint1), self.joint_limb)  # create joint1_m
        pm.parent(mytools.jnt.new(name=self.joint2_m, target=self.joint2), self.joint1_m)  # create joint2_m
        pm.parent(mytools.jnt.new(name=self.joint3_m, target=self.joint3), self.joint2_m)  # create joint3_m

        mytools.cv.create(name=self.ctrl_mid, shape='square', radius=4)
        mytools.grp.zero(name=self.zero_mid, target=self.ctrl_mid)
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

    def stretch(self):
        rig.stretch_rig.stretch_ik(attr_stretch=self.attr_stretch, jnt1_offset=self.ctrl_main,
                                   handle_ctrl=self.ctrl_ik_handle, ik_jnt1=self.joint1_ik, ik_jnt2=self.joint2_ik,
                                   ik_jnt3=self.joint3_ik)
        rig.stretch_rig.stretch_jnt(start_point=self.ctrl_main, end_point=self.ctrl_mid, joints=[self.joint1_m])
        rig.stretch_rig.stretch_jnt(start_point=self.ctrl_mid, end_point=self.joint3_ik, joints=[self.joint2_m])
        for joint in [self.joint1, self.joint2, self.joint3]:
            rig.stretch_rig.stretch_yz(joint)

    def blend(self):
        reverse_nd = pm.createNode('reverse', name=f'reverse__{self.joint_limb}')
        pm.PyNode(self.attr_ik_fk_blend) >> reverse_nd.inputX  # type: ignore

        rig.stretch_rig.blend_orient(attr_ctrl=self.attr_ik_fk_blend, reverse=reverse_nd, ik_jnt=self.joint1_m,
                                     fk_jnt=self.joint1_fk, blend_jnt=self.joint1)
        rig.stretch_rig.blend_orient(attr_ctrl=self.attr_ik_fk_blend, reverse=reverse_nd, ik_jnt=self.joint2_m,
                                     fk_jnt=self.joint2_fk, blend_jnt=self.joint2)
        rig.stretch_rig.blend_orient(attr_ctrl=self.attr_ik_fk_blend, reverse=reverse_nd, ik_jnt=self.joint3_m,
                                     fk_jnt=self.joint3_fk, blend_jnt=self.joint3)
        rig.stretch_rig.blend_scale_x(attr_ctrl=self.attr_ik_fk_blend, ik_jnt=self.joint1_m, fk_jnt=self.joint1_fk,
                                      blend_jnt=self.joint1)
        rig.stretch_rig.blend_scale_x(attr_ctrl=self.attr_ik_fk_blend, ik_jnt=self.joint2_m, fk_jnt=self.joint2_fk,
                                      blend_jnt=self.joint2)
        rig.stretch_rig.blend_scale_x(attr_ctrl=self.attr_ik_fk_blend, ik_jnt=self.joint3_m, fk_jnt=self.joint3_fk,
                                      blend_jnt=self.joint3)

    def build(self):
        self.create_main()
        self.create_fk()
        self.create_ik()
        self.create_mid()
        self.stretch()
        self.blend()
        print(f'limb rig success! >>> {self.name_id}')
        return self.zero_main


if __name__ == '__main__':
    arm = Limb(name='jnt__r__arm__001', joint1='joint1', joint2='joint2', joint3='joint3')
    arm.build()
