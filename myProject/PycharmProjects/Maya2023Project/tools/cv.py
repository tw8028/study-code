import pymel.core as pm


def _create(name, radius, points):
    knot = list(range(len(points)))
    point = [tuple([radius * x for x in i]) for i in points]
    return pm.curve(n=name, d=1, p=point, k=knot)


def cube(name='cube', radius=10):
    points = [(-1, -1, 1), (1, -1, 1), (1, -1, -1), (-1, -1, -1), (-1, -1, 1), (-1, 1, 1), (1, 1, 1), (1, -1, 1),
              (1, 1, 1), (1, 1, -1), (1, -1, -1), (1, 1, -1), (-1, 1, -1), (-1, -1, -1), (-1, 1, -1), (-1, 1, 1)]
    return _create(name, radius, points)


def ball(name='boll', radius=1):
    points = [(-0.0, 0.0, 1.0), (-0.7, -0.0, 0.7), (-1.0, 0.0, 0.0), (-0.7, 0.0, -0.7), (0.0, 0.0, -1.0),
              (0.7, 0.0, -0.7), (1.0, -0.0, -0.0), (0.7, -0.0, 0.7), (-0.0, -0.0, 1.0), (0.0, -0.7, 0.7),
              (-0.0, -1.0, -0.0), (0.0, -0.7, -0.7), (0.0, 0.0, -1.0), (-0.0, 0.7, -0.7), (0.0, 1.0, 0.0),
              (-0.0, 0.7, 0.7), (-0.0, -0.0, 1.0), (0.0, -0.7, 0.7), (0.0, -1.0, 0.0), (0.7, -0.7, -0.0),
              (1.0, -0.0, 0.0), (0.7, 0.7, 0.0), (-0.0, 1.0, -0.0), (-0.7, 0.7, 0.0), (-1.0, 0.0, -0.0),
              (-0.7, -0.7, -0.0), (0.0, -1.0, 0.0)]
    return _create(name, radius, points)


def rhombus(name='rhombus', radius=10):
    points = [(-1, 0, 0), (0, 0, -1), (1, 0, 0), (0, 0, 1), (-1, 0, 0), (0, 1, 0), (1, 0, 0), (0, -1, 0),
              (-1, 0, 0), (0, 0, -1), (0, 1, 0), (0, 0, 1), (0, -1, 0), (0, 0, -1)]
    return _create(name, radius, points)


if __name__ == '__main__':
    sl = pm.selected()
