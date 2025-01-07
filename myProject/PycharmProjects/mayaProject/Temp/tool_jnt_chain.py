# coding:gbk
import maya.cmds as mc


def jointChain(n):
    curve1 = mc.ls(sl=True)[0]
    curve1_sp = mc.listRelatives(curve1, s=True)

    def path(x):
        u = x / n
        name = curve1 + '_joint'
        mc.createNode('motionPath', n='temp')
        mc.setAttr('temp.fractionMode', 1)
        mc.setAttr('temp.uValue', u)
        mc.group(empty=True, n='point1')
        mc.joint(n=name + str(x + 1))
        mc.connectAttr(curve1_sp[0] + '.worldSpace', 'temp.geometryPath')
        mc.connectAttr('temp.allCoordinates', 'point1.translate')
        mc.connectAttr('temp.rotate', 'point1.rotate')
        mc.parent(world=True, )
        mc.delete('point1')
        if x > 0:
            mc.parent(name + str(x + 1), name + str(x))

    list(map(path, range(n + 1)))


def click(*arg):
    n = mc.intField('numJoints', q=True, value=True)
    jointChain(n)


if __name__ == '__main__':
    if mc.window('Chain', ex=True):
        mc.deleteUI('Chain')
    mc.window('Chain')
    mc.columnLayout()
    mc.frameLayout('选择曲线，设置骨骼数量')
    mc.columnLayout()
    mc.intField('numJoints', value=0)
    mc.button(label='Create', c=click)

    mc.window('Chain', title='骨骼链工具', e=True, wh=(300, 100))
    mc.showWindow('Chain')
