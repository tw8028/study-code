import maya.cmds as mc
import os


def import_from_ref():
    refs = [i for i in mc.ls(references=True) if 'RN' in i]
    for i in refs:
        rFile = mc.referenceQuery(i, f=True)
        mc.file(rFile, importReference=True)


def del_namespace():
    namespaces = [i for i in mc.namespaceInfo(lon=True) if '_rig' in i]
    for i in namespaces:
        mc.namespace(removeNamespace=i, mergeNamespaceWithRoot=True)


def bake_ani(jnt):
    mc.bakeResults(jnt, t=(0, mc.playbackOptions(q=True, max=True)), simulation=True)


# get the file path name
cfile = mc.file(q=True, exn=True)
# get the path
path = os.path.split(cfile)[0]

ctrls = ['FKEyePain_L', 'FKEyebrow2_R', 'FKEyebrow3_R', 'FKMouth16_L', 'RollToesEnd_R', 'FKMiddleFinger1_R', 'FKRoot_M',
         'FKMouth11_L', 'FKMouth06_R', 'FKMouth09_R', 'IKArm_L', 'FKEyebrow1_L', 'FKThumbFinger1_L',
         'FKMiddleFinger2_R', 'FKMouth02_R', 'IKLeg_R', 'world_ctrl', 'FKMouth07_R', 'FKTongue4_M', 'FKIKLeg_L',
         'FKMouth01_R', 'FKEars_L', 'FKEyebrow4_R', 'FKSpine2_M', 'Fingers_R', 'FKMouth08_R', 'IKToes_L', 'FKMouth14_L',
         'FKChest_M', 'FKScapula_L', 'FKJaw_M', 'FKMouth_L', 'FKEye_g_L', 'FKMouth12_R', 'RollToes_R', 'FKMouth13_L',
         'FKMouthDown_M', 'FKEyebrow1_R', 'FKIndexFinger3_L', 'IKLeg_L', 'FKIndexFinger2_R', 'FKSpine1_M',
         'FKEyebrow3_L', 'FKMouth1_L', 'FKEars_R', 'FKRingFinger1_L', 'FKNeck_M', 'FKEyebrow4_L', 'root_ctrl',
         'FKMouth03_L', 'FKIndexFinger1_L', 'FKEyeStartled_R', 'FKRingFinger3_R', 'FKMiddleFinger1_L', 'RollToesEnd_L',
         'Fingers_L', 'FKMouthUp1_M', 'FKToothDown_M', 'FKIndexFinger3_R', 'FKThumbFinger2_L', 'FKScapula_R',
         'FKEyebrow5_R', 'FKRingFinger2_L', 'FKMouth10_R', 'FKThumbFinger1_R', 'FKTongue1_M', 'PoleLeg_L',
         'FKMouth09_L', 'FKMouth11_R', 'FKMouth12_L', 'FKIndexFinger1_R', 'PoleArm_R', 'FKMouth10_L',
         'FKThumbFinger3_R', 'FKEyePain_R', 'FKIKLeg_R', 'FKCheek_R', 'IKToes_R', 'FKThumbFinger3_L', 'FKRingFinger1_R',
         'FKMouth05_R', 'RollHeel_L', 'FKMouth07_L', 'FKMiddleFinger3_R', 'FKMouth02_L', 'HipSwinger_M', 'FKEyebrow2_L',
         'FKMouth1_R', 'FKMiddleFinger3_L', 'FKMouth03_R', 'FKMouth14_R', 'FKToothUp_M', 'FKMouth01_L', 'FKMouth05_L',
         'FKMouth04_L', 'FKMouth_R', 'IKArm_R', 'FKEye_g_R', 'FKMouth08_L', 'RollHeel_R', 'FKTongue3_M',
         'FKMouthDown1_M', 'FKMouth16_R', 'PoleArm_L', 'FKMouth15_R', 'FKIKSpine_M', 'FKThumbFinger2_R', 'Main',
         'FKCheek_L', 'FKMiddleFinger2_L', 'FKNose_M', 'FKIKArm_R', 'FKMouth06_L', 'FKRingFinger3_L', 'RootX_M',
         'FKMouth04_R', 'FKIKArm_L', 'PoleLeg_R', 'FKMouth15_L', 'FKMouthUp_M', 'FKMouth13_R', 'FKEyebrow5_L',
         'FKEyeStartled_L', 'FKHead_M', 'FKIndexFinger2_L', 'RollToes_L', 'FKTongue2_M', 'FKRingFinger2_R']

body_jnts = ['root_jnt', 'Root_M', 'Spine1_M', 'Spine2_M', 'Chest_M', 'Neck_M', 'Head_M', 'Scapula_R',
             'Shoulder_R', 'Elbow_R', 'Wrist_R', 'MiddleFinger1_R', 'MiddleFinger2_R', 'MiddleFinger3_R',
             'ThumbFinger1_R', 'ThumbFinger2_R', 'ThumbFinger3_R', 'IndexFinger1_R', 'IndexFinger2_R',
             'IndexFinger3_R', 'RingFinger1_R', 'RingFinger2_R', 'RingFinger3_R', 'Scapula_L', 'Shoulder_L',
             'Elbow_L', 'Wrist_L', 'MiddleFinger1_L', 'MiddleFinger2_L', 'MiddleFinger3_L', 'ThumbFinger1_L',
             'ThumbFinger2_L', 'ThumbFinger3_L', 'IndexFinger1_L', 'IndexFinger2_L', 'IndexFinger3_L',
             'RingFinger1_L', 'RingFinger2_L', 'RingFinger3_L', 'Hip_R', 'Knee_R', 'Ankle_R', 'Toes_R',
             'jiaoxing_Toes_R01', 'jiaoxing_Toes_R02', 'jiaoxing_Ankle_R01', 'jiaoxing_Ankle_R02', 'Hip_L',
             'Knee_L', 'Ankle_L', 'Toes_L', 'jiaoxing_Toes_L01', 'jiaoxing_Toes_L02', 'jiaoxing_Ankle_L01',
             'jiaoxing_Ankle_L02']
head_jnt = 'Head_M'
face_jnts = ['Eye_R', 'Eye1_R', 'Eye2_R', 'ToothUp_M', 'Jaw_M', 'ToothDown_M', 'Tongue1_M', 'Tongue2_M',
             'Tongue3_M', 'Tongue4_M', 'MouthDown_M', 'Mouth05_R', 'Mouth06_R', 'Mouth07_R', 'Mouth08_R',
             'Mouth12_R', 'Mouth09_R', 'Mouth10_R', 'Mouth11_R', 'MouthDown1_M', 'Mouth05_L', 'Mouth06_L',
             'Mouth07_L', 'Mouth08_L', 'Mouth12_L', 'Mouth09_L', 'Mouth10_L', 'Mouth11_L', 'Eyebrow1_R',
             'Eyebrow2_R', 'Eyebrow3_R', 'Eyebrow4_R', 'Eyebrow5_R', 'MouthUp_M', 'Mouth_R', 'Mouth01_R',
             'Mouth02_R', 'Mouth03_R', 'Mouth04_R', 'Nose_M', 'Ears_R', 'Cheek_R', 'EyeStartled_R',
             'EyePain_R', 'MouthUp1_M', 'Mouth1_R', 'Mouth13_R', 'Mouth14_R', 'Mouth15_R', 'Mouth16_R', 'Eye_L',
             'Eye1_L', 'Eye2_L', 'Eyebrow1_L', 'Eyebrow2_L', 'Eyebrow3_L', 'Eyebrow4_L', 'Eyebrow5_L', 'Mouth_L',
             'Mouth01_L', 'Mouth02_L', 'Mouth03_L', 'Mouth04_L', 'Ears_L', 'Cheek_L', 'EyeStartled_L', 'EyePain_L',
             'Mouth1_L', 'Mouth13_L', 'Mouth14_L', 'Mouth15_L', 'Mouth16_L']


def click0(*args):
    import_from_ref()
    del_namespace()
    mc.FBXResetExport()
    mc.FBXExportFileVersion('FBX201200')


# export body
def click1(*args):
    name = mc.textFieldButtonGrp('body', q=True, tx=True)
    file_fbx = path + '/' + name + '.fbx'
    # set foot_fype
    mc.setAttr("Main.Foot_type", 0)
    # bake joints
    for i in body_jnts:
        bake_ani(i)
    # remove face joints
    mc.parent(face_jnts, w=True)
    # export selection
    mc.select('DeformationSystem', r=True)
    mc.FBXExport('-f', file_fbx, '-s')
    print('export:{0}'.format(file_fbx))
    # open new
    mc.file(cfile, force=True, options='v=0', open=True)


# export face
def click2(*args):
    name = mc.textFieldButtonGrp('face', q=True, tx=True)
    file_fbx = path + '/' + name + '.fbx'
    # remove constraint
    for ctrl in ['world_ctrl', 'root_ctrl', 'Main']:
        con = mc.listRelatives(ctrl, type='constraint')
        mc.delete(con)
    # reset transform
    for i in ctrls:
        mc.cutKey(i, clear=True, time=(None, None))
        mc.xform(i, t=(0, 0, 0), ro=(0, 0, 0), s=(1, 1, 1))
    # bake joints
    for j in face_jnts:
        bake_ani(j)
    # reset group
    mc.parent(head_jnt, w=True)
    mc.delete('Group')
    mc.group(empty=True, name='DeformationSystem')
    mc.group('DeformationSystem', name='Group')
    mc.parent(head_jnt, 'DeformationSystem')
    mc.xform(head_jnt, t=(0, 0, 0), ro=(0, 0, 0))
    # export selection
    mc.select(head_jnt)
    mc.FBXExport('-f', file_fbx, '-s')
    print('export:{0}'.format(file_fbx))
    # open new
    mc.file(cfile, force=True, options='v=0', open=True)


# export item
def click3(*args):
    name = mc.textFieldButtonGrp('item', q=True, tx=True)
    file_fbx = path + '/' + name + '.fbx'
    # need to select root
    root = mc.ls(sl=True)[0]
    mc.select(root, hierarchy=True)
    jnts = mc.ls(mc.ls(sl=True), type='joint')[1:]
    # bake joints expect root
    for i in jnts:
        bake_ani(i)
    # export selection
    mc.select(root, r=True)
    mc.FBXExport('-f', file_fbx, '-s')
    print('export:{0}'.format(file_fbx))


if __name__ == '__main__':
    if mc.window('ZL_ani_export', ex=True):
        mc.deleteUI('ZL_ani_export')
    mc.window('ZL_ani_export')
    column = mc.columnLayout()
    mc.button(label='prepare', c=click0)
    mc.textFieldButtonGrp('body', label='body', text='ZL_zt_xxx_body_ani', buttonLabel='apply', bc=click1)
    mc.textFieldButtonGrp('face', label='face', text='ZL_zt_xxx_face_ani', buttonLabel='apply', bc=click2)

    mc.frameLayout('select root joint')
    mc.setParent(column)
    mc.textFieldButtonGrp('item', label='item', text='ZL_zt_xxx_itemName_ani', buttonLabel='apply', bc=click3)

    mc.window('ZL_ani_export', title='ZL_ani_export', e=True, wh=(540, 200))
    mc.showWindow('ZL_ani_export')
