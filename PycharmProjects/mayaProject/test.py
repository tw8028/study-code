#!/usr/bin/python
# -*- coding:utf-8 -*-
import pymel.core as pm


def main():
    if pm.window('Tools', ex=True):
        pm.deleteUI('Tools')
    pm.window('Tools')
    column = pm.columnLayout()
    pm.button(label='create main', c=rig_group)
    pm.button(label='copy skin', c=copy_skin)
    pm.button(label='create offset', c=create_offset)

    pm.text('curve ctrl tools')
    pm.button(label='cv point ctrl', c=point_ctrl)
    pm.rowLayout(nc=2)
    pm.intField('path_num', value=0, w=40)
    pm.button(label='pathConstraint', c=path_cons)
    pm.setParent(column)

    pm.window('Tools', title='Tools', e=True, wh=(240, 300))
    pm.showWindow('Tools')


if __name__ == '__main__':
    main()
