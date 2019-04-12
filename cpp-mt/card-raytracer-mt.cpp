/**
Исходный тест https://github.com/Mark-Kovalyov/CardRaytracerBenchmark/blob/master/cpp/card-raytracer.cpp

Распараллеливание расчета в N потоков путем разбиения на N блоков и обсчет каждого блока своим потоком

-----------------------------------------------------------------------------------------------------------
Запускать с параметром количество потоков

card-raytracer-mt.exe <filename>.ppm  [threads]

по умолчанию threads равно количеству ядер процессора

*/

#define _CRT_SECURE_NO_WARNINGS
#include <stdlib.h>   
#include <stdio.h>
#include <time.h>
#include <math.h>
#include <vector>
#include <thread>
#include <assert.h>
#ifdef NDEBUG
#undef NDEBUG
#endif

#if defined(_WIN32) || defined(_WIN64)
#include <windows.h>
int cpu_count() {
	SYSTEM_INFO sysinfo;
	GetSystemInfo(&sysinfo);
	return sysinfo.dwNumberOfProcessors;
}
#else
#include <unistd.h>
int cpu_count() {
	return sysconf(_SC_NPROCESSORS_ONLN);
}
#endif

// Время с момента запуска
int time_now() {
	static std::chrono::steady_clock::time_point t = std::chrono::steady_clock::now();
	std::chrono::steady_clock::time_point t2 = std::chrono::steady_clock::now();
	std::chrono::duration<double> time_span = std::chrono::duration_cast<std::chrono::duration<double>>(t2 - t);
	return (int)(time_span.count() * 1000);
}

#define WIDTH  512
#define HEIGHT 512

struct Vector {

	Vector() {
	}

	Vector(double a, double b, double c) {
		x = a;
		y = b;
		z = c;
	}

	void init(double a, double b, double c) {
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

	void print(FILE* out) {
		fprintf(out, "%c%c%c", (int)x, (int)y, (int)z);
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
	return (double)rand() / RAND_MAX;
}

int tracer(Vector o, Vector d, double &t, Vector& n) {
	t = 1e9;
	int m = 0;
	double p = -o.z / d.z;
	if (.01 < p) {
		t = p;
		n = Vector(0, 0, 1);
		m = 1;
	}
	for (int k = 19; k--;)
		for (int j = 9; j--;)
			if (G[j] & 1 << k) {
				Vector v = o + Vector(-k, 0, -j - 4);
				double b = v % d;
				double c = v % v - 1;
				double q = b * b - c;
				if (q > 0) {
					double s = -b - sqrt(q);
					if (s < t && s > .01) {
						t = s;
						n = !(v + d * t);
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
	if (!m) {
		return Vector(.7, .6, 1) * pow(1 - d.z, 4);
	}
	Vector h = o + d * t;
	Vector l = !(Vector(9 + Random(), 9 + Random(), 16) + h * -1);
	Vector r = d + n * (n % d * -2);
	double b = l % n;
	if (b < 0 || tracer(h, l, t, n)) {
		b = 0;
	}
	double p = pow(l % r * (b > 0), 99);
	if (m & 1) {
		h = h * .2;
		return ((int)(ceil(h.x) + ceil(h.y)) & 1 ? Vector(3, 1, 1) : Vector(3, 3, 3)) * (b * .2 + .1);
	}
	return Vector(p, p, p) + sampler(h, r) * .5;
}

// Задание на расчет
typedef struct {
	int y_from, y_to;
	std::vector<Vector> result;
} task_t;

// Поток обработки одного блока
void calc_thread(task_t* task) {
	Vector g = !Vector(-6, -16, 0);
	Vector a = !(Vector(0, 0, 1) ^ g) * .002;
	Vector b = !(g ^ a) * .002;
	Vector c = (a + b) * -256 + g;
	for (int y = task->y_to + 1; y-- != task->y_from;) {
		for (int x = WIDTH; x--;) {
			Vector p(13, 13, 13);
			for (int r = 64; r--;) {
				Vector t = a * (Random() - .5) * 99 + b * (Random() - .5) * 99;
				p = sampler(Vector(17, 16, 8) + t, !(t * -1 + (a * (Random() + x) + b * (y + Random()) + c) * 16)) * 3.5 + p;
			}
			task->result.push_back(p);
		}
	}
}

void test(const char* filename, size_t thread_count) {
	FILE *out = fopen(filename, "w");
	assert(out != NULL);
	fprintf(out, "P6 %d %d 255 ", WIDTH, HEIGHT);

	std::vector<task_t> tasks(thread_count);
	std::vector<std::thread> threads(thread_count);

	// Запуск потоков
	int step = HEIGHT / (int)thread_count, start = 0;
	for (size_t i = 0; i != thread_count; i++) {
		tasks[i].y_from = start;
		start = i + 1 != thread_count ? start + step : HEIGHT;
		tasks[i].y_to = start - 1;
		tasks[i].result.reserve(WIDTH * (tasks[i].y_to - tasks[i].y_from + 1));
		threads[i] = std::thread(calc_thread, &tasks[i]);
	}

	// Ожидание завершения потоков и вывод результатов
	for (size_t i = 0; i != thread_count; i++) {
		threads[i].join();
		for(auto& it : tasks[i].result) it.print(out);
		printf("%d: thread %d finish \n", time_now(), (int)i);
	}

	fclose(out);
}

int main(int argc, char **argv) {
	if (argc < 2) {
		fprintf(stderr, "\n\nUsage: card-raytracer-mt.exe <filename>.ppm [threads_count]\n");
		return -1;
	}



	int threads = 0;
	if (argc > 2) {
		// Количество потоков
		for (char* p = argv[2]; *p != 0 && *p >= '0' && *p <= '9'; p++) threads = threads * 10 + *p - '0';
	} else {
		threads = cpu_count();
	}
	printf("compile %s %s\n", __DATE__, __TIME__);
	time_now();
	printf("use %d threads to file %s ...\n", threads, argv[1]);
	test(argv[1], threads);

	printf("Time: %d msec\n", time_now());
	return 0;
}