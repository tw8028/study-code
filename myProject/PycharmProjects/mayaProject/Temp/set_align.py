#!/usr/bin/python
# -*- coding:utf-8 -*-
import pymel.core as pm


def align_pos(obj, target, *, tx=True, ty=True, tz=True):
    pm.parent(obj, target)
    if tx:
        obj.tx.set(0)
    if ty:
        obj.ty.set(0)
    if tz:
        obj.tz.set(0)
    pm.parent(obj, w=True)


def align_ro(obj, target, *, rx=True, ry=True, rz=True):
    pm.parent(obj, target)
    if rx:
        obj.rx.set(0)
    if ry:
        obj.ry.set(0)
    if rz:
        obj.rz.set(0)
    pm.parent(obj, w=True)


def pos_click(*args):
    sl = pm.selected()
    objs = sl[:-1]
    target = sl[-1]
    tx_check = pm.checkBox(tx_box, q=True, v=True)
    ty_check = pm.checkBox(ty_box, q=True, v=True)
    tz_check = pm.checkBox(tz_box, q=True, v=True)
    for obj in objs:
        align_pos(obj, target, tx=tx_check, ty=ty_check, tz=tz_check)


def ro_click(*args):
    sl = pm.selected()
    objs = sl[:-1]
    target = sl[-1]
    rx_check = pm.checkBox(rx_box, q=True, v=True)
    ry_check = pm.checkBox(ry_box, q=True, v=True)
    rz_check = pm.checkBox(rz_box, q=True, v=True)
    for obj in objs:
        align_ro(obj, target, rx=rx_check, ry=ry_check, rz=rz_check)


if __name__ == '__main__':
    if pm.window('set_align', ex=True):
        pm.deleteUI('set_align')
    pm.window('set_align')
    column = pm.columnLayout()
    pm.frameLayout('position')
    pm.setParent(column)
    pm.gridLayout(numberOfColumns=4, cellWidth=50)
    tx_box = pm.checkBox(label='x', v=True)
    ty_box = pm.checkBox(label='y', v=True)
    tz_box = pm.checkBox(label='z', v=True)
    pm.button(label='apply', c=pos_click)
    pm.setParent(column)

    pm.frameLayout('rotation')
    pm.setParent(column)
    pm.gridLayout(numberOfColumns=4, cellWidth=50)
    rx_box = pm.checkBox(label='x', v=True)
    ry_box = pm.checkBox(label='y', v=True)
    rz_box = pm.checkBox(label='z', v=True)
    pm.button(label='apply', c=ro_click)
    pm.setParent(column)

    pm.window('set_align', title='set_align', e=True, wh=(240, 160))
    pm.showWindow('set_align')
