import importlib

import package_tools.cv
import package_tools.grp
import package_tools.jnt
import package_tools.rig

import rig_quinn.head
import rig_quinn.spine
import rig_quinn.clavicle
import rig_quinn.limb
import rig_quinn.hand
import rig_quinn.foot
import rig_quinn.switch_limb

def main():
    importlib.reload(package_tools.cv)
    importlib.reload(package_tools.grp)
    importlib.reload(package_tools.jnt)
    importlib.reload(package_tools.rig)

    importlib.reload(rig_quinn.head)
    importlib.reload(rig_quinn.spine)
    importlib.reload(rig_quinn.clavicle)
    importlib.reload(rig_quinn.limb)
    importlib.reload(rig_quinn.hand)
    importlib.reload(rig_quinn.foot)
    importlib.reload(rig_quinn.switch_limb)

if __name__ == '__main__':
    main()
