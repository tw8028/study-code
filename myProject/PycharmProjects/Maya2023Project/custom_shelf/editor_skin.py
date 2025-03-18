import pymel.core as pm


def select_joints(*args):
    meshes = pm.selected()
    skin_joints = [pm.skinCluster(x, q=True, inf=True) for x in meshes]
    pm.select(skin_joints)


# 选择所有 mesh 将蒙皮 copy 给最后一个mesh
def copy_weights(*args):
    meshes = pm.selected()
    skin_joints = [pm.skinCluster(x, q=True, inf=True) for x in meshes[:-1]]
    # create skin cluster
    pm.select(skin_joints)
    pm.select(meshes[-1], add=True)
    pm.skinCluster(toSelectedBones=True)
    # copy weight
    pm.select(meshes)
    pm.copySkinWeights(noMirror=True, influenceAssociation='oneToOne', sa='closestPoint')


def show_window():
    name = 'my_skin_editor_win'
    if pm.window(name, ex=True):
        print(f'delete win: {name}')
        pm.deleteUI(name, window=True)
    with pm.window(name):
        with pm.columnLayout(adj=True):
            pm.button(label='select joints', c=select_joints)
            pm.button(label='copy weights', c=copy_weights)

        pm.window(name, e=True, title='skin_tools', wh=(240, 300))
        pm.showWindow(name)
