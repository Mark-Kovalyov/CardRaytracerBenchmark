import kotlinx.cinterop.alloc
import kotlinx.cinterop.memScoped
import kotlinx.cinterop.ptr
import platform.posix.ceil
import platform.posix.exit
import platform.posix.gettimeofday
import platform.posix.pow
import platform.posix.sqrt
import platform.posix.timeval

fun main(args: Array<String?>) {
    val start = now()
    CardRaytracer().process()
//    if (args.size == 0) {
//        CardRaytracer().process()
//        println("Elapsed time : ${(now() - start) / 1000} sec")
//        exit(1)
//    } else if (args.size == 1) {
//        val os: OutputStream = Files.newOutputStream(Paths.get(args[0]))
//        CardRaytracer(os).process()
//        println("Elapsed time : ${(now() - start) / 1000} sec")
//        exit(2)
//    } else if (args.size == 3) {
//        val os: OutputStream = Files.newOutputStream(Paths.get(args[0]))
//        CardRaytracer(args[1]?.toInt(), args[2]?.toInt()).process()
//        println("Elapsed time : ${(now() - start) / 1000} sec")
//        exit(2)
//    }
    exit(0)
}

class VectorBox(var value: Vector)
class DoubleBox(var value: Double)
class Vector(val x: Double, val y: Double, val z: Double) {
    fun sum(r: Vector): Vector {
        return Vector(x + r.x, y + r.y, z + r.z)
    }

    fun sum(ax: Double, ay: Double, az: Double): Vector {
        return Vector(x + ax, y + ay, z + az)
    }

    fun prod(r: Double): Vector {
        return Vector(x * r, y * r, z * r)
    }

    fun sprod(r: Vector): Double {
        return x * r.x + y * r.y + z * r.z
    }

    fun vprod(r: Vector): Vector {
        return Vector(y * r.z - z * r.y,
                z * r.x - x * r.z,
                x * r.y - y * r.x)
    }

    fun norm(): Vector {
        // return *this * (1 / sqrt(*this % *this));
        return prod(1.0 / sqrt(sprod(this)))
    }
}

class CardRaytracer {

    var width = WIDTH
    var height = HEIGHT
    var oldI = 12357
    fun Random(): Double {
        oldI = (oldI * J + 1) % M
        return oldI.toDouble() / M
    }

    fun tracer(o: Vector, d: Vector, t: DoubleBox, n: VectorBox): Int {
        t.value = 1e9
        var m = 0
        val p = -o.z / d.z
        if (0.01 < p) {
            t.value = p
            n.value = Z_ORTHO_VECTOR
            m = 1
        }
        for (k in 18 downTo 0) {
            for (j in 8 downTo 0) {
                // if (G[j] & 1 << k)
                if (G[j] and 1 shl k != 0) {
                    // Vector p = o + Vector(-k, 0, -j - 4);
                    val _p = o.sum(-k.toDouble(), 0.0, -j - 4.0)
                    // double b = p % d;
                    val b = _p.sprod(d)
                    // double c = p % p - 1;
                    val c = _p.sprod(_p) - 1.0
                    // double q = b * b - c;
                    val q = b * b - c
                    if (q > 0) {
                        val s: Double = -b - sqrt(q)
                        if (s < t.value && s > 0.01) {
                            t.value = s
                            // n = !(p + d * t);
                            n.value = _p.sum(d.prod(t.value)).norm()
                            m = 2
                        }
                    }
                }
            }
        }
        return m
    }

    /**
     *
     * @param o
     * @param d
     * @return Color of sample
     */
    fun sampler(o: Vector, d: Vector): Vector {
        val t: DoubleBox = DoubleBox(0.0)
        val n: VectorBox = VectorBox(ZERO_VECTOR)
        val m = tracer(o, d, t, n)
        if (m == 0) {
            // return Vector(.7, .6, 1) * pow(1 - d.z, 4);
            return COLOR_SKY.prod(pow(1.0 - d.z, 4.0))
        }
        // Vector h = o + d * t;
        var h = o.sum(d.prod(t.value))

        // Vector l = !(Vector(9 + Random(), 9 + Random(), 16) + h * -1);
        val l = Vector(9.0 + Random(), 9.0 + Random(), 16.0).sum(h.prod(-1.0)).norm()

        // Vector r = d + n * (n % d * -2);
        val r = d.sum(n.value.prod(n.value.sprod(d) * -2.0))
        // double b = l % n;
        var b = l.sprod(n.value)
        if (b < 0 || tracer(h, l, t, n) != 0) {
            b = 0.0
        }
        // double p = pow(l % r * (b > 0), 99);
        val p: Double = pow(l.sprod(r) * if (b > 0) 1.0 else 0.0, 99.0)
        if (m and 1 != 0) {
            // h = h * .2;
            h = h.prod(0.2)
            // return ((int) (ceil(h.x) + ceil(h.y)) & 1 ?
            //              Vector(3, 1, 1) :
            //              Vector(3, 3, 3)) * (b * .2 + .1);
            return (if ((ceil(h.x) + ceil(h.y)).toInt() and 1 != 0) COLOR_CELL1_VECTOR else COLOR_CELL2_VECTOR).prod(b * 0.2 + 0.1)
        }
        // return Vector(p, p, p) + sampler(h, r) * .5;
        return Vector(p, p, p).sum(sampler(h, r).prod(0.5))
    }

    constructor(width: Int, height: Int) {
        this.width = width
        this.height = height
    }

    constructor()

    fun process() {
        // Vector g = !Vector(-6, -16, 0);
        val g = CAMERA_DEST_VECTOR.norm()
        // Vector a = !(Vector(0, 0, 1) ^ g) * .002;
        val a = Z_ORTHO_VECTOR.vprod(g).norm().prod(0.002)
        // Vector b = !(g ^ a) * .002;
        val b = g.vprod(a).norm().prod(0.002)
        // Vector c = (a + b) * -256 + g;
        val c = a.sum(b).prod(-256.0).sum(g)
        for (y in height - 1 downTo 0) {
            for (x in width - 1 downTo 0) {
                var p = COLOR_DARK_GRAY_VECTOR
                for (r in 0 until SUB_SAMPLES) {
                    //Vector t = a * (Random() - .5) * 99 + b * (Random() - .5) * 99;
                    val t = a.prod(Random() - 0.5).prod(99.0).sum(b.prod(Random() - 0.5).prod(99.0))
                    //p = sampler(Vector(17, 16, 8) + t,
                    //           !(t * -1 + (a * (Random() + x) + b * (y + Random()) + c) * 16)) * 3.5 + p;
                    p = sampler(CAMERA_ASPECT_VECTOR.sum(t),
                            t.prod(-1.0).sum(a.prod(Random() + x).sum(b.prod(Random() + y)).sum(c).prod(16.0)).norm()
                    ).prod(3.5).sum(p)
                }
                val R = p.x.toInt()
                val G = p.y.toInt()
                val B = p.z.toInt()
            }
        }
    }

    companion object {
        const val WIDTH = 512
        const val HEIGHT = 512
        const val SUB_SAMPLES = 64

        // Position vectors:
        val ZERO_VECTOR = Vector(0.0, 0.0, 0.0)
        val Z_ORTHO_VECTOR = Vector(0.0, 0.0, 1.0)
        val CAMERA_ASPECT_VECTOR = Vector(17.0, 16.0, 8.0)
        val CAMERA_DEST_VECTOR = Vector(-6.0, -16.0, 0.0)

        // Color vectors:
        val COLOR_CELL1_VECTOR = Vector(3.0, 1.0, 1.0)
        val COLOR_CELL2_VECTOR = Vector(3.0, 3.0, 3.0)
        val COLOR_DARK_GRAY_VECTOR = Vector(13.0, 13.0, 13.0)
        val COLOR_SKY = Vector(0.7, 0.6, 1.0)
        val G = intArrayOf(
                247570,
                280596,
                280600,
                249748,
                18578,
                18577,
                231184,
                16,
                16
        )
        const val M = 1048576 // 2^20
        const val J = 2045
    }
}

fun now() = memScoped {
    val timeVal = alloc<timeval>()
    gettimeofday(timeVal.ptr, null)
    val sec = timeVal.tv_sec
    val usec = timeVal.tv_usec
    (sec * 1_000L) + (usec / 1_000L)
}