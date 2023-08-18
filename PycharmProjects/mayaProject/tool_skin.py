# coding:gbk
import pymel.core as pm


def low_res_geo(*args):
    jnts = pm.selected()
    for jnt in jnts:
        cylinder = \
            pm.polyCylinder(n=jnt + '_res_geo', radius=1, height=1, sx=12, sy=6, sz=1, ax=(1, 0, 0), rcp=0, cuv=3,
                            ch=1)[0]
        pm.move(-0.5, 0, 0, cylinder.scalePivot, cylinder.rotatePivot, r=True)
        pm.delete(cylinder.f[72:95])
        pm.delete(pm.parentConstraint(jnt, cylinder))
        if jnt.getChildren():
            cylinder.sx.set(jnt.getChildren()[0].tx.get())
        else:
            cylinder.sx.set(2)
            cylinder.sy.set(2)
            cylinder.sz.set(2)
        pm.select(jnt, cylinder)
        pm.skinCluster(toSelectedBones=True)


def del_res_geo(*args):
    pm.delete('*_res_geo')


def select_skin_jnts(*args):
    objs = pm.selected()
    jnts = [pm.skinCluster(x, q=True, inf=True) for x in objs]
    pm.select(jnts)


# copy skin from mesh a to mesh b
def copy_skin_weights(*args):
    objs = pm.selected()
    jnts = [pm.skinCluster(x, q=True, inf=True) for x in objs[:-1]]
    print(jnts)
    pm.select(jnts)
    pm.select(objs[-1], add=True)
    # create skinCluster for mesh objs[-1]
    pm.skinCluster(toSelectedBones=True)
    # copy weight from objs[:-1] to objs[-1]
    pm.select(objs)
    pm.copySkinWeights(noMirror=True, ia=('closestJoint', 'oneToOne'), sa='closestPoint')


if __name__ == '__main__':
    if pm.window('skin_tools', ex=True):
        pm.deleteUI('skin_tools')
    pm.window('skin_tools')
    pm.columnLayout(adj=True)
    pm.button(label='create low_res_geo', c=low_res_geo)
    pm.button(label='delete low_res_geo', c=del_res_geo)
    pm.button(label='select skin jnts', c=select_skin_jnts)
    pm.button(label='copy skin-weights', c=copy_skin_weights)

    pm.window('skin_tools', title='skin_tools', e=True, wh=(240, 300))
    pm.showWindow('skin_tools')
