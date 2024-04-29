#!/usr/bin/python
# -*- coding:utf-8 -*-
import pymel.core as pm
import package_tools.cv as cv
import package_tools.grp as grp
import package_tools.jnt as jnt
import package_tools.rig as rig


class Spine:
    #  spine_05(end) >> spine_04(chest) >> spine_03 >> spine_02 >> spine_01(IKjnt_start) >> pelvis
    def __init__(self, *joints):
        self.jnts = joints
        self.grp_system = pm.group(empty=True, name="spine_system")
        self.grp_cv = pm.group(empty=True, name="spine_cv_grp")

        self.grp_IKjnt = None
        self.IKjnts = None

        # controllers connect with neck, clavicles and legs
        self.end_ctrl = None
        self.pelvis_ctrl = None

    def create_ikjnts(self):
        # create IK-joints
        self.grp_IKjnt = pm.group(empty=True, name="spine_IKjnt_grp")
        self.IKjnts = [jnt.new(x, name="IK_" + x) for x in self.jnts]
        rig.parent_chain(*self.IKjnts)
        # grp_IKjnt align to pelvis
        rig.align(self.grp_IKjnt, self.IKjnts[-1])
        # IK_pelvis parent to grp_IKjnt
        pm.parent(self.IKjnts[-1], self.grp_IKjnt)
        # constraint joints to IK-joints
        list(map(lambda x, y: pm.parentConstraint(x, y), self.IKjnts, self.jnts))

    def create_cv(self):
        # create spineIK on cv_point(spine_05 to spine_01)
        cv_point = self.IKjnts[0:5]
        curve = pm.curve(name="spine_curve", p=[(x * y for y in (0, 100, 0)) for x in range(5)])
        cv_shape = pm.listRelatives(curve, s=True)[0]
        n = 0
        u_value = 0
        for i in cv_point:
            # ctrl locator
            ctrl_locator = pm.spaceLocator(n=i + '_cvCtrl')
            ctrl_locator.visibility.set(0)
            rig.align(ctrl_locator, i)
            pm.listRelatives(ctrl_locator)[0].worldPosition >> cv_shape.controlPoints[n]
            n = n + 1
            # path locator
            point_info = pm.createNode('pointOnCurveInfo', n=i + '_mp')
            path_locator = pm.spaceLocator(n=i + '_path')
            pm.addAttr(path_locator, ln='u', at='double', min=0, max=2, dv=u_value, k=True)
            u_value += 0.5
            path_locator.u >> point_info.parameter
            cv_shape.worldSpace[0] >> point_info.inputCurve
            point_info.result.position >> path_locator.translate
            pm.parent(path_locator, self.grp_cv)
        pm.parent(curve, self.grp_cv)
        pm.parent(self.grp_cv, self.grp_system)

    def create_ctrl(self):
        root_ctrl = cv.root(name='Root_ctrl')
        pelvis_ctrl = cv.pelvis(name='Pelvis_ctrl')
        spine1_ctrl = cv.spine1(name='Spine1_ctrl')
        spine2_ctrl = cv.spine2(name='Spine2_ctrl')
        chest_ctrl = cv.chest(name='Chest_ctrl')
        end_ctrl = cv.cube(name='End_ctrl')
        self.pelvis_ctrl = pelvis_ctrl
        self.end_ctrl = end_ctrl

        root_offset = grp.offset(name='Root_ctrlOffset', pos=self.IKjnts[3], child=root_ctrl)
        pelvis_offset = grp.offset(name='Pelvis_ctrlOffset', pos=self.IKjnts[3], child=pelvis_ctrl)
        spine1_offset = grp.offset(name='Spine1_ctrlOffset', pos=self.IKjnts[3], child=spine1_ctrl)
        spine2_offset = grp.offset(name='Spine2_ctrlOffset', pos=self.IKjnts[2], child=spine2_ctrl)
        chest_offset = grp.offset(name='Chest_ctrlOffset', pos=self.IKjnts[1], child=chest_ctrl)
        end_offset = grp.offset(name='End_ctrlOffset', pos=self.IKjnts[0], child=end_ctrl)

        #  ctrl chain
        pm.parent(pelvis_offset, spine1_offset, root_ctrl)
        pm.parent(spine2_offset, spine1_ctrl)
        pm.parent(chest_offset, spine2_ctrl)
        pm.parent(end_offset, chest_ctrl)

        pm.parent(self.IKjnts[0] + "_cvCtrl", self.IKjnts[1] + "_cvCtrl", chest_ctrl)
        pm.parent(self.IKjnts[2] + "_cvCtrl", spine2_ctrl)
        pm.parent(self.IKjnts[3] + "_cvCtrl", self.IKjnts[4] + "_cvCtrl", self.grp_IKjnt, pelvis_ctrl)

        pm.parent(root_offset, self.grp_system)

        # chest twist
        chest_twist = pm.group(empty=True, n='chest_twist')
        chest_twist_offset = grp.offset(name='chest_twistOffset', pos=self.IKjnts[1], child=chest_twist)
        pm.parent(chest_twist_offset, chest_ctrl)
        # root twist
        root_twist = pm.group(empty=True, n='root_twist')
        root_twist_offset = grp.offset(name='root_twistOffset', pos=self.IKjnts[-1], child=root_twist)
        pm.parent(root_twist_offset, pelvis_ctrl)
        # spine1 spine2 twist
        spine1_twist = pm.group(empty=True, n='spine1_twist')
        spine1_twist_offset = grp.offset(name='spine1_twistOffset', pos=self.IKjnts[-3], child=spine1_twist)
        spine2_twist = pm.group(empty=True, n='spine2_twist')
        spine2_twist_offset = grp.offset(name='spine2_twistOffset', pos=self.IKjnts[-4], child=spine2_twist)
        pm.parent(spine1_twist_offset, spine2_twist_offset, root_ctrl)
        # constraint twist
        con_down = pm.orientConstraint(chest_twist, root_twist, spine1_twist)
        con_up = pm.orientConstraint(chest_twist, root_twist, spine2_twist)
        con_down.chest_twistW0.set(0.5)
        con_up.root_twistW1.set(0.5)

    def constraint_ikjnts(self):
        # constraint IK-joint to path locator
        for i in self.IKjnts[0:5]:
            pm.pointConstraint(i + '_path', i, mo=True)

        pm.orientConstraint(self.end_ctrl, self.IKjnts[0])
        pm.aimConstraint(self.IKjnts[0] + "_path", self.IKjnts[1], mo=True, worldUpType='objectrotation',
                         worldUpObject='chest_twist')
        pm.aimConstraint(self.IKjnts[1] + "_path", self.IKjnts[2], mo=True, worldUpType='objectrotation',
                         worldUpObject='spine2_twist')
        pm.aimConstraint(self.IKjnts[2] + "_path", self.IKjnts[3], mo=True, worldUpType='objectrotation',
                         worldUpObject='spine1_twist')
        pm.aimConstraint(self.IKjnts[3] + "_path", self.IKjnts[4], mo=True, worldUpType='objectrotation',
                         worldUpObject='root_twist')
