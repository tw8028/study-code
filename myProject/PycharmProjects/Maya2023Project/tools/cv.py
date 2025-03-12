import pymel.core as pm
import tools.attr as attr


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


def connect_line(obj_a, obj_b):
    name_a = 'loc__' + obj_a.split('__', 1)[1]
    name_b = 'loc__' + obj_b.split('__', 1)[1]
    name_line = 'line__' + obj_a.split('__', 1)[1]
    point1 = pm.spaceLocator(n=name_a)
    pm.pointConstraint(obj_a, point1)
    point2 = pm.spaceLocator(n=name_b)
    pm.pointConstraint(obj_b, point2)
    line = pm.curve(d=1, p=[(0, 0, 0), (1, 0, 0)], k=[0, 1], n=name_line)
    attr.set_display_type(line, 2)
    line_shape = line.getShape()
    point1.getShape().worldPosition[0] >> line_shape.controlPoints[0]
    point2.getShape().worldPosition[0] >> line_shape.controlPoints[1]


if __name__ == '__main__':
    sl = pm.selected()
