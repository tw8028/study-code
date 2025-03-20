import pymel.core as pm
import importlib
import parts
import rig
import custom_shelf

importlib.reload(parts.attr)
importlib.reload(parts.cv)
importlib.reload(parts.grp)
importlib.reload(parts.jnt)
importlib.reload(parts.utils)
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
print('reload!!!')