# coding:gbk
import maya.cmds as mc


def createObjs(mode, R):
    if mode == 'ʮ��1':
        cross1(R)
    elif mode == 'ʮ��2':
        cross2(R)
    elif mode == '������':
        cube(R)
    elif mode == '��ͷ1':
        arrows1(R)
    elif mode == '˫��ͷ':
        arrows2(R)
    elif mode == '����':
        triangle1(R)
    elif mode == '������':
        square(R)
    elif mode == 'Բ��':
        circle1(R)
    elif mode == '����':
        rhomb(R)
    elif mode == 'ʮ�ּ�ͷ1':
        arrows3(R)
    elif mode == 'ʮ�ּ�ͷ2':
        arrows4(R)
    elif mode == '��ͷup':
        arrows5(R)
    # ʮ�ּ�ͷ1


def arrows3(R):
    p1 = [(-1, 1, 0), (-1, 2, 0), (-2, 2, 0), (0, 4, 0), (2, 2, 0),
          (1, 2, 0), (1, 1, 0), (5, 1, 0), (5, 2, 0), (7, 0, 0), (5, -2, 0), (5, -1, 0),
          (1, -1, 0), (1, -2, 0), (2, -2, 0), (0, -4, 0), (-2, -2, 0), (-1, -2, 0),
          (-1, -1, 0), (-5, -1, 0), (-5, -2, 0), (-7, 0, 0), (-5, 2, 0), (-5, 1, 0), (-1, 1, 0)]

    def f(n):
        return tuple(map(lambda x: R * x, n))

    pn = list(map(f, p1))
    mc.curve(d=1, p=pn, k=[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24])


# ʮ�ּ�ͷ2
def arrows4(R):
    p1 = [(-1, 1, 0), (-1, 3, 0), (-2, 3, 0), (0, 5, 0), (2, 3, 0), (1, 3, 0), (1, 1, 0), (3, 1, 0), (3, 2, 0),
          (5, 0, 0), (3, -2, 0), (3, -1, 0), (1, -1, 0), (1, -3, 0), (2, -3, 0), (0, -5, 0), (-2, -3, 0), (-1, -3, 0),
          (-1, -1, 0), (-3, -1, 0), (-3, -2, 0), (-5, 0, 0), (-3, 2, 0), (-3, 1, 0), (-1, 1, 0)]

    def f(n):
        return tuple(map(lambda x: R * x, n))

    pn = list(map(f, p1))
    mc.curve(d=1, p=pn, k=[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24])


# up��ͷ
def arrows5(R):
    p1 = [(-1, 2, 0), (-2, 2, 0), (0, 4, 0), (2, 2, 0), (1, 2, 0), (1, -2, 0), (-1, -2, 0), (-1, 2, 0)]

    def f(n):
        return tuple(map(lambda x: R * x, n))

    pn = list(map(f, p1))
    mc.curve(d=1, p=pn, k=[0, 1, 2, 3, 4, 5, 6, 7])


# ʮ����
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


# ������
def cube(R):
    p1 = [(-1, -1, 1), (1, -1, 1), (1, -1, -1), (-1, -1, -1),
          (-1, -1, 1), (-1, 1, 1), (1, 1, 1), (1, -1, 1),
          (1, 1, 1), (1, 1, -1), (1, -1, -1), (1, 1, -1),
          (-1, 1, -1), (-1, -1, -1), (-1, 1, -1), (-1, 1, 1)]

    def f(n):
        return tuple(map(lambda x: R * x, n))

    pn = list(map(f, p1))
    mc.curve(d=1, p=pn, k=[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15])


# ��ͷ
def arrows1(R):
    p1 = [(-3, 2, 0), (0, 2, 0), (0, 6, 0), (6, 0, 0),
          (0, -6, 0), (0, -2, 0), (-3, -2, 0), (-3, 2, 0)]

    def f(n):
        return tuple(map(lambda x: R * x, n))

    pn = list(map(f, p1))
    mc.curve(d=1, p=pn, k=[0, 1, 2, 3, 4, 5, 6, 7])


# ˫��ͷ
def arrows2(R):
    p1 = [(0, 1, 0), (3, 1, 0), (3, 2, 0), (5, 0, 0), (3, -2, 0),
          (3, -1, 0), (-3, -1, 0), (-3, -2, 0), (-5, 0, 0), (-3, 2, 0), (-3, 1, 0), (0, 1, 0)]

    def f(n):
        return tuple(map(lambda x: R * x, n))

    pn = list(map(f, p1))
    mc.curve(d=1, p=pn, k=[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11])


# ����
def triangle1(R):
    p1 = [(0, 0, 0), (-1, 2, 0), (1, 2, 0), (0, 0, 0), (0, -3, 0)]

    def f(n):
        return tuple(map(lambda x: R * x, n))

    pn = list(map(f, p1))
    mc.curve(d=1, p=pn, k=[0, 1, 2, 3, 4])


# ������
def square(R):
    p1 = [(-1, 1, 0), (-1, -1, 0), (1, -1, 0), (1, 1, 0), (-1, 1, 0)]

    def f(n):
        return tuple(map(lambda x: R * x, n))

    pn = list(map(f, p1))
    mc.curve(d=1, p=pn, k=[0, 1, 2, 3, 4])


# Բ
def circle1(R):
    mc.circle(nr=(0, 0, 1), c=(0, 0, 0), r=R)


# ����
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
    mc.frameLayout('ѡ��һ����״�����ô�С�����������')

    mc.gridLayout(numberOfColumns=2, cellWidth=100)
    mc.radioCollection('objType')
    mc.radioButton(label='ʮ��1')
    mc.radioButton(label='ʮ��2')
    mc.radioButton(label='��ͷ1')
    mc.radioButton(label='��ͷup')
    mc.radioButton(label='ʮ�ּ�ͷ1')
    mc.radioButton(label='ʮ�ּ�ͷ2')
    mc.radioButton(label='˫��ͷ')
    mc.radioButton(label='����')
    mc.radioButton(label='������')
    mc.radioButton(label='������', select=True)
    mc.radioButton(label='Բ��')
    mc.radioButton(label='����')

    mc.setParent(column)
    mc.rowLayout(numberOfColumns=2)
    mc.floatField('radiusObj', value=1)
    mc.button(label='Create', c=click)

    mc.window(name, title='��������״', e=True, wh=(300, 360))
    mc.showWindow(name)


def click(*args):
    radio = mc.radioCollection('objType', q=True, select=True)
    mode = mc.radioButton(radio, q=True, label=True)

    R = mc.floatField('radiusObj', q=True, value=True)
    createObjs(mode, R)


showWindow1()
