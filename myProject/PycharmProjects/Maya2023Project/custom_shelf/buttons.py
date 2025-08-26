import pymel.core as pm
import mytools
import custom_shelf


def zero_transform():
    sl = pm.selected()
    for obj in sl:
        mytools.zero_transform(obj)


def zero_orient():
    sl = pm.selected()
    for obj in sl:
        mytools.zero_orient(obj)


def set_orient():
    sl = pm.selected()
    mytools.set_orient(sl[0], aim_obj=sl[1], up_obj=sl[2])


def name():
    sl = pm.selected()
    for obj in sl:
        field = obj.rsplit('_', 1)
        if len(field) < 2:
            pm.warning(f'命名不符合规范: 边_名字')
            return
        if obj.nodeType() == 'joint':
            pm.rename(obj, f'jnt__{field[0]}__{field[1]}__001')
        elif obj.nodeType() == 'transform':
            shape_type = obj.getShape().nodeType()
            if shape_type == 'mesh':
                pm.rename(obj, f'mesh__{field[0]}__{field[1]}__001')
            elif shape_type == 'nurbsCurve':
                pm.rename(obj, f'ctrl__{field[0]}__{field[1]}__001')
            elif shape_type == 'locator':
                pm.rename(obj, f'loc__{field[0]}__{field[1]}__001')
            else:
                pass
        else:
            pass


def grp_master():
    mytools.grp_master()


def grp_zero():
    target = pm.selected()[0]
    if '__' in target.name():
        grp_name = 'zero__' + target.split('__', 1)[1]
        return mytools.grp_zero(name=grp_name, target=target)
    else:
        pm.warning(f'{target} 命名不符合规范，无法创建 zero grp')


def grp_sub():
    target = pm.selected()[0]
    if '__' in target.name():
        grp_name = 'sub__' + target.split('__', 1)[1]
        return mytools.grp_sub(name=grp_name, target=target)
    else:
        pm.warning(f'{target} 命名不符合规范，无法创建 sub grp')


def show_cv_editor():
    custom_shelf.editor_cv.show_window()


def show_jnt_editor():
    custom_shelf.editor_jnt.show_window()


def show_skin_editor():
    custom_shelf.editor_skin.show_window()


def add_button(iol, label, func):
    # a shelf button must be parented to a shelf.
    command = 'import custom_shelf.buttons;custom_shelf.buttons.{0}()'.format(func)
    pm.shelfButton(image='pythonFamily.png', imageOverlayLabel=iol, label=label, command=command, olb=(0, 0, 0, 0),
                   olc=(0.9, 0.9, 0.9), parent='Custom')


def clear():
    if pm.shelfLayout('Custom', ex=True):
        shelf_buttons = pm.shelfLayout('Custom', q=True, childArray=True)
        if shelf_buttons:
            for each in shelf_buttons:
                pm.deleteUI(each)


def rebuild():
    clear()
    add_button('zeroTrans', 'reset attr to zero', 'zero_transform')
    add_button('zeroOri', 'zero orient', 'zero_orient')
    add_button('setOri', 'set orient', 'set_orient')
    add_button('Name', 'rename object', 'name')

    add_button('gMaster', 'create rig group', 'grp_master')
    add_button('gZero', 'create zero group', 'grp_zero')
    add_button('gSub', 'create sub group', 'grp_sub')

    add_button('wCv', 'curve editor', 'show_cv_editor')
    add_button('wJnt', 'joint editor', 'show_jnt_editor')
    add_button('wSkin', 'skin editor', 'show_skin_editor')
    print('rebuild custom shelf...')
