import pymel.core as pm
import package_tools.grp as grp


# Align to target
def align(obj, target, *, t=True, ro=True):
    _roo = pm.xform(target, q=True, roo=True)
    pm.parent(obj, target)
    if t:
        pm.xform(obj, t=(0, 0, 0), roo=_roo)
    if ro:
        pm.xform(obj, ro=(0, 0, 0), roo=_roo)
    pm.parent(obj, w=True)


# parent chain
def parent_chain(*objs):
    list_children = list(objs)
    list_children.pop()
    for i in list_children:
        pm.parent(i, w=True)
    n = 0
    while n < len(objs) - 1:
        pm.parent(objs[n], objs[n + 1])
        n = n + 1


# stretch IK joints
def stretch_ikjnt(jnt0_offset, handle_offset, ik_jnt0, ik_jnt1, ik_jnt2):
    point1 = pm.PyNode(jnt0_offset)
    point2 = pm.PyNode(handle_offset)
    jnt0 = pm.PyNode(ik_jnt0)
    jnt1 = pm.PyNode(ik_jnt1)
    jnt2 = pm.PyNode(ik_jnt2)

    length = abs(jnt1.translateX.get()) + abs(jnt2.translateX.get())
    distance_between = pm.createNode('distanceBetween', name=handle_offset + '_dis')
    multiply_divide = pm.createNode('multiplyDivide', name=handle_offset + '_md')
    multiply_divide.operation.set(2)
    multiply_divide.input2X.set(length)
    condition = pm.createNode('condition', name=handle_offset + '_condition')
    condition.secondTerm.set(length)
    condition.operation.set(2)
    condition.colorIfFalseR.set(length)

    point1.worldMatrix[0] >> distance_between.inMatrix1
    point2.worldMatrix[0] >> distance_between.inMatrix2
    distance_between.distance >> condition.firstTerm
    distance_between.distance >> condition.colorIfTrue.colorIfTrueR
    condition.outColor.outColorR >> multiply_divide.input1.input1X
    multiply_divide.outputX >> jnt0.scaleX
    multiply_divide.outputX >> jnt1.scaleX


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
def twist_drive(driver, no_roll, driven, value):
    driver_pn = pm.PyNode(driver)
    no_roll_pn = pm.PyNode(no_roll)
    mult_matrix = pm.createNode('multMatrix', name=driver_pn + '_mm')
    decompose_matrix = pm.createNode('decomposeMatrix', name=driver_pn + '_dpm')
    quat2euler = pm.createNode('quatToEuler', name=driver_pn + '_q2e')
    multiply_divide = pm.createNode('multiplyDivide', name=driver_pn + '_md')
    multiply_divide.operation.set(1)
    multiply_divide.input2X.set(value)
    driver_pn.worldMatrix[0] >> mult_matrix.matrixIn[0]
    no_roll_pn.worldInverseMatrix[0] >> mult_matrix.matrixIn[1]
    mult_matrix.matrixSum >> decompose_matrix.inputMatrix
    decompose_matrix.outputQuatX >> quat2euler.inputQuatX
    decompose_matrix.outputQuatW >> quat2euler.inputQuatW
    quat2euler.outputRotateX >> multiply_divide.input1X
    multiply_divide.outputX >> pm.PyNode(driven).rotateX


def normalaize(vector):
    norm = (vector[0] ** 2 + vector[1] ** 2 + vector[2] ** 2) ** 0.5
    return [vector[n] / norm for n in range(3)]


# 使用 offset parent Matrix 做矩阵约束的优势:
# 1 少使用一个节点(decomposeMatrix)
# 2 能够移动，比如先约束，再对齐某个目标
def joint_connect(driver, driven):
    output = grp.target(name="output_" + driven, pos=driven)
    pm.xform(output, ro=pm.xform(driver, q=1, ro=1, ws=1))
    pm.parent(output, driver)
    input_point = grp.target(name='input_' + driver, pos=output)
    pm.parent(driven, input_point)

    mult_nd = pm.createNode("multMatrix", n="multMatrix_" + driven)
    decompose_nd = pm.createNode('decomposeMatrix', n='decomposeMatrix_' + driven)
    output.worldMatrix[0] >> mult_nd.matrixIn[0]
    input_point.parentInverseMatrix[0] >> mult_nd.matrixIn[1]
    mult_nd.matrixSum >> decompose_nd.inputMatrix

    decompose_nd.outputTranslate >> input_point.translate
    decompose_nd.outputRotate >> input_point.rotate
    return input_point


def constraint(driver, driven, *, t=False, ro=False, s=False, mo=True):
    if mo:
        output = grp.target(name="output_to_" + driven, pos=driven)
        pm.parent(output, driver)
    else:
        output = pm.PyNode(driver)
    driven_node = pm.PyNode(driven)

    mult_nd = pm.createNode("multMatrix", n="multMatrix_" + driven)
    decompose_nd = pm.createNode('decomposeMatrix', n='decomposeMatrix_' + driven)
    output.worldMatrix[0] >> mult_nd.matrixIn[0]
    driven_node.parentInverseMatrix[0] >> mult_nd.matrixIn[1]
    mult_nd.matrixSum >> decompose_nd.inputMatrix
    if t:
        decompose_nd.outputTranslate >> driven_node.translate
    if ro:
        decompose_nd.outputRotate >> driven_node.rotate
    if s:
        decompose_nd.outputScale >> driven_node.scale
    # noinspection PyBroadException
    try:
        driven_node.jointOrient.set(0, 0, 0)
        print("driven is Joint")
    except:
        pass


# offset parent matrix, 自身可以移动，比如对齐某个物体，因此没有必要设置output
def constraint_opm(driver, driven, *, mo=False):
    driver_node = pm.PyNode(driver)
    driven_node = pm.PyNode(driven)
    # 获取 driven transform
    _t = pm.xform(driven, q=1, t=1, ws=1)
    _ro = pm.xform(driven, q=1, ro=1, ws=1)
    # noinspection PyBroadException
    try:
        driven_parent = pm.listRelatives(driven_node, parent=True)[0]
        print("has parent")
        mult_matrix_nd = pm.createNode("multMatrix", n="multMatrix_" + driven)
        # driver worldMatrix * driven_parent worldInverseMatrix
        driver_node.worldMatrix[0] >> mult_matrix_nd.matrixIn[0]
        driven_parent.worldInverseMatrix[0] >> mult_matrix_nd.matrixIn[1]
        mult_matrix_nd.matrixSum >> driven_node.offsetParentMatrix
    except:
        driver_node.worldMatrix[0] >> driven_node.offsetParentMatrix
    # noinspection PyBroadException
    try:
        pm.xform(driven, t=(0, 0, 0), ro=(0, 0, 0))
        driven_node.jointOrient.set(0, 0, 0)
    except:
        pass
    # 设置原来transform，保持偏移
    if mo:
        pm.xform(driven, t=_t, ro=_ro, ws=1)


def create_line(ctrl, joint):
    point1 = pm.spaceLocator(n=ctrl + '_point_loc1')
    pm.parentConstraint(ctrl, point1)
    point2 = pm.spaceLocator(n=ctrl + '_point_loc2')
    pm.parentConstraint(joint, point2)
    line = pm.curve(d=1, p=[(0, 0, 0), (1, 0, 0)], k=[0, 1], name=ctrl + '_line')
    line_shape = line.getShape()
    line_shape.overrideEnabled.set(1)
    line_shape.overrideDisplayType.set(1)
    point1.getShape().worldPosition[0] >> line_shape.controlPoints[0]
    point2.getShape().worldPosition[0] >> line_shape.controlPoints[1]
    grp_line = pm.group(empty=True, name=ctrl + '_line_offset')
    grp_line.inheritsTransform.set(0)
    pm.parent(point1, point2, line, grp_line)
    return grp_line


def main():
    sel = pm.selected()
    constraint_opm(sel[0], sel[1], mo=True)


if __name__ == '__main__':
    main()
