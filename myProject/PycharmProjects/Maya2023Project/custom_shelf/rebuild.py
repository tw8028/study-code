import pymel.core as pm


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
    add_button('Reset', 'reset attr to zero', 'reset')
    add_button('zeroOri', 'zero orient', 'zero_orient')
    add_button('setOri', 'set orient', 'set_orient')
    add_button('Name', 'rename object', 'name')

    add_button('gMaster', 'create rig group', 'grp_master')
    add_button('gZero', 'create zero group', 'grp_zero')
    add_button('gSub', 'create sub group', 'grp_sub')
    add_button('wCv', 'curve editor', 'show_cv_editor')
    add_button('wJnt', 'joint editor', 'show_jnt_editor')
    add_button('wSkin', 'skin editor', 'show_skin_editor')


import importlib
import mytools
import custom_shelf
import rig


def main():
    importlib.reload(custom_shelf)
    importlib.reload(mytools)
    importlib.reload(rig)

    rebuild()
    print('rebuild shelf...')


if __name__ == '__main__':
    main()
