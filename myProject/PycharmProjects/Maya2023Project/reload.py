import pymel.core as pm
import importlib
import mytools
import rig
import custom_shelf

importlib.reload(mytools.attr)
importlib.reload(mytools.cv)
importlib.reload(mytools.grp)
importlib.reload(mytools.jnt)
importlib.reload(mytools.math_utils)
importlib.reload(rig.curve_rig)
importlib.reload(rig.fk_rig)
importlib.reload(rig.stretch_rig)
importlib.reload(rig.twist_rig)
importlib.reload(custom_shelf.buttons)
importlib.reload(custom_shelf.editor_cv)
importlib.reload(custom_shelf.editor_jnt)
importlib.reload(custom_shelf.editor_skin)
if not pm.commandPort(":4434", query=True):
    pm.commandPort(name=":4434")
custom_shelf.buttons.rebuild()
