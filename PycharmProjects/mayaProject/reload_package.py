import importlib

from package_tools import *
from rig_quinn import *


def main():
    importlib.reload(cv)
    importlib.reload(grp)
    importlib.reload(jnt)
    importlib.reload(rig)

    importlib.reload(head)
    importlib.reload(spine)
    importlib.reload(clavicle)
    importlib.reload(limb)
    importlib.reload(finger)
    importlib.reload(foot)
    importlib.reload(switch_limb)


if __name__ == '__main__':
    main()
