#!/usr/bin/python
# -*- coding:utf-8 -*-
import pymel.core as pm
from ngSkinTools2.api import *


class NgLayersBuilder:
    def __init__(self, target: str):
        self.target = target
        self.layers = init_layers(target)
        self.base_layer = self.layers.add('base weights')
        self.influences = self.get_influences()

    # filter influences 排除右边的
    def get_influences(self):
        influences = target_info.list_influences(self.target)

        def is_not_right(influence):
            inf_nd = pm.PyNode(influence.path_name())
            return '_r' not in inf_nd.name()

        return list(filter(is_not_right, influences))

    def add_layer(self, name, *, parent=None, empty=False):
        layer = self.layers.add(name, parent=parent)
        if parent:
            layer.effects.configure_mirror(mirror_mask=True, mirror_weights=True)
        if empty:
            return layer

        # 匹配influences by layer name
        def has_name(inf):
            return name in pm.PyNode(inf.path_name()).name()

        influences = filter(has_name, self.influences)
        for i in influences:
            # 只接收influences index或者'mask'做为参数
            weights_list = self.base_layer.get_weights(i.logicalIndex)
            layer.set_weights(i.logicalIndex, weights_list)
        print(f'add {layer.name}')
        return layer


def click(*args):
    builder = NgLayersBuilder(pm.selected()[0].name())
    for i in ["spine", "neck", "head"]:
        builder.add_layer(i)

    arm = builder.add_layer('grp_arm', empty=True)
    for i in ["clavicle", "upperarm", "lowerarm"]:
        builder.add_layer(i, parent=arm)

    hand = builder.add_layer('grp_hand', empty=True)
    for i in ["hand", "thumb", "index", "middle", "ring", "pinky"]:
        builder.add_layer(i, parent=hand)

    leg = builder.add_layer('grp_leg', empty=True)
    for i in ["thigh", "calf", "foot"]:
        builder.add_layer(i, parent=leg)


def main():
    if pm.window('ng_layerBuilder', ex=True):
        pm.deleteUI('ng_layerBuilder')
    with pm.window('ng_layerBuilder', wh=(280, 100)):
        with pm.columnLayout():
            pm.frameLayout('ngSkinTool layer builder')
            with pm.columnLayout():
                pm.text('select skin mesh')
                pm.button(label='apply', c=click)

        pm.window('ng_layerBuilder', e=True, title='ng layer', wh=(240, 120))
        pm.showWindow('ng_layerBuilder')


if __name__ == '__main__':
    main()
