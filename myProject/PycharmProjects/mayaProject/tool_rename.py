#!/usr/bin/python
# -*- coding:utf-8 -*-
import pymel.core as pm


def rename_click(*args):
    name = pm.textFieldButtonGrp('re', q=True, tx=True, )
    objs = pm.selected()
    new_list = []
    for i in objs:
        new_list.append(pm.rename(i, i + '_mlwxj'))
    n = 1
    for j in new_list:
        pm.rename(j, name + str(n))
        n += 1


def suf_click(*args):
    suffix = pm.textFieldButtonGrp('suf', q=True, tx=True, )
    ojbs = pm.selected()
    for i in ojbs:
        pm.rename(i, i + '_' + suffix)


def replace_click(*args):
    ser = pm.textFieldGrp('seach', q=True, tx=True)
    rep = pm.textFieldButtonGrp('replace', q=True, tx=True)
    objs = pm.selected()
    for i in objs:
        pm.rename(i, i.replace(ser, rep))


def main():
    win = 'rename_win'
    if pm.window(win, ex=True):
        pm.deleteUI(win)
    with pm.window(win):
        with pm.columnLayout(adj=True, rowSpacing=5):
            with pm.frameLayout('rename'):
                pm.textFieldButtonGrp('re', label='name', cw3=(60, 180, 40), text='', buttonLabel='apply',
                                      bc=rename_click)
                pm.textFieldButtonGrp('suf', label='suffix', cw3=(60, 180, 40), text='', buttonLabel='apply',
                                      bc=suf_click)
            with pm.frameLayout('replace'):
                pm.textFieldGrp('seach', label='seach', cw2=(60, 180), text='')
                pm.textFieldButtonGrp('replace', label='replace', cw3=(60, 180, 40), text='', buttonLabel='apply',
                                      bc=replace_click)
    pm.window(win, e=True, t='rename', wh=(330, 200))
    pm.showWindow(win)


if __name__ == '__main__':
    main()
