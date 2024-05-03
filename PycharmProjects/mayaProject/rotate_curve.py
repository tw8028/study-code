#!/usr/bin/python
# -*- coding:utf-8 -*-
import pymel.core as pm


def rotate_shape(shape, ro):
    def rotate_point(i):
        x = shape.controlPoints[i].xValue.get()
        y = shape.controlPoints[i].yValue.get()
        z = shape.controlPoints[i].zValue.get()
        if ro == 'x':
            shape.controlPoints[i].xValue.set(x)
            shape.controlPoints[i].yValue.set(z)
            shape.controlPoints[i].zValue.set(-y)
        elif ro == 'y':
            shape.controlPoints[i].xValue.set(-z)
            shape.controlPoints[i].yValue.set(y)
            shape.controlPoints[i].zValue.set(x)
        elif ro == 'z':
            shape.controlPoints[i].xValue.set(y)
            shape.controlPoints[i].yValue.set(-x)
            shape.controlPoints[i].zValue.set(z)

    size = shape.controlPoints.get(size=True)
    list(map(rotate_point, range(size)))


def rotate(ro='x'):
    cv = pm.selected()[0]
    for shape in cv.getShapes():
        rotate_shape(shape, ro)
    pm.select(cv)


def curve_rx(*args):
    rotate(ro='x')


def curve_ry(*args):
    rotate(ro='y')


def curve_rz(*args):
    rotate(ro='z')


def main():
    win = 'ro_curve'
    if pm.window(win, ex=True):
        pm.deleteUI(win)
    with pm.window(win, wh=(280, 100)):
        with pm.columnLayout():
            pm.frameLayout('90 degree once')
            with pm.columnLayout():
                pm.button(label='rotate x', c=curve_rx)
                pm.button(label='rotate y', c=curve_ry)
                pm.button(label='rotate z', c=curve_rz)
        pm.window(win, e=True, title='ro_curve', wh=(240, 120))
        pm.showWindow(win)


if __name__ == '__main__':
    main()
