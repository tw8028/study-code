import pymel.core as pm
import mytools


class Master:
    master = 'master'
    geo = 'geometry'
    control = 'control'
    joint = 'joint'
    ctrl_world = 'ctrl__c__world__001'
    zero_world = 'zero__c__world__001'
    constraint = 'constraint'
    jnt_root = 'root'
    ctrl_root = 'ctrl__c__root__001'
    zero_root = 'zero__c__root__001'

    @classmethod
    def create(cls):
        for name in [cls.master, cls.geo, cls.control, cls.joint, cls.zero_world]:
            pm.group(name=name, empty=True)
            mytools.lock_hide_transform(name)
        pm.parent(cls.geo, cls.control, cls.joint, cls.zero_world, cls.master)

        pm.circle(nr=(0, 1, 0), r=30, name=cls.ctrl_world, ch=False)
        pm.parent(cls.ctrl_world, cls.zero_world)
        pm.parent(cls.zero_world, cls.control)

        mytools.grp_sub(name=cls.constraint, target=cls.control)

        pm.addAttr(cls.master, ln='geometryVis', at='bool', dv=1)
        pm.addAttr(cls.master, ln='geoDisplayType', at='enum', enumName='Normal:Template:Reference')
        pm.addAttr(cls.master, ln='controlVis', at='bool', dv=1)
        pm.addAttr(cls.master, ln='jointVis', at='bool', dv=1)
        master_grp = pm.PyNode(cls.master)
        pm.setAttr(master_grp.geometryVis, channelBox=1)  # type:ignore
        pm.setAttr(master_grp.geoDisplayType, channelBox=1)  # type:ignore
        pm.setAttr(master_grp.controlVis, channelBox=1)  # type:ignore
        pm.setAttr(master_grp.jointVis, channelBox=1)  # type:ignore
        var = master_grp.geometryVis >> pm.PyNode(cls.geo).visibility  # type:ignore
        var = master_grp.geoDisplayType >> pm.PyNode(cls.geo).overrideDisplayType  # type:ignore
        var = master_grp.controlVis >> pm.PyNode(cls.control).visibility  # type:ignore
        var = master_grp.jointVis >> pm.PyNode(cls.joint).visibility  # type:ignore

        if pm.objExists(cls.jnt_root):
            mytools.cv_and_zero(name=cls.ctrl_root, target=cls.jnt_root, shape='cube', radius=2)
            pm.parent(cls.zero_root, cls.ctrl_world)
            orient_cons = pm.orientConstraint(cls.ctrl_root, cls.jnt_root)
            point_cons = pm.pointConstraint(cls.ctrl_root, cls.jnt_root)
            pm.parent(orient_cons, point_cons, cls.constraint)


if __name__ == '__main__':
    Master.create()
