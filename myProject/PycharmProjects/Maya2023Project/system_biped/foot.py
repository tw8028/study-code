import pymel.core as pm
import mytools
from system_biped.core.master import Master
from system_biped.interface.joint_limb import Ilimb


class Foot:
    def __init__(self, name: str, side: str, bones: list[str], leg: Ilimb):
        self._name = name
        self._side = side
        self._leg = leg
        self._bone_foot = bones[0]
        self._bone_ball = bones[1]
        self._bone_tiptoe = bones[2]
        self._bone_heel = bones[3]
        self._grp_rig = f'rig__{side}__{name}__001'
        self._grp_jnt = f'zero_jnt__{side}__{name}__001'

        self._ball = f'jnt__{side}__ball__001'
        self._ball_fk = f'jnt__{side}__ball_fk__001'
        self._ctrl_ball_fk = f'ctrl__{side}__ball_fk__001'
        self._zero_ball_fk = f'zero__{side}__ball_fk__001'
        self._input_ball_fk = f'input__{side}__ball_fk__001'

        self._ball_ik = f'jnt__{side}__ball_ik__001'
        self._zero_ball_ik = f'zero__{side}__ball_ik__001'
        self._create_main()
        self._create_fk()
        self._create_ik()
        self._blend()

    def _create_main(self):
        pm.group(name=self._grp_rig, empty=True)
        if pm.objExists(Master.ctrl_root):
            pm.parent(self._grp_rig, Master.ctrl_root)

        pm.group(name=self._grp_jnt, empty=True)
        pm.parent(self._grp_jnt, self._grp_rig)
        mytools.jnt_target(name=self._ball, target=self._bone_ball)
        pm.parent(self._ball, self._grp_jnt)

        grp_cons = Master.constraint
        if not pm.objExists(grp_cons):
            pm.group(name=grp_cons, empty=True)
        point_cons = pm.pointConstraint(self._ball, self._bone_ball)
        orient_cons = pm.orientConstraint(self._ball, self._bone_ball)
        pm.parent(point_cons, orient_cons, grp_cons)

    def _create_fk(self):
        jnt = mytools.jnt_target(name=self._ball_fk, target=self._ball)
        mytools.cv_and_zero(name=self._ctrl_ball_fk, target=self._ball_fk, shape='circle', radius=4)
        pm.parent(jnt, self._ctrl_ball_fk)

        grp_input = mytools.grp_target(name=self._input_ball_fk, target=self._bone_foot)
        pm.parent(grp_input, self._grp_rig)
        pm.parent(self._zero_ball_fk, grp_input)
        mytools.opm_constraint(self._leg.get_fk_end_control(), grp_input)

    def _create_ik(self):
        name_template = '{0}__' + self._side + '__{1}__001'
        # back
        heel_ctrl = name_template.format('ctrl', 'heel')
        heel_zero = name_template.format('zero', 'heel')
        mytools.cv_and_zero(name=heel_ctrl, target=self._bone_heel, shape='cube', radius=4)
        # mid
        mid_ctrl = name_template.format('ctrl', 'mid')
        mid_zero = name_template.format('zero', 'mid')
        mytools.cv_and_zero(name=mid_ctrl, target=self._bone_ball, shape='circle_linear', radius=4)
        # front
        tiptoe_ctrl = name_template.format('ctrl', 'tiptoe')
        tiptoe_zero = name_template.format('zero', 'tiptoe')
        mytools.cv_and_zero(name=tiptoe_ctrl, target=self._bone_tiptoe, shape='ball', radius=1)
        # ankle
        ankle_ctrl = name_template.format('ctrl', 'ankle')
        ankle_zero = name_template.format('zero', 'ankle')
        mytools.cv_and_zero(name=ankle_ctrl, target=self._bone_ball, shape='triangle', radius=1.5)
        # toes
        toe_ctrl = name_template.format('ctrl', 'toe')
        toe_zero = name_template.format('zero', 'toe')
        mytools.cv_and_zero(name=toe_ctrl, target=self._bone_ball, shape='triangle', radius=1.0)

        # parent
        pm.parent(ankle_zero, toe_zero, tiptoe_ctrl)
        pm.parent(tiptoe_zero, mid_ctrl)
        pm.parent(mid_zero, heel_ctrl)
        zero_ik = mytools.grp_zero(name=f'zero__{self._side}__ball_ik__001', target=heel_zero)
        pm.parent(zero_ik, self._grp_rig)

        # ik joint
        mytools.jnt_target(name=self._ball_ik, target=self._ball)
        pm.parent(self._ball_ik, toe_ctrl)

        # leg ik ctrl connect to ankle_ctrl
        pm.parentConstraint(ankle_ctrl, self._leg.get_ik_handle_control(), maintainOffset=True)
        mytools.lock_hide_transform(self._leg.get_ik_handle_control())
        # delete
        pm.delete(self._bone_heel, self._bone_tiptoe)

    def _blend(self):
        attr_blend = self._leg.get_blend_attribute()
        reverse_nd = self._leg.get_reverse_node()
        mytools.blend_orient(attr_ctrl=attr_blend, reverse=reverse_nd, ik_jnt=self._ball_ik, fk_jnt=self._ball_fk,
                             blend_jnt=self._ball)
        mytools.blend_translate(attr_ctrl=attr_blend, reverse=reverse_nd, ik_jnt=self._ball_ik, fk_jnt=self._ball_fk,
                                blend_jnt=self._ball)
