# We are using the evalDeferred() command, because maya loads the userSetup.py file as it is starting,
# so we are not sure if the shelfLayout is already in place as it gets executed.
# Therefore, evalDeferred() helps us call our script after maya has been initialized.
import maya.cmds as cmds

if not cmds.commandPort(":4434", query=True):  # type: ignore
    cmds.commandPort(name=":4434")  # type: ignore
