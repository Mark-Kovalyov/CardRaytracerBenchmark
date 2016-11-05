import static java.lang.Math.ceil
import static java.lang.Math.pow
import static java.lang.Math.sqrt

/**
 * CardRaytrace
 *
 * @author mayton
 */

final WIDTH  = 512
final HEIGHT = 512

def width
def height

class DoubleBox {
    def value;
}

class VectorBox{
    def value;
}

class Vector {

    def x, y, z

    def plus(def r) {
        new Vector(
                x:x + r.x,
                y:y + r.y,
                z:z + r.z)
    }

    def multiply(def r) {
        new Vector(
                x:x * r,
                y:y * r,
                z:z * r)
    }

    def multiply(Vector r) {
        x * r.x + y * r.y + z * r.z;
    }

    def mod(Vector r) {
        new Vector(
                x:y * r.z - z * r.y,
                y:z * r.x - x * r.z,
                z:x * r.y - y * r.x
        )
    }

    def Vector bitwiseNegate() {
        this.prod(1.0 / sqrt(new Vector(this).sprod(new Vector(this))))
    }
}

def out

int tracer(Vector o, Vector d, DoubleBox t, VectorBox n) {
    t.value = 1e9;
    int m = 0;
    def p = -o.z / d.z;

    if (0.01 < p) {
        t.value = p;
        n.value = new Vector(x:0.0, y:0.0, z:1.0)
        m = 1;
    }

    for (k in [18..0]) {
        for (j in [8..0]) {
            if ((G(j) & 1 << k) != 0) {
                Vector _p = o + new Vector(-k, 0, -j - 4)
                def b = _p % d;
                def c = _p % _p - 1;
                def q = b * b - c;
                if (q > 0) {
                    def s = -b - sqrt(q)
                    if (s < t.value && s > 0.01) {
                        t.value = s;
                        n = ~(_p + d * t)
                        m = 2;
                    }
                }
            }
        }
    }
    m;
}

Vector sampler(Vector o, Vector d) {
    DoubleBox t = new DoubleBox(0.0)
    VectorBox n = new VectorBox(new Vector())
    int m = tracer(o, d, t, n)

    if ( m == 0 ) {
        new Vector(x:0.7, y:0.6, z:1.0) * pow(1.0 - d.z, 4.0)
    }
    Vector h = o + d * t

    Vector l = ~(new Vector(9 + Random, 9 + Random, 16) + h * -1)

    Vector r = d + n * (n % d * -2)
    def b = l % n

    if (b < 0 || tracer(h, l, t, n) != 0) {
        b = 0;
    }
    def p = pow(l % r * (b > 0), 99)
    if ((m & 1) != 0) {
        h = h * 0.2
        ((int) (ceil(h.x) + ceil(h.y)) & 1 ?
                      new Vector(x:3, y:1, z:1) :
                      new Vector(x:3, y:3, z:3)) * (b * 0.2 + 0.1)

    }
    new Vector(x:p, y:p, z:p) + sampler(h, r) * 0.5
}

public void process() throws IOException {
    def wr = new PrintWriter(out)
    wr.printf("P6 %d %d 255 ", width, height)
    wr.flush
    def g = ~(new Vector(x: -6.0, y: -16.0, z: 0.0))
    def a = ~(new Vector(x:0, y:0, z:1) ^ g) * 0.002
    def b = ~(g ^ a) * 0.002
    def c = (a + b) * -256 + g
    for (y in [height - 1..0]) {
        for (x in [width - 1..0]) {
            def p = new Vector(x:13.0, y:13.0, z:13.0)
            for (r in [0..SUB_SAMPLES] ) {
                def t = a * (Random - 0.5) * 99 + b * (Random - 0.5) * 99;
                p = sampler(new Vector(x:17.0, y:16.0, z:8) + t,
                           ~(t * -1 + (a * (Random + x) + b * (y + Random) + c) * 16)) * 3.5 + p
            }
            def R = (int) p.x
            def G = (int) p.y
            def B = (int) p.z
            out.write R
            out.write G
            out.write B
        }
    }
    out.flush
}

CardRaytracer(out) {
    this.out = out
}

public static void main(def args) {
    if (args.length == 0) {
        new CardRaytracer(out:System.out).process()
        System.exit(1)
    } else if (args.length == 1) {
        def os = new FileOutputStream((String) args(0))
        new CardRaytracer(out:os).process()
        os.close()
        System.exit(2)
    } else if (args.length == 3) {
        def os = new FileOutputStream((String) args(0))
        new CardRaytracer(out:os, width:args(1).toInteger(), height:args(2).toInteger()).process()
        os.close()
        System.exit(2)
    }
    System.exit(0)
}

