import pymel.core as pm


def lock_hide_transform(obj):
    node = pm.PyNode(obj)
    lock_and_hide(node.translateX)
    lock_and_hide(node.translateY)
    lock_and_hide(node.translateZ)
    lock_and_hide(node.rotateX)
    lock_and_hide(node.rotateY)
    lock_and_hide(node.rotateZ)
    lock_and_hide(node.scaleX)
    lock_and_hide(node.scaleY)
    lock_and_hide(node.scaleZ)


def lock_and_hide(attr):
    pm.setAttr(attr, lock=True)
    pm.setAttr(attr, keyable=False)
    pm.setAttr(attr, channelBox=False)
