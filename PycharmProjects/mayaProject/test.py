#!/usr/bin/python
# -*- coding:utf-8 -*-
import pymel.core as pm


def main():
    if pm.window('Tools', ex=True):
        pm.deleteUI('Tools')
    pm.window('Tools')
    column = pm.columnLayout()
    pm.button(label='create main')
    pm.button(label='copy skin')
    pm.button(label='create offset')

    pm.window('Tools', title='Tools', e=True, wh=(240, 300))
    pm.showWindow('Tools')


if __name__ == '__main__':
    main()
