import pymel.core as pm


def align(obj, target, *, t=True, ro=True):
    _roo = pm.xform(target, q=True, roo=True)
    pm.parent(obj, target)
    if t:
        pm.xform(obj, t=(0, 0, 0), roo=_roo)
    if ro:
        pm.xform(obj, ro=(0, 0, 0), roo=_roo)
    pm.parent(obj, w=True)


# a sort of twist
# attettion: neck_base have a zero transform
def create_neck_ctrl(neck_base, neck_ctrl, neck_joints):
    amount = 10 / len(neck_joints)
    inbetwent_parent = pm.group(n='Inbetwent_{0}'.format(neck_joints[0]), empty=True)
    align(inbetwent_parent, neck_joints[0])

    def con_inbetwent(_inbetwent, n_value):
        pm.select(neck_ctrl)
        pm.addAttr(ln='w{0}'.format(n_value), min=0, max=10, dv=amount * (n_value + 1), k=True)
        orcon = pm.orientConstraint(neck_ctrl, neck_base, _inbetwent)
        _inbetwent.rotate >> neck_joints[n_value].rotate

        re_node = pm.createNode('reverse', n=_inbetwent + '_re')
        unit_node = pm.createNode('unitConversion', n=_inbetwent + '_unit')
        unit_node.conversionFactor.set(0.1)
        pm.PyNode('{0}.w{1}'.format(neck_ctrl, n_value)) >> unit_node.input
        unit_node.output >> pm.PyNode('{0}.{1}W0'.format(orcon, neck_ctrl))
        unit_node.output >> re_node.inputX
        re_node.outputX >> pm.PyNode('{0}.{1}W1'.format(orcon, neck_base))

    n = 0
    for i in neck_joints:
        inbetwent = pm.group(n='inbetwent_{0}_part{1}'.format(neck_joints[0], n), empty=True)
        align(inbetwent, neck_joints[0])
        con_inbetwent(inbetwent, n)
        pm.parent(inbetwent, inbetwent_parent)
        inbetwent_parent = inbetwent
        n += 1


if __name__ == '__main__':
    base = 'joint1_offset'
    ctrl = 'joint1_ctrl'
    jnts = pm.selected()
    create_neck_ctrl(base, ctrl, jnts)
