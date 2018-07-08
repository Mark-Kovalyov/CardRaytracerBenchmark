#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <vector>

// Перевод времени в мс
int parse_time(const char *time)
{
	const char* point = strstr(time, ".");
	int res = 0;
	if (point) {
		// в формате mm ss.sss
		int w = 100;
		const char* p = point + 1;
		while (*p >= '0' && *p <= '9') {
			res += (*p - '0') * w;
			w /= 10;
			p++;
		}
		p = point - 1;
		w = 1000;
		while (*p >= '0' && *p <= '9' && p >= time) {
			res += (*p - '0') * w;
			w *= 10;
			p--;
		}
		p--;
		w = 60000;
		while (*p >= '0' && *p <= '9' && p >= time) {
			res += (*p - '0') * w;
			w *= 10;
			p--;
		}
	}
	else {
		// в мс
		res = atoi(time);
	}
	return res;
}

struct res_t {
	char name[32];
	char time[16];
	char mse[8];

	void type_csv() {
		if (name[0] == 0) return;
		static bool hdr = false;
		static int base = 0;
		int time_ms = parse_time(time);
		if (base == 0) base = time_ms;
		if (!hdr) {
			printf("Lang,Time s,Time %%,MSE\n");
			hdr = true;
		}
		printf("%s,%d:%d.%03d,%.1f%%,%s\n", name, time_ms / 60000, time_ms / 1000 % 60, time_ms % 1000, (base == 0 ? 0 : (double)time_ms * 100 / base), mse);
	}

	void type_git() {
		if (name[0] == 0) return;
		static bool hdr = false;
		static int base = 0;
		int time_ms = parse_time(time);
		if (base == 0) base = time_ms;
		if (!hdr) {
			printf("Lang | Time sec | Time %%\n-------------|---------|--------------\n");
			hdr = true;
		}
		printf("%s | %d:%d.%03d | %.1f%%\n", name, time_ms / 60000, time_ms / 1000 % 60, time_ms % 1000, (base == 0 ? 0 : (double)time_ms * 100 / base));
	}

	void type_json() {
		if (name[0] == 0) return;
		static int base = 0;
		int time_ms = parse_time(time);
		if (base == 0) { 
			base = time_ms;
		} else {
			printf(", ");
		}
		printf("{\"lang\"=\"%s\",\"time\"=\"%d:%d.%03d\",\"persent\"=\"%.1f%%\",\"mse\"=\"%s\"}\n", name, time_ms / 60000, time_ms / 1000 % 60, time_ms % 1000, (base == 0 ? 0 : (double)time_ms * 100 / base), mse);
	}
};

// Вырезание подстроки 
bool substr(const char* line, const char* start, const char* end, char* out, int size)
{
	const char* s = strstr(line, start);
	if(s) s += strlen(start);
	const char* e = NULL;
	if(s && end) {
		e = strstr(s, end);
	} else {
		e = line + strlen(line);
		if(*(e - 1) == 0xA) e--;
	}
	if(!s || !e || s >= e) return false;
	if(e - s >= size) e = s + size - 1;
	memcpy(out, s, e - s);
	out[e - s] = 0;
	return true;
}

// вывод строки результата
void type(res_t& r)
{
	if(r.name[0] == 0) return;
	static bool hdr = false;
	static int base = 0;
	int time_ms = parse_time(r.time);
	if(base == 0) base = time_ms;
	if(!hdr) {
		printf("Lang,Time s,Time %%,MSE\n");
		hdr = true;
	}
	printf("%s,%d:%d.%03d,%.1f%%,%s\n", r.name, time_ms/60000, time_ms/1000%60, time_ms%1000, (base == 0 ? 0: (double)time_ms * 100 / base), r.mse);
	memset(&r, 0, sizeof(r));
}


// разбор лога
bool parse(char* fname)
{
	FILE* f = fopen(fname, "r");
	if(!f) {
		fprintf(stderr, "Can`t open %s\n", fname);
		return false;
	}
	fprintf(stderr, "Parse %s\n\n", fname);
	std::vector<res_t> result;
	res_t r;
	memset(&r, 0, sizeof(r));
	while(!feof(f)) {
		char buf[1024];
		fgets(buf, 1024, f);
		if(buf[0] == 0xA || buf[0] == 0xD || buf[0] == 0) continue;
		if((buf[0] == '"' && buf[1] == '[') || buf[0] == '[') {
			result.push_back(r);
			memset(&r, 0, sizeof(r));
			//type(r);
			substr(buf, "[", "]", r.name, sizeof(r.name));
		} else if(substr(buf, "Elapsed Time :  ", NULL, r.time, sizeof(r.time))) {
		} else if(substr(buf, "real	", NULL, r.time, sizeof(r.time))) {
		} else if(substr(buf, "Time ", NULL, r.time, sizeof(r.time))) {
		} else if(substr(buf, "MSE ", " ", r.mse, sizeof(r.mse))) {
		}
	}
	result.push_back(r);
	//type(r);
	fclose(f);

	printf("\nCSV\n");
	for (auto& v : result) v.type_csv();

	printf("\nGIT\n");
	for (auto& v : result) v.type_git();

	printf("\nJSON\n{\n");
	for (auto& v : result) v.type_json();
	printf("\n}\n");
#ifdef _DEBUG
	system("pause");
#endif
	return true;
}

int main(int argc, char* argv[])
{
	if(argc < 2) {
		printf("\nUsage: resultparser <filename>.log\n");
		return 1;
	} else {
		return parse(argv[1]) ? 0 : 1;
	}
}
