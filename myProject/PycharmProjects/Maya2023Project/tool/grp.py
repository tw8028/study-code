import pymel.core as pm


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
