import pkgutil
import importlib

# 自动扫描并加载所有子模块
def _load_all_modules():
    for _, module_name, _ in pkgutil.walk_packages(__path__, prefix=f'{__name__}.'):
        module = importlib.import_module(module_name)
        # 将模块中的所有公共功能绑定到顶层模块的命名空间中
        for attr_name in dir(module):
            if not attr_name.startswith('_'):
                attr = getattr(module, attr_name)
                globals()[attr_name] = attr

# 执行加载
_load_all_modules()