import pymel.core as pm


def cube(name, r=1):
    points = [(-1, -1, 1), (1, -1, 1), (1, -1, -1), (-1, -1, -1), (-1, -1, 1), (-1, 1, 1), (1, 1, 1), (1, -1, 1),
              (1, 1, 1), (1, 1, -1), (1, -1, -1), (1, 1, -1), (-1, 1, -1), (-1, -1, -1), (-1, 1, -1), (-1, 1, 1)]
    # return pm.curve(n=name, d=1, p=[(r * x[0], r * x[1], r * x[2]) for x in p], k=range(16))
    return pm.curve(n=name, d=1, p=[tuple(r * x for x in i) for i in points], k=range(16))


def rhomb(name, r=1):
    points = [(-1, 0, 0), (0, 0, -1), (1, 0, 0), (0, 0, 1), (-1, 0, 0), (0, 1, 0), (1, 0, 0), (0, -1, 0), (-1, 0, 0),
              (0, 0, -1), (0, 1, 0), (0, 0, 1), (0, -1, 0), (0, 0, -1)]
    return pm.curve(n=name, d=1, p=[tuple(r * x for x in i) for i in points], k=range(14))
