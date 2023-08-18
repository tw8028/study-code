import pymel.core as pm


def show_line(point1, point2, *, name='line1'):
    line = pm.curve(d=1, p=[(0, 0, 0), (1, 0, 0)], k=[0, 1], n=name)
    line_shape = line.getShape()
    point1.getShape().worldPosition[0] >> line_shape.controlPoints[0]
    point2.getShape().worldPosition[0] >> line_shape.controlPoints[1]
    set_color(14, line)


def new_jnt(target, *, n='joint'):
    _roo = pm.xform(target, q=True, roo=True)
    pm.select(target)
    jnt = pm.joint(n=n, roo=_roo)
    pm.select(cl=True)
    return jnt





def reset_jnt(jnt):
    pm.xform(jnt, ro=(0, 0, 0))
    jnt.jointOrient.set(0, 0, 0)


# Insert part joints
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


def offset(name='offset', *, target, child):
    grp = pm.group(empty=True, n=name)
    _roo = pm.xform(target, q=True, roo=True)
    pm.parent(grp, target)
    pm.xform(grp, t=(0, 0, 0), ro=(0, 0, 0), roo=_roo)
    pm.parent(grp, w=True)
    pm.parent(child, grp)
    pm.xform(child, t=(0, 0, 0), ro=(0, 0, 0), roo=_roo)
    return grp


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


# set color
def set_color(index, *objs):
    for i in objs:
        shapes = pm.listRelatives(i, s=True)
        for j in shapes:
            j.overrideEnabled.set(1)
            j.overrideColor.set(index)


# stretch joints
def stretch_jnt(point1, point2, *driven):
    point1 = pm.PyNode(point1)
    point2 = pm.PyNode(point2)
    distance_between = pm.createNode('distanceBetween', name=point2 + '_db')
    point1.worldMatrix[0] >> distance_between.inMatrix1
    point2.worldMatrix[0] >> distance_between.inMatrix2
    md = pm.createNode('multiplyDivide', name=point2 + '_md')
    md.operation.set(2)
    md.input2X.set(distance_between.distance.get())
    distance_between.distance >> md.input1X
    # sqrt
    sqrt = pm.createNode('multiplyDivide', name=point2 + '_sqrt')
    sqrt.operation.set(3)
    sqrt.input2X.set(0.5)
    # reciprocal
    reciprocal = pm.createNode('multiplyDivide', name=point2 + '_reciprocal')
    reciprocal.operation.set(2)
    reciprocal.input1X.set(1)

    md.outputX >> sqrt.input1X
    sqrt.outputX >> reciprocal.input2X
    for i in driven:
        try:
            jnt = pm.PyNode(i)
            md.outputX >> jnt.scaleX
            reciprocal.outputX >> jnt.scaleY
            reciprocal.outputX >> jnt.scaleZ
        except pm.MayaObjectError:
            pass


# Twist drive
def twist_drive(driver, no_roll, part_jnt):
    driver_pn = pm.PyNode(driver)
    no_roll_pn = pm.PyNode(no_roll)
    mult_matrix = pm.createNode('multMatrix', name=driver_pn + '_mm')
    decompose_matrix = pm.createNode('decomposeMatrix', name=driver_pn + '_dpm')
    quat2euler = pm.createNode('quatToEuler', name=driver_pn + '_q2e')
    multiply_divide = pm.createNode('multiplyDivide', name=driver_pn + '_md')
    multiply_divide.operation.set(2)
    multiply_divide.input2X.set(len(part_jnt) + 1)
    driver_pn.worldMatrix[0] >> mult_matrix.matrixIn[0]
    no_roll_pn.worldInverseMatrix[0] >> mult_matrix.matrixIn[1]
    mult_matrix.matrixSum >> decompose_matrix.inputMatrix
    decompose_matrix.outputQuatX >> quat2euler.inputQuatX
    decompose_matrix.outputQuatW >> quat2euler.inputQuatW
    quat2euler.outputRotateX >> multiply_divide.input1X
    for i in part_jnt:
        part_pn = pm.PyNode(i)
        multiply_divide.outputX >> part_pn.rotateX
