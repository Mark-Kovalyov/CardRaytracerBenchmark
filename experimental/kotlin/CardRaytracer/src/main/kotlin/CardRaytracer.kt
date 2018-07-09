import java.io.FileOutputStream
import java.io.OutputStream
import java.io.PrintWriter

import java.lang.Math.*

/**
 * Special thanks to Paul Heckbert
 * <p/>
 * http://tproger.ru/translations/business-card-raytracer
 * <p/>
 * Kotlin port
 * <p/>
 * 3-MAR-2016 - (mayton) Begin...
 * 5-MAR-2016 - (mayton) More logic has been fixed.
 */
class CardRaytracer {

    val WIDTH = 512;
    val HEIGHT = 512;
    val SUB_SAMPLES = 64;

    // Position vectors:
    val ZERO_VECTOR = Vector(0.0, 0.0, 0.0);
    val Z_ORTHO_VECTOR = Vector(0.0, 0.0, 1.0);
    val CAMERA_ASPECT_VECTOR = Vector(17.0, 16.0, 8.0);
    val CAMERA_DEST_VECTOR = Vector(-6.0, -16.0, 0.0);

    // Color vectors:
    val COLOR_CELL1_VECTOR = Vector(3.0, 1.0, 1.0);
    val COLOR_CELL2_VECTOR = Vector(3.0, 3.0, 3.0);
    val COLOR_DARK_GRAY_VECTOR = Vector(13.0, 13.0, 13.0);
    val COLOR_SKY = Vector(0.7, 0.6, 1.0);

    var width = WIDTH;
    var height = HEIGHT;

    var out: OutputStream;

    val G = intArrayOf(
            0x0003C712, // 00111100011100010010
            0x00044814, // 01000100100000010100
            0x00044818, // 01000100100000011000
            0x0003CF94, // 00111100111110010100
            0x00004892, // 00000100100010010010
            0x00004891, // 00000100100010010001
            0x00038710, // 00111000011100010000
            0x00000010, // 00000000000000010000
            0x00000010
    );

    val M: Int = 1048576; // 2^20
    val J: Int = 2045;
    var oldI: Int = 12357;

    constructor(out: OutputStream, width: Int = 512, height: Int = 512) {
        this.out    = out;
        this.width  = width;
        this.height = height;
    }

    fun Random(): Double {
        oldI = (oldI * J + 1) % M;
        return oldI.toDouble() / M;
    }

    // TODO: Fix expressions with '+','*','%' e.t.c. overloadings
    fun tracer(o: Vector, d: Vector, t: DoubleBox, n: VectorBox): Int {
        t.value = 1e9;
        var m: Int = 0;
        var p: Double = -o.z / d.z;

        if (0.01 < p) {
            t.value = p;
            n.value = Z_ORTHO_VECTOR;
            m = 1;
        }
        for (k in 18 downTo 0) {
            for (j in 8 downTo 0) {
                if (((G[j] and 1) shl k) != 0) {
                    var _p: Vector = o.plus(Vector(-k.toDouble(), 0.0, -j - 4.0));
                    var b: Double = _p.mod(d);
                    var c: Double = _p.mod(_p) - 1.0;
                    var q: Double = b * b - c;
                    if (q > 0) {
                        var s: Double = -b - Math.sqrt(q);
                        if (s < t.value && s > 0.01) {
                            t.value = s;
                            n.value = (_p.plus(d.times(t.value))).norm();
                            m = 2;
                        }
                    }
                }
            }
        }
        return m;
    }

    fun sampler(o: Vector, d: Vector): Vector {
        var t = DoubleBox(0.0);
        var n = VectorBox(ZERO_VECTOR);
        var m = tracer(o, d, t, n);

        if (m == 0) {
            return COLOR_SKY.times(Math.pow(1.0 - d.z, 4.0));
        }
        var h: Vector = o.plus(d.times(t.value));

        var l: Vector = Vector(9.0 + Random(), 9.0 + Random(), 16.0).plus(h.times(-1.0)).norm();

        var r: Vector = d.plus(n.value.times(n.value.mod(d) * -2.0));
        var b: Double = l.mod(n.value);
        if (b < 0 || tracer(h, l, t, n) != 0) {
            b = 0.0;
        }
        var p: Double = Math.pow(l.mod(r) * (if (b > 0) 1.0 else 0.0), 99.0);
        if ((m and 1) != 0) {
            h = h.times(0.2);
            return if ((((Math.ceil(h.x).toInt() + Math.ceil(h.y).toInt()) and 1) != 0))
                COLOR_CELL1_VECTOR
            else
                COLOR_CELL2_VECTOR.times(b * 0.2 + 0.1);
        }
        return Vector(p, p, p).plus(sampler(h, r).times(0.5));
    }

    fun process() {
        var wr = PrintWriter(out);
        wr.printf("P6 %d %d 255 ", width, height);
        wr.flush();
        var g: Vector = CAMERA_DEST_VECTOR.norm();
        // Vector a = !(Vector(0, 0, 1) ^ g) * .002;
        var a: Vector = ((Z_ORTHO_VECTOR.vprod(g)).norm()).times(0.002);
        // Vector b = !(g ^ a) * .002;
        var b: Vector = g.vprod(a).norm().times(0.002);
        // Vector c = (a + b) * -256 + g;
        var c: Vector = (a.plus(b)).times(-256.0).plus(g);
        for (y in height - 1 downTo 0) {
            for (x in width - 1 downTo 0) {
                var p: Vector = COLOR_DARK_GRAY_VECTOR;
                for (r in 0..SUB_SAMPLES - 1) {
                    var t: Vector = a.times(Random() - 0.5).times(99.0).plus(b.times(Random() - 0.5).times(99.0));
                    p = sampler(CAMERA_ASPECT_VECTOR.plus(t),
                            t.times(-1.0).plus(a.times(Random() + x).plus(b.times(Random() + y)).plus(c).times(16.0)).norm()
                    ).times(3.5).plus(p);
                }
                var R = p.x.toInt();
                var G = p.y.toInt();
                var B = p.z.toInt();

                out.write(R);
                out.write(G);
                out.write(B);
            }
        }
        out.flush();
    }
}

