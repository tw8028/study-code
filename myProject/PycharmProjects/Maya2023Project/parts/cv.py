import pymel.core as pm
import parts.attr as attr
import parts.grp as grp


def _create(name, radius, points):
    scaled_points = [(radius * x, radius * y, radius * z) for x, y, z in points]
    knot = list(range(len(points)))
    return pm.curve(name=name, degree=1, point=scaled_points, knot=knot)


def cv_create(name, shape, radius: int):
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

    elif shape == 'circle':
        return pm.circle(nr=(1, 0, 0), c=(0, 0, 0), radius=radius, n=name, ch=False)[0]

    elif shape == 'circle_linear':
        return pm.circle(nr=(1, 0, 0), c=(0, 0, 0), radius=radius, n=name, ch=False, degree=1)[0]

    elif shape == 'root':
        points = [(0, -10, 15), (0, -10, -15), (0, 10, -15), (0, 15, 0), (0, 10, 15), (0, -10, 15)]
        return _create(name, radius, points)

    elif shape == 'pelvis':
        points = [(-22.2, 15.7, 3.1), (-22.2, 15.7, -3.1), (-11.8, 17.9, -6.8), (-8.1, 12.5, -17.4), (-4.2, 1.3, -23.3),
                  (-2.3, -10.5, -19.0), (-4.4, -15.4, -6.8), (-9.8, -16.9, 0.0), (-4.4, -15.4, 6.8),
                  (-2.3, -10.5, 19.0),
                  (-4.2, 1.3, 23.3), (-8.1, 12.5, 17.4), (-11.8, 17.9, 6.8), (-22.2, 15.7, 3.1)]
        return _create(name, radius, points)

    else:
        return pm.circle(nr=(1, 0, 0), c=(0, 0, 0), radius=radius, n=name, ch=False)[0]


def cv_target(name, target, shape, radius: int):
    curve = cv_create(name=name, shape=shape, radius=radius)
    pm.parent(curve, target)
    attr.zero_transform(curve)
    pm.parent(curve, world=True)
    return curve


def cv_and_zero(name, target, shape, radius: int):
    return grp.grp_zero(name='zero' + name[4:], target=cv_target(name, target, shape, radius))
