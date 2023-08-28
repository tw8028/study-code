#!/usr/bin/python
# -*- coding:utf-8 -*-
import pymel.core as pm


def zero(*args):
    objs = pm.selected()
    for obj in objs:
        pm.xform(obj, t=(0, 0, 0), ro=(0, 0, 0))


def align(*args):
    objs = pm.selected()
    for i in objs[0:-1]:
        pm.delete(pm.parentConstraint(objs[-1], i))


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

    def add_button(self, label, icon='pythonFamily.png', iol='pymel', command='command'):
        pm.setParent(self.name)
        pm.shelfButton(label=label, image=icon, imageOverlayLabel=iol, command=command, olb=self.label_background,
                       olc=self.label_colour)

    def build(self):
        self.add_button('zero', iol='Zero', command=zero)
        self.add_button('align', iol='Align', command=align)
        self.add_button('grp_rig', iol='G_rig', command=rig_grp)
        self.add_button('grp_offset', iol='Offset', command=offset_grp)


def main():
    CustomShelf()


if __name__ == '__main__':
    main()
