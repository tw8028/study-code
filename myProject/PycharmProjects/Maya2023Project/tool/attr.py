import pymel.core as pm


def hide_channel(obj):
    node = pm.PyNode(obj)
    pm.setAttr(node.translateX, keyable=0)
    pm.setAttr(node.translateY, keyable=0)
    pm.setAttr(node.translateZ, keyable=0)
    pm.setAttr(node.rotateX, keyable=0)
    pm.setAttr(node.rotateY, keyable=0)
    pm.setAttr(node.rotateZ, keyable=0)
    pm.setAttr(node.scaleX, keyable=0)
    pm.setAttr(node.scaleY, keyable=0)
    pm.setAttr(node.scaleZ, keyable=0)


if __name__ == '__main__':
    sel = pm.selected()[0]
    hide_channel(sel)
