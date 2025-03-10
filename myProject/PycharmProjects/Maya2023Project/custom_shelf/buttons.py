import pymel.core as pm


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


def grp_obj(target, prefix='grp__'):
    grp_name = prefix + target.split('__', 1)[1]
    grp = pm.group(empty=True, n=grp_name)
    pm.parent(grp, target)
    pm.xform(grp, t=(0, 0, 0), ro=(0, 0, 0), roo=pm.xform(target, q=True, roo=True))
    pm.parent(grp, w=True)
    return grp


def grp_zero(*args):
    target = pm.selected()[0]
    zero_grp = grp_obj(target, 'zero__')
    pm.parent(target, zero_grp)


def grp_sub(*args):
    target = pm.selected()[0]
    sub_grp = grp_obj(target, 'sub__')
    pm.parent(sub_grp, target)
