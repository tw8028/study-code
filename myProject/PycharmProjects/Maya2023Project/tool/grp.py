import pymel.core as pm


# create offset group for the child on the target position
def offset(name='offset', *, target, child):
    grp = on_target(name=name, target=target)
    _roo = pm.xform(target, q=True, roo=True)
    pm.parent(child, grp)
    pm.xform(child, t=(0, 0, 0), ro=(0, 0, 0), roo=_roo)
    # noinspection PyBroadException
    try:
        pm.PyNode(child).jointOrient.set(0, 0, 0)
    except:
        pass
    return grp


# create a group on the target position
def on_target(name='group', *, target):
    grp = pm.group(empty=True, n=name)
    _roo = pm.xform(target, q=True, roo=True)
    pm.parent(grp, target)
    pm.xform(grp, t=(0, 0, 0), ro=(0, 0, 0), roo=_roo)
    pm.parent(grp, w=True)
    return grp
