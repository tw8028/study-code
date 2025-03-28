import pymel.core as pm
import mytools
from system_biped.component import Component


class Clavicle(Component):
    def __init__(self, *, side: str, joints: list[str]):
        super().__init__(name='clavicle', side=side, joints=joints)
        self.clavicle = joints[0]
        self.ctrl = f'ctrl__{side}__{self.name}__001'
        self.zero = f'zero__{side}__{self.name}__001'
        self.output = f'output__{side}__{self.name}__001'

        self.ctrl_list = [self.ctrl]
        self.constraint_objs = [self.ctrl]

    def build(self):
        spine_end = pm.PyNode(self.clavicle).getParent()  # type:ignore
        upper_arm = pm.PyNode(self.clavicle).getChildren()[0]  # type:ignore

        mytools.grp_target(name=self.zero_cog, target=spine_end)  # connect to spine
        mytools.cv_and_zero(name=self.ctrl, target=self.clavicle, shape='cube', radius=2)
        pm.parent(self.zero_cog, self.grp_rig)
        pm.parent(self.zero, self.zero_cog)
        mytools.grp_sub(name=self.output, target=self.ctrl)
        pm.matchTransform(self.output, upper_arm)
        mytools.lock_hide_transform(self.output)
        self.post_process()


if __name__ == '__main__':
    clavicle = Clavicle(side='l', joints=['clavicle_l'])
    clavicle.build()
    output = clavicle.output
    print(output)
