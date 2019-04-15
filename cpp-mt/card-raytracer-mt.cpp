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
#include <atomic>
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

int this_thread_id() {
	return GetCurrentThreadId();
}
#else
#include <unistd.h>
#include <sys/types.h>
#include <sys/syscall.h>

int cpu_count() {
	return sysconf(_SC_NPROCESSORS_ONLN);
}

int this_thread_id() {
	return syscall(__NR_gettid);
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

	uint8_t* print(uint8_t* out) {
		*out++ = (uint8_t)x;
		*out++ = (uint8_t)y;
		*out++ = (uint8_t)z;
		return out;
	}

	void print(FILE* out) {
		uint8_t buf[3];
		print(buf);
		fwrite(buf, 1, 3, out);
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
	thread_local uint32_t state = 12345;
	state = state * 1103515245;
	return (double)(state >> 16) / 65536;
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

//*********************************************************************************************************
enum { ST_EMPTY = 0, ST_CALC = 1, ST_READY = 2 };

// Начальные константы
Vector g = !Vector(-6, -16, 0);
Vector a = !(Vector(0, 0, 1) ^ g) * .002;
Vector b = !(g ^ a) * .002;
Vector c = (a + b) * -256 + g;

// Расчет строки
class img_row_t {
	std::atomic<int> state = { ST_EMPTY };
	uint8_t res[WIDTH * 3]; // Результат
public:

	// Обработка одной строки
	bool calc(int y) {
		// Смена статуса на ST_CALC если статус ST_EMPTY
		int expected = ST_EMPTY;
		if(!state.compare_exchange_weak(expected, ST_CALC)) return false; // Строка уже считается другим потоком
		uint8_t* out = res;
		// Расчет строки
		for (int x = WIDTH; x--;) {
			Vector p(13, 13, 13);
			for (int r = 64; r--;) {
				Vector t = a * (Random() - .5) * 99 + b * (Random() - .5) * 99;
				p = sampler(Vector(17, 16, 8) + t, !(t * -1 + (a * (Random() + x) + b * (y + Random()) + c) * 16)) * 3.5 + p;
			}
			out = p.print(out);
		}
		if (out != res + sizeof(res)) printf("ERROR calc row[%d]\n", y);
		state = ST_READY;
		return true;
	}

	// Вывод в файл
	void print(FILE* out) {
		if (state != ST_READY) { // Строка недосчитана
			// Ожидание в течении 100 мс
			int time = time_now() + 100;
			do {
				std::this_thread::sleep_for(std::chrono::milliseconds(1));
			} while (state != ST_READY && time_now() < time);
			if (state != ST_READY)  printf("ERROR print to file. Row not ready\n");
		}
		fwrite(res, 1, sizeof(res), out);
	}

};

// Строки для обработки
std::vector<img_row_t> rows(HEIGHT);

//*********************************************************************************************************
// Поток обработки одного блока
void calc_thread(int thread_id) {
	printf("%6d: start thread#%d\n", time_now(), thread_id);
	for (int y = HEIGHT; y--;) rows[y].calc(y);
	printf("%6d: thread#%d finished\n", time_now(), thread_id);
}

//*********************************************************************************************************
void test(const char* filename, int thread_count) {
	printf("%6d: test %d threads to file %s\n", time_now(), thread_count, filename);

	FILE *out = fopen(filename, "w");
	if (out == NULL) {
		printf("Can`t create file '%s'\n", filename);
		return;
	}
	fprintf(out, "P6 %d %d 255 ", WIDTH, HEIGHT);

	std::vector<std::thread> threads(thread_count);

	// Запуск потоков
	for (int i = 0; i != thread_count; i++) {
		threads[i] = std::thread(calc_thread, i); // Запуск потока
	}

	// Ожидание завершения потоков и вывод результата
	for (int i = 0; i != thread_count; i++) {
		threads[i].join(); // Ожидание i-го потока
	}

	// Вывод результата
	for (int y = HEIGHT; y--;) {
		rows[y].print(out);
	}

	fclose(out);
	printf("%6d: test end\n", time_now());
}

//*********************************************************************************************************
int main(int argc, char **argv) {
	if (argc < 2) {
		fprintf(stderr, "\n\nUsage: card-raytracer-mt.exe <filename>.ppm [threads_count]\n");
		return -1;
	}

	int thread_count = 0;
	if (argc > 2) {
		// Количество потоков
		for (char* p = argv[2]; *p != 0 && *p >= '0' && *p <= '9'; p++) thread_count = thread_count * 10 + *p - '0';
	} else {
		thread_count = cpu_count();
	}
	printf("compile %s %s\n", __DATE__, __TIME__);
	test(argv[1], thread_count);

	return 0;
}