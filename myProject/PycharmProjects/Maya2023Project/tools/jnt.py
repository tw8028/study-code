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


def on_curve(curve, num):
    u_value = 1 / num
    curve_shape = curve.getShape()
    loc = pm.spaceLocator()
    pm.select(cl=True)
    motion_path = pm.createNode('motionPath')
    # set Parametirc Length false
    # Getting uniform positions along a curve
    motion_path.fractionMode.set(1)
    curve_shape.worldSpace >> motion_path.geometryPath
    motion_path.allCoordinates >> loc.translate
    jnt_p = None
    for n in range(num + 1):
        motion_path.uValue.set(n * u_value)
        jnt = pm.joint(position=pm.xform(loc, q=True, t=True, ws=True))
        if jnt_p is not None:
            pm.parent(jnt, jnt_p)
        jnt_p = jnt
    pm.delete(loc, motion_path)


if __name__ == '__main__':
    sel = pm.selected()[0]
    insert(sel, 2)
