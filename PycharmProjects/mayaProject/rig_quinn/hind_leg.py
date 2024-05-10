#!/usr/bin/python
# -*- coding:utf-8 -*-
import pymel.core as pm


def main():
    win = 'tools'
    if pm.window(win, ex=True):
        pm.deleteUI(win)
    with pm.window(win, wh=(280, 100)):
        with pm.columnLayout():
            pm.frameLayout('quinn rigging test')
            with pm.columnLayout():
                pm.button(label='step1', c=step1)
                pm.button(label='step2', c=step2)
        pm.window(win, e=True, title='quinn builder', wh=(240, 120))
        pm.showWindow(win)


if __name__ == '__main__':
    main()
