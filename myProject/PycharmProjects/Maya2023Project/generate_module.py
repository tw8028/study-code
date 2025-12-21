# generate_module.py

import importlib
import pkgutil
import inspect
from typing import Dict, Callable


def get_modules(package_name: str):
    package = importlib.import_module(package_name)
    modules = []
    for _, module_name, _ in pkgutil.walk_packages(package.__path__, prefix=f"{package_name}."):
        modules.append(module_name)
    return modules


def scan_package(package_name: str) -> Dict[str, Callable]:
    """
    扫描指定包中的所有模块，并提取方法
    :param package_name: 包名（例如 "package1"）
    :return: 方法字典，键为方法名，值为方法对象
    """
    package = importlib.import_module(package_name)
    methods = {}

    # 遍历包中的所有模块
    for _, module_name, _ in pkgutil.walk_packages(package.__path__, prefix=f"{package_name}."):
        module = importlib.import_module(module_name)

        # 提取模块中的所有方法
        for attr_name in dir(module):
            attr = getattr(module, attr_name)
            if callable(attr) and not attr_name.startswith("_"):  # 过滤掉私有方法和非方法对象
                methods[attr_name] = attr

    return methods


def generate_entry_module(package_names: list, output_file: str = "mytools.py"):
    """
    生成入口模块
    :param package_names: 需要扫描的包名列表
    :param output_file: 生成的入口模块文件名
    """
    all_methods = {}
    for package_name in package_names:
        methods = scan_package(package_name)
        all_methods.update(methods)

    # 生成入口模块代码
    with open(output_file, "w", encoding="utf-8") as f:
        f.write("# Auto-generated entry module\n\n")

        # 导入所有 module
        all_module = []
        for package_name in package_names:
            modules = get_modules(package_name)
            all_module.extend(modules)
        for module in all_module:
            f.write(f"import {module}\n")

        f.write("\n\n")

        # 为每个方法生成调用函数
        for method_name, method in all_methods.items():
            # 获取原函数的参数签名
            signature = inspect.signature(method)
            parameters = list(signature.parameters.values())

            # 生成参数列表
            param_list = []
            for param in parameters:
                if param.default == inspect.Parameter.empty:
                    param_list.append(param.name)
                else:
                    param_list.append(f"{param.name}={param.default}")

            param_str = ", ".join(param_list)

            # 生成调用函数
            # module_name = method.__module__.rsplit('.', 1)[1]
            f.write(f"def {method_name}({param_str}):\n")
            f.write(f"    return {method.__module__}.{method_name}({param_str})\n\n\n")

    print(f"Entry module generated: {output_file}")


def generate_reload_module(package_names: list, output_file: str = "hot_reload.py"):
    all_module = []
    for package_name in package_names:
        modules = get_modules(package_name)
        all_module.extend(modules)
    with open(output_file, "w", encoding="utf-8") as f:
        f.write("# Auto-generated reload module\n\n")
        # import
        f.write(f"import importlib\n")
        for module in all_module:
            f.write(f"import {module}\n")

        # main()
        f.write("def main():\n")
        for module in all_module:
            f.write(f"    importlib.reload({module})\n")

    print(f"Reload module generated: {output_file}")


# 示例：扫描多个包并生成入口模块
if __name__ == "__main__":
    entry_package = ["parts", "rig"]  # 替换为你的包名
    generate_entry_module(entry_package)
    reload_package = ["parts", "rig", "custom_shelf", "system_biped"]
    generate_reload_module(reload_package)
