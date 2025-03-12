import pymel.core as pm


def _create(name, radius, points):
    scaled_points = [(radius * x, radius * y, radius * z) for x, y, z in points]
    knot = list(range(len(points)))
    return pm.curve(name=name, degree=1, point=scaled_points, knot=knot)


def cube(name='cube', radius=10):
    points = [(-1, -1, 1), (1, -1, 1), (1, -1, -1), (-1, -1, -1), (-1, -1, 1), (-1, 1, 1), (1, 1, 1), (1, -1, 1),
              (1, 1, 1), (1, 1, -1), (1, -1, -1), (1, 1, -1), (-1, 1, -1), (-1, -1, -1), (-1, 1, -1), (-1, 1, 1)]
    return _create(name, radius, points)


def ball(name='boll', radius=10):
    points = [(-0.0, 0.0, 1.0), (-0.7, -0.0, 0.7), (-1.0, 0.0, 0.0), (-0.7, 0.0, -0.7), (0.0, 0.0, -1.0),
              (0.7, 0.0, -0.7), (1.0, -0.0, -0.0), (0.7, -0.0, 0.7), (-0.0, -0.0, 1.0), (0.0, -0.7, 0.7),
              (-0.0, -1.0, -0.0), (0.0, -0.7, -0.7), (0.0, 0.0, -1.0), (-0.0, 0.7, -0.7), (0.0, 1.0, 0.0),
              (-0.0, 0.7, 0.7), (-0.0, -0.0, 1.0), (0.0, -0.7, 0.7), (0.0, -1.0, 0.0), (0.7, -0.7, -0.0),
              (1.0, -0.0, 0.0), (0.7, 0.7, 0.0), (-0.0, 1.0, -0.0), (-0.7, 0.7, 0.0), (-1.0, 0.0, -0.0),
              (-0.7, -0.7, -0.0), (0.0, -1.0, 0.0)]
    return _create(name, radius, points)


def arrow1(name='arrow1', radius=1):
    points = [(-1.0, 2.0, 0.0), (-2.0, 2.0, 0.0), (0.0, 4.0, 0.0), (2.0, 2.0, 0.0), (1.0, 2.0, 0.0),
              (1.0, -2.0, 0.0), (-1.0, -2.0, 0.0), (-1.0, 2.0, 0.0)]
    return _create(name, radius, points)


def arrow2(name='arrow2', radius=1):
    points = [(0, 1, 0), (3, 1, 0), (3, 2, 0), (5, 0, 0), (3, -2, 0), (3, -1, 0), (-3, -1, 0), (-3, -2, 0),
              (-5, 0, 0), (-3, 2, 0), (-3, 1, 0), (0, 1, 0)]
    return _create(name, radius, points)


def cross1(name='cross1', radius=1):
    points = [(-1, 1, 0), (-1, 3, 0), (1, 3, 0), (1, 1, 0), (3, 1, 0), (3, -1, 0), (1, -1, 0), (1, -3, 0),
              (-1, -3, 0), (-1, -1, 0), (-3, -1, 0), (-3, 1, 0), (-1, 1, 0)]
    return _create(name, radius, points)


def cross2(name='cross2', radius=1):
    points = [(-1, 1, 0), (-1, 7, 0), (1, 7, 0), (1, 1, 0), (7, 1, 0), (7, -1, 0), (1, -1, 0), (1, -7, 0),
              (-1, -7, 0), (-1, -1, 0), (-7, -1, 0), (-7, 1, 0), (-1, 1, 0)]
    return _create(name, radius, points)


def square(name='square', radius=1):
    points = [(0.0, 1.0, 1.0), (0.0, -1.0, 1.0), (0.0, -1.0, -1.0), (0.0, 1.0, -1.0), (0.0, 1.0, 1.0)]
    return _create(name, radius, points)


def triangle(name='triangle', radius=1):
    points = [(0.0, 0.0, 0.0), (-1.0, 2.0, 0.0), (1.0, 2.0, 0.0), (0.0, 0.0, 0.0), (0.0, -3.0, 0.0)]
    return _create(name, radius, points)


if __name__ == '__main__':
    sl = pm.selected()
