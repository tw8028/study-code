# maya.env  PYTHONPATH = D:\github\study-code\PycharmProjects\mayaProject
# file path = C:\Users\Administrator\Documents\maya\2023

# userSetup.py
# file path = C:\Users\Administrator\Documents\maya\2023\scripts
# 注意语言，中文版文件位置不一样

import maya.cmds as cmds

if not cmds.commandPort(":4434", query=True):  # type: ignore
    cmds.commandPort(name=":4434")  # type: ignore

# We are using the evalDeferred() command, because maya loads the userSetup.py file as it is starting,
# so we are not sure if the shelfLayout is already in place as it gets executed.
# Therefore, evalDeferred() helps us call our script after maya has been initialized.
