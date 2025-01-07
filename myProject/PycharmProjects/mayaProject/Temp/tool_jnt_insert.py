import pymel.core as pm


def insert_jnts(start_jnt, num=1):
    end_jnt = pm.listRelatives(start_jnt, children=True)[0]
    jnt_offset = end_jnt.translateX.get() / (num + 1)
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


def click(*args):
    jnt = pm.selected()[0]
    num = pm.intField('num', q=True, value=True)
    insert_jnts(jnt, num)


if __name__ == '__main__':
    if pm.window('insert_jnts', ex=True):
        pm.deleteUI('insert_jnts')
    pm.window('insert_jnts')
    column = pm.columnLayout()
    pm.frameLayout('set number to insert joints')
    pm.setParent(column)

    pm.rowLayout(numberOfColumns=2)
    pm.intField('num', value=1)
    pm.button(label='apply', c=click)

    pm.window('insert_jnts', title='insert_jnts', e=True, wh=(300, 200))
    pm.showWindow('insert_jnts')
