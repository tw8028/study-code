import pymel.core as pm
import parts.attr as attr


# 生成的 joint 旋转数值为零, jointOrient 不为零
def jnt_target(name, target):
    pm.select(clear=True)
    joint = pm.joint(name=name, roo=pm.xform(target, q=True, roo=True))
    pm.parent(joint, target)
    attr.zero_transform(joint)
    pm.parent(joint, world=True)
    return joint


# 只镜像 translate 和 rotate, 不镜像 jointOrient, 用于面部
def jnt_mirror(origin_jnt):
    pm.select(clear=True)
    old_name = origin_jnt.name()
    if '__r' in old_name:
        new_name = old_name.replace('__r', '__l')
    elif '__l' in old_name:
        new_name = old_name.replace('__l', '__r')
    else:
        new_name = old_name + '_mirrored'
    mirror_jnt = pm.joint(name=new_name)
    t = pm.xform(origin_jnt, q=True, t=True)
    ro = pm.xform(origin_jnt, q=True, ro=True)
    pm.xform(mirror_jnt, t=(-t[0], t[1], t[2]))
    pm.xform(mirror_jnt, ro=(ro[0], -ro[1], ro[2]))


def jnt_insert(start_jnt, num):
    end_jnt = pm.listRelatives(start_jnt, children=True)[0]
    jnt_offset = pm.PyNode(end_jnt).translateX.get() / (num + 1)  # type: ignore
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


def jnt_curve(curve, num):
    u_value = 1 / num
    curve_shape = curve.getShape()
    loc = pm.spaceLocator()
    pm.select(cl=True)
    motion_path = pm.createNode('motionPath')
    # set Parametric Length false
    # Getting uniform positions along a curve
    motion_path.fractionMode.set(1)
    var = curve_shape.worldSpace >> motion_path.geometryPath
    var = motion_path.allCoordinates >> loc.translate
    jnt_p = None
    for n in range(num + 1):
        motion_path.uValue.set(n * u_value)
        jnt = pm.joint(position=pm.xform(loc, q=True, t=True, ws=True))
        if jnt_p is not None:
            pm.parent(jnt, jnt_p)
        jnt_p = jnt
    pm.delete(loc, motion_path)
