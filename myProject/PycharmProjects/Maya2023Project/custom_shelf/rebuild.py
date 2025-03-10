import pymel.core as pm
import importlib
import custom_shelf.buttons
import tools.grp
import tools.attr


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
    add_button('Master', 'create rig group', 'grp_master')
    add_button('Zero', 'create zero group', 'grp_zero')
    add_button('Sub', 'create sub group', 'grp_sub')


def main():
    importlib.reload(custom_shelf.buttons)
    importlib.reload(tools.grp)
    importlib.reload(tools.attr)
    rebuild()
    print('reload shelf...')


if __name__ == '__main__':
    main()
