#!/usr/bin/python
###
### Special thanks to Paul Heckbert
###
### http://tproger.ru/translations/business-card-raytracer
###
__author__ = 'ziv'

from math import sqrt, ceil
from random import random
import sys
import cProfile

WIDTH = 512
HEIGHT = 512
NRAYS = 64  # 64
BRIGHTNESS = 1  # 64./NRAYS/6
START_REAL_RENDERING_FROM = 0  # 240
UNITTESTME = False

# This class holds simple value of `float' type.
# The class is needed to pass a float value into a function with 'by reference' semantics
# (the value changed inside the function is visible as a side effect outside the function.
class Double:
    def __init__(self, v=0.):
        self.value = float(v)

    def __str__(self):
        return '({0})'.format(self.value)


class Vector:
    def __init__(self, x=0.0, y=0.0, z=0.0):
        self.x = x
        self.y = y
        self.z = z

    def __str__(self):
        return '({0},{1},{2})'.format(self.x, self.y, self.z)

    def __add__(self, r):
        return Vector(self.x + r.x, self.y + r.y, self.z + r.z)

    def assign(self, r):
        self.x = r.x
        self.y = r.y
        self.z = r.z
        return self

    def __mul__(self, r):
        return Vector(self.x * r, self.y * r, self.z * r)

    def __div__(self, r):
        return Vector(self.x / r, self.y / r, self.z / r)

    def __mod__(self, r):
        return self.x * r.x + self.y * r.y + self.z * r.z

    def __xor__(self, r):
        return Vector(self.y * r.z - self.z * r.y, self.z * r.x - self.x * r.z, self.x * r.y - self.y * r.x)

    def __invert__(self):
        return self * (1 / sqrt(self % self))


def assertEquals(e, v, d=0.0001):
    assert abs(v - e) <= d, '%g is not in range %g+-%g [%g..%g]' % (v, e, d, e-d, e+d)


def testVectorInit():
    a = Vector()
    assertEquals(0.0, a.x, 0.000000001)
    assertEquals(0.0, a.y, 0.000000001)
    assertEquals(0.0, a.z, 0.000000001)

    b = Vector(1.0, 2.0, 3.0)
    assertEquals(1.0, b.x, 0.000000001)
    assertEquals(2.0, b.y, 0.000000001)
    assertEquals(3.0, b.z, 0.000000001)


def testSum():
    a = Vector(3.0, 4.0, 5.0)
    b = Vector(-1.0, 7.0, -11.0)
    s = a + b
    assertEquals(2.0, s.x)
    assertEquals(11.0, s.y)
    assertEquals(-6.0, s.z)


def testMul():
    a = Vector(3.0, 4.0, 5.0)
    b = a * 4.0
    assertEquals(12.0, b.x)
    assertEquals(16.0, b.y)
    assertEquals(20.0, b.z)


def testNormalization():
    #a = Vector(1.4142135623, 1.4142135623, 1.4142135623)
    a = Vector(100, 100, 100)
    b = ~a
    assertEquals(0.57, b.x, 0.1)
    assertEquals(0.57, b.y, 0.1)
    assertEquals(0.57, b.z, 0.1)


def testVector():
    testVectorInit()
    testSum()
    testMul()
    testNormalization()


G = [
    0x0003C712,  # 00111100011100010010
    0x00044814,  # 01000100100000010100
    0x00044818,  # 01000100100000011000
    0x0003CF94,  # 00111100111110010100
    0x00004892,  # 00000100100010010010
    0x00004891,  # 00000100100010010001
    0x00038710,  # 00111000011100010000
    0x00000010,  # 00000000000000010000
    0x00000010,  # 00000000000000010000
]


def tracer(o, d, t, n):
    """
    Vector o, Vector d, Double t, Vector & n
    """
    t.value = 1e9
    m = 0
    p = -o.z / d.z
    if 0.01 < p:
        t.value = p
        n.assign(Vector(0, 0, 1))
        m = 1
    for k in range(18, -1, -1):
        for j in range(8, -1, -1):
            if G[j] & (1 << k):
                p = o + Vector(-k, 0, -j - 4)
                b = p % d
                c = p % p - 1
                q = b * b - c
                if q > 0:
                    s = -b - sqrt(q)
                    if t.value > s > .01:
                        t.value = s
                        n.assign(~(p + d * t.value))
                        m = 2
    return m


def sampler(o, d):
    """
    Vector o, Vector d
    """
    t = Double(0.)
    n = Vector()
    m = tracer(o, d, t, n)
    if m == 0:
        return Vector(.7, .6, 1) * pow(1 - d.z, 4)

    h = o + d * t.value
    l = ~(Vector(9 + random(), 9 + random(), 16) + h * -1)
    r = d + n * (n % d * -2)
    b = l % n
    if b < 0 or tracer(h, l, t, n):
        b = 0
    p = pow(l % r * (b > 0), 99)
    if m == 1:
        h = h * 0.2
        return (Vector(3, 1, 1) if (int(ceil(h.x) + ceil(h.y)) & 1) else Vector(3, 3, 3)) * (b * 0.2 + 0.1)
    return Vector(p, p, p) + sampler(h, r) * 0.5


def main():
    out = sys.stdout
    if len(sys.argv) > 1:
        out = open(sys.argv[1], mode='w')
    out.write("P6 %d %d 255 " % (WIDTH, HEIGHT))
    g = ~Vector(-6, -16, 0)
    a = ~(Vector(0, 0, 1) ^ g) * 0.002
    b = ~(g ^ a) * 0.002
    c = (a + b) * -256 + g
    for y in range(HEIGHT-1, -1, -1):
        # BEGIN ziv temp debug hack
        if y > HEIGHT - START_REAL_RENDERING_FROM:
            for x in range(WIDTH-1, -1, -1):
                out.write("%c%c%c" % (0, 0, 0))
        else:
        # END ziv temp debug hack
            for x in range(WIDTH-1, -1, -1):
                p = Vector(13, 13, 13)
                for r in range(NRAYS):
                    t = a * (random() - 0.5) * 99 + b * (random() - 0.5) * 99
                    p = sampler(Vector(17, 16, 8) + t, ~(t * -1 + (a * (random() + x) + b * (y + random()) + c) * 16)) * 3.5 + p
                p = p * BRIGHTNESS
                out.write("%c%c%c" % (int(p.x), int(p.y), int(p.z)))
#                out.flush()
    out.close()


if __debug__:
    print(Vector())
    print(Vector(1, 2, 3))
    print(Vector(1, 1, 1) + Vector(1, 1, 1))
    print(Vector(1, 1, 1) * 3.1415)
    print(Vector(1, 1, 1) % Vector(2, 2, 2))
    print(Vector(1, 1, 1) ^ Vector(2, 2, 2))
    print(~Vector(1, 1, 1))
    testVector()


if len(sys.argv) > 2 and sys.argv[2] == '--profile':
    cProfile.run('main()')
else:
    main()

