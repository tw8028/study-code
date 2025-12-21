# 自定义maya工具集合

## 项目配置

### Maya 设置

1. 语言修改，安装目录：resources/110n/en_US
2. maya.env
    - PYTHONPATH=D:\GitHub\study-code\myProject\PycharmProjects\Maya2023Project;
    - file path = C:\Users\Administrator\Documents\maya\2023\scripts
3. userSetup.py
    - file path = C:\Users\Administrator\Documents\maya\2023\scripts

### pycharm 设置

1. Python Interpreter：maya安装目录 "D:\Program Files\Autodesk\Maya2023\bin\mayapy.exe"
2. Project Structure: 添加项目位置 "D:\GitHub\study-code\myProject\PycharmProjects\Maya2023Project"

## PyMEl

### 常用PyNode方法

- pm.selected()[0]
- obj_nd.name()
- obj_nd.rename('newName')
- obj_nd.getShape()
- obj_nd.getParent()
- obj_nd.getChildren() 返回列表，第一个是形状节点

### PyNode属性

- obj_nd.visibility.get()
- obj_nd.translate.set([4,5,6])
- obj_nd.translateX.set(1)