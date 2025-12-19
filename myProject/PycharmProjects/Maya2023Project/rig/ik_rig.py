import pymel.core as pm
import mytools


def no_flip_ik(joints_ik, ctrl_ikHandle: str, zero_pole: str):
    joint_thigh = joints_ik[0]
    joint_calf = joints_ik[1]
    zero_start = pm.PyNode(joints_ik[0]).getParent()  # type:ignore
    side = zero_start.split('__')[1]

    point_bottom = mytools.grp_sub(name=f'point__{side}__bottom__001', target=ctrl_ikHandle)
    pm.xform(point_bottom, ro=pm.xform(joint_calf, q=1, ro=1, ws=1), ws=True)
    point_top = mytools.grp_sub(name=f'point__{side}__top__001', target=zero_start)

    # on top
    top = mytools.jnt_target(name=f'jnt__{side}__top__001', target=point_top)
    top_end = mytools.jnt_target(name=f'jnt__{side}__top_end__001', target=point_bottom)
    pm.parent(top_end, top)
    pm.parent(top, point_top)
    top_handle = pm.ikHandle(name=f'jnt__{side}__top_handle__001', sj=top, ee=top_end)[0]
    pm.parent(top_handle, point_bottom)
    top_pv = pm.spaceLocator(name=f'jnt__{side}__top_pv__001')
    pm.parent(top_pv, point_top)
    pm.xform(top_pv, t=(0, 0, 6), ro=(0, 0, 0))
    pm.poleVectorConstraint(top_pv, top_handle)

    # on bottom
    bottom = mytools.jnt_target(name=f'jnt__{side}__bottom__001', target=point_bottom)
    bottom_end = mytools.jnt_target(name=f'jnt__{side}__top_end__001', target=point_top)
    pm.parent(bottom_end, bottom)
    pm.parent(bottom, point_bottom)
    bottom_handle = pm.ikHandle(n=f'jnt__{side}__bottom_handle__001', sj=bottom, ee=bottom_end)[0]
    pm.parent(bottom_handle, point_top)
    bottom_pv = pm.spaceLocator(n=f'jnt__{side}__bottom_pv__001')
    pm.parent(bottom_pv, point_bottom)
    pm.xform(bottom_pv, t=(0, 0, 6), ro=(0, 0, 0))
    pm.poleVectorConstraint(bottom_pv, bottom_handle)

    # # top locator and bot locator 分别被 top and end_ctrl 控制
    top_loc = pm.spaceLocator(n=f'loc__{side}__top__001')
    pm.delete(pm.parentConstraint(zero_pole, top_loc))
    pm.parent(top_loc, top)

    bottom_loc = pm.spaceLocator(n=f'loc__{side}__bottom__001')
    pm.delete(pm.parentConstraint(zero_pole, bottom_loc))
    pm.parent(bottom_loc, bottom)

    # pole_offset 同时被 top_lor and bot_loc 约束
    pm.parentConstraint(top_loc, bottom_loc, zero_pole)
