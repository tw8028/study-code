import pymel.core as pm


def create(name, points, radius):
    new_points = points
    return pm.curve(n=name, d=1, p=[tuple(radius * x for x in i) for i in points], k=range(len(points)))
