module card_raytracer;

import std.stdio;
import std.math;
import std.random;
import std.datetime;

immutable int WIDTH  =  512;
immutable int HEIGHT =  512;

int G[] = [
	0x0003C712,  // 00111100011100010010
	0x00044814,  // 01000100100000010100
	0x00044818,  // 01000100100000011000
	0x0003CF94,  // 00111100111110010100
	0x00004892,  // 00000100100010010010
	0x00004891,  // 00000100100010010001
	0x00038710,  // 00111000011100010000
	0x00000010,  // 00000000000000010000
	0x00000010,  // 00000000000000010000
];

alias double4 = double[3];

struct vec3 {
        union{
                double4 m;
                struct{
                        double x,y,z;
                }
        }

        this(double x, double y, double z){
                this.x = x;
                this.y = y;
                this.z = z;
        }

        this(double4 rm){
                this.m = rm;
        }

        auto opBinary(string op) (const ref vec3 r) const {
		static if (op == "+")
			return vec3(x + r.x, y + r.y, z + r.z);
		else static if (op == "^")
			return vec3(y * r.z - z * r.y, z * r.x - x * r.z, x * r.y - y * r.x);
		else static if (op == "%")
			return x * r.x + y * r.y + z * r.z;
        else static assert(0, "Operator "~op~" not implemented");

        }

       auto opBinary(string op) (vec3 r) const {
		static if (op == "+")
			return vec3(x + r.x, y + r.y, z + r.z);
		else static if (op == "^")
			return vec3(y * r.z - z * r.y, z * r.x - x * r.z, x * r.y - y * r.x);
		else static if (op == "%")
			return x * r.x + y * r.y + z * r.z;
   		else static assert(0, "Operator "~op~" not implemented");

        }


	vec3 opBinary(string op)(double r) const {
		static if (op == "*")
			return vec3(x * r, y * r, z * r);
        else static assert(0, "Operator "~op~" not implemented");
	}

	vec3 opUnary(string op)() /* op ! */ const {
		static if (op == "~")
			return this * (1 / sqrt(this % this));
        else static assert(0, "Operator "~op~" not implemented");
	}
}


void testOP() {

	auto x = vec3(1,2,3);
	auto y = vec3(4,5,6);

	vec3 z, z2;

	z = x + y;
	z = x ^ y;
	double d = x % y;
	z = x * 5;
	z = ~x;

	z2 = ~(x + y * 1e9);
}

double Random() { return uniform(0.0f, 1.0f); }


int tracer(const ref vec3 o, const ref vec3 d, ref double t, ref vec3 n) {
	t = 1e9;
	int m = 0;
	double dp = -o.z / d.z;
	if (.01 < dp){
		t = dp;
		n =  vec3(0, 0, 1);
		m = 1;
	}
	for (int k = 19; k--;)
		for (int j = 9; j--;)
			if (G[j] & 1 << k) {
				vec3 p = vec3(-k, 0, -j - 4) + o;
				double b = p % d;
                                double c = p % p - 1;
                                double q = b * b - c;
				if (q > 0) {
					double s = -b - sqrt(q);
					if (s < t && s > .01) {
						t = s;
						n = ~(p + d * t);
						m = 2;
					}
				}
			}
	return m;
}

vec3 sampler(const ref vec3 o, const ref vec3 d) {
	double t;
	vec3 n;
	int m = tracer(o, d, t, n);
	if (!m){
		return vec3(.7, .6, 1) * pow(1 - d.z, 4);
	}
	vec3 h = o + d * t;
        vec3 l = ~(vec3(9 + Random(), 9 + Random(), 16) + h * -1);
        vec3 r = d + n * (n % d * -2);
	double b = l % n;
	if (b < 0 || tracer(h, l, t, n)){
		b = 0;
	}
	double p = pow(l % r * (b > 0), 99);
	if (m & 1) {
		h = h * .2;
		return (cast(int) (ceil(h.x) + ceil(h.y)) & 1 ? vec3(3, 1, 1) : vec3(3, 3, 3)) * (b * .2 + .1);
	}
	return vec3(p, p, p) + sampler(h, r) * .5;
}


void renderScene() {
	writef("P6 %d %d 255 ",WIDTH,HEIGHT);
	vec3 g = ~  vec3(-6, -16, 0);
        vec3 a = ~( vec3(0, 0, 1) ^ g) * .002;
        vec3 b = ~(g ^ a) * .002;
        vec3 c = (a + b) * -256 + g;
	for (int y = HEIGHT; y--;) {
		for (int x = WIDTH; x--;) {
			auto p =  vec3(13, 13, 13);
			for (int r = 64; r--;) {
				vec3 t = a * (Random() - .5) * 99 + b * (Random() - .5) * 99;
				vec3 cam = vec3(17, 16, 8) + t;
				vec3 point = ~(t * -1 + (a * (Random() + x) + b * (y + Random()) + c) * 16);
				p = sampler(cam, point) * 3.5 + p;
			}
			writef("%c%c%c", cast(char) p.x, cast(char) p.y, cast(char) p.z);
		}
	}
}

void main() {
    //testOP();
    //return;

	auto mt = benchmark!(renderScene)(1);

	//writeln("Time running(s) ", mt[0].seconds());
}
