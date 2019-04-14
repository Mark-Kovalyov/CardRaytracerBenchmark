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

// Выравнивание в памяти по адресам кратно 64
class align64_t {
public:
	align64_t() {}
	align64_t(int) {}

	void *operator new[](size_t size) {
#ifdef WINVER
		void* p = _aligned_malloc(size, 0x40);
#else
		void *p;
		if (posix_memalign(&p, 0x40, size)) p = NULL;
#endif
		if (p == NULL) {
			assert(p != NULL);
			throw std::bad_alloc();
		}
		return p;
	}

	void operator delete[](void *p) {
#ifdef WINVER
		_aligned_free(p);
#else
		free(p);
#endif
	}
};

enum { ST_EMPTY = 0, ST_CALC = 1, ST_READY = 2 };

// Начальные константы
Vector g = !Vector(-6, -16, 0);
Vector a = !(Vector(0, 0, 1) ^ g) * .002;
Vector b = !(g ^ a) * .002;
Vector c = (a + b) * -256 + g;

// Расчет строки
class img_row_t : public align64_t {
	std::atomic<int> state = { ST_EMPTY };
	Vector v[WIDTH];
public:
	// Проверка что строка не посчитана
	bool is_empty() {
		return state == ST_EMPTY;
	}

	// Обработка одной строки
	bool calc(int y) {
		// Смена статуса
		int expected = ST_EMPTY;
		if(!state.compare_exchange_weak(expected, ST_CALC)) return false; // Строка уже считается другим потоком
		// Расчет строки
		for (int x = WIDTH; x--;) {
			Vector p(13, 13, 13);
			for (int r = 64; r--;) {
				Vector t = a * (Random() - .5) * 99 + b * (Random() - .5) * 99;
				p = sampler(Vector(17, 16, 8) + t, !(t * -1 + (a * (Random() + x) + b * (y + Random()) + c) * 16)) * 3.5 + p;
			}
			v[x] = p;
		}
		state = ST_READY;
		return true;
	}

	// Вывод в файл
	void print(FILE* out) {
		if(state != ST_READY) printf("ERROR: Row not ready\n");
		for (int i = WIDTH; i--;) v[i].print(out);
	}

};

img_row_t* rows = NULL;

// Задание одному потоку
class alignas(64) task_t : public align64_t {
public:
	std::atomic<int> cnt; // Осталось обработать
	int row_from, row_to;

	// Обработка потоком, владельцем задания 
	void run() {
		for (int i = row_from; i <= row_to; i++) {
			if(rows[i].calc(i)) cnt--;
		}
	}

	// Обработка другим потоком, ранее освободившемся
	void help() {
		for (int i = row_to; i >= row_from; i--) {
			if (!rows[i].calc(i)) break;
			cnt--;
		}
	}

	// Проверка что потоку никто не помогает
	bool need_help() {
		return rows[row_to].is_empty();
	}

	// Вывод в файл
	void print(FILE* out) {
		for (int i = row_to; i >= row_from; i--) rows[i].print(out);
	}
};

task_t* tasks = NULL;

int thread_count = 0;

// Поток обработки одного блока
void calc_thread(int task_id) {
	printf("%6d: start thread#%d (lines %d...%d)\n", time_now(), task_id, tasks[task_id].row_from, tasks[task_id].row_to);
	// Обработка своих заданий
	tasks[task_id].run();
	// Помощь другим потокам
	for (int i = 0; i < thread_count; i++) {
		int max = 0, id = -1;
		for (int i = 0; i < thread_count; i++) {
			if (tasks[i].need_help() && max < tasks[i].cnt) {
				max = tasks[i].cnt;
				id = i;
			}
		}
		if (id == -1) break;
		printf("%6d: thread#%d help to thread#%d  %d rows\n", time_now(), task_id, id, max);
		tasks[id].help();
	}
	// Проверка всех незавершенных
	for (int i = 0; i < thread_count; i++) {
		if (tasks[i].cnt > 0) tasks[i].run();
	}
	printf("%6d: thread#%d finished\n", time_now(), task_id);
}

void test(const char* filename) {
	printf("%6d: test %d threads to file %s\n", time_now(), (int)thread_count, filename);

	FILE *out = fopen(filename, "w");
	assert(out != NULL);
	fprintf(out, "P6 %d %d 255 ", WIDTH, HEIGHT);

	rows = new img_row_t[HEIGHT];
	tasks = new task_t[thread_count];

	std::vector<std::thread> threads(thread_count);

	// Запуск потоков
	int step = HEIGHT / thread_count, start = 0; // step кол.строк на один блок
	for (int i = 0; i != thread_count; i++) {
		tasks[i].row_from = start; // Первая строка
		start = i + 1 != thread_count ? start + step : HEIGHT; // Начало следующего блока, для последнего 0
		tasks[i].row_to = start - 1; // Последняя строка
		tasks[i].cnt = tasks[i].row_to - tasks[i].row_from + 1;
		threads[i] = std::thread(calc_thread, i); // Запуск потока
	}

	// Ожидание завершения потоков
	for (int i = thread_count; i--;) {
		threads[i].join(); // Ожидание i-го потока
		tasks[i].print(out);
		//printf("%6d: task#%d printed\n", time_now(), i);
	}

	fclose(out);
	printf("%6d: test end\n", time_now());
}

int main(int argc, char **argv) {
	if (argc < 2) {
		fprintf(stderr, "\n\nUsage: card-raytracer-mt.exe <filename>.ppm [threads_count]\n");
		return -1;
	}

	thread_count = 0;
	if (argc > 2) {
		// Количество потоков
		for (char* p = argv[2]; *p != 0 && *p >= '0' && *p <= '9'; p++) thread_count = thread_count * 10 + *p - '0';
	} else {
		thread_count = cpu_count();
	}
	printf("compile %s %s\n", __DATE__, __TIME__);
	test(argv[1]);

	return 0;
}