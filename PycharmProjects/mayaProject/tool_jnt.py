#!/usr/bin/python
# -*- coding:utf-8 -*-
import pymel.core as pm


def reset_jnt(objs):
    for i in objs:
        pm.xform(i, ro=(0, 0, 0))
        i.jointOrient.set(0, 0, 0)


def reset_selection(*args):
    sl = pm.selected()
    reset_jnt(sl)


def reset_children(*args):
    sl = pm.selected()
    children = pm.listRelatives(sl, ad=True)
    reset_jnt(children)


def mirror_jnt(*args):
    sl = pm.selected()
    for i in sl:
        pm.select(cl=True)
        jnt = pm.joint()
        tranlate = pm.xform(i, q=True, t=True)
        rotate = pm.xform(i, q=True, ro=True)
        pm.xform(jnt, t=(-tranlate[0], tranlate[1], tranlate[2]))
        pm.xform(jnt, ro=(rotate[0], -rotate[1], rotate[2]))
        pm.rename(jnt, i.replace('R', 'L'))


# create joint at selected position
def joint_obj(*args):
    sel = pm.ls(sl=True)
    for i in sel:
        dummy = pm.group(empty=True)
        pm.delete(pm.parentConstraint(i, dummy))
        p = pm.xform(dummy, q=True, t=True, ws=True)
        ro = pm.xform(dummy, q=True, ro=True, ws=True)
        pm.select(cl=True)
        pm.joint(position=p, orientation=ro)
        pm.delete(dummy)


def joint_point(*args):
    sel = pm.ls(sl=True, flatten=True)
    for i in sel:
        pm.select(cl=True)
        pm.joint(p=pm.xform(i, q=True, t=True, ws=True))


def locator_point(*args):
    sel = pm.ls(sl=True, flatten=True)
    print(sel)
    for i in sel:
        p = pm.xform(i, q=True, t=True, ws=True)
        pm.xform(pm.spaceLocator(), t=p)


def insert_jnt(*args):
    def insert_jnts(start_jnt, num=1):
        end_jnt = pm.listRelatives(start_jnt, children=True)[0]
        jnt_offset = pm.PyNode(end_jnt).translateX.get() / (num + 1)
        _roo = pm.xform(start_jnt, q=True, roo=True)
        part_jnts = []
        n = 1
        pm.select(start_jnt)
        while n < num + 1:
            part_pn = pm.PyNode(pm.insertJoint())
            part_jnts.append(part_pn)
            # edit name and position
            pm.joint(part_pn, e=True, co=True, r=True, p=(jnt_offset, 0, 0), n="{0}_part{1}".format(start_jnt, n),
                     roo=_roo)
            n += 1
        return part_jnts

    jnt = pm.selected()[0]
    num_insert = pm.intField('num_insert', q=True, value=True)
    insert_jnts(jnt, num=num_insert)


def jnts_on_curve(*args):
    num = pm.intField('num_on_curve', q=True, v=True)
    u_value = 1 / num
    curve = pm.selected()[0]
    curve_shape = curve.getShape()
    loc = pm.spaceLocator()
    pm.select(cl=True)
    motion_path = pm.createNode('motionPath')
    motion_path.fractionMode.set(1)
    curve_shape.worldSpace >> motion_path.geometryPath
    motion_path.allCoordinates >> loc.translate
    jnt_p = None
    for n in range(num + 1):
        motion_path.uValue.set(n * u_value)
        jnt = pm.joint(position=pm.xform(loc, q=True, t=True, ws=True))
        if jnt_p is not None:
            pm.parent(jnt, jnt_p)
        jnt_p = jnt
    pm.delete(loc, motion_path)


def create_ro_geo(*args):
    jnts = pm.selected()
    plane_p = None
    for jnt in jnts:
        plane = pm.polyPlane(w=1, h=1, sx=1, sy=1, name='a_ro_geo')[0]
        pm.move(-0.5, 0, 0, plane.scalePivot, plane.rotatePivot, rpr=True)
        pm.delete(pm.parentConstraint(jnt, plane))
        if jnt.getChildren():
            plane.sx.set(jnt.getChildren()[0].tx.get())
        else:
            plane.sx.set(2)
            plane.sz.set(2)
        pm.makeIdentity(plane, apply=True, t=0, r=0, s=1, n=0, pn=1)

        if plane_p is not None:
            pm.parent(plane, plane_p)
        plane_p = plane
        pm.pointConstraint(plane, jnt, n='a_ro_ptcon')
        plane.rotate >> jnt.jointOrient


def delete_ro_geo(*args):
    pm.delete('*_ro_ptcon')
    pm.delete('*_ro_geo')


def main():
    if pm.window('jntTool', ex=True):
        pm.deleteUI('jntTool')
    pm.window('jntTool')
    column = pm.columnLayout()

    pm.text('Reset jointOrient')
    pm.rowLayout(numberOfColumns=2)
    pm.button(label='selected', c=reset_selection)
    pm.button(label='Children', c=reset_children)
    pm.setParent(column)

    pm.text('MirrorJnt (rotateY)')
    pm.button(label='MirrorJnt', c=mirror_jnt)

    pm.text('create joints')
    pm.rowLayout(numberOfColumns=5)
    pm.button(label='point', c=joint_point)
    pm.button(label='obj', c=joint_obj)
    pm.button(label='point_locator', c=locator_point)
    pm.setParent(column)

    pm.text('insert joints')
    pm.rowLayout(numberOfColumns=2)
    pm.intField('num_insert', w=40)
    pm.button(label='apply', c=insert_jnt)
    pm.setParent(column)

    pm.text('create joints on curve')
    pm.rowLayout(numberOfColumns=2)
    pm.intField('num_on_curve', w=40)
    pm.button(label='apply', c=jnts_on_curve)
    pm.setParent(column)

    pm.text('create rotate geo')
    pm.rowLayout(numberOfColumns=2)
    pm.button(label='create', c=create_ro_geo)
    pm.button(label='delete', c=delete_ro_geo)
    pm.setParent(column)

    pm.window('jntTool', title='joint tool', e=True, wh=(240, 300))
    pm.showWindow('jntTool')


if __name__ == '__main__':
    main()
