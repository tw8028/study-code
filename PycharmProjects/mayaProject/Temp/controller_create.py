# coding:gbk
import maya.cmds as mc


def createObjs(mode, R):
    if mode == '十字1':
        cross1(R)
    elif mode == '十字2':
        cross2(R)
    elif mode == '立方体':
        cube(R)
    elif mode == '箭头1':
        arrows1(R)
    elif mode == '双箭头':
        arrows2(R)
    elif mode == '三角':
        triangle1(R)
    elif mode == '正方形':
        square(R)
    elif mode == '圆形':
        circle1(R)
    elif mode == '菱形':
        rhomb(R)
    elif mode == '十字箭头1':
        arrows3(R)
    elif mode == '十字箭头2':
        arrows4(R)
    elif mode == '箭头up':
        arrows5(R)
    # 十字箭头1


def arrows3(R):
    p1 = [(-1, 1, 0), (-1, 2, 0), (-2, 2, 0), (0, 4, 0), (2, 2, 0),
          (1, 2, 0), (1, 1, 0), (5, 1, 0), (5, 2, 0), (7, 0, 0), (5, -2, 0), (5, -1, 0),
          (1, -1, 0), (1, -2, 0), (2, -2, 0), (0, -4, 0), (-2, -2, 0), (-1, -2, 0),
          (-1, -1, 0), (-5, -1, 0), (-5, -2, 0), (-7, 0, 0), (-5, 2, 0), (-5, 1, 0), (-1, 1, 0)]

    def f(n):
        return tuple(map(lambda x: R * x, n))

    pn = list(map(f, p1))
    mc.curve(d=1, p=pn, k=[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24])


# 十字箭头2
def arrows4(R):
    p1 = [(-1, 1, 0), (-1, 3, 0), (-2, 3, 0), (0, 5, 0), (2, 3, 0), (1, 3, 0), (1, 1, 0), (3, 1, 0), (3, 2, 0),
          (5, 0, 0), (3, -2, 0), (3, -1, 0), (1, -1, 0), (1, -3, 0), (2, -3, 0), (0, -5, 0), (-2, -3, 0), (-1, -3, 0),
          (-1, -1, 0), (-3, -1, 0), (-3, -2, 0), (-5, 0, 0), (-3, 2, 0), (-3, 1, 0), (-1, 1, 0)]

    def f(n):
        return tuple(map(lambda x: R * x, n))

    pn = list(map(f, p1))
    mc.curve(d=1, p=pn, k=[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24])


# up箭头
def arrows5(R):
    p1 = [(-1, 2, 0), (-2, 2, 0), (0, 4, 0), (2, 2, 0), (1, 2, 0), (1, -2, 0), (-1, -2, 0), (-1, 2, 0)]

    def f(n):
        return tuple(map(lambda x: R * x, n))

    pn = list(map(f, p1))
    mc.curve(d=1, p=pn, k=[0, 1, 2, 3, 4, 5, 6, 7])


# 十字形
def cross1(R):
    p1 = [(-1, 1, 0), (-1, 3, 0), (1, 3, 0), (1, 1, 0),
          (3, 1, 0), (3, -1, 0), (1, -1, 0), (1, -3, 0),
          (-1, -3, 0), (-1, -1, 0), (-3, -1, 0), (-3, 1, 0), (-1, 1, 0)]

    def f(n):
        return tuple(map(lambda x: R * x, n))

    pn = list(map(f, p1))
    mc.curve(d=1, p=pn, k=[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12])


def cross2(R):
    p1 = [(-1, 1, 0), (-1, 7, 0), (1, 7, 0), (1, 1, 0),
          (7, 1, 0), (7, -1, 0), (1, -1, 0), (1, -7, 0),
          (-1, -7, 0), (-1, -1, 0), (-7, -1, 0), (-7, 1, 0), (-1, 1, 0)]

    def f(n):
        return tuple(map(lambda x: R * x * 0.5, n))

    pn = list(map(f, p1))
    mc.curve(d=1, p=pn, k=[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12])


# 立方体
def cube(R):
    p1 = [(-1, -1, 1), (1, -1, 1), (1, -1, -1), (-1, -1, -1),
          (-1, -1, 1), (-1, 1, 1), (1, 1, 1), (1, -1, 1),
          (1, 1, 1), (1, 1, -1), (1, -1, -1), (1, 1, -1),
          (-1, 1, -1), (-1, -1, -1), (-1, 1, -1), (-1, 1, 1)]

    def f(n):
        return tuple(map(lambda x: R * x, n))

    pn = list(map(f, p1))
    mc.curve(d=1, p=pn, k=[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15])


# 箭头
def arrows1(R):
    p1 = [(-3, 2, 0), (0, 2, 0), (0, 6, 0), (6, 0, 0),
          (0, -6, 0), (0, -2, 0), (-3, -2, 0), (-3, 2, 0)]

    def f(n):
        return tuple(map(lambda x: R * x, n))

    pn = list(map(f, p1))
    mc.curve(d=1, p=pn, k=[0, 1, 2, 3, 4, 5, 6, 7])


# 双箭头
def arrows2(R):
    p1 = [(0, 1, 0), (3, 1, 0), (3, 2, 0), (5, 0, 0), (3, -2, 0),
          (3, -1, 0), (-3, -1, 0), (-3, -2, 0), (-5, 0, 0), (-3, 2, 0), (-3, 1, 0), (0, 1, 0)]

    def f(n):
        return tuple(map(lambda x: R * x, n))

    pn = list(map(f, p1))
    mc.curve(d=1, p=pn, k=[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11])


# 三角
def triangle1(R):
    p1 = [(0, 0, 0), (-1, 2, 0), (1, 2, 0), (0, 0, 0), (0, -3, 0)]

    def f(n):
        return tuple(map(lambda x: R * x, n))

    pn = list(map(f, p1))
    mc.curve(d=1, p=pn, k=[0, 1, 2, 3, 4])


# 正方形
def square(R):
    p1 = [(-1, 1, 0), (-1, -1, 0), (1, -1, 0), (1, 1, 0), (-1, 1, 0)]

    def f(n):
        return tuple(map(lambda x: R * x, n))

    pn = list(map(f, p1))
    mc.curve(d=1, p=pn, k=[0, 1, 2, 3, 4])


# 圆
def circle1(R):
    mc.circle(nr=(0, 0, 1), c=(0, 0, 0), r=R)


# 菱形
def rhomb(R):
    p1 = [(-1, 0, 0), (0, 0, -1), (1, 0, 0), (0, 0, 1), (-1, 0, 0),
          (0, 1, 0), (1, 0, 0), (0, -1, 0), (-1, 0, 0),
          (0, 0, -1), (0, 1, 0), (0, 0, 1), (0, -1, 0), (0, 0, -1)]

    def f(n):
        return tuple(map(lambda x: R * x, n))

    pn = list(map(f, p1))
    mc.curve(d=1, p=pn, k=[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13])


def showWindow1():
    name = 'CreateCurves'
    if mc.window(name, q=True, ex=True):
        mc.deleteUI(name)
    mc.window(name)
    column = mc.columnLayout()
    mc.frameLayout('选择一个形状，设置大小，点击创建。')

    mc.gridLayout(numberOfColumns=2, cellWidth=100)
    mc.radioCollection('objType')
    mc.radioButton(label='十字1')
    mc.radioButton(label='十字2')
    mc.radioButton(label='箭头1')
    mc.radioButton(label='箭头up')
    mc.radioButton(label='十字箭头1')
    mc.radioButton(label='十字箭头2')
    mc.radioButton(label='双箭头')
    mc.radioButton(label='三角')
    mc.radioButton(label='正方形')
    mc.radioButton(label='立方体', select=True)
    mc.radioButton(label='圆形')
    mc.radioButton(label='菱形')

    mc.setParent(column)
    mc.rowLayout(numberOfColumns=2)
    mc.floatField('radiusObj', value=1)
    mc.button(label='Create', c=click)

    mc.window(name, title='控制器形状', e=True, wh=(300, 360))
    mc.showWindow(name)


def click(*args):
    radio = mc.radioCollection('objType', q=True, select=True)
    mode = mc.radioButton(radio, q=True, label=True)

    R = mc.floatField('radiusObj', q=True, value=True)
    createObjs(mode, R)


showWindow1()
