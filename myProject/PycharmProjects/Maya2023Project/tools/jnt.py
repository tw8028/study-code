import pymel.core as pm


#  Create a new joint on the target position
def new(name, target):
    pm.select(target)
    jnt = pm.joint(name=name, roo=pm.xform(target, q=True, roo=True))
    pm.select(cl=True)
    return jnt


def insert(start_jnt, num=1):
    end_jnt = pm.listRelatives(start_jnt, children=True)[0]
    jnt_offset = pm.PyNode(end_jnt).translateX.get() / (num + 1)
    _roo = pm.xform(start_jnt, q=True, roo=True)
    jnt_parts = []
    n = 1
    pm.select(start_jnt)
    while n < num + 1:
        part_pn = pm.PyNode(pm.insertJoint())
        jnt_parts.append(part_pn)
        # edit name and position
        name = start_jnt + f'_part_0{n}'
        pm.joint(part_pn, e=True, co=True, r=True, p=(jnt_offset, 0, 0), n=name, roo=_roo)
        n += 1
    return jnt_parts


if __name__ == '__main__':
    sel = pm.selected()[0]
    insert(sel, 2)
