import pymel.core as pm


def rename(objs):
    for i in objs:
        sl = pm.selected()[0]
        pm.rename(sl, i)
        child = pm.listRelatives(sl)
        pm.select(child)


def click1(*args):
    L = ['Root_M', 'Spine1_M', 'Spine2_M', 'Chest_M', 'Neck_M', 'Head_M', 'HeadEnd_M']
    rename(L)


def click2(*args):
    L = ['Scapula_R', 'Shoulder_R', 'Elbow_R', 'Wrist_R']
    rename(L)


def thumb(*args):
    L = ['ThumbFinger1_R', 'ThumbFinger2_R', 'ThumbFinger3_R', 'ThumbFinger4_R']
    rename(L)


def click4(*args):
    L = ['IndexFinger1_R', 'IndexFinger2_R', 'IndexFinger3_R', 'IndexFinger4_R']
    rename(L)


def click5(*args):
    L = ['MiddleFinger1_R', 'MiddleFinger2_R', 'MiddleFinger3_R', 'MiddleFinger4_R']
    rename(L)


def click6(*args):
    L = ['RingFinger1_R', 'RingFinger2_R', 'RingFinger3_R', 'RingFinger4_R']
    rename(L)


def click7(*args):
    L = ['PinkyFinger1_R', 'PinkyFinger2_R', 'PinkyFinger3_R', 'PinkyFinger4_R']
    rename(L)


def click8(*args):
    L = ['Hip_R', 'Knee_R', 'Ankle_R', 'Toes_R', 'ToesEnd_R']
    rename(L)


def click9(*args):
    L = ['AnkleEnd_R']
    rename(L)


if __name__ == '__main__':
    if pm.window('jntRename', ex=True):
        pm.deleteUI('jntRename')
    pm.window('jntRename')
    column = pm.columnLayout()

    pm.frameLayout('Rename body')
    pm.setParent(column)
    pm.rowLayout(numberOfColumns=5)
    pm.button(label='Spine', c=click1)
    pm.button(label='Arm_R', c=click2)
    pm.button(label='Leg_R', c=click8)
    pm.button(label='heel_R', c=click9)
    pm.setParent(column)

    pm.frameLayout('Rename finger')
    pm.setParent(column)
    pm.rowLayout(numberOfColumns=5)
    pm.button(label='Thumb_R', c=thumb)
    pm.button(label='Index_R', c=click4)
    pm.button(label='Middle_R', c=click5)
    pm.button(label='Ring_R', c=click6)
    pm.button(label='Pinky_R', c=click7)
    pm.setParent(column)

    pm.window('jntRename', title='joint rename', e=True, wh=(300, 200))
    pm.showWindow('jntRename')
