from package_tools import *
import importlib
import rig_quinn.head
import rig_quinn.spine
import rig_quinn.clavicle
import rig_quinn.limb
import rig_quinn.finger
import rig_quinn.foot
import rig_quinn.switch_limb
import rig_quinn.twist
import rig_quinn.config
import ngSkinCreateLayers

def main():
    importlib.reload(cv)
    importlib.reload(grp)
    importlib.reload(jnt)
    importlib.reload(rig)
    importlib.reload(ngSkinCreateLayers)

    importlib.reload(rig_quinn.head)
    importlib.reload(rig_quinn.spine)
    importlib.reload(rig_quinn.clavicle)
    importlib.reload(rig_quinn.limb)
    importlib.reload(rig_quinn.finger)
    importlib.reload(rig_quinn.foot)
    importlib.reload(rig_quinn.switch_limb)
    importlib.reload(rig_quinn.twist)
    importlib.reload(rig_quinn.config)

if __name__ == '__main__':
    main()
