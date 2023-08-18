#!/usr/bin/python
# -*- coding:utf-8 -*-
import pymel.core as pm
import package_tools.rigging as rg


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
        T = pm.xform(i, q=True, t=True)
        Ro = pm.xform(i, q=True, ro=True)
        pm.xform(jnt, t=(-T[0], T[1], T[2]))
        pm.xform(jnt, ro=(Ro[0], -Ro[1], Ro[2]))
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
        jnt = pm.joint(position=p, orientation=ro)
        pm.delete(dummy)
        pm.pointConstraint(i, jnt)


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


def insert_jnts(*args):
    jnt = pm.selected()[0]
    num = pm.intField('num_insert', q=True, value=True)
    rg.insert_jnts(jnt, num=num)


def jnts_on_curve(*args):
    num = pm.intField('num_on_curve', q=True, v=True)
    u_value = 1 / num
    jnts = []
    curve = pm.selected()[0]
    curve_shape = curve.getShape()
    loc = pm.spaceLocator()
    pm.select(cl=True)
    motion_path = pm.createNode('motionPath')
    motion_path.fractionMode.set(1)
    curve_shape.worldSpace >> motion_path.geometryPath
    motion_path.allCoordinates >> loc.translate
    for n in range(num + 1):
        motion_path.uValue.set(n * u_value)
        jnts.append(pm.joint(position=pm.xform(loc, q=True, t=True, ws=True)))
    rg.parent_chain(jnts)
    pm.delete(loc, motion_path)


def create_ro_geo(*args):
    jnts = pm.selected()
    plane_p = None
    geos = []
    for jnt in jnts:
        plane = pm.polyPlane(w=1, h=1, sx=1, sy=1, name=jnt + '_ro_geo')[0]
        geos.append(plane)
        pm.move(-0.5, 0, 0, plane.scalePivot, plane.rotatePivot, rpr=True)
        pm.delete(pm.parentConstraint(jnt, plane))
        if jnt.getChildren():
            plane.sx.set(jnt.getChildren()[0].tx.get())
        else:
            plane.sx.set(5)
            plane.sz.set(5)
        pm.makeIdentity(plane, apply=True, t=0, r=0, s=1, n=0, pn=1)
        if plane_p is not None:
            pm.parent(plane, plane_p)
        plane_p = plane

        pm.pointConstraint(plane, jnt, n=jnt + '_ro_ptcon')
        plane.rotate >> jnt.jointOrient


def delete_ro_geo(*args):
    pm.delete('*_ro_ptcon')
    pm.delete('*_ro_geo')


if __name__ == '__main__':
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
    pm.button(label='apply', c=insert_jnts)
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
