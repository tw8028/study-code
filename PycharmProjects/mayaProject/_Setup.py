# maya.env  PYTHONPATH = D:\github\study-code\PycharmProjects\mayaProject
# file path = C:\Users\Administrator\Documents\maya\2022

# userSetup.py
# file path = C:\Users\Administrator\Documents\maya\2022\scripts

import maya.cmds as cmds
import custom_shelf
import importlib

# We are using the evalDeferred() command, because maya loads the userSetup.py file as it is starting,
# so we are not sure if the shelfLayout is already in place as it gets executed.
# Therefore, evalDeferred() helps us call our script after maya has been initialized.

cmds.evalDeferred("importlib.reload(custom_shelf)")
cmds.evalDeferred("custom_shelf.main()")

if not cmds.commandPort(":4434", query=True):
    cmds.commandPort(name=":4434")
