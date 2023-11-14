import pymel.core as pm


# curve shape
class Cv:
    @classmethod
    def cube(cls, name, r=2):
        p = [(-1, -1, 1), (1, -1, 1), (1, -1, -1), (-1, -1, -1), (-1, -1, 1), (-1, 1, 1), (1, 1, 1), (1, -1, 1),
             (1, 1, 1), (1, 1, -1), (1, -1, -1), (1, 1, -1), (-1, 1, -1), (-1, -1, -1), (-1, 1, -1), (-1, 1, 1)]
        return pm.curve(n=name, d=1, p=[(r * x[0], r * x[1], r * x[2]) for x in p], k=range(16))

    @classmethod
    def spine(cls, name):
        p = [(0, -10, 15), (0, -10, -15), (0, 10, -15), (0, 15, 0), (0, 10, 15), (0, -10, 15)]
        cv = pm.curve(d=1, p=p, k=range(6), n=name)
        set_color(24, cv)
        return cv

    @classmethod
    def root(cls, name):
        p = [(-22.2, 15.7, 3.1), (-22.2, 15.7, -3.1), (-11.8, 17.9, -6.8), (-8.1, 12.5, -17.4), (-4.2, 1.3, -23.3),
             (-2.3, -10.5, -19.0), (-4.4, -15.4, -6.8), (-9.8, -16.9, 0.0), (-4.4, -15.4, 6.8), (-2.3, -10.5, 19.0),
             (-4.2, 1.3, 23.3), (-8.1, 12.5, 17.4), (-11.8, 17.9, 6.8), (-22.2, 15.7, 3.1)]
        cv = pm.curve(d=1, p=p, k=range(14), n=name)
        set_color(21, cv)
        return cv

    @classmethod
    def spine1(cls, name):
        cv = pm.circle(name=name, nr=(1, 0, 0), c=(5, 2, 0), r=10, ch=False)
        set_color(21, cv)
        return cv

    @classmethod
    def spine2(cls, name):
        cv = pm.circle(name=name, nr=(1, 0, 0), c=(5, 2, 0), r=10, ch=False)
        set_color(21, cv)
        return cv

    @classmethod
    def chest(cls, name):
        p = [(0.0, -16.6, 14.9), (16.8, -12.6, 11.2), (16.8, 4.1, 11.2), (0.0, 8.7, 14.9), (0.0, 12.2, 0.0),
             (16.8, 6.4, 0.0), (16.8, 4.1, -11.2), (0.0, 8.7, -14.9), (0.0, -16.6, -14.9), (16.8, -12.6, -11.2),
             (16.8, -16.0, 0.0), (0.0, -21.8, 0.0), (0.0, -16.6, 14.9), (16.8, -12.6, 11.2), (16.8, -16.0, 0.0),
             (0.0, -21.8, 0.0), (0.0, -16.6, -14.9), (16.8, -12.6, -11.2), (16.8, 4.1, -11.2), (0.0, 8.7, -14.9),
             (0.0, 12.2, 0.0), (16.8, 6.4, 0.0), (16.8, 4.1, 11.2), (0.0, 8.7, 14.9), (0.0, -16.6, 14.9)]
        cv = pm.curve(name=name, d=1, p=p, k=range(25))
        set_color(21, cv)
        return cv

    @classmethod
    def neck(cls, name):
        cv = pm.circle(name=name, nr=(1, 0, 0), c=(3, 1, 0), r=6, ch=False)
        set_color(21, cv)
        return cv

    @classmethod
    def head(cls, name):
        p = [(0, -4, 5), (16, -4, 5), (16, -4, -5), (0, -4, -5), (0, -4, 5), (0, 10, 5), (0, 10, -5), (16, 10, -5),
             (16, 10, 5), (0, 10, 5), (0, 10, -5), (0, -4, -5), (16, -4, -5), (16, 10, -5), (16, 10, 5), (16, -4, 5)]
        cv = pm.curve(d=1, p=p, k=range(16), n=name)
        set_color(21, cv)
        return cv

    @classmethod
    def scapula(cls, name):
        p = [(15.4, 1.4, 10.4), (15.5, -6.2, 9.0), (9.1, -8.3, 9.7), (5.2, -0.4, 11.5), (5.1, 7.3, 3.1),
             (13.7, 9.0, -3.2), (13.9, 7.6, 5.9), (15.4, 1.4, 10.4), (5.2, -0.4, 11.5)]
        points = p if '_R_' in name else [(-x[0], -x[1], -x[2]) for x in p]
        color = 13 if '_R_' in name else 6
        cv = pm.curve(d=1, p=points, k=range(9), n=name)
        set_color(color, cv)
        return cv

    @classmethod
    def pole(cls, name):
        p = [(-1, 0, 0), (0, 0, -1), (1, 0, 0), (0, 0, 1), (-1, 0, 0), (0, 1, 0), (1, 0, 0), (0, -1, 0), (-1, 0, 0),
             (0, 0, -1), (0, 1, 0), (0, 0, 1), (0, -1, 0), (0, 0, -1)]
        cv = pm.curve(d=1, p=p, k=range(14), n=name)
        color = 13 if '_R_' in name else 6
        set_color(color, cv)
        return cv

    @classmethod
    def hand(cls, name):
        color = 13 if '_R_' in name else 6
        p = [(0.6, 6.6, -1.3), (0.6, -5.2, -1.3), (0.6, -5.2, 3.4), (0.6, 0.0, 6.1), (0.6, 6.6, 4.4), (0.6, 6.6, -1.3),
             (0.6, 6.6, 4.4), (11.1, 8.8, 4.1), (12.5, 0.0, 5.3), (0.6, 0.0, 6.1), (0.6, -5.2, 3.4), (11.1, -6.0, 2.7),
             (12.5, 0.0, 5.3), (11.1, -6.0, 2.7), (11.1, -6.0, -0.5), (0.6, -5.2, -1.3)]
        points = p if '_R_' in name else [(-x[0], -x[1], -x[2]) for x in p]
        cv = pm.curve(d=1, p=points, k=range(16), n=name)
        set_color(color, cv)
        return cv

    @classmethod
    def heel(cls, name):
        color = 13 if '_R_' in name else 6
        p1 = [(3.2, 0.0, 0.8), (-3.2, 0.0, 0.6), (-5.9, 0.0, 19.6), (-5.6, 0.0, 26.3), (-0.0, 0.0, 31.1),
              (4.4, 0.0, 28.1), (5.8, 0.0, 21.2), (3.2, 0.0, 0.8)]
        points1 = p1 if '_R_' in name else [(-x[0], x[1], x[2]) for x in p1]
        k1 = range(8)
        p2 = [(-6.1, 2.2, 18.3), (-3.4, 5.0, -0.2), (2.9, 5.0, 0.4), (5.3, 2.7, 16.5)]
        points2 = p2 if '_R_' in name else [(-x[0], x[1], x[2]) for x in p2]
        k2 = range(4)
        cv1 = pm.curve(d=1, p=points1, k=k1, n=name)
        cv2 = pm.curve(d=1, p=points2, k=k2, n=name)
        pm.parent(pm.listRelatives(cv2, s=True)[0], cv1, add=True, s=True)
        pm.delete(cv2)
        set_color(color, cv1)
        return cv1

    @classmethod
    def sole(cls, name):
        p = [(-4, 0, -5), (-6, 0, 1), (0, 0, 5), (6, 0, 1), (5, 0, -5), (-4, 0, -5)]
        points = p if '_R_' in name else [(-x[0], x[1], x[2]) for x in p]
        color = 20 if '_R_' in name else 18
        cv = pm.curve(d=1, p=points, k=range(6), n=name)
        set_color(color, cv)
        return cv

    @classmethod
    def tip(cls, name):
        p = [(-0.9, 1.8, 0.4), (-1.3, 1.0, 0.7), (-1.4, 0.1, 0.7), (-0.0, 0.1, 1.4), (1.4, 0.1, 1.1), (1.3, 1.0, 0.9),
             (0.9, 1.8, 0.6), (0.0, 1.9, 0.7), (-0.9, 1.8, 0.4)]
        points = p if '_R_' in name else [(-x[0], x[1], x[2]) for x in p]
        color = 20 if '_R_' in name else 18
        cv = pm.curve(d=1, p=points, k=range(9), n=name)
        set_color(color, cv)
        return cv

    @classmethod
    def ankle(cls, name):
        p = [(-1.9, 7.6, -5.3), (0.2, 8.0, -4.6), (2.6, 7.4, -5.2), (2.5, 6.1, -3.6), (2.3, 4.6, -0.6),
             (0.1, 5.2, -0.7), (-1.9, 4.6, -1.0), (-2.1, 6.1, -3.9), (-1.9, 7.6, -5.3)]
        points = p if '_R_' in name else [(-x[0], x[1], x[2]) for x in p]
        color = 20 if '_R_' in name else 18
        cv = pm.curve(d=1, p=points, k=range(9), n=name)
        set_color(color, cv)
        return cv

    @classmethod
    def toes(cls, name):
        p = [(1.6, 4.0, 0.8), (-0.1, 4.5, 0.7), (-1.6, 4.0, 0.4), (-1.4, 3.0, 2.9), (-1.2, 2.5, 4.2), (-0.2, 2.6, 4.6),
             (0.8, 2.5, 4.5), (1.1, 3.0, 3.2), (1.6, 4.0, 0.8)]
        points = p if '_R_' in name else [(-x[0], x[1], x[2]) for x in p]
        color = 20 if '_R_' in name else 18
        cv = pm.curve(d=1, p=points, k=range(9), n=name)
        set_color(color, cv)
        return cv

    @classmethod
    def finger(cls, name):
        cv = pm.circle(nr=(1, 0, 0), c=(0, 0, 0), r=2, n=name, ch=False)
        color = 20 if '_R_' in name else 18
        set_color(color, cv)
        return cv


# offset group
def grp_offset(n='offset', *, target, child):
    grp = pm.group(empty=True, n=n)
    _roo = pm.xform(target, q=True, roo=True)
    pm.parent(child, grp)
    pm.xform(child, t=(0, 0, 0), ro=(0, 0, 0), roo=_roo)
    pm.parent(grp, target)
    pm.xform(grp, t=(0, 0, 0), ro=(0, 0, 0), roo=_roo)
    pm.parent(grp, w=True)
    return grp


def grp_target(n='group', *, target):
    grp = pm.group(empty=True, n=n)
    _roo = pm.xform(target, q=True, roo=True)
    pm.parent(grp, target)
    pm.xform(grp, t=(0, 0, 0), ro=(0, 0, 0), roo=_roo)
    pm.parent(grp, w=True)
    return grp


# Align
def align(obj, target, *, t=True, ro=True):
    _roo = pm.xform(target, q=True, roo=True)
    pm.parent(obj, target)
    if t:
        pm.xform(obj, t=(0, 0, 0), roo=_roo)
    if ro:
        pm.xform(obj, ro=(0, 0, 0), roo=_roo)
    pm.parent(obj, w=True)


# new joint
def new_jnt(target, *, n='joint'):
    _roo = pm.xform(target, q=True, roo=True)
    pm.select(target)
    jnt = pm.joint(n=n, roo=_roo)
    pm.select(cl=True)
    return jnt


# set color
def set_color(index, *objs):
    for i in objs:
        shapes = pm.listRelatives(i, s=True)
        for j in shapes:
            j.overrideEnabled.set(1)
            j.overrideColor.set(index)


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


# Insert part joints
def insert_jnts(start_jnt, end_jnt, num=2):
    jnt_offset = pm.PyNode(end_jnt).translateX.get() / (num + 1)
    _roo = pm.xform(start_jnt, q=True, roo=True)
    part_jnts = []
    n = 1
    pm.select(start_jnt)
    while n < num + 1:
        part_pn = pm.PyNode(pm.insertJoint())
        part_jnts.append(part_pn)
        pm.joint(part_pn, e=True, co=True, r=True, p=(jnt_offset, 0, 0), n="{0}{1}{2}".format(start_jnt, '_part', n),
                 roo=_roo)
        n += 1
    return part_jnts


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


def mirror_points(shape):
    size = shape.controlPoints.get(size=True)
    for i in range(size):
        x = shape.controlPoints[i].xValue.get()
        y = shape.controlPoints[i].yValue.get()
        z = shape.controlPoints[i].zValue.get()
        if 'Foot' in shape.name():
            shape.controlPoints[i].xValue.set(-x)
        else:
            shape.controlPoints[i].xValue.set(-x)
            shape.controlPoints[i].yValue.set(-y)
            shape.controlPoints[i].zValue.set(-z)


def mirror_ctrl_curve(target):
    target_name = target.name()
    obj_name = target_name.replace('R_', 'L_') if 'R_' in target_name else target_name.replace('L_', 'R_')
    obj = pm.PyNode(obj_name)
    old_shapes = pm.listRelatives(obj, s=True)
    color = old_shapes[0].overrideColor.get()
    pm.delete(old_shapes)
    copy = pm.duplicate(target, name=obj_name)
    copy_shapes = pm.listRelatives(copy, s=True)
    for i in copy_shapes:
        mirror_points(i)
        pm.parent(i, obj, add=True, s=True)
        i.overrideColor.set(color)
    pm.delete(copy)


def matrix_constraint(driver, driven):
    driver_node = pm.PyNode(driver)
    driven_node = pm.PyNode(driven)
    mult_matrix_node = pm.createNode('multMatrix', n=driven + '_matrixConstraint')

    driver_node.worldMatrix[0] >> mult_matrix_node.matrixIn[0]
    if pm.listRelatives(driven, parent=True):
        driven_parent_node = pm.listRelatives(driven, parent=True)[0]
        driven_parent_node.worldInverseMatrix >> mult_matrix_node.matrixIn[1]
    mult_matrix_node.matrixSum >> driven_node.offsetParentMatrix

    # set local transform
    pm.xform(driven, t=(0, 0, 0), ro=(0, 0, 0), roo=pm.xform(driver, q=True, roo=True))
    try:
        driven_node.jointOrient.set(0, 0, 0)
    except exception:
        pass


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
        matrix_constraint(ctrl, jnt)
        create_fk(pm.listRelatives(jnt, c=True)[0], ctrl)
    return grp


class Spine:
    motion_system = 'MotionSystem'
    curve_system = 'CurveSystem'
    cvgrp = 'SpineCv_grp'
    spine_system = 'SpineSystem'
    dict_jnts = {'Root_M': 'root', 'Spine1_M': 'spine1', 'Spine2_M': 'spine2', 'Chest_M': 'chest', 'Neck_M': 'neck'}

    @staticmethod
    def create_jnt():
        pm.parent(pm.group(empty=True, name=Spine.spine_system), Spine.motion_system)
        for k, v in Spine.dict_jnts.items():
            new_jnt(k, n=v)
        jnt_grp = grp_target('Spine_jntOffset', target='Root_M')
        jnt_grp.visibility.set(0)
        parent_chain('neck', 'chest', 'spine2', 'spine1', 'root', jnt_grp, Spine.spine_system)

    @staticmethod
    def create_cv():
        cv_grp = pm.group(empty=True, n=Spine.cvgrp)
        cv = pm.curve(d=3, p=[(0, 85, 0), (0, 95, 0), (0, 105, 0), (0, 115, 0), (0, 135, 0)], k=[0, 0, 0, 1, 2, 2, 2],
                      n='spineCv')
        cv_shape = pm.listRelatives(cv, s=True)[0]
        parent_chain(cv, cv_grp, Spine.curve_system, Spine.motion_system)
        # ctrl
        n = 0
        u_value = 0
        for v in Spine.dict_jnts.values():
            # ctrl locator
            ctrl_locator = pm.spaceLocator(n=v + '_cvCtrl')
            ctrl_locator.visibility.set(0)
            align(ctrl_locator, v)
            pm.listRelatives(ctrl_locator)[0].worldPosition >> cv_shape.controlPoints[n]
            n = n + 1
            # path locator
            point_info = pm.createNode('pointOnCurveInfo', n=v + '_mp')
            path_locator = pm.spaceLocator(n=v + '_path')
            pm.addAttr(path_locator, ln='u', at='double', min=0, max=2, dv=u_value, k=True)
            u_value += 0.5
            path_locator.u >> point_info.parameter
            cv_shape.worldSpace[0] >> point_info.inputCurve
            point_info.result.position >> path_locator.translate
            pm.parent(path_locator, cv_grp)

    @staticmethod
    def create_ctrl():
        root_ctrl = Cv.spine(name='Root_ctrl')
        pelvis_ctrl = Cv.root(name='Pelvis_ctrl')
        spine1_ctrl = Cv.spine1(name='Spine1_ctrl')
        spine2_ctrl = Cv.spine2(name='Spine2_ctrl')
        chest_ctrl = Cv.chest(name='Chest_ctrl')
        neck_ctrl = Cv.neck(name='Neck_ctrl')
        head_ctrl = Cv.head(name='Head_ctrl')
        root_ctrl_offset = grp_offset(n='Root_ctrlOffset', target='spine1', child=root_ctrl)
        pelvis_ctrl_offset = grp_offset(n='Pelvis_ctrlOffset', target='spine1', child=pelvis_ctrl)
        spine1_ctrl_offset = grp_offset(n='Spine1_ctrlOffset', target='spine1', child=spine1_ctrl)
        spine2_ctrl_offset = grp_offset(n='Spine2_ctrlOffset', target='spine2', child=spine2_ctrl)
        chest_ctrl_offset = grp_offset(n='Chest_ctrlOffset', target='chest', child=chest_ctrl)
        neck_ctrl_offset = grp_offset(n='Neck_ctrlOffset', target='neck', child=neck_ctrl)
        head_ctrl_offset = grp_offset(n='Head_ctrlOffset', target='Head_M', child=head_ctrl)
        #  ctrl chain
        pm.parent(pelvis_ctrl_offset, spine1_ctrl_offset, root_ctrl)
        pm.parent(spine2_ctrl_offset, spine1_ctrl)
        pm.parent(chest_ctrl_offset, spine2_ctrl)
        pm.parent(neck_ctrl_offset, chest_ctrl)
        pm.parent(head_ctrl_offset, neck_ctrl)
        pm.parent('chest_cvCtrl', 'neck_cvCtrl', chest_ctrl)
        pm.parent('root_cvCtrl', 'spine1_cvCtrl', pelvis_ctrl)
        pm.parent('spine2_cvCtrl', spine2_ctrl)
        parent_chain(root_ctrl_offset, Spine.spine_system, Spine.motion_system)
        # head global
        head_global = pm.group(empty=True, name='head_global')
        align(head_global, 'Head_M')
        pm.parent(head_global, 'Root_ctrl')
        pm.orientConstraint(head_global, head_ctrl_offset)
        # chest twist
        chest_twist = pm.group(empty=True, n='chest_twist')
        chest_twist_offset = grp_offset(n='chest_twistOffset', target='chest', child=chest_twist)
        pm.parent(chest_twist_offset, chest_ctrl)
        # root twist
        root_twist = pm.group(empty=True, n='root_twist')
        root_twist_offset = grp_offset(n='root_twistOffset', target='root', child=root_twist)
        pm.parent(root_twist_offset, pelvis_ctrl)
        # spine1 spine2 twist
        spine1_twist = pm.group(empty=True, n='spine1_twist')
        spine1_twist_offset = grp_offset(n='spine1_twistOffset', target='spine1', child=spine1_twist)
        spine2_twist = pm.group(empty=True, n='spine2_twist')
        spine2_twist_offset = grp_offset(n='spine2_twistOffset', target='spine2', child=spine2_twist)
        pm.parent(spine1_twist_offset, spine2_twist_offset, root_ctrl)
        # constraint twist
        con_down = pm.orientConstraint(chest_twist, root_twist, spine1_twist)
        con_up = pm.orientConstraint(chest_twist, root_twist, spine2_twist)
        con_down.chest_twistW0.set(0.5)
        con_up.root_twistW1.set(0.5)
        # Scapula
        scapula_r_ctrl = Cv.scapula('Scapula_R_ctrl')
        scapula_r_ctrl_offset = grp_offset(n='Scapula_R_ctrlOffset', target='Scapula_R', child=scapula_r_ctrl)
        scapula_l_ctrl = Cv.scapula('Scapula_L_ctrl')
        scapula_l_ctrl_offset = grp_offset(n='Scapula_L_ctrlOffset', target='Scapula_L', child=scapula_l_ctrl)
        pm.parent(scapula_r_ctrl_offset, scapula_l_ctrl_offset, chest_ctrl)
        # setting
        for i in [head_ctrl, neck_ctrl[0], spine2_ctrl[0], spine1_ctrl[0], scapula_r_ctrl, scapula_l_ctrl]:
            i.translate.set(lock=True)

    @staticmethod
    def stretch():
        stretch_jnt('neck', 'chest', 'Chest_M')
        stretch_jnt('chest', 'spine2', 'Spine2_M')
        stretch_jnt('spine2', 'spine1', 'Spine1_M')
        stretch_jnt('spine1', 'root', 'Root_M')

    @staticmethod
    def create():
        Spine.create_jnt()
        Spine.create_cv()
        Spine.create_ctrl()
        Spine.stretch()

    @staticmethod
    def constraint():
        # constraint ik joint
        pm.pointConstraint('root_path', 'root', mo=True)
        pm.pointConstraint('spine1_path', 'spine1', mo=True)
        pm.pointConstraint('spine2_path', 'spine2', mo=True)
        pm.pointConstraint('chest_path', 'chest', mo=True)
        pm.pointConstraint('neck_path', 'neck', mo=True)
        pm.aimConstraint('spine1_path', 'root', mo=True, worldUpType='objectrotation', worldUpObject='root_twist')
        pm.aimConstraint('spine2_path', 'spine1', mo=True, worldUpType='objectrotation', worldUpObject='spine1_twist')
        pm.aimConstraint('chest_path', 'spine2', mo=True, worldUpType='objectrotation', worldUpObject='spine2_twist')
        pm.aimConstraint('neck_path', 'chest', mo=True, worldUpType='objectrotation', worldUpObject='chest_twist')
        pm.orientConstraint('Neck_ctrl', 'neck')
        # constraint deformation
        con = {'Root_M': 'root', 'Spine1_M': 'spine1', 'Spine2_M': 'spine2', 'Chest_M': 'chest', 'Neck_M': 'neck',
               'Head_M': 'Head_ctrl', 'Scapula_R': 'Scapula_R_ctrl', 'Scapula_L': 'Scapula_L_ctrl'}
        for k, v in con.items():
            matrix_constraint(v, k)
        # set visibility
        pm.PyNode(Spine.cvgrp).visibility.set(0)


class Limb:
    motion_system = 'MotionSystem'
    ik_system = 'IKsystem'
    curve_system = 'CurveSystem'

    def __init__(self, *joints):
        self.jnts = joints
        if joints[0] == 'Shoulder_L':
            self.name = 'IKArm_L'
            self.jntParent = 'Scapula_L_ctrl'
        if joints[0] == 'Shoulder_R':
            self.name = 'IKArm_R'
            self.jntParent = 'Scapula_R_ctrl'
        if joints[0] == 'Hip_L':
            self.name = 'IKLeg_L'
            self.jntParent = 'root'
        if joints[0] == 'Hip_R':
            self.name = 'IKLeg_R'
            self.jntParent = 'root'
        self.grp = pm.group(empty=True, n=self.name + '_grp')
        parent_chain(self.grp, Limb.ik_system, Limb.motion_system)
        # IKjnt
        self.IKjntOffset = pm.group(empty=True, n=self.name + '_jntOffset')
        align(self.IKjntOffset, self.jntParent)
        self.IKjntGrp = pm.group(empty=True, n=self.name + '_jntGrp')
        align(self.IKjntGrp, self.jnts[0])
        pm.pointConstraint(self.jntParent, self.IKjntOffset)
        pm.orientConstraint(self.jntParent, self.IKjntOffset)
        self.IKjnt0 = new_jnt(self.jnts[0], n='IK_' + self.jnts[0])
        self.IKjnt1 = new_jnt(self.jnts[1], n='IK_' + self.jnts[1])
        self.IKjnt2 = new_jnt(self.jnts[2], n='IK_' + self.jnts[2])
        parent_chain(self.IKjnt2, self.IKjnt1, self.IKjnt0, self.IKjntGrp, self.IKjntOffset)
        # handle
        self.handleOffset = pm.group(empty=True, n=self.name + '_handleOffset')
        align(self.handleOffset, self.jnts[2])
        self.poleOffset = self.name + '_poleOffset'
        # midGrp     
        self.midCtrl = pm.curve(n=self.name + '_midCtrl', d=1,
                                p=[(0, 6, 6), (0, -6, 6), (0, -6, -6), (0, 6, -6), (0, 6, 6)], k=range(5))
        self.midOffset = grp_offset(n=self.name + '_midOffset', target=self.jnts[1], child=self.midCtrl)
        # grp
        pm.parent(self.IKjntOffset, self.handleOffset, self.midOffset, self.grp)
        for i in [self.IKjntOffset, self.handleOffset]:
            i.visibility.set(0)
        # slide
        self.slide50 = self.jnts[1] + '_slide50'
        self.slide1 = self.jnts[1] + '_slide1'
        self.slide2 = self.jnts[1] + '_slide2'

    def creat_ik(self):
        distance = -35 if self.jnts[0] == 'Shoulder_R' or self.jnts[0] == 'Hip_L' else 35
        pole_ctrl = Cv.pole(self.name + '_poleCtrl')
        pole_offset = grp_offset(self.poleOffset, target=self.jnts[1], child=pole_ctrl)
        pm.select(pole_offset)
        pm.move(distance, relative=True, objectSpace=True, y=True)
        handle = pm.ikHandle(n=self.name + '_handle', sj=self.IKjnt0, ee=self.IKjnt2)[0]
        pm.poleVectorConstraint(pole_ctrl, handle)
        pm.parent(handle, self.handleOffset)
        # pole line
        if not pm.objExists('PoleCv_grp'):
            pm.group(empty=True, n='PoleCv_grp')
        line = pm.curve(d=1, p=[(0, 0, 0), (1, 0, 0)], k=[0, 1], n=pole_ctrl + '_line')
        parent_chain(line, 'PoleCv_grp', Spine.curve_system)
        line_shape = pm.listRelatives(line)[0]
        line_shape.overrideEnabled.set(1)
        line_shape.overrideDisplayType.set(1)
        point1 = pm.spaceLocator(n=pole_ctrl + '_point1')
        point1.visibility.set(0)
        point2 = pm.spaceLocator(n=pole_ctrl + '_point2')
        point2.visibility.set(0)
        align(point1, self.IKjnt1)
        align(point2, pole_ctrl)
        pm.parent(point1, self.IKjnt1)
        pm.parent(point2, pole_ctrl)
        point1_shape = pm.listRelatives(point1)[0]
        point2_shape = pm.listRelatives(point2)[0]
        point1_shape.worldPosition[0] >> line_shape.controlPoints[0]
        point2_shape.worldPosition[0] >> line_shape.controlPoints[1]

    def mid(self):
        pm.orientConstraint(self.IKjnt0, self.IKjnt1, self.midOffset)
        pm.pointConstraint(self.IKjnt1, self.midOffset)

    def up_twist(self):
        jnt_t01 = new_jnt(self.jnts[0], n=self.IKjnt0 + '_t01')
        jnt_t02 = new_jnt(self.jnts[0], n=self.IKjnt0 + '_t02')
        pm.parent(jnt_t02, jnt_t01)
        pm.parent(jnt_t01, self.IKjntGrp)
        distance = 12 if '_R' in self.name else -12
        jnt_t02.translateX.set(distance)
        handle_t = pm.ikHandle(n=self.IKjnt0 + '_tHandle', sj=jnt_t01, ee=jnt_t02)
        pm.poleVectorConstraint(jnt_t01, handle_t[0])
        pm.parent(handle_t[0], self.IKjnt0)
        part_jnts = insert_jnts(self.jnts[0], self.jnts[1])
        twist_drive(self.IKjnt0, jnt_t01, part_jnts)

    def down_twist(self):
        part_jnts = insert_jnts(self.jnts[1], self.jnts[2])
        twist_drive(self.IKjnt2, self.IKjnt1, part_jnts)

    def stretch(self):
        stretch_ikjnt(self.IKjntGrp, self.handleOffset, self.IKjnt0, self.IKjnt1, self.IKjnt2)
        stretch_jnt(self.IKjntGrp, self.midCtrl, self.jnts[0], self.jnts[0] + '_part1', self.jnts[0] + '_part2')
        stretch_jnt(self.midCtrl, self.handleOffset, self.jnts[1], self.jnts[1] + '_part1',
                    self.jnts[1] + '_part2')

    def constraint(self):
        jnt_t01 = self.IKjnt0 + '_t01'
        con_jnt = jnt_t01 if pm.objExists(jnt_t01) else self.IKjnt0
        aim_vector = (1, 0, 0) if '_R' in self.jnts[0] else (-1, 0, 0)
        pm.pointConstraint(con_jnt, self.jnts[0])
        pm.aimConstraint(self.midCtrl, self.jnts[0], aimVector=aim_vector, worldUpType='objectrotation',
                         worldUpObject=con_jnt)
        pm.pointConstraint(self.midCtrl, self.jnts[1])
        pm.aimConstraint(self.IKjnt2, self.jnts[1], aimVector=aim_vector, worldUpType='objectrotation',
                         worldUpObject=self.IKjnt1)
        pm.orientConstraint(self.IKjnt2, self.jnts[2])
        pm.pointConstraint(self.IKjnt2, self.jnts[2])
        pm.orientConstraint(self.handleOffset, self.IKjnt2)

    @staticmethod
    def slide_motion(end, jnt):
        dis_node = pm.createNode('distanceBetween', name=jnt + '_dis')
        end.translate >> dis_node.point2
        md_node1 = pm.createNode('multiplyDivide', name=jnt + '_md1')
        md_node1.operation.set(2)
        md_node1.input2X.set(dis_node.distance.get())
        dis_node.distance >> md_node1.input1X
        rev_node = pm.createNode('reverse', name=jnt + 'rev')
        md_node1.outputX >> rev_node.inputX
        md_node2 = pm.createNode('multiplyDivide', name=jnt + '_md2')
        md_node2.operation.set(1)
        md_node2.input2X.set(-1)
        condition_node = pm.createNode('condition', name=jnt + '_cd')
        condition_node.operation.set(4)
        condition_node.secondTerm.set(0)
        rev_node.outputX >> md_node2.input1X
        md_node2.outputX >> condition_node.colorIfTrueR
        rev_node.outputX >> condition_node.colorIfFalseR
        rev_node.outputX >> condition_node.firstTerm
        md_node3 = pm.createNode('multiplyDivide', name=jnt + '_md3')
        md_node3.operation.set(1)
        md_node3.input2X.set(jnt.translateY.get())
        condition_node.outColorR >> md_node3.input1X
        md_node4 = pm.createNode('multiplyDivide', name=jnt + '_md4')
        md_node4.operation.set(1)
        pm.addAttr(jnt, ln='slide', at='double', dv=2, k=True)
        jnt.slide >> md_node4.input2X
        md_node3.outputX >> md_node4.input1X
        plus_node = pm.createNode('plusMinusAverage', name=jnt + '_plus')
        plus_node.operation.set(1)
        md_node4.outputX >> plus_node.input1D[0]
        plus_node.input1D[1].set(jnt.translateY.get())
        plus_node.output1D >> jnt.translateY

    def create_slide(self, slide=False):
        grp = self.name + '_slideGrp'
        if slide:
            grp = pm.group(empty=True, n=grp)
            pm.parent(grp, self.grp)
            slide50 = new_jnt(self.jnts[1], n=self.slide50)
            slide1 = new_jnt(slide50, n=self.slide1)
            slide1.translateY.set(6)
            slide2 = new_jnt(slide50, n=self.slide2)
            slide2.translateY.set(-6)
            temp_con = pm.orientConstraint(self.IKjnt0, self.IKjnt1, slide50)
            pm.delete(temp_con)
        yield
        # slide00 reference constraint slide50
        if slide:
            slide00 = pm.group(empty=True, n=self.jnts[1] + '_slide00')
            slide00_offset = grp_offset(n=self.jnts[1] + '_slide00Offset', target=self.slide50, child=slide00)
            pm.parentConstraint(self.jnts[0], slide00_offset, mo=True)
            pm.parent(slide00_offset, grp)
            pm.orientConstraint(slide00, self.jnts[1], self.slide50, mo=True)
            # motion
            for i in [self.slide1, self.slide2]:
                jnt_slide = pm.PyNode(i)
                start = pm.group(empty=True, n=jnt_slide + '_start')
                pm.parent(start, self.IKjnt0)
                pm.xform(start, t=(pm.PyNode(self.IKjnt1).translateX.get() - jnt_slide.translateY.get(), 0, 0))
                pm.parent(start, grp)
                pm.parentConstraint(self.jnts[0], start, mo=True)
                end = pm.group(empty=True, n=jnt_slide + '_end')
                align(end, jnt_slide)
                pm.parent(end, start)
                pm.parentConstraint(self.slide50, end, mo=True)
                Limb.slide_motion(end, jnt_slide)
        yield

    def create(self, ut=False, dt=False, slide=False):
        self.creat_ik()
        self.mid()
        if ut:
            self.up_twist()
        if dt:
            self.down_twist()
        self.stretch()
        self.constraint()


class Hand:
    fk_system = 'FKsystem'
    motion_system = 'MotionSystem'

    def __init__(self, jnt2, handle_offset):
        self.ctrl = Cv.hand(jnt2 + '_ctrl')
        align(self.ctrl, jnt2)
        self.jnt = jnt2
        self.grp = pm.group(empty=True, n='Hand_R_grp' if self.jnt == 'Wrist_R' else 'Hand_L_grp')
        self.list_finger1 = pm.listRelatives(self.jnt, children=True, type='joint')
        align(self.grp, self.ctrl)
        parent_chain(handle_offset, self.ctrl, self.grp, Hand.fk_system, Hand.motion_system)

    def create(self):
        for j in self.list_finger1:
            finger_grp = create_fk(j)
            pm.parent(finger_grp, self.ctrl)


class Foot:
    fk_system = 'FKsystem'
    motion_system = 'MotionSystem'

    def __init__(self, handle_offset, ankle, toes, ankle_end, toes_end):
        self.name = 'Foot_R' if '_R' in toes else 'Foot_L'
        self.handle = handle_offset
        self.ankle = ankle
        self.ankle_ctrl = self.name + '_ankleCtrl'
        self.toes = toes
        self.ankleEnd = ankle_end
        self.toesEnd = toes_end
        self.grp = pm.group(empty=True, n=self.name + '_grp')

    def create(self):
        # back
        back_ctrl = Cv.heel(self.name + '_backCtrl')
        back_offset = grp_offset(n=self.name + '_backOffset', target=self.ankleEnd, child=back_ctrl)
        # mid
        mid_ctrl = Cv.sole(self.name + '_midCtrl')
        mid_offset = grp_offset(n=self.name + '_midOffset', target=self.toes, child=mid_ctrl)
        align(mid_offset, self.ankleEnd, t=False, ro=True)
        # front
        front_ctrl = Cv.tip(self.name + '_frontCtrl')
        front_offset = grp_offset(n=self.name + '_frontOffset', target=self.toesEnd, child=front_ctrl)
        align(front_offset, self.ankleEnd, t=False, ro=True)
        # ankle
        ankle_ctrl = Cv.ankle(self.ankle_ctrl)
        ankle_offset = grp_offset(n=self.name + '_ankleOffset', target=self.toes, child=ankle_ctrl)
        align(ankle_offset, self.ankleEnd, t=False, ro=True)
        # toes
        toes_ctrl = Cv.toes(self.name + '_toesCtrl')
        toes_offset = grp_offset(n=self.name + '_toesOffset', target=self.toes, child=toes_ctrl)
        align(toes_offset, self.ankleEnd, t=False, ro=True)
        # parent
        pm.parent(ankle_offset, toes_offset, front_ctrl)
        pm.parent(front_offset, mid_ctrl)
        pm.parent(mid_offset, back_ctrl)
        pm.parent(back_offset, self.grp)
        # constraint deform
        pm.pointConstraint(toes_ctrl, self.toes)
        pm.orientConstraint(toes_ctrl, self.toes, mo=True)
        pm.parent(self.handle, ankle_ctrl)
        for i in [mid_ctrl, front_ctrl, ankle_ctrl, toes_ctrl]:
            i.translate.set(lock=True)
        parent_chain(self.grp, Hand.fk_system, Hand.motion_system)


def check_jnt():
    for i in ['Root_M', 'Spine1_M', 'Spine2_M', 'Chest_M', 'Neck_M', 'Head_M', 'Scapula_R', 'Shoulder_R', 'Elbow_R',
              'Wrist_R', 'Scapula_L', 'Shoulder_L', 'Elbow_L', 'Wrist_L', 'Hip_R', 'Knee_R', 'Ankle_R', 'Toes_R',
              'ToesEnd_R', 'AnkleEnd_R', 'Hip_L', 'Knee_L', 'Ankle_L', 'Toes_L', 'ToesEnd_L', 'AnkleEnd_L']:
        try:
            pm.PyNode(i)
        except pm.MayaObjectError:
            print("The Joint Doesn't Exist:", i)


def set_jnt_roo():
    zxy_grp = ['Scapula_R', 'Scapula_L', 'Hip_R', 'Hip_L', 'Knee_R', 'Knee_L']
    zyx_grp = ['Shoulder_R', 'Shoulder_L', 'Elbow_R', 'Elbow_L', 'Wrist_R', 'Wrist_L', 'Toes_R', 'Toes_L', 'Neck_M',
               'Head_M']
    xzy_grp = ['Ankle_R', 'Ankle_L']
    pm.xform(zxy_grp, roo='zxy')
    pm.xform(zyx_grp, roo='zyx')
    pm.xform(xzy_grp, roo='xzy')


def create_grp():
    if not pm.objExists('MotionSystem'):
        pm.group(empty=True, name='MotionSystem')
        pm.parent('MotionSystem', 'Main')
    curve_system = pm.group(empty=True, n='CurveSystem')
    curve_system.inheritsTransform.set(0)
    ik_system = pm.group(empty=True, n='IKsystem')
    fk_system = pm.group(empty=True, n='FKsystem')
    con_system = pm.group(empty=True, n='ConstraintSystem')
    pm.parent(curve_system, ik_system, fk_system, con_system, 'MotionSystem')


global arm_R
global arm_L
global leg_R
global leg_L
global arm_R_slide
global arm_L_slide
global leg_R_slide
global leg_L_slide


def click1(*args):
    pm.select('DeformationSystem', hierarchy=True)
    pm.mel.eval("FreezeTransformations();")
    check_jnt()
    set_jnt_roo()
    create_grp()
    Spine.create()

    global arm_R
    global arm_L
    global leg_R
    global leg_L
    arm_R = Limb('Shoulder_R', 'Elbow_R', 'Wrist_R')
    arm_L = Limb('Shoulder_L', 'Elbow_L', 'Wrist_L')
    leg_R = Limb('Hip_R', 'Knee_R', 'Ankle_R')
    leg_L = Limb('Hip_L', 'Knee_L', 'Ankle_L')

    global arm_R_slide
    global arm_L_slide
    global leg_R_slide
    global leg_L_slide
    slide_check = pm.checkBox('slide_check', q=True, value=True)
    arm_R_slide = arm_R.create_slide(slide=slide_check)
    arm_L_slide = arm_L.create_slide(slide=slide_check)
    leg_R_slide = leg_R.create_slide(slide=slide_check)
    leg_L_slide = leg_L.create_slide(slide=slide_check)
    next(arm_R_slide)
    next(arm_L_slide)
    next(leg_R_slide)
    next(leg_L_slide)


def click2(*args):
    Spine.constraint()
    next(arm_R_slide)
    next(arm_L_slide)
    next(leg_R_slide)
    next(leg_L_slide)

    shoulder_check = pm.checkBox('shoulder_check', q=True, value=True)
    elbow_check = pm.checkBox('elbow_check', q=True, value=True)
    hip_check = pm.checkBox('hip_check', q=True, value=True)
    knee_check = pm.checkBox('knee_check', q=True, value=True)

    arm_R.create(ut=shoulder_check, dt=elbow_check)
    arm_L.create(ut=shoulder_check, dt=elbow_check)
    leg_R.create(ut=hip_check, dt=knee_check)
    leg_L.create(ut=hip_check, dt=knee_check)

    hand_r = Hand('Wrist_R', arm_R.handleOffset)
    hand_r.create()
    hand_l = Hand('Wrist_L', arm_L.handleOffset)
    hand_l.create()

    foot_r = Foot(leg_R.handleOffset, 'Ankle_R', 'Toes_R', 'AnkleEnd_R', 'ToesEnd_R')
    foot_r.create()
    foot_l = Foot(leg_L.handleOffset, 'Ankle_L', 'Toes_L', 'AnkleEnd_L', 'ToesEnd_L')
    foot_l.create()

    pm.select('DeformationSystem', hierarchy=True)
    cons = pm.ls(sl=True, type=['pointConstraint', 'orientConstraint', 'aimConstraint'])
    pm.parent(*cons, 'ConstraintSystem')


def click3(*args):
    sl = pm.selected()
    for i in sl:
        mirror_ctrl_curve(i)


def del_ctrl(*args):
    pm.select('DeformationSystem', hierarchy=True)
    pm.delete(pm.ls(sl=True, type=['pointConstraint', 'orientConstraint', 'aimConstraint']))

    def disconnect(*attr):
        for j in attr:
            if pm.connectionInfo(j, id=True):
                sattr = pm.connectionInfo(j, sfd=True)
                pm.disconnectAttr(sattr, j)

    for i in ['Root_M', 'Spine1_M', 'Spine2_M', 'Chest_M', 'Shoulder_R', 'Shoulder_R_part1', 'Shoulder_R_part2',
              'Elbow_R', 'Elbow_R_part1', 'Elbow_R_part2', 'Shoulder_L', 'Shoulder_L_part1', 'Shoulder_L_part2',
              'Elbow_L', 'Elbow_L_part1', 'Elbow_L_part2', 'Hip_R', 'Hip_R_part1', 'Hip_R_part2', 'Knee_R',
              'Knee_R_part1', 'Knee_R_part2', 'Hip_L', 'Hip_L_part1', 'Hip_L_part2', 'Knee_L', 'Knee_L_part1',
              'Knee_L_part2', 'Elbow_R_slide50', 'Elbow_R_slide1', 'Elbow_R_slide2', 'Elbow_L_slide50',
              'Elbow_L_slide1', 'Elbow_L_slide2', 'Knee_R_slide50', 'Knee_R_slide1', 'Knee_R_slide2', 'Knee_L_slide50',
              'Knee_L_slide1', 'Knee_L_slide2']:
        try:
            jnt = pm.PyNode(i)
            disconnect(jnt.scaleX, jnt.scaleY, jnt.scaleZ, jnt.rotateX)
        except pm.MayaNodeError:
            pass
        if '_part' in i or '_slide' in i:
            try:
                part_jnt = pm.PyNode(i)
                pm.removeJoint(part_jnt)
            except pm.MayaObjectError:
                pass

    pm.mel.eval("MLdeleteUnused();")
    pm.delete('MotionSystem')


def main():
    if pm.window('Rig', ex=True):
        pm.deleteUI('Rig')
    with pm.window('Rig'):
        with pm.columnLayout(rowSpacing=5, adj=True):
            with pm.frameLayout('Twist setting'):
                with pm.gridLayout(numberOfColumns=2, cellWidth=100):
                    pm.checkBox('shoulder_check', label='Shoulder', v=True)
                    pm.checkBox('elbow_check', label='Elbow', v=True)
                    pm.checkBox('hip_check', label='Hip', v=True)
                    pm.checkBox('knee_check', label='Knee')
            with pm.frameLayout('Slide setting'):
                pm.checkBox('slide_check', label='Slide')
            with pm.frameLayout('Create spine and then create others'):
                with pm.columnLayout():
                    pm.button(label='Create Spine', c=click1)
                    pm.button(label='Create Others', c=click2)
                    pm.button(label='del ctrls', c=del_ctrl)
                    pm.button(label='Mirror ctrl shape', c=click3)
        pm.window('Rig', e=True, title='Rig 2.1', wh=(240, 360))
        pm.showWindow('Rig')
        print('fff')


if __name__ == '__main__':
    main()
