import maya.cmds as mc


def check():
    L = mc.ls(sl=1)
    n = len(L) - 1
    while n >= 0:
        mc.rename(L[n], L[n] + '_t')
        L = mc.ls(sl=1)
        n = n - 1


def re(name):
    check()
    L = mc.ls(sl=1)

    def f(x):
        n = L.index(x) + 1
        mc.rename(x, '{0}{1:0>2d}'.format(name, n))

    list(map(f, L))


def suf(suffix):
    L = mc.ls(sl=1)
    n = len(L) - 1
    while n >= 0:
        mc.rename(L[n], L[n] + '_' + suffix)
        L = mc.ls(sl=1)
        n = n - 1


def replace(ser, rep):
    L = mc.ls(sl=1)
    for i in L:
        mc.rename(i, i.replace(ser, rep))


def click1(*args):
    name = mc.textFieldButtonGrp('re', q=True, tx=True, )
    re(name)


def click2(*args):
    suffix = mc.textFieldButtonGrp('suf', q=True, tx=True, )
    suf(suffix)


def click3(*args):
    ser = mc.textFieldGrp('seach', q=True, tx=True)
    rep = mc.textFieldButtonGrp('replace', q=True, tx=True)
    replace(ser, rep)


if __name__ == '__main__':
    if mc.window('rename', ex=True):
        mc.deleteUI('rename')
    mc.window('rename')
    column = mc.columnLayout()
    mc.frameLayout('rename')
    mc.setParent(column)
    mc.textFieldButtonGrp('re', label='name', text='', buttonLabel='apply', bc=click1)
    mc.textFieldButtonGrp('suf', label='suffix', text='', buttonLabel='apply', bc=click2)

    mc.frameLayout('replace')
    mc.setParent(column)
    mc.textFieldGrp('seach', label='seach', text='')
    mc.textFieldButtonGrp('replace', label='replace', text='', buttonLabel='apply', bc=click3)

    mc.window('rename', e=True, wh=(540, 200))
    mc.showWindow('rename')
