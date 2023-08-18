#!/usr/bin/python
# -*- coding:utf-8 -*-
import pymel.core as pm


def grp_offset(n='offset', *, target, child):
    grp = pm.group(empty=True, n=n)
    _roo = pm.xform(target, q=True, roo=True)
    pm.parent(grp, target)
    pm.xform(grp, t=(0, 0, 0), ro=(0, 0, 0), roo=_roo)
    pm.parent(grp, w=True)
    pm.parent(child, grp)
    pm.xform(child, t=(0, 0, 0), ro=(0, 0, 0), roo=_roo)
    return grp


def cube_cv(name, r=2):
    p = [(-1, -1, 1), (1, -1, 1), (1, -1, -1), (-1, -1, -1), (-1, -1, 1), (-1, 1, 1), (1, 1, 1), (1, -1, 1),
         (1, 1, 1), (1, 1, -1), (1, -1, -1), (1, 1, -1), (-1, 1, -1), (-1, -1, -1), (-1, 1, -1), (-1, 1, 1)]
    return pm.curve(n=name, d=1, p=[(r * x[0], r * x[1], r * x[2]) for x in p], k=range(16))


def pole_cv(name):
    p = [(-1, 0, 0), (0, 0, -1), (1, 0, 0), (0, 0, 1), (-1, 0, 0), (0, 1, 0), (1, 0, 0), (0, -1, 0), (-1, 0, 0),
         (0, 0, -1), (0, 1, 0), (0, 0, 1), (0, -1, 0), (0, 0, -1)]
    return pm.curve(n=name, d=1, p=p, k=range(14))


def parent_chain(*objs):
    list_children = list(objs)
    # remove the last
    list_children.pop()
    for i in list_children:
        pm.parent(i, w=True)
    n = 0
    while n < len(objs) - 1:
        pm.parent(objs[n], objs[n + 1])
        n = n + 1


# get jonits except the end jnt
def get_jnts(jnt_head):
    jnts = []
    while pm.listRelatives(jnt_head, children=True):
        jnts.append(jnt_head)
        jnt_head = pm.listRelatives(jnt_head, children=True)[0]
    return jnts


def create_fk(jnts):
    list_grp = []
    for i in jnts:
        # offset
        offset = pm.group(empty=True, name=i + '_ctrl_offset')
        list_grp.append(offset)
        pm.delete(pm.parentConstraint(i, offset))
        # ctrl
        ctrl = pm.circle(nr=(1, 0, 0), c=(0, 0, 0), r=2, n=i + '_ctrl', ch=False)[0]
        list_grp.append(ctrl)
        pm.delete(pm.parentConstraint(i, ctrl))
        # constraint jonts
        pm.pointConstraint(ctrl, i)
        pm.orientConstraint(ctrl, i)
    # list_grp = [offset1,ctrl1,offset2,ctrl2....]
    list_grp.reverse()
    parent_chain(*list_grp)
    return list_grp[-1]


def create_ik(jnt0):
    jnt1 = pm.listRelatives(jnt0, children=True)[0]
    jnt2 = pm.listRelatives(jnt1, children=True)[0]
    print(jnt1, jnt2)
    handle = pm.ikHandle(n=jnt0 + '_handle', sj=jnt0, ee=jnt2)[0]
    handle.visibility.set(0)
    pole_ctrl = pole_cv(jnt0 + '_poleCtrl')
    pole_offset = grp_offset(jnt0 + '_poleOffset', target=jnt1, child=pole_ctrl)
    handle_ctrl = cube_cv(handle + '_ctrl')
    handle_offset = grp_offset(jnt0 + '_handleOffset', target=jnt2, child=handle_ctrl)
    pm.pointConstraint(handle_ctrl, handle)
    pm.orientConstraint(handle_ctrl, jnt2)
    grp = pm.group(n='{0}_ctrl_offset'.format(jnt0), empty=True)
    pm.parent(handle, handle_offset, pole_offset, grp)
    return grp


def blend_ikfk(jnt0):
    # create jnts
    jnt1 = pm.listRelatives(jnt0, children=True)[0]
    jnt2 = pm.listRelatives(jnt1, children=True)[0]
    pm.select(jnt0)
    ik_jnt0 = pm.joint(n='IK' + jnt0)
    fk_jnt0 = pm.joint(n='FK' + jnt0)
    pm.select(jnt1)
    ik_jnt1 = pm.joint(n='IK' + jnt1)
    fk_jnt1 = pm.joint(n='FK' + jnt1)
    pm.select(jnt2)
    ik_jnt2 = pm.joint(n='IK' + jnt2)
    fk_jnt2 = pm.joint(n='FK' + jnt2)
    ik_jnt_offset = grp_offset(n='IK' + jnt0 + '_offset', target=jnt0, child=ik_jnt0)
    fk_jnt_offset = grp_offset(n='FK' + jnt0 + '_offset', target=jnt0, child=fk_jnt0)
    parent_chain(ik_jnt2, ik_jnt1, ik_jnt0)
    parent_chain(fk_jnt2, fk_jnt1, fk_jnt0)
    con0 = pm.parentConstraint(ik_jnt0, fk_jnt0, jnt0)
    con1 = pm.parentConstraint(ik_jnt1, fk_jnt1, jnt1)
    con2 = pm.parentConstraint(ik_jnt2, fk_jnt2, jnt2)
    # create ikfk ctrl
    fk_ctrl_offset = create_fk([fk_jnt0, fk_jnt1, fk_jnt2])
    ik_ctrl_offset = create_ik(ik_jnt0)
    # grp
    grp = pm.group(n=jnt0 + '_system', empty=True)
    pm.parent(ik_jnt_offset, ik_ctrl_offset, grp)
    pm.parent(fk_jnt_offset, fk_ctrl_offset, grp)
    # set the attr
    pm.select('Main')
    pm.addAttr(ln=jnt0 + '_IKFK', at='float', min=0, max=1, dv=0, k=1)
    ikfk_attr = pm.PyNode('Main.{}_IKFK'.format(jnt0))
    reverse_nd = pm.createNode('reverse', n=jnt0 + '_IKFK_reverse')
    ikfk_attr >> reverse_nd.inputX

    ikfk_attr >> pm.PyNode('{0}.{1}W0'.format(con0, ik_jnt0))
    reverse_nd.outputX >> pm.PyNode('{0}.{1}W1'.format(con0, fk_jnt0))
    ikfk_attr >> pm.PyNode('{0}.{1}W0'.format(con1, ik_jnt1))
    reverse_nd.outputX >> pm.PyNode('{0}.{1}W1'.format(con1, fk_jnt1))
    ikfk_attr >> pm.PyNode('{0}.{1}W0'.format(con2, ik_jnt2))
    reverse_nd.outputX >> pm.PyNode('{0}.{1}W1'.format(con2, fk_jnt2))

    reverse_nd.outputX >> fk_ctrl_offset.visibility
    ikfk_attr >> ik_ctrl_offset.visibility


# select root joint to create fk line except the end joint
def click1(*args):
    jnts = get_jnts(pm.selected()[0])
    create_fk(jnts)


# create fk by selection
def click2(*args):
    jnts = pm.selected()
    create_fk(jnts)


# select root joint to create IK ctrl
def click3(*args):
    jnt = pm.selected()[0]
    create_ik(jnt)


# blend ikfk
def click4(*args):
    jnt = pm.selected()[0]
    blend_ikfk(jnt)


def fk_tree(*args):
    root_jnt = pm.selected()[0]
    children = pm.listRelatives(root_jnt, children=True, type='joint')

    root_jnt_ctrl = cv.cube(name=root_jnt + '_root_ctrl')
    root_jnt_ctrl_offset = grp_offset(n=root_jnt_ctrl + '_offset', target=root_jnt, child=root_jnt_ctrl)
    for i in children:
        pm.parent(create_fk(get_jnts(i)), root_jnt_ctrl)


def main():
    if pm.window('create_FK', ex=True):
        pm.deleteUI('create_FK')
    pm.window('create_FK')
    column = pm.columnLayout(rowSpacing=20, columnAttach=('both', 5), columnWidth=250)
    pm.columnLayout(columnAttach=('both', 5), columnWidth=180)
    pm.text('create FK')
    pm.button(label='select root', c=click1)
    pm.button(label='select all', c=click2)
    pm.setParent(column)

    pm.columnLayout(columnAttach=('both', 5), columnWidth=180)
    pm.text('create FK Tree')
    pm.button(label='select root', c=fk_tree)
    pm.setParent(column)

    pm.columnLayout(columnAttach=('both', 5), columnWidth=180)
    pm.text('create IK')
    pm.button(label='select root', c=click3)
    pm.setParent(column)

    pm.columnLayout(columnAttach=('both', 5), columnWidth=180)
    pm.text('create IKFK blend')
    pm.button(label='select root', c=click4)

    pm.window('create_FK', title='IKFK', e=True, wh=(200, 300))
    pm.showWindow('create_FK')


if __name__ == '__main__':
    main()
