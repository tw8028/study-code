import pymel.core as pm
import importlib
import custom_shelf.buttons
import custom_shelf.cv_editor
import tools.attr
import tools.cv
import tools.drive
import tools.grp
import tools.jnt


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
    add_button('Cv','curve editor','show_cv_editor')


def main():
    importlib.reload(custom_shelf.buttons)
    importlib.reload(custom_shelf.cv_editor)
    importlib.reload(tools.attr)
    importlib.reload(tools.cv)
    importlib.reload(tools.drive)
    importlib.reload(tools.grp)
    importlib.reload(tools.jnt)

    rebuild()
    print('rebuild shelf...')


if __name__ == '__main__':
    main()
