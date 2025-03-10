import pymel.core as pm
import tools.grp as grp
import tools.attr as attr


def reset(*args):
    objs = pm.selected()
    for obj in objs:
        pm.xform(obj, t=(0, 0, 0), ro=(0, 0, 0))


def grp_master(*args):
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


def grp_zero(*args):
    target = pm.selected()[0]
    grp_name = 'zero__' + target.split('__', 1)[1]
    return grp.zero(grp_name, target)


def grp_sub(*args):
    target = pm.selected()[0]
    grp_name = 'sub__' + target.split('__', 1)[1]
    return grp.sub(grp_name, target)
