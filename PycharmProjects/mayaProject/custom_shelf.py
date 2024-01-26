#!/usr/bin/python
# -*- coding:utf-8 -*-
import pymel.core as pm
import importlib

import tool_curve as curve
import tool_jnt as jnt
import tool_rename as rename
import tool_skin as skin
import rig_biped as bip
import rig_IKFK_switch as ikfk
import rig_neck as neck


def zero(*args):
    objs = pm.selected()
    for obj in objs:
        pm.xform(obj, t=(0, 0, 0), ro=(0, 0, 0))


def align(*args):
    objs = pm.selected()
    target = objs[-1]
    _roo = pm.xform(target, q=True, roo=True)
    for i in objs[0:-1]:
        pm.delete(pm.parentConstraint(target, i))
        pm.xform(i, roo=_roo)


# create rig group
def rig_grp(*args):
    pm.group(empty=True, name='Group')
    pm.group(empty=True, name='Geometry')
    pm.group(empty=True, name='DeformationSystem')
    pm.group(empty=True, name='MotionSystem')
    pm.parent('Geometry', 'DeformationSystem', 'MotionSystem', 'Group')

    pm.group(empty=True, name='MainSystem')
    pm.circle(nr=(0, 1, 0), r=30, name='world_ctrl', ch=False)
    pm.circle(nr=(0, 1, 0), r=25, name='local_ctrl', ch=False)
    pm.circle(nr=(0, 1, 0), r=20, name='Main', ch=False)
    group_p = 'MotionSystem'
    for i in ['MainSystem', 'world_ctrl', 'local_ctrl', 'Main']:
        pm.parent(i, group_p)
        group_p = i


# create offset group
def offset_grp(*args):
    def create(obj):
        offset = pm.group(empty=True, n=obj + '_offset')
        _roo = pm.xform(obj, q=True, roo=True)
        pm.parent(offset, obj)
        pm.xform(offset, t=(0, 0, 0), ro=(0, 0, 0), roo=_roo)
        pm.parent(offset, w=True)
        pm.parent(obj, offset)

    objs = pm.ls(sl=True)
    for i in objs:
        create(i)


# select the offset of ik chain then copy it and then control it
def create_trans(*args):
    sel = pm.selected()
    n = 0
    grp = []
    while n < len(sel):
        offset = sel[n]
        trans = pm.group(empty=True, n=offset + '_trans')
        pm.xform(trans, t=pm.xform(offset, q=True, t=True, ws=True))
        pm.xform(trans, ro=pm.xform(offset, q=True, ro=True, ws=True))
        grp.append(trans)
        if n > 0:
            pm.parent(trans, grp[n - 1])
        trans.translate >> offset.translate
        trans.rotate >> offset.rotate
        trans.scale >> offset.scale
        n = n + 1


def create_sub(*args):
    sel = pm.selected()
    for obj in sel:
        sub = pm.group(empty=True, n=obj + '_sub')
        pm.parent(sub, obj)
        pm.xform(sub, t=(0, 0, 0), ro=(0, 0, 0), roo=pm.xform(obj, q=True, roo=True))


class CustomShelf:
    def __init__(self, name='Custom'):
        self.name = name
        self.label_background = (0, 0, 0, 0)
        self.label_colour = (0.9, 0.9, 0.9)
        self._clean_oldshelf()
        pm.setParent(self.name)
        self.build()

    def _clean_oldshelf(self):
        # Checks if the shelf exists and empties it if it does or creates it if it does not.
        if pm.shelfLayout(self.name, ex=True):
            if pm.shelfLayout(self.name, q=True, childArray=True):
                for each in pm.shelfLayout(self.name, q=True, childArray=True):
                    pm.deleteUI(each)

    def add_button(self, label, iol, icon='pythonFamily.png', command='command'):
        pm.setParent(self.name)
        pm.shelfButton(label=label, image=icon, imageOverlayLabel=iol, command=command, olb=self.label_background,
                       olc=self.label_colour)

    def build(self):
        self.add_button('zero', iol='Zero', command=zero)
        self.add_button('align', iol='Align', command=align)
        self.add_button('rig_grp', iol='Grp', command=rig_grp)
        self.add_button('offset_grp', iol='Offset', command=offset_grp)
        self.add_button('trans', iol='Trans', command=create_trans)
        self.add_button('sub', iol='Sub', command=create_sub)

        self.add_button('tool curve', iol='tCv', command=curve.main)
        self.add_button('tool jnt', iol='tJnt', command=jnt.main)
        self.add_button('tool skin', iol='tSkin', command=skin.main)

        self.add_button('rig biped', iol='rBip', command=bip.main)
        self.add_button('rig IKFK', iol='rIKFK', command=ikfk.main)
        self.add_button('rig neck', iol='rNeck', command=neck.main)

        self.add_button('tool rename', iol='tReN', command=rename.main)


def main():
    importlib.reload(curve)
    importlib.reload(jnt)
    importlib.reload(rename)
    importlib.reload(skin)
    importlib.reload(bip)
    importlib.reload(ikfk)
    importlib.reload(neck)
    CustomShelf()
    print('relord custom shelf...')


if __name__ == '__main__':
    main()
