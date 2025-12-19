import pymel.core as pm

if not pm.commandPort(":4434", query=True):
    pm.commandPort(name=":4434")

# 在Script Editor执行这个，只重载mytools
import sys
import importlib

# 1. 从 sys.modules 中删除 mytools
for name in list(sys.modules.keys()):
    if name == 'mytools' or name.startswith('mytools.'):
        print(f"Deleting: {name}")
        del sys.modules[name]

# 2. 清除导入缓存
importlib.invalidate_caches()

# 3. 重新导入（这里必须reload一次mytools和hot_reload,否则maya中报错）
import mytools
importlib.reload(mytools)
import hot_reload
importlib.reload(hot_reload)
hot_reload.main()
