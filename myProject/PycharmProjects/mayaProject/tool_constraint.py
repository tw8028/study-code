#!/usr/bin/python
# -*- coding:utf-8 -*-
import pymel.core as pm


def matrix_constraint(driver, driven):
    driver_node = pm.PyNode(driver)
    driven_node = pm.PyNode(driven)
    mult_matrix_node = pm.createNode('multMatrix', n=driven + '_matrixConstraint')

    driver_node.worldMatrix[0] >> mult_matrix_node.matrixIn[0]
    if pm.listRelatives(driven, parent=True):
        driven_parent_node = pm.listRelatives(driven, parent=True)[0]
        driven_parent_node.worldInverseMatrix >> mult_matrix_node.matrixIn[1]
    mult_matrix_node.matrixSum >> driven_node.offsetParentMatrix

    # set local transform
    pm.xform(driven, t=(0, 0, 0), ro=(0, 0, 0), roo=pm.xform(driver, q=True, roo=True))
    try:
        driven_node.jointOrient.set(0, 0, 0)
    except:
        pass


def constraint(*args):
    sel = pm.selected()
    matrix_constraint(sel[0], sel[1])


def delete(*args):
    sel = pm.selected()
    for i in sel:
        try:
            pm.delete(i + '_matrixConstraint')
        except:
            print('unknown')


def main():
    if pm.window('myWin', ex=True):
        pm.deleteUI('myWin')
    pm.window('myWin')
    pm.columnLayout(adj=True)
    pm.text('select driver first')
    pm.button(label='constraint', c=constraint)
    pm.text('select driven to delete constrain')
    pm.button(label='delete', c=delete)

    pm.window('myWin', title='matrix constraint', e=True, wh=(240, 100))
    pm.showWindow('myWin')


if __name__ == '__main__':
    main()
