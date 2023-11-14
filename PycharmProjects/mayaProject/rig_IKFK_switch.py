#!/usr/bin/python
# -*- coding:utf-8 -*-
import pymel.core as pm


def normalaize(vector):
    norm = (vector[0] ** 2 + vector[1] ** 2 + vector[2] ** 2) ** 0.5
    return [vector[n] / norm for n in range(3)]


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


def cross_cv(name):
    points = [(-1, 1, 0), (-1, 3, 0), (1, 3, 0), (1, 1, 0), (3, 1, 0), (3, -1, 0), (1, -1, 0), (1, -3, 0),
              (-1, -3, 0), (-1, -1, 0), (-3, -1, 0), (-3, 1, 0), (-1, 1, 0)]
    return pm.curve(n=name, d=1, p=points, k=range(13))


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


def create_fk(jnt, p=None):
    grp = None
    if pm.listRelatives(jnt, c=True):
        offset = pm.group(empty=True, n=jnt + '_ctrl_offset')
        ctrl = pm.circle(nr=(1, 0, 0), c=(0, 0, 0), r=2, n=jnt + '_ctrl', ch=False)[0]
        t = pm.xform(jnt, q=True, t=True, ws=True)
        ro = pm.xform(jnt, q=True, ro=True, ws=True)
        roo = pm.xform(jnt, q=True, roo=True)
        pm.xform(offset, t=t, ro=ro, roo=roo)
        pm.xform(ctrl, t=t, ro=ro, roo=roo)
        pm.parent(ctrl, offset)
        # noinspection PyBroadException
        try:
            pm.parent(offset, p)
        except Exception:
            pass
        if grp is None:
            grp = offset
        pm.parentConstraint(ctrl, jnt)
        create_fk(pm.listRelatives(jnt, c=True)[0], ctrl)
    return grp


def create_ik(jnt0):
    jnt1 = pm.listRelatives(jnt0, children=True)[0]
    jnt2 = pm.listRelatives(jnt1, children=True)[0]
    print(jnt1, jnt2)
    handle = pm.ikHandle(n=jnt0 + '_handle', sj=jnt0, ee=jnt2)[0]
    handle.visibility.set(0)
    pole_ctrl = pole_cv(jnt0 + '_poleCtrl')
    pole_offset = grp_offset(jnt0 + '_poleOffset', target=jnt1, child=pole_ctrl)

    # get the pole_offset vector
    vec0 = pm.xform(jnt0, q=True, t=True, ws=True)
    vec1 = pm.xform(jnt1, q=True, t=True, ws=True)
    vec2 = pm.xform(jnt2, q=True, t=True, ws=True)
    vec_up = normalaize([vec1[n] - vec0[n] for n in range(3)])
    vec_down = normalaize([vec1[n] - vec2[n] for n in range(3)])
    direction_poleVector = normalaize([vec_up[n] + vec_down[n] for n in range(3)])

    pm.xform(pole_offset, t=[vec1[n] + direction_poleVector[n] * 40 for n in range(3)], ws=True)

    handle_ctrl = cube_cv(handle + 'Ctrl')
    handle_offset = grp_offset(jnt0 + '_handleOffset', target=jnt2, child=handle_ctrl)
    pm.pointConstraint(handle_ctrl, handle)
    pm.orientConstraint(handle_ctrl, jnt2)
    pm.poleVectorConstraint(pole_ctrl, handle)
    grp = pm.group(n='{0}_ctrl_offset'.format(jnt0), empty=True)
    pm.parent(handle, handle_offset, pole_offset, grp)

    def connect(ctrl, jnt):
        point1 = pm.spaceLocator(n=ctrl + '_point_loc1')
        pm.parentConstraint(ctrl, point1)
        point2 = pm.spaceLocator(n=ctrl + '_point_loc2')
        pm.parentConstraint(jnt, point2)
        line = pm.curve(d=1, p=[(0, 0, 0), (1, 0, 0)], k=[0, 1], name=ctrl + '_line')
        line_shape = line.getShape()
        line_shape.overrideEnabled.set(1)
        line_shape.overrideDisplayType.set(1)
        point1.getShape().worldPosition[0] >> line_shape.controlPoints[0]
        point2.getShape().worldPosition[0] >> line_shape.controlPoints[1]
        grp_line = pm.group(empty=True, name=ctrl + '_line_offset')
        pm.parent(point1, point2, line, grp_line)
        return grp_line

    pm.parent(connect(pole_ctrl, jnt1), grp)
    return grp


def blend_ikfk(jnt0):
    # create jnts
    jnt1 = pm.listRelatives(jnt0, children=True)[0]
    jnt2 = pm.listRelatives(jnt1, children=True)[0]

    pm.select(jnt0)
    ik_jnt0 = pm.joint(n='IK' + jnt0, roo=pm.xform(jnt0, q=True, roo=True))
    fk_jnt0 = pm.joint(n='FK' + jnt0, roo=pm.xform(jnt0, q=True, roo=True))
    pm.select(jnt1)
    ik_jnt1 = pm.joint(n='IK' + jnt1, roo=pm.xform(jnt1, q=True, roo=True))
    fk_jnt1 = pm.joint(n='FK' + jnt1, roo=pm.xform(jnt1, q=True, roo=True))
    pm.select(jnt2)
    ik_jnt2 = pm.joint(n='IK' + jnt2, roo=pm.xform(jnt2, q=True, roo=True))
    fk_jnt2 = pm.joint(n='FK' + jnt2, roo=pm.xform(jnt2, q=True, roo=True))

    ik_jnt_offset = grp_offset(n='IK' + jnt0 + '_offset', target=jnt0, child=ik_jnt0)
    fk_jnt_offset = grp_offset(n='FK' + jnt0 + '_offset', target=jnt0, child=fk_jnt0)
    parent_chain(ik_jnt2, ik_jnt1, ik_jnt0)
    parent_chain(fk_jnt2, fk_jnt1, fk_jnt0)
    con0 = pm.parentConstraint(ik_jnt0, fk_jnt0, jnt0)
    con1 = pm.parentConstraint(ik_jnt1, fk_jnt1, jnt1)
    con2 = pm.parentConstraint(ik_jnt2, fk_jnt2, jnt2)

    # create ikfk ctrl
    pm.select(fk_jnt2)
    end = pm.joint()
    fk_ctrl_offset = create_fk(fk_jnt0)
    pm.delete(end)

    ik_ctrl_offset = create_ik(ik_jnt0)
    # grp
    grp = pm.group(n=jnt0 + '_system', empty=True)
    pm.parent(ik_jnt_offset, ik_ctrl_offset, grp)
    pm.parent(fk_jnt_offset, fk_ctrl_offset, grp)

    # set the attribute
    attr_obj = cross_cv(jnt0 + '_switch_ctrl')
    grp_offset(n=attr_obj + '_offset', target=jnt2, child=attr_obj)
    pm.select(attr_obj)
    pm.addAttr(ln='IKFK', at='bool', dv=0, k=1)
    ikfk_attr = pm.PyNode('{0}.IKFK'.format(attr_obj))
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


def hind_leg_ik():
    pass


class Switch:
    def __init__(self, switch_ctrl):
        self.attr = pm.PyNode('{0}.IKFK'.format(switch_ctrl))
        self.jnt0 = pm.PyNode(str(switch_ctrl).replace('_switch_ctrl', ''))
        self.jnt1 = pm.listRelatives(self.jnt0, children=True)[0]
        print(self.jnt0)

        self.jnt2 = pm.listRelatives(self.jnt1, children=True)[0]

        self.fkctrl0 = 'FK' + self.jnt0 + '_ctrl'
        self.fkctrl1 = 'FK' + self.jnt1 + '_ctrl'
        self.fkctrl2 = 'FK' + self.jnt2 + '_ctrl'

        self.poleCtrl = 'IK' + self.jnt0 + '_poleCtrl'
        self.handleCtrl = 'IK' + self.jnt0 + '_handleCtrl'

    # Check the Rotate Order if it not work well
    def ik2fk(self):
        pm.xform(self.fkctrl0, ro=pm.xform('IK' + self.jnt0, q=True, ro=True))
        pm.xform(self.fkctrl1, ro=pm.xform('IK' + self.jnt1, q=True, ro=True))
        pm.xform(self.fkctrl2, ro=pm.xform('IK' + self.jnt2, q=True, ro=True))
        self.attr.set(0)

    def fk2ik(self):
        t = pm.xform('FK' + self.jnt2, q=True, t=True, ws=True)
        ro = pm.xform('FK' + self.jnt2, q=True, ro=True, ws=True)
        pm.xform(self.handleCtrl, t=t, ro=ro, ws=True)

        vec0 = pm.xform('FK' + self.jnt0, q=True, t=True, ws=True)
        vec1 = pm.xform('FK' + self.jnt1, q=True, t=True, ws=True)
        vec2 = pm.xform('FK' + self.jnt2, q=True, t=True, ws=True)
        vec_up = normalaize([vec1[n] - vec0[n] for n in range(3)])
        vec_down = normalaize([vec1[n] - vec2[n] for n in range(3)])
        dir_poleVector = normalaize([vec_up[n] + vec_down[n] for n in range(3)])

        pm.xform(self.poleCtrl, t=[vec1[n] + dir_poleVector[n] * 40 for n in range(3)], ws=True)
        self.attr.set(1)


def switch_click(*args):
    switch_ctrl = pm.selected()[0]
    switch = Switch(switch_ctrl)
    if switch_ctrl.IKFK.get() == 0:
        switch.fk2ik()
    else:
        switch.ik2fk()


def ikfk_click(*args):
    radio_collection = pm.radioCollection('ikfk_type', q=True, select=True)
    ikfk_type = pm.radioButton(radio_collection, q=True, label=True)
    print(ikfk_type)
    if ikfk_type == 'FK':
        # select root joint to create fk line except the end joint
        create_fk(pm.selected()[0])

    elif ikfk_type == 'FK tree':
        root_jnt = pm.selected()[0]
        children = pm.listRelatives(root_jnt, children=True, type='joint')
        print(children)
        root_jnt_offset = pm.group(empty=True, n=root_jnt + '_ctrl_offset')
        pm.parentConstraint(root_jnt, root_jnt_offset)
        for i in children:
            pm.parent(create_fk(i), root_jnt_offset)

    elif ikfk_type == 'IK':
        create_ik(pm.selected()[0])

    elif ikfk_type == 'IKFK switch':
        blend_ikfk(pm.selected()[0])


def main():
    if pm.window('IKFK', ex=True):
        pm.deleteUI('IKFK')
    with pm.window('IKFK', wh=(200, 240)):
        with pm.columnLayout(rowSpacing=15, columnAttach=('both', 5), adj=True):
            with pm.frameLayout('Create IK FK by selecting root'):
                with pm.gridLayout(numberOfColumns=2, cellWidth=100):
                    pm.radioCollection('ikfk_type')
                    pm.radioButton(label='FK', select=True)
                    pm.radioButton(label='FK tree')
                    pm.radioButton(label='IK')
                    pm.radioButton(label='IKFK switch')
                with pm.columnLayout():
                    pm.button(label='apply', c=ikfk_click)
            with pm.frameLayout('Switch operation'):
                with pm.columnLayout():
                    pm.button(label='apply', c=switch_click)

        pm.window('IKFK', e=True, wh=(240, 360))
        pm.showWindow('IKFK')


if __name__ == '__main__':
    main()
