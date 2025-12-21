# maya.env
# PYTHONPATH=D:\GitHub\study-code\myProject\PycharmProjects\Maya2023Project;
# file path = C:\Users\Administrator\Documents\maya\2023

# userSetup.py
# file path = C:\Users\Administrator\Documents\maya\2023\scripts
# 注意语言，中文版文件位置不一样
# 改英文 resources/110n/en_US

'''
pycharm项目设置
1. Python Interpreter：maya安装目录 "D:\Program Files\Autodesk\Maya2023\bin\mayapy.exe"
2. Project Structure: 添加项目位置 "D:\GitHub\study-code\myProject\PycharmProjects\Maya2023Project"
'''

import maya.cmds as cmds

if not cmds.commandPort(":4434", query=True):  # type: ignore
    cmds.commandPort(name=":4434")  # type: ignore

# We are using the evalDeferred() command, because maya loads the userSetup.py file as it is starting,
# so we are not sure if the shelfLayout is already in place as it gets executed.
# Therefore, evalDeferred() helps us call our script after maya has been initialized.
