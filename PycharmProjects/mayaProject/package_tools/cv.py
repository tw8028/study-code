import pymel.core as pm


def set_color(index, *objs):
    for i in objs:
        shapes = pm.listRelatives(i, s=True)
        for j in shapes:
            j.overrideEnabled.set(1)
            j.overrideColor.set(index)
            j.overrideColor.set(index)


def cube(name, r=2):
    p = [(-1, -1, 1), (1, -1, 1), (1, -1, -1), (-1, -1, -1), (-1, -1, 1), (-1, 1, 1), (1, 1, 1), (1, -1, 1),
         (1, 1, 1), (1, 1, -1), (1, -1, -1), (1, 1, -1), (-1, 1, -1), (-1, -1, -1), (-1, 1, -1), (-1, 1, 1)]
    return pm.curve(n=name, d=1, p=[(r * x[0], r * x[1], r * x[2]) for x in p], k=range(16))


def root(name):
    p = [(0, -10, 15), (0, -10, -15), (0, 10, -15), (0, 15, 0), (0, 10, 15), (0, -10, 15)]
    cv = pm.curve(d=1, p=p, k=range(6), n=name)
    set_color(24, cv)
    return cv


def pelvis(name):
    p = [(-22.2, 15.7, 3.1), (-22.2, 15.7, -3.1), (-11.8, 17.9, -6.8), (-8.1, 12.5, -17.4), (-4.2, 1.3, -23.3),
         (-2.3, -10.5, -19.0), (-4.4, -15.4, -6.8), (-9.8, -16.9, 0.0), (-4.4, -15.4, 6.8), (-2.3, -10.5, 19.0),
         (-4.2, 1.3, 23.3), (-8.1, 12.5, 17.4), (-11.8, 17.9, 6.8), (-22.2, 15.7, 3.1)]
    cv = pm.curve(d=1, p=p, k=range(14), n=name)
    set_color(21, cv)
    return cv


def spine1(name):
    cv = pm.circle(name=name, nr=(1, 0, 0), c=(5, 2, 0), r=10, ch=False)
    set_color(21, cv)
    return cv


def spine2(name):
    cv = pm.circle(name=name, nr=(1, 0, 0), c=(5, 2, 0), r=10, ch=False)
    set_color(21, cv)
    return cv


def chest(name):
    p = [(0.0, -16.6, 14.9), (16.8, -12.6, 11.2), (16.8, 4.1, 11.2), (0.0, 8.7, 14.9), (0.0, 12.2, 0.0),
         (16.8, 6.4, 0.0), (16.8, 4.1, -11.2), (0.0, 8.7, -14.9), (0.0, -16.6, -14.9), (16.8, -12.6, -11.2),
         (16.8, -16.0, 0.0), (0.0, -21.8, 0.0), (0.0, -16.6, 14.9), (16.8, -12.6, 11.2), (16.8, -16.0, 0.0),
         (0.0, -21.8, 0.0), (0.0, -16.6, -14.9), (16.8, -12.6, -11.2), (16.8, 4.1, -11.2), (0.0, 8.7, -14.9),
         (0.0, 12.2, 0.0), (16.8, 6.4, 0.0), (16.8, 4.1, 11.2), (0.0, 8.7, 14.9), (0.0, -16.6, 14.9)]
    cv = pm.curve(name=name, d=1, p=p, k=range(25))
    set_color(21, cv)
    return cv


def neck(name):
    cv = pm.circle(name=name, nr=(1, 0, 0), c=(3, 1, 0), r=6, ch=False)
    set_color(21, cv)
    return cv


def head(name):
    p = [(0, -4, 5), (16, -4, 5), (16, -4, -5), (0, -4, -5), (0, -4, 5), (0, 10, 5), (0, 10, -5), (16, 10, -5),
         (16, 10, 5), (0, 10, 5), (0, 10, -5), (0, -4, -5), (16, -4, -5), (16, 10, -5), (16, 10, 5), (16, -4, 5)]
    cv = pm.curve(d=1, p=p, k=range(16), n=name)
    set_color(21, cv)
    return cv


def scapula(name):
    p = [(15.4, 1.4, 10.4), (15.5, -6.2, 9.0), (9.1, -8.3, 9.7), (5.2, -0.4, 11.5), (5.1, 7.3, 3.1),
         (13.7, 9.0, -3.2), (13.9, 7.6, 5.9), (15.4, 1.4, 10.4), (5.2, -0.4, 11.5)]
    points = p if '_r_' in name else [(-x[0], -x[1], -x[2]) for x in p]
    color = 13 if '_r_' in name else 6
    cv = pm.curve(d=1, p=points, k=range(9), n=name)
    set_color(color, cv)
    return cv


def pole(name):
    p = [(-1, 0, 0), (0, 0, -1), (1, 0, 0), (0, 0, 1), (-1, 0, 0), (0, 1, 0), (1, 0, 0), (0, -1, 0), (-1, 0, 0),
         (0, 0, -1), (0, 1, 0), (0, 0, 1), (0, -1, 0), (0, 0, -1)]
    cv = pm.curve(d=1, p=p, k=range(14), n=name)
    color = 13 if '_r_' in name else 6
    set_color(color, cv)
    return cv


def hand(name):
    color = 13 if '_r_' in name else 6
    p = [(0.6, 6.6, -1.3), (0.6, -5.2, -1.3), (0.6, -5.2, 3.4), (0.6, 0.0, 6.1), (0.6, 6.6, 4.4), (0.6, 6.6, -1.3),
         (0.6, 6.6, 4.4), (11.1, 8.8, 4.1), (12.5, 0.0, 5.3), (0.6, 0.0, 6.1), (0.6, -5.2, 3.4), (11.1, -6.0, 2.7),
         (12.5, 0.0, 5.3), (11.1, -6.0, 2.7), (11.1, -6.0, -0.5), (0.6, -5.2, -1.3)]
    points = p if '_r_' in name else [(-x[0], -x[1], -x[2]) for x in p]
    cv = pm.curve(d=1, p=points, k=range(16), n=name)
    set_color(color, cv)
    return cv


def heel(name):
    color = 13 if '_r_' in name else 6
    p1 = [(3.2, 0.0, 0.8), (-3.2, 0.0, 0.6), (-5.9, 0.0, 19.6), (-5.6, 0.0, 26.3), (-0.0, 0.0, 31.1),
          (4.4, 0.0, 28.1), (5.8, 0.0, 21.2), (3.2, 0.0, 0.8)]
    points1 = p1 if '_r_' in name else [(-x[0], x[1], x[2]) for x in p1]
    k1 = range(8)
    p2 = [(-6.1, 2.2, 18.3), (-3.4, 5.0, -0.2), (2.9, 5.0, 0.4), (5.3, 2.7, 16.5)]
    points2 = p2 if '_r_' in name else [(-x[0], x[1], x[2]) for x in p2]
    k2 = range(4)
    cv1 = pm.curve(d=1, p=points1, k=k1, n=name)
    cv2 = pm.curve(d=1, p=points2, k=k2, n=name)
    pm.parent(pm.listRelatives(cv2, s=True)[0], cv1, add=True, s=True)
    pm.delete(cv2)
    set_color(color, cv1)
    return cv1


def sole(name):
    p = [(-4, 0, -5), (-6, 0, 1), (0, 0, 5), (6, 0, 1), (5, 0, -5), (-4, 0, -5)]
    points = p if '_r_' in name else [(-x[0], x[1], x[2]) for x in p]
    color = 20 if '_r_' in name else 18
    cv = pm.curve(d=1, p=points, k=range(6), n=name)
    set_color(color, cv)
    return cv


def tip(name):
    p = [(-0.9, 1.8, 0.4), (-1.3, 1.0, 0.7), (-1.4, 0.1, 0.7), (-0.0, 0.1, 1.4), (1.4, 0.1, 1.1), (1.3, 1.0, 0.9),
         (0.9, 1.8, 0.6), (0.0, 1.9, 0.7), (-0.9, 1.8, 0.4)]
    points = p if '_r_' in name else [(-x[0], x[1], x[2]) for x in p]
    color = 20 if '_r_' in name else 18
    cv = pm.curve(d=1, p=points, k=range(9), n=name)
    set_color(color, cv)
    return cv


def ankle(name):
    p = [(-1.9, 7.6, -5.3), (0.2, 8.0, -4.6), (2.6, 7.4, -5.2), (2.5, 6.1, -3.6), (2.3, 4.6, -0.6),
         (0.1, 5.2, -0.7), (-1.9, 4.6, -1.0), (-2.1, 6.1, -3.9), (-1.9, 7.6, -5.3)]
    points = p if '_r_' in name else [(-x[0], x[1], x[2]) for x in p]
    color = 20 if '_r_' in name else 18
    cv = pm.curve(d=1, p=points, k=range(9), n=name)
    set_color(color, cv)
    return cv


def toes(name):
    p = [(1.6, 4.0, 0.8), (-0.1, 4.5, 0.7), (-1.6, 4.0, 0.4), (-1.4, 3.0, 2.9), (-1.2, 2.5, 4.2), (-0.2, 2.6, 4.6),
         (0.8, 2.5, 4.5), (1.1, 3.0, 3.2), (1.6, 4.0, 0.8)]
    points = p if '_r_' in name else [(-x[0], x[1], x[2]) for x in p]
    color = 20 if '_r_' in name else 18
    cv = pm.curve(d=1, p=points, k=range(9), n=name)
    set_color(color, cv)
    return cv


def finger(name):
    cv = pm.circle(nr=(1, 0, 0), c=(0, 0, 0), r=2, n=name, ch=False)
    color = 20 if '_r_' in name else 18
    set_color(color, cv)
    return cv


def square(name):
    return pm.curve(n=name, d=1, p=[(0, 6, 6), (0, -6, 6), (0, -6, -6), (0, 6, -6), (0, 6, 6)], k=range(5))
