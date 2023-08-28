#!/usr/bin/python
# -*- coding:utf-8 -*-
import pymel.core as pm
import sys

if not pm.commandPort(":4434", query=True):
    pm.commandPort(name=":4434")

sys.path.append(r'D:\github\study-code\PycharmProjects\mayaProject')