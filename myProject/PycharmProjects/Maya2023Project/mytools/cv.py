import pymel.core as pm
import mytools.attr as attr


def _create(name, radius, points):
    scaled_points = [(radius * x, radius * y, radius * z) for x, y, z in points]
    knot = list(range(len(points)))
    return pm.curve(name=name, degree=1, point=scaled_points, knot=knot)


def create(*, name, shape, radius):
    if shape == 'cube':
        points = [(-1, -1, 1), (1, -1, 1), (1, -1, -1), (-1, -1, -1), (-1, -1, 1), (-1, 1, 1), (1, 1, 1), (1, -1, 1),
                  (1, 1, 1), (1, 1, -1), (1, -1, -1), (1, 1, -1), (-1, 1, -1), (-1, -1, -1), (-1, 1, -1), (-1, 1, 1)]
        return _create(name, radius, points)

    elif shape == 'ball':
        points = [(-0.0, 0.0, 1.0), (-0.7, -0.0, 0.7), (-1.0, 0.0, 0.0), (-0.7, 0.0, -0.7), (0.0, 0.0, -1.0),
                  (0.7, 0.0, -0.7), (1.0, -0.0, -0.0), (0.7, -0.0, 0.7), (-0.0, -0.0, 1.0), (0.0, -0.7, 0.7),
                  (-0.0, -1.0, -0.0), (0.0, -0.7, -0.7), (0.0, 0.0, -1.0), (-0.0, 0.7, -0.7), (0.0, 1.0, 0.0),
                  (-0.0, 0.7, 0.7), (-0.0, -0.0, 1.0), (0.0, -0.7, 0.7), (0.0, -1.0, 0.0), (0.7, -0.7, -0.0),
                  (1.0, -0.0, 0.0), (0.7, 0.7, 0.0), (-0.0, 1.0, -0.0), (-0.7, 0.7, 0.0), (-1.0, 0.0, -0.0),
                  (-0.7, -0.7, -0.0), (0.0, -1.0, 0.0)]
        return _create(name, radius, points)

    elif shape == 'arrow1':
        points = [(-1.0, 2.0, 0.0), (-2.0, 2.0, 0.0), (0.0, 4.0, 0.0), (2.0, 2.0, 0.0), (1.0, 2.0, 0.0),
                  (1.0, -2.0, 0.0), (-1.0, -2.0, 0.0), (-1.0, 2.0, 0.0)]
        return _create(name, radius, points)

    elif shape == 'arrow2':
        points = [(0, 1, 0), (3, 1, 0), (3, 2, 0), (5, 0, 0), (3, -2, 0), (3, -1, 0), (-3, -1, 0), (-3, -2, 0),
                  (-5, 0, 0), (-3, 2, 0), (-3, 1, 0), (0, 1, 0)]
        return _create(name, radius, points)

    elif shape == 'cross1':
        points = [(-1, 1, 0), (-1, 3, 0), (1, 3, 0), (1, 1, 0), (3, 1, 0), (3, -1, 0), (1, -1, 0), (1, -3, 0),
                  (-1, -3, 0), (-1, -1, 0), (-3, -1, 0), (-3, 1, 0), (-1, 1, 0)]
        return _create(name, radius, points)

    elif shape == 'cross2':
        points = [(-1, 1, 0), (-1, 7, 0), (1, 7, 0), (1, 1, 0), (7, 1, 0), (7, -1, 0), (1, -1, 0), (1, -7, 0),
                  (-1, -7, 0), (-1, -1, 0), (-7, -1, 0), (-7, 1, 0), (-1, 1, 0)]
        return _create(name, radius, points)

    elif shape == 'square':
        points = [(0.0, 1.0, 1.0), (0.0, -1.0, 1.0), (0.0, -1.0, -1.0), (0.0, 1.0, -1.0), (0.0, 1.0, 1.0)]
        return _create(name, radius, points)

    elif shape == 'triangle':
        points = [(0.0, 0.0, 0.0), (-1.0, 2.0, 0.0), (1.0, 2.0, 0.0), (0.0, 0.0, 0.0), (0.0, -3.0, 0.0)]
        return _create(name, radius, points)

    else:
        return pm.circle(nr=(1, 0, 0), c=(0, 0, 0), radius=radius, n=name, ch=False)[0]


def ctrl(*, name='ctrl__', target, shape='', radius=2):
    curve = create(name=name, shape=shape, radius=radius)
    pm.parent(curve, target)
    attr.reset(curve)
    pm.parent(curve, world=True)
    return curve


def connect_line(obj_a, obj_b):
    name_id = obj_a.split('__', 1)[1]
    name_obj_a = 'loc__' + name_id
    name_obj_b = 'loc__' + obj_b.split('__', 1)[1]
    name_line = 'line__' + name_id
    name_grp = 'show__' + name_id
    point1 = pm.spaceLocator(n=name_obj_a)
    pm.pointConstraint(obj_a, point1)
    point2 = pm.spaceLocator(n=name_obj_b)
    pm.pointConstraint(obj_b, point2)
    line = pm.curve(d=1, p=[(0, 0, 0), (1, 0, 0)], k=[0, 1], n=name_line)
    line.inheritsTransform.set(0)
    attr.set_display_type(line, display_type=2)
    line_shape = line.getShape()
    var = point1.getShape().worldPosition[0] >> line_shape.controlPoints[0]
    var = point2.getShape().worldPosition[0] >> line_shape.controlPoints[1]
    grp_line = pm.group(name=name_grp, empty=True)
    pm.parent(point1, point2, line, grp_line)
    return grp_line
