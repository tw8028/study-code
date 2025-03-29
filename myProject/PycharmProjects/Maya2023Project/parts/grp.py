import pymel.core as pm
import parts.attr as attr


def grp_zero(name, target):
    zero_group = grp_target(name=name, target=target)
    pm.parent(target, zero_group)
    return zero_group


# create a group on the target position
def grp_target(name, target):
    grp = grp_sub(name=name, target=target)
    pm.parent(grp, w=True)
    return grp


# create a subGroup of the target
def grp_sub(name, target):
    sub_group = pm.group(empty=True, name=name)
    pm.parent(sub_group, target)
    pm.xform(sub_group, t=(0, 0, 0), ro=(0, 0, 0), roo=pm.xform(target, q=True, roo=True))
    return sub_group


def grp_child(name, parent, position):
    child = grp_sub(name=name, target=parent)
    pm.matchTransform(child, position)
    return child


def grp_master():
    master_grp = pm.group(empty=True, name='master')
    geo = pm.group(empty=True, name='geometry')
    geo.overrideEnabled.set(1)
    ctrl = pm.group(empty=True, name='control')
    jnt = pm.group(empty=True, name='joint')
    pm.parent(geo, ctrl, jnt, master_grp)

    world_zero = pm.group(empty=True, name='zero__c__world__001')
    world_ctrl = pm.circle(nr=(0, 1, 0), r=30, name='ctrl__c__world__001', ch=False)
    pm.parent(world_ctrl, world_zero)
    pm.parent(world_zero, ctrl)
    attr.lock_hide_transform(world_zero)

    pm.addAttr('master', ln='geometryVis', at='bool', dv=1)
    pm.addAttr('master', ln='geoDisplayType', at='enum', enumName='Normal:Template:Reference')
    pm.addAttr('master', ln='controlVis', at='bool', dv=1)
    pm.addAttr('master', ln='jointVis', at='bool', dv=1)
    pm.setAttr(master_grp.geometryVis, channelBox=1)
    pm.setAttr(master_grp.geoDisplayType, channelBox=1)
    pm.setAttr(master_grp.controlVis, channelBox=1)
    pm.setAttr(master_grp.jointVis, channelBox=1)
    var = master_grp.geometryVis >> geo.visibility
    var = master_grp.geoDisplayType >> geo.overrideDisplayType
    var = master_grp.controlVis >> ctrl.visibility
    var = master_grp.jointVis >> jnt.visibility
    for item in [master_grp, geo, ctrl, jnt]:
        attr.lock_hide_transform(item)
