import pymel.core as pm
import mytools


class Foot5ctrl:
    def __init__(self, name: str, side: str, bones: list[str]):
        self._name = name
        self._side = side
        self._bone_foot = bones[0]
        self._bone_ball = bones[1]
        self._bone_tiptoe = bones[2]
        self._bone_heel = bones[3]

        self.grp_rig = f'rig__{side}__{name}__001'
        self.ankle_ctrl = None
        self.toe_ctrl = None
        self._create_ctrl()

    def _create_ctrl(self):
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
        # ankle 控制ikHandle
        self.ankle_ctrl = name_template.format('ctrl', 'ankle')
        ankle_zero = name_template.format('zero', 'ankle')
        mytools.cv_and_zero(name=self.ankle_ctrl, target=self._bone_ball, shape='triangle', radius=1.5)
        # toes
        self.toe_ctrl = name_template.format('ctrl', 'toe')
        toe_zero = name_template.format('zero', 'toe')
        mytools.cv_and_zero(name=self.toe_ctrl, target=self._bone_ball, shape='triangle', radius=1.0)

        # parent
        pm.parent(ankle_zero, toe_zero, tiptoe_ctrl)
        pm.parent(tiptoe_zero, mid_ctrl)
        pm.parent(mid_zero, heel_ctrl)
        pm.parent(heel_zero, pm.group(name=self.grp_rig, empty=True))
