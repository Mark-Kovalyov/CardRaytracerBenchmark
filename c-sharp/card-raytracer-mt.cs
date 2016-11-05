using System;
using System.Text;
using System.IO;
using System.Diagnostics;
using System.Collections.Generic;
using System.Threading;

namespace CardRayTracer {

    public struct Vector {

        public Double x, y, z;

        public Vector(Double a, Double b, Double c) {
            x = a;
            y = b;
            z = c;
        }

        public Vector(Vector v) {
            x = v.x;
            y = v.y;
            z = v.z;
        }

        public void Init(Double a, Double b, Double c) {
            x = a;
            y = b;
            z = c;
        }

        public void Init(Vector v1, Double m1, Vector v2, Double m2) {
            x = v1.x * m1 + v2.x * m2;
            y = v1.y * m1 + v2.y * m2;
            z = v1.z * m1 + v2.z * m2;
        }

        public void Init(Vector v) {
            x = v.x;
            y = v.y;
            z = v.z;
        }

        public void Sum(Vector v) { // +
            x += v.x;
            y += v.y;
            z += v.z;
        }

        public void Sum(Double a, Double b, Double c) { // +
            x += a;
            y += b;
            z += c;
        }

        public void Sub(Vector v) { // * -1
            x -= v.x;
            y -= v.y;
            z -= v.z;
        }

        public void Prod(Double r) { // *
            x *= r;
            y *= r;
            z *= r;
        }

        public void Norm() { // !
            Double l = Math.Sqrt(x*x + y*y + z*z);
            x /= l;
            y /= l;
            z /= l;
        }

        public Double Sprod(Vector v) { // %
            return v.x * x + v.y * y + v.z * z;
        }

        public Double Sprod() { // % this
            return x * x + y * y + z * z;
        }

        public void Vprod(Vector v) { // ^
            Double x0 = x;
            Double y0 = y;
            x = y * v.z - z * v.y;
            y = z * v.x - x0 * v.z;
            z = x0 * v.y - y0 * v.x;
        }
    };

    public class Calc {
        private Random rnd = new Random();
        private static Mutex mx_ready = new Mutex();
        private static Int32 ready = 512;
        public static MemoryStream[] res = new MemoryStream[ready];

        public Calc() {
        }


        static readonly Int32[] G = { 
            0x0003C712,  // 00111100011100010010 
            0x00044814,  // 01000100100000010100
            0x00044818,  // 01000100100000011000
            0x0003CF94,  // 00111100111110010100
            0x00004892,  // 00000100100010010010
            0x00004891,  // 00000100100010010001
            0x00038710,  // 00111000011100010000
            0x00000010,  // 00000000000000010000
            0x00000010,  // 00000000000000010000
        };

        private Int32 tracer(Vector o, Vector d, out Double t, ref Vector n) {
            t = 1e9;
            Int32 m = 0;
            Double p = -o.z / d.z;
            if (.01 < p) {
                t = p;
                n.Init(0, 0, 1);
                m = 1;
            }
            Vector vp = new Vector();
            for (Int32 k = 18; k >= 0; k--) {
                for (Int32 j = 8; j >= 0; j--) {
                    if ((G[j] & 1 << k) != 0) {
                        vp.Init(-k, 0, -j - 4);
                        vp.Sum(o);
                        Double b = vp.Sprod(d);
                        Double c = vp.Sprod() - 1;
                        Double q = b * b - c;
                        if (q > 0) {
                            Double s = -b - Math.Sqrt(q);
                            if (s < t && s > .01) {
                                t = s;
                                n.Init(vp, 1, d, t);
                                n.Norm();
                                m = 2;
                            }
                        }
                    }
                }
            }
            return m;
        }

        private Vector sampler(Vector o, Vector d, ref Vector n) {
            Double t;
            Int32 m = tracer(o, d, out t, ref n);
            if (m == 0) {
                o.Init(.7, .6, 1);
                o.Prod(Math.Pow(1 - d.z, 4));
                return o;
            }
            Vector h = new Vector();
            h.Init(o, 1, d, t);
            Vector l = new Vector(9 + rnd.NextDouble(), 9 + rnd.NextDouble(), 16);
            l.Sub(h);
            l.Norm();
            Double b = l.Sprod(n);
            if (b < 0 || tracer(h, l, out t, ref n) != 0) {
                b = 0;
            }
            Vector r = new Vector();
            r.Init(d, 1, n, n.Sprod(d) * -2);

            Double p = Math.Pow(l.Sprod(r) * ((b > 0) ? 1 : 0), 99);
            if ((m & 1) != 0) {
                h.Prod(.2);
                if (((Int32)(Math.Ceiling(h.x) + Math.Ceiling(h.y)) & 1) != 0) {
                    h.Init(3, 1, 1);
                } else {
                    h.Init(3, 3, 3);
                }
                h.Prod(b * .2 + .1);
                return h;
            }
            l = sampler(h, r, ref n);
            l.Prod(.5);
            l.Sum(p, p, p);
            return l;
        }

        public void CalcPart() {
            Vector g = new Vector(-6, -16, 0); // !new Vector(-6, -16, 0);
            g.Norm();
            Vector a = new Vector(0, 0, 1); // !(new Vector(0, 0, 1) ^ g) * .002;
            a.Vprod(g);
            a.Norm();
            a.Prod(.002);
            Vector b = new Vector(g); // !(g ^ a) * .002;
            b.Vprod(a);
            b.Norm();
            b.Prod(.002);
            Vector a99 = new Vector(a); // a * 99;
            a99.Prod(99);
            Vector b99 = new Vector(b); // b * 99;
            b99.Prod(99);
            Vector c = new Vector(a); // (a + b) * -256 + g;
            c.Sum(b);
            c.Prod(-256);
            c.Sum(g);
            Vector k = new Vector();
            Vector k2 = new Vector();
            Vector p = new Vector();
            Vector t = new Vector();
            Vector n = new Vector();
            Int32 y;
            while(true) {
                mx_ready.WaitOne();
                ready--;
                y = ready;
                mx_ready.ReleaseMutex();
                if (y < 0) break;
                res[y] = new MemoryStream();
                for (Int32 x = 511; x >= 0; x--) {
                    p.Init(13, 13, 13);
                    for (Int32 r = 0; r < 64; r++) {
                        t.Init(a99, rnd.NextDouble() - .5, b99, rnd.NextDouble() - .5); // a * (Random() - .5) * 99 + b * (Random() - .5) * 99;
                        k.Init(17, 16, 8); // Vector(17, 16, 8) + t
                        k.Sum(t);
                        k2.Init(a, rnd.NextDouble() + x, b, rnd.NextDouble() + y); // !(t * -1 + (a * (Random() + x) + b * (y + Random()) + c) * 16)
                        k2.Sum(c);
                        k2.Prod(16);
                        k2.Sub(t);
                        k2.Norm();
                        k2 = sampler(k, k2, ref n);
                        k2.Prod(3.5); // * 3.5
                        p.Sum(k2);
                    }
                    res[y].WriteByte((Byte)p.x);
                    res[y].WriteByte((Byte)p.y);
                    res[y].WriteByte((Byte)p.z);
                }
            }
        }
    }

    class Program {
        // Многопоточный расчет
        static void RunMT(String fname, Int32 th_cnt) {
            if (th_cnt <= 0) th_cnt = 1;
            Console.WriteLine("Use {0} threads", th_cnt);
            // Запуск потоков
            var threads = new Thread[th_cnt];
            for (Int32 i = 0; i < threads.Length; i++) {
                threads[i] = new Thread(new ThreadStart(new Calc().CalcPart));
                threads[i].Start();
            }
            // Ожидание завершения
            for (Int32 i = 0; i < threads.Length; i++) {
                threads[i].Join();
            }
            // Вывод результата
            Stream outs = Stream.Null;
            if (fname != "NUL" && fname != "nul") {
                outs = new FileStream(fname, FileMode.Create);
            }
            byte[] tmp = Encoding.ASCII.GetBytes("P6 512 512 255 ");
            outs.Write(tmp, 0, tmp.Length);
            for (Int32 i = Calc.res.Length - 1; i >= 0; i--) {
                Calc.res[i].WriteTo(outs);
                Calc.res[i].Close();
            }
            outs.Close();
        }

        static void Main(string[] args) {
            String fname = "";
            Int32 th_cnt = Environment.ProcessorCount;
            foreach(String s in args) {
                if (s.Substring(0, 2) == "-t") {
                    th_cnt = Int32.Parse(s.Substring(2));
                } else {
                    fname = s;
                }
            }
            if(fname != "") {
                Stopwatch sw = new Stopwatch();
                sw.Start();
                RunMT(fname, th_cnt);
                sw.Stop();
                Console.WriteLine("Time {0} msec", sw.ElapsedMilliseconds);
            } else {
                Console.WriteLine("\nUsage: card-raytracer-mt [-tN] <filename>.ppm\n\n-tN use N threads. Default all CPUs\n");
            }
        }
    }
}
