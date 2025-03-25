import pymel.core as pm
import mytools


class Clavicle:
    # name: jnt__r__clavicle__001
    def __init__(self, *, name: str, clavicle: str):
        self.clavicle = clavicle
        self.upper_arm = pm.PyNode(clavicle).getChildren()[0]  # type:ignore

        self.ctrl = name.format('ctrl')
        self.zero = name.format('zero')
        self.shoulder = name.format('shoulder')

    def create(self):
        mytools.cv_target(name=self.ctrl, target=self.clavicle, shape='cube', radius=2)
        mytools.grp_zero(name=self.zero, target=self.ctrl)

        mytools.grp_sub(name=self.shoulder, target=self.ctrl)
        pm.matchTransform(self.shoulder, self.upper_arm)
        mytools.lock_hide_transform(self.shoulder)


if __name__ == '__main__':
    clavicle = Clavicle(name='{0}__l__clavicle__001', clavicle='clavicle_l')
    clavicle.create()
    output = clavicle.shoulder
    print(output)
