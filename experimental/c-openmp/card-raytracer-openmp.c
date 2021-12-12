#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <sys/time.h>
#include <time.h>
#include <omp.h>

#define WIDTH  512
#define HEIGHT 512
#define PARTITIONS 16

struct Vector {

	Vector() {
	}

	Vector(double a, double b, double c) {
		x = a;
		y = b;
		z = c;
	}

	double x, y, z;

	Vector operator+(const Vector &r) {
		return Vector(x + r.x, y + r.y, z + r.z);
	}

	Vector operator*(double r) {
		return Vector(x * r, y * r, z * r);
	}

	double operator%(const Vector &r) {
		return x * r.x + y * r.y + z * r.z;
	}

	Vector operator^(const Vector &r) {
		return Vector(y * r.z - z * r.y, z * r.x - x * r.z, x * r.y - y * r.x);
	}

	Vector operator!() {
		return *this * (1 / sqrt(*this % *this));
	}
};

int G[] = {
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

double Random() {
	//return (double) rand() / RAND_MAX;
	return 0.0;
}

int tracer(Vector o, Vector d, double &t, Vector& n) {
	t = 1e9;
	int m = 0;
	double p = -o.z / d.z;
	if (.01 < p){
		t = p;
		n = Vector(0, 0, 1);
		m = 1;
	}
	for (int k = 19; k--;)
		for (int j = 9; j--;)
			if (G[j] & 1 << k) {
				Vector p = o + Vector(-k, 0, -j - 4);
				double b = p % d;
                                double c = p % p - 1;
                                double q = b * b - c;
				if (q > 0) {
					double s = -b - sqrt(q);
					if (s < t && s > .01) {
						t = s;
						n = !(p + d * t);
						m = 2;
					}
				}
			}
	return m;
}

Vector sampler(Vector o, Vector d) {
	double t;
	Vector n;
	int m = tracer(o, d, t, n);
	if (!m){
		return Vector(.7, .6, 1) * pow(1 - d.z, 4);
	}
	Vector h = o + d * t;
        Vector l = !(Vector(9 + Random(), 9 + Random(), 16) + h * -1);
        Vector r = d + n * (n % d * -2);
	double b = l % n;
	if (b < 0 || tracer(h, l, t, n)){
		b = 0;
	}
	double p = pow(l % r * (b > 0), 99);
	if (m & 1) {
		h = h * .2;
		return ((int) (ceil(h.x) + ceil(h.y)) & 1 ? Vector(3, 1, 1) : Vector(3, 3, 3)) * (b * .2 + .1);
	}
	return Vector(p, p, p) + sampler(h, r) * .5;
}

int main(int argc,char **argv) {
	if (argc==1){
		fprintf(stderr,"\n\nUsage: card-raytracer <filename>.ppm\n");
		return -1;
	}
	printf("Start with OpenMP support\n");
	printf("omp_get_max_threads = %d\n", omp_get_max_threads());

  struct timespec start, end;
	clock_gettime(CLOCK_MONOTONIC_RAW, &start);

	FILE *out = fopen(argv[1],"w");
	fprintf(out,"P6 %d %d 255 ",WIDTH,HEIGHT);
	Vector g = !Vector(-6, -16, 0);
    Vector a = !(Vector(0, 0, 1) ^ g) * .002;
    Vector b = !(g ^ a) * .002;
    Vector c = (a + b) * -256 + g;

  int PART_SIZE = HEIGHT / PARTITIONS;

  printf("Partitions = %d\n", PARTITIONS);
	printf("Partition height = %d\n", PART_SIZE);

  int *buf = new int[WIDTH * HEIGHT * 4];

  omp_set_num_threads(12);
	#pragma omp parallel for
	for (int p = 0; p < PARTITIONS; p++) {
		printf("Started OpenMP-thread %i for partition (y=%d)\n", omp_get_thread_num(), p);
		for (int y = 0; y < PART_SIZE; y++) {
			int y_offset = y + p * PART_SIZE;
			for (int x = 0 ; x < WIDTH; x++) {
				Vector p(13, 13, 13);
				for (int r = 64; r--;) {
					Vector t = a * (Random() - .5) * 99 + b * (Random() - .5) * 99;
					p = sampler(Vector(17, 16, 8) + t, !(t * -1 + (a * (Random() + x) + b * (y_offset + Random()) + c) * 16)) * 3.5 + p;
				}
				buf[x + y_offset * WIDTH] =  (int) p.x << 16 |
				                             (int) p.y << 8 |
														         (int) p.z;
			}
		}
		printf("Finished thread %i\n", omp_get_thread_num());
  }
	printf("Writing buffer...\n");
	for (int y = 0; y < HEIGHT; y++) {
		for (int x = 0 ; x < WIDTH; x++) {
			int rgb = buf[(WIDTH - x - 1) + (HEIGHT - y - 1) * WIDTH];
			fprintf(out,"%c", 0xFF & (rgb >> 16));
			fprintf(out,"%c", 0xFF & (rgb >> 8));
			fprintf(out,"%c", 0xFF & rgb);
		}
	}
	fclose(out);
	delete buf;
	clock_gettime(CLOCK_MONOTONIC_RAW, &end);
	//u_int64_t delta_us = end.tv_sec - start.tv_sec;
	int delta_us = end.tv_sec - start.tv_sec;
	printf("Finish. Elapsed time : %i s\n", delta_us);
	return 0;
}
