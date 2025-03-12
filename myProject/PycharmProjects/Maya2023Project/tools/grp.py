import pymel.core as pm
import tools.attr as attr


def zero(name, target):
    zero_group = on_target(name, target)
    pm.parent(target, zero_group)
    return zero_group


# create a group on the target position
def on_target(name, target):
    grp = sub(name, target)
    pm.parent(grp, w=True)
    return grp


# create a subGroup of the target
def sub(name, target):
    sub_group = pm.group(empty=True, n=name)
    pm.parent(sub_group, target)
    pm.xform(sub_group, t=(0, 0, 0), ro=(0, 0, 0), roo=pm.xform(target, q=True, roo=True))
    return sub_group


def master():
    master = pm.group(empty=True, name='master')
    geo = pm.group(empty=True, name='geometry')
    geo.overrideEnabled.set(1)
    ctrl = pm.group(empty=True, name='control')
    jnt = pm.group(empty=True, name='joint')
    pm.parent(geo, ctrl, jnt, master)

    world_zero = pm.group(empty=True, name='zero__c__world__001')
    world_ctrl = pm.circle(nr=(0, 1, 0), r=30, name='ctrl__c__world__001', ch=False)
    pm.parent(world_ctrl, world_zero)
    pm.parent(world_zero, ctrl)
    attr.lock_hide_transform(world_zero)

    pm.addAttr('master', ln='geometryVis', at='bool', dv=1)
    pm.addAttr('master', ln='geoDisplayType', at='enum', enumName='Normal:Template:Reference')
    pm.addAttr('master', ln='controlVis', at='bool', dv=1)
    pm.addAttr('master', ln='jointVis', at='bool', dv=1)
    pm.setAttr(master.geometryVis, channelBox=1)
    pm.setAttr(master.geoDisplayType, channelBox=1)
    pm.setAttr(master.controlVis, channelBox=1)
    pm.setAttr(master.jointVis, channelBox=1)
    master.geometryVis >> geo.visibility
    master.geoDisplayType >> geo.overrideDisplayType
    master.controlVis >> ctrl.visibility
    master.jointVis >> jnt.visibility
    for item in [master, geo, ctrl, jnt]:
        attr.lock_hide_transform(item)
