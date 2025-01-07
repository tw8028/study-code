#!/usr/bin/python
# -*- coding:utf-8 -*-
import pymel.core as pm

def cut_keys(root):
    joint_p = pm.PyNode(root)
    joint_ch = pm.listRelatives(joint_p,children = True)
    for jnt in joint_ch:
        pm.cutKey(jnt, attribute = 'scale', clear=True)
        pm.cutKey(jnt, attribute='translate', clear=True)
        cut_keys(jnt)

def cut_bip(*args):
    bip001 = pm.PyNode('Bip001')
    pm.cutKey(bip001, attribute = 'scale', clear=True)
    cut_keys(bip001)

if __name__ == '__main__':
    name = 'cut_keys'
    if pm.window(name, ex=True):
        pm.deleteUI(name)
    with pm.window(name):
        with pm.columnLayout(adj=True):
            pm.button(label=name, c=cut_bip)