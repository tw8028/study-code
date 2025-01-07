#!/usr/bin/python
# -*- coding:utf-8 -*-
import pymel.core as pm
import os
import json
from itertools import chain


# 闭合的曲线，controlPoints无法获取正确的数值，通配符表示所有控制点
def info_p(obj):
    cvs = pm.ls(obj + '.cv[*]', fl=1)
    n = len(cvs)
    return [tuple(pm.pointPosition(obj.cv[i], local=True)) for i in range(n)]


def write2file(objs):
    # filename = os.path.split(file)[1]
    scene_name = pm.sceneName()
    path = os.path.split(scene_name)[0]
    with open(f'{path}/curve_info.json', 'w+', encoding='utf-8') as f:
        # f.write(data)
        data = {}
        for obj in objs:
            # noinspection PyBroadException
            try:
                print(obj.name())
                data[obj.name()] = info_p(obj)
            except:
                print(f"{obj}:异常")
        json.dump(data, f)


# data 是一个字典，key=shape，value=控制点列表
def read_file(path):
    # scene_name = pm.sceneName()
    # path = os.path.split(scene_name)[0]
    with open(f'{path}/curve_info.json', 'r', encoding='utf-8') as f:
        data = json.load(f)
        for i in data.keys():
            p = data[i]
            shape = pm.PyNode(i)
            for j in range(len(p)):
                # noinspection PyBroadException
                try:
                    shape.controlPoints[j].xValue.set(p[j][0])
                    shape.controlPoints[j].yValue.set(p[j][1])
                    shape.controlPoints[j].zValue.set(p[j][2])
                except:
                    pass


def write(*args):
    objs = pm.selected()
    # 一个obj可能存在多个shape，这里获取每一个obj的shapes
    shapes = [obj.getShapes() for obj in objs]
    # 将每个obj的shapes_list合并到一个list中
    m_list = list(chain(*shapes))
    print(m_list)
    write2file(m_list)


def read_base(*args):
    read_file('D:/Maya/quinn')


def read_local(*args):
    scene_name = pm.sceneName()
    path = os.path.split(scene_name)[0]
    read_file(path)


def main():
    win = 'quinn_config'
    if pm.window(win, ex=True):
        pm.deleteUI(win)
    with pm.window(win, wh=(280, 100)):
        with pm.columnLayout():
            pm.frameLayout('curve info config')
            with pm.columnLayout():
                pm.button(label='write curve info', c=write)
                pm.button(label='read curve info from base', c=read_base)
                pm.button(label='read curve info from local', c=read_local)
        pm.window(win, e=True, title=win, wh=(240, 120))
        pm.showWindow(win)


if __name__ == '__main__':
    main()
