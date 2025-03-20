import math


def normalize(vector):
    sum_of_squares = vector[0] ** 2 + vector[1] ** 2 + vector[2] ** 2
    norm = math.sqrt(sum_of_squares)
    return [i / norm for i in vector]


# 已知世界位置 point_a, point_b. 计算向量 ab
def new_vector(point_a, point_b):
    x1, y1, z1 = point_a
    x2, y2, z2 = point_b
    vector_ab = (x2 - x1, y2 - y1, z2 - z1)
    return vector_ab


# 向量加法
def add_vector(vector_a, vector_b):
    x1, y1, z1 = vector_a
    x2, y2, z2 = vector_b
    sum_vector = (x2 + x1, y2 + y1, z2 + z1)
    return sum_vector


def direction_pole(point_a, point_b, point_c):
    vector_ab = new_vector(point_a, point_b)
    vector_cb = new_vector(point_c, point_b)
    vector_sum = add_vector(normalize(vector_ab), normalize(vector_cb))
    return normalize(vector_sum)
