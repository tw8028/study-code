import pymel.core as pm
import reload
import custom_shelf.buttons

if not pm.commandPort(":4434", query=True):
    pm.commandPort(name=":4434")

reload.main()
custom_shelf.buttons.rebuild()

