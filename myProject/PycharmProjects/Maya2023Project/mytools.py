# Auto-generated entry module

import parts.attr
import parts.cv
import parts.grp
import parts.jnt
import parts.utils
import rig.curve_rig
import rig.drive_rig
import rig.fk_rig
import rig.stretch_rig
import rig.twist_rig


def displayable(attr):
    return parts.attr.displayable(attr)


def lock_and_hide(attr):
    return parts.attr.lock_and_hide(attr)


def lock_hide_transform(obj):
    return parts.attr.lock_hide_transform(obj)


def set_color(obj, color):
    return parts.attr.set_color(obj, color)


def set_display_type(obj, display_type):
    return parts.attr.set_display_type(obj, display_type)


def set_orient(obj, aim_obj, up_obj):
    return parts.attr.set_orient(obj, aim_obj, up_obj)


def zero_orient(obj):
    return parts.attr.zero_orient(obj)


def zero_transform(obj):
    return parts.attr.zero_transform(obj)


def cv_create(name, shape, radius):
    return parts.cv.cv_create(name, shape, radius)


def cv_target(name, target, shape, radius):
    return parts.cv.cv_target(name, target, shape, radius)


def grp_master():
    return parts.grp.grp_master()


def grp_sub(name, target):
    return parts.grp.grp_sub(name, target)


def grp_target(name, target):
    return parts.grp.grp_target(name, target)


def grp_zero(name, target):
    return parts.grp.grp_zero(name, target)


def jnt_curve(curve, num):
    return parts.jnt.jnt_curve(curve, num)


def jnt_insert(start_jnt, num):
    return parts.jnt.jnt_insert(start_jnt, num)


def jnt_mirror(origin_jnt):
    return parts.jnt.jnt_mirror(origin_jnt)


def jnt_target(name, target):
    return parts.jnt.jnt_target(name, target)


def add_vector(vector_a, vector_b):
    return parts.utils.add_vector(vector_a, vector_b)


def direction_pole(point_a, point_b, point_c):
    return parts.utils.direction_pole(point_a, point_b, point_c)


def new_vector(point_a, point_b):
    return parts.utils.new_vector(point_a, point_b)


def normalize(vector):
    return parts.utils.normalize(vector)


def connect_line(obj_a, obj_b):
    return rig.curve_rig.connect_line(obj_a, obj_b)


def loc_ctrl_curve(curve):
    return rig.curve_rig.loc_ctrl_curve(curve)


def loc_on_curve(curve, num):
    return rig.curve_rig.loc_on_curve(curve, num)


def pole_ctrl(ik_joint1, ik_joint2, ik_joint3, ctrl_name, zero_name):
    return rig.curve_rig.pole_ctrl(ik_joint1, ik_joint2, ik_joint3, ctrl_name, zero_name)


def opm_constraint(driver, driven):
    return rig.drive_rig.opm_constraint(driver, driven)


def parent_chain(objs):
    return rig.drive_rig.parent_chain(objs)


def fk_chain(object_list):
    return rig.fk_rig.fk_chain(object_list)


def blend_attr(attr_ctrl, attr_a, attr_b, attr_blend):
    return rig.stretch_rig.blend_attr(attr_ctrl, attr_a, attr_b, attr_blend)


def blend_orient(attr_ctrl, reverse, ik_jnt, fk_jnt, blend_jnt):
    return rig.stretch_rig.blend_orient(attr_ctrl, reverse, ik_jnt, fk_jnt, blend_jnt)


def blend_scale_x(attr_ctrl, ik_jnt, fk_jnt, blend_jnt):
    return rig.stretch_rig.blend_scale_x(attr_ctrl, ik_jnt, fk_jnt, blend_jnt)


def blend_translate(attr_ctrl, reverse, ik_jnt, fk_jnt, blend_jnt):
    return rig.stretch_rig.blend_translate(attr_ctrl, reverse, ik_jnt, fk_jnt, blend_jnt)


def stretch_ik(attr_stretch, jnt1_offset, handle_ctrl, ik_jnt1, ik_jnt2, ik_jnt3):
    return rig.stretch_rig.stretch_ik(attr_stretch, jnt1_offset, handle_ctrl, ik_jnt1, ik_jnt2, ik_jnt3)


def stretch_jnt(start_point, end_point, joints):
    return rig.stretch_rig.stretch_jnt(start_point, end_point, joints)


def stretch_yz(joint):
    return rig.stretch_rig.stretch_yz(joint)


def twist_joint(driver, no_roll, driven_objs, ro_direction):
    return rig.twist_rig.twist_joint(driver, no_roll, driven_objs, ro_direction)
