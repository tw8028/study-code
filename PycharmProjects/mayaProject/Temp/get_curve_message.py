import pymel.core as pm


def get_curve_message():
    obj = pm.selected()[0]
    n = obj.controlPoints.get(size=True)
    print(n)
    k = range(n)
    p = [(pm.pointPosition(obj.cv[x])[0], pm.pointPosition(obj.cv[x])[1], pm.pointPosition(obj.cv[x])[2]) for x in k]
    round_p = [(round(x[0], 1), round(x[1], 1), round(x[2], 1)) for x in p]
    print(round_p)

if __name__ == '__main__':
    get_curve_message()
