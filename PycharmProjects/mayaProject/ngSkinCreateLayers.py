#!/usr/bin/python
# -*- coding:utf-8 -*-
import pymel.core as pm
from ngSkinTools2.api import layers, init_layers


def create_body_layers(*args):
    layers = init_layers("skinCluster1")
    layers.add("base weights")
    layers.add("spine")

    # using group to manage layers
    grp_head = layers.add("grp_head")
    layers.add("neck", parent=grp_head)
    layers.add("head", parent=grp_head)

    grp_arm = layers.add("grp_arm")
    layers.add("clavicle", parent=grp_arm)
    layers.add("upper", parent=grp_arm)
    layers.add("lower", parent=grp_arm)

    grp_hand = layers.add("grp_hand")
    layers.add("hand", parent=grp_hand)
    layers.add("thumb", parent=grp_hand)
    layers.add("index", parent=grp_hand)
    layers.add("middle", parent=grp_hand)
    layers.add("ring", parent=grp_hand)
    layers.add("pinky", parent=grp_hand)

    grp_leg = layers.add("grp_leg")
    layers.add("thigh", parent=grp_leg)
    layers.add("calf", parent=grp_leg)
    layers.add("foot", parent=grp_leg)


def main():
    if pm.window('ng_layerBuilder', ex=True):
        pm.deleteUI('ng_layerBuilder')
    with pm.window('ng_layerBuilder', wh=(280, 100)):
        with pm.columnLayout():
            pm.frameLayout('ngSkinTool layer bulider')
            with pm.columnLayout():
                pm.text('select skin mesh')
                pm.button(label='apply', c=create_body_layers)
        pm.window('ng_layerBuilder', e=True, title='layer', wh=(240, 120))
        pm.showWindow('ng_layerBuilder')


if __name__ == '__main__':
    main()
