import pymel.core as pm


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


def delete(*args):
    pm.delete('*_ro_ptcon')
    pm.delete('*_ro_geo')


if __name__ == '__main__':
    if pm.window('ro_geo', ex=True):
        pm.deleteUI('ro_geo')
    pm.window('ro_geo')
    pm.columnLayout(adj=True)
    pm.button(label='create ro_geo', c=create_ro_geo)
    pm.button(label='delete', c=delete)

    pm.window('ro_geo', title='ro_geo', e=True, wh=(200, 300))
    pm.showWindow('ro_geo')
