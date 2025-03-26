import pymel.core as pm
import mytools


class Master:
    def __init__(self):
        self.master = 'master'
        self.geo = 'geometry'
        self.control = 'control'
        self.joint = 'joint'
        self.ctrl_world = 'ctrl__c__world__001'
        self.zero_world = 'zero__c__world__001'

    def create(self):
        for name in [self.master, self.geo, self.control, self.joint, self.zero_world]:
            pm.group(name=name, empty=True)
            mytools.lock_hide_transform(name)
        pm.parent(self.geo, self.control, self.joint, self.zero_world, self.master)
        pm.circle(nr=(0, 1, 0), r=30, name=self.ctrl_world, ch=False)
        pm.parent(self.ctrl_world, self.zero_world)
        pm.parent(self.zero_world, self.control)

        pm.addAttr(self.master, ln='geometryVis', at='bool', dv=1)
        pm.addAttr(self.master, ln='geoDisplayType', at='enum', enumName='Normal:Template:Reference')
        pm.addAttr(self.master, ln='controlVis', at='bool', dv=1)
        pm.addAttr(self.master, ln='jointVis', at='bool', dv=1)
        master_grp = pm.PyNode(self.master)
        print('e')
        pm.setAttr(master_grp.geometryVis, channelBox=1)
        pm.setAttr(master_grp.geoDisplayType, channelBox=1)
        pm.setAttr(master_grp.controlVis, channelBox=1)
        pm.setAttr(master_grp.jointVis, channelBox=1)
        print('a')
        var = master_grp.geometryVis >> pm.PyNode(self.geo).visibility
        print('b')
        var = master_grp.geoDisplayType >> pm.PyNode(self.geo).overrideDisplayType
        var = master_grp.controlVis >> pm.PyNode(self.control).visibility
        var = master_grp.jointVis >> pm.PyNode(self.joint).visibility
