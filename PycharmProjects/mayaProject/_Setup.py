# maya.env  PYTHONPATH = D:\github\study-code\PycharmProjects\mayaProject
# file path = C:\Users\Administrator\Documents\maya\2022

# userSetup.py
# file path = C:\Users\Administrator\Documents\maya\2022\scripts

import pymel.core as pm
import custom_shelf
import importlib

# We are using the evalDeferred() command, because maya loads the userSetup.py file as it is starting,
# so we are not sure if the shelfLayout is already in place as it gets executed.
# Therefore, evalDeferred() helps us call our script after maya has been initialized.

pm.evalDeferred("importlib.reload(custom_shelf)")
pm.evalDeferred("custom_shelf.main()")

if not pm.commandPort(":4434", query=True):
    pm.commandPort(name=":4434")
