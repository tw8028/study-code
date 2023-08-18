#!/usr/bin/python
# -*- coding:utf-8 -*-
import pymel.core as pm

global a_list
global b_list
global c_list


def get_a(*args):
    global a_list
    a_list = pm.selected()
    pm.select(cl=True)


def get_b(*args):
    global b_list
    b_list = pm.selected()
    pm.select(cl=True)


def get_c(*args):
    global c_list
    c_list = pm.selected()
    pm.select(cl=True)


def jnt_inbetween(*args):
    global a_list
    global b_list
    for n in range(len(a_list)):
        pm.joint(position=pm.xform(a_list[n], q=True, rotatePivot=True, ws=True))
        pm.joint(position=pm.xform(b_list[n], q=True, rotatePivot=True, ws=True))
        pm.select(cl=True)


def create_ik(*args):
    global a_list
    global b_list
    global c_list
    for n in range(len(a_list)):
        handle = pm.ikHandle(n=a_list[n] + '_handle', sj=a_list[n], ee=b_list[n])[0]
        pm.poleVectorConstraint(c_list[n], handle)


def parent_cons(*args):
    global a_list
    global b_list
    maintainOffset = pm.checkBox('m_offset', q=True, v=True)
    for n in range(len(a_list)):
        pm.parentConstraint(a_list[n], b_list[n], mo=maintainOffset)


def skin(*args):
    global a_list
    global b_list
    for n in range(len(a_list)):
        pm.select(a_list[n], b_list[n])
        pm.skinCluster(tsb=True)


def show_line(*args):
    global a_list
    global b_list
    for n in range(len(a_list)):
        line = pm.curve(d=1, p=[(0, 0, 0), (1, 0, 0)], k=[0, 1])
        line_shape = line.getShape()
        line_shape.overrideEnabled.set(1)
        line_shape.overrideColor.set(14)
        a_list[n].getShape().worldPosition[0] >> line_shape.controlPoints[0]
        b_list[n].getShape().worldPosition[0] >> line_shape.controlPoints[1]


def main():
    if pm.window('batch', ex=True):
        pm.deleteUI('batch')
    pm.window('batch')
    column = pm.columnLayout(adj=True)
    pm.text('get global variables form selected objs')
    pm.rowLayout(numberOfColumns=3)
    pm.button(label='get a_list', c=get_a)
    pm.button(label='get b_list', c=get_b)
    pm.button(label='get c_list', c=get_c)
    pm.setParent(column)
    pm.text('batch')
    pm.button(label='jnt inbetween(2)', c=jnt_inbetween)
    pm.button(label='create ik(3)', c=create_ik)
    pm.button(label='skinCluster(2)', c=skin)
    pm.button(label='show line(2)', c=show_line)

    pm.rowLayout(nc=2)
    pm.checkBox('m_offset', label='maintainOffset', v=False)
    pm.button(label='parent constraint(2)', c=parent_cons)
    pm.setParent(column)

    pm.window('batch', title='batch', e=True, wh=(240, 300))
    pm.showWindow('batch')


if __name__ == '__main__':
    main()
