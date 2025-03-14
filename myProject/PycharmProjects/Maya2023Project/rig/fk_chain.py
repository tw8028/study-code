import pymel.core as pm
import tools.grp as grp
import tools.cv as cv
import tools.attr as attr


# object_list 必须符合命名规范如: jnt__l__finger__001
def create(object_list):
    def ctrl(target, name):
        return cv.ctrl(name=name, target=target, shape='circle', radius=6)

    node_list = [pm.PyNode(i) for i in object_list]
    zero_name_list = ['zero__' + n.name().split('__', 1)[1] for n in node_list]  # type:ignore
    ctrl_name_list = ['ctrl__' + n.name().split('__', 1)[1] for n in node_list]  # type:ignore
    ctrl_list = list(map(ctrl, node_list, ctrl_name_list))
    zero_list = list(map(grp.zero, zero_name_list, ctrl_list))
    fk_rig = []
    for a, b in zip(zero_list, ctrl_list):
        fk_rig.append(a)
        fk_rig.append(b)
    for i in range(len(fk_rig) - 1):
        pm.parent(fk_rig[i + 1], fk_rig[i])
    for ctrl, jnt in zip(ctrl_list, node_list):
        attr.opm_constraint(ctrl, jnt)
    return zero_list[0]


if __name__ == '__main__':
    sl = pm.selected()
    create(sl)
