import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.time.Duration;
import java.time.Instant;

import static java.lang.Integer.valueOf;
import static java.lang.Math.*;
import static java.lang.System.err;

/**
 * Special thanks to Paul Heckbert
 * <p/>
 * http://tproger.ru/translations/business-card-raytracer
 * <p/>
 * Java port
 * <p/>
 * 4-SEP-2015 - (mayton) In beginning...
 * 5-SEP-2015 - (mayton) changes
 * 6-SEP-2015 - (mayton) changes
 * 2-MAR-2016 - (mayton) constants up to 1.7 JDK
 * 20-JUN-2016 - (mayton) I/O has been improoved acc. to Java8.
 *                        System clock usage has been inprooved acc. to Java8
 */

public class CardRaytracer {

    class VectorBox {

        public Vector value;

        public VectorBox(Vector value) {
            this.value = value;
        }
    }

    class DoubleBox {

        public double value;

        public DoubleBox(double value) {
            this.value = value;
        }
    }

    static final class Vector {

        public final double x, y, z;

        public Vector(double x, double y, double z) {
            this.x = x;
            this.y = y;
            this.z = z;
        }

        public Vector sum(Vector r) {
            return new Vector(x + r.x, y + r.y, z + r.z);
        }

        public Vector prod(double r) {
            return new Vector(x * r, y * r, z * r);
        }

        public double sprod(Vector r) {
            return x * r.x + y * r.y + z * r.z;
        }

        public Vector vprod(Vector r) {
            return new Vector(y * r.z - z * r.y,
                    z * r.x - x * r.z,
                    x * r.y - y * r.x);
        }

        public Vector norm() {
            // return *this * (1 / sqrt(*this % *this));
            return this.prod(1.0 / sqrt(this.sprod(this)));
        }

    }


    static final int WIDTH = 512;
    static final int HEIGHT = 512;
    static final int SUB_SAMPLES = 64;

    // Position vectors:
    static final Vector ZERO_VECTOR            = new Vector(0.0,0.0,0.0);
    static final Vector Z_ORTHO_VECTOR         = new Vector(0.0,0.0,1.0);
    static final Vector CAMERA_ASPECT_VECTOR   = new Vector(17.0, 16.0, 8.0);
    static final Vector CAMERA_DEST_VECTOR     = new Vector(-6.0, -16.0, 0.0);

    // Color vectors:
    static final Vector COLOR_CELL1_VECTOR     = new Vector(3.0, 1.0, 1.0);
    static final Vector COLOR_CELL2_VECTOR     = new Vector(3.0, 3.0, 3.0);
    static final Vector COLOR_DARK_GRAY_VECTOR = new Vector(13.0, 13.0, 13.0);
    static final Vector COLOR_SKY              = new Vector(0.7, 0.6, 1.0);

    int width  = WIDTH;
    int height = HEIGHT;

    OutputStream out;

    static final int G[] = {
            0b00111100011100010010,
            0b01000100100000010100,
            0b01000100100000011000,
            0b00111100111110010100,
            0b00000100100010010010,
            0b00000100100010010001,
            0b00111000011100010000,
            0b00000000000000010000,
            0b00000000000000010000
    };

    static final int M = 1_048_576; // 2^20
    static final int J = 2_045;
    int oldI = 12357;

    double Random() {
        oldI = (oldI * J + 1) % M;
        return (double) oldI / M;
    }

    int tracer(final Vector o,final Vector d,final DoubleBox t,final VectorBox n) {
        t.value = 1e9;
        int m = 0;
        double p = -o.z / d.z;

        if (0.01 < p) {
            t.value = p;
            n.value = Z_ORTHO_VECTOR;
            m = 1;
        }

        for (int k = 18; k >= 0; k--) {
            for (int j = 8; j >= 0; j--) {
                // if (G[j] & 1 << k)
                if ((G[j] & 1 << k) != 0) {
                    // Vector p = o + Vector(-k, 0, -j - 4);
                    Vector _p = o.sum(new Vector(-k, 0.0, -j - 4.0));
                    // double b = p % d;
                    double b = _p.sprod(d);
                    // double c = p % p - 1;
                    double c = _p.sprod(_p) - 1.0;
                    // double q = b * b - c;
                    double q = b * b - c;
                    if (q > 0) {
                        double s = -b - sqrt(q);
                        if (s < t.value && s > 0.01) {
                            t.value = s;
                            // n = !(p + d * t);
                            n.value = (_p.sum(d.prod(t.value))).norm();
                            m = 2;
                        }
                    }
                }
            }
        }
        return m;
    }


    /**
     *
     * @param o
     * @param d
     * @return Color of sample
     */
    Vector sampler(final Vector o,final Vector d) {
        DoubleBox t = new DoubleBox(0.0);
        VectorBox n = new VectorBox(ZERO_VECTOR);
        int m = tracer(o, d, t, n);

        if (m == 0) {
            // return Vector(.7, .6, 1) * pow(1 - d.z, 4);
            return COLOR_SKY.prod(pow(1.0 - d.z, 4));
        }
        // Vector h = o + d * t;
        Vector h = o.sum(d.prod(t.value));

        // Vector l = !(Vector(9 + Random(), 9 + Random(), 16) + h * -1);
        Vector l = new Vector(9.0 + Random(), 9.0 + Random(), 16.0).sum(h.prod(-1.0)).norm();

        // Vector r = d + n * (n % d * -2);
        Vector r = d.sum(n.value.prod(n.value.sprod(d) * -2.0));
        // double b = l % n;
        double b = l.sprod(n.value);
        if (b < 0 || tracer(h, l, t, n) != 0) {
            b = 0;
        }
        // double p = pow(l % r * (b > 0), 99);
        double p = pow(l.sprod(r) * (b > 0 ? 1.0 : 0.0), 99.0);
        if ((m & 1) != 0) {
            // h = h * .2;
            h = h.prod(0.2);
            // return ((int) (ceil(h.x) + ceil(h.y)) & 1 ?
            //              Vector(3, 1, 1) :
            //              Vector(3, 3, 3)) * (b * .2 + .1);
            return ((((int) (ceil(h.x) + ceil(h.y)) & 1) != 0) ?
                    COLOR_CELL1_VECTOR :
                    COLOR_CELL2_VECTOR).prod(b * 0.2 + 0.1);
        }
        // return Vector(p, p, p) + sampler(h, r) * .5;
        return new Vector(p, p, p).sum(sampler(h, r).prod(0.5));
    }

    public CardRaytracer(OutputStream out, int width, int height) {
        this.width = width;
        this.height = height;
        this.out = out;
    }

    public CardRaytracer(OutputStream out) {
        this.out = out;
    }

    public void process() throws IOException {
        PrintWriter wr = new PrintWriter(out);
        wr.printf("P6 %d %d 255 ", width, height);
        wr.flush();
        // Vector g = !Vector(-6, -16, 0);
        Vector g = CAMERA_DEST_VECTOR.norm();
        // Vector a = !(Vector(0, 0, 1) ^ g) * .002;
        Vector a = (Z_ORTHO_VECTOR.vprod(g)).norm().prod(0.002);
        // Vector b = !(g ^ a) * .002;
        Vector b = g.vprod(a).norm().prod(0.002);
        // Vector c = (a + b) * -256 + g;
        Vector c = a.sum(b).prod(-256.0).sum(g);
        for (int y = height - 1; y >= 0; y--) {
            for (int x = width - 1; x >= 0; x--) {
                Vector p = COLOR_DARK_GRAY_VECTOR;
                for (int r = 0; r < SUB_SAMPLES; r++) {
                    //Vector t = a * (Random() - .5) * 99 + b * (Random() - .5) * 99;
                    Vector t = a.prod(Random() - 0.5).prod(99.0).sum(b.prod(Random() - 0.5).prod(99.0));
                    //p = sampler(Vector(17, 16, 8) + t,
                    //           !(t * -1 + (a * (Random() + x) + b * (y + Random()) + c) * 16)) * 3.5 + p;
                    p = sampler(CAMERA_ASPECT_VECTOR.sum(t),
                            t.prod(-1.0).sum(a.prod(Random() + x).sum(b.prod(Random() + y)).sum(c).prod(16.0)).norm()
                    ).prod(3.5).sum(p);
                }
                int R = (int) p.x;
                int G = (int) p.y;
                int B = (int) p.z;
                out.write(R);
                out.write(G);
                out.write(B);
            }
        }
        out.flush();
    }

    public static void main(String[] args) throws Exception {
        Instant start = Instant.now();
        if (args.length == 0) {
            new CardRaytracer(System.out).process();
            err.printf("Elapsed time : %d sec\n",Duration.between(start,Instant.now()).toMillis() / 1000);
            System.exit(1);
        } else if (args.length == 1) {
            OutputStream os = Files.newOutputStream(Paths.get(args[0]));
            new CardRaytracer(os).process();
            err.printf("Elapsed time : %d sec\n",Duration.between(start,Instant.now()).toMillis() / 1000);
            System.exit(2);
        } else if (args.length == 3) {
            OutputStream os = Files.newOutputStream(Paths.get(args[0]));
            new CardRaytracer(os, valueOf(args[1]), valueOf(args[2])).process();
            err.printf("Elapsed time : %d sec\n",Duration.between(start,Instant.now()).toMillis() / 1000);
            System.exit(2);
        }
        System.exit(0);
    }

}
