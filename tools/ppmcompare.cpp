#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

bool ppm_comp(char* fn1, char* fn2)
{
	FILE* f1 = fopen(fn1, "rb");
	if(!f1) {
		printf("Can`t open %s\n", fn1);
		return false;
	}
	FILE* f2 = fopen(fn2, "rb");
	if(!f2) {
		printf("Can`t open %s\n", fn2);
		fclose(f1);
		return false;
	}
	printf("Compare %s %s\n", fn1, fn2);
	int stat[256] = {0};
	int cnt = 0;
	bool empty = true;
	while(!feof(f1) && !feof(f2)) {
		cnt++;
		int d = fgetc(f1) - fgetc(f2);
		if(d < 0) d = -d;
		if(d != 0) {
			stat[d]++;
			empty = false;
		}
	}
	fclose(f1);
	fclose(f2);
	printf("Total %d bytes. ", cnt);
	if(empty) {
		printf("MSE 0 Files are not differences\n", cnt);
		return true;
	} else {
		// Определение уровня шума https://ru.wikipedia.org/wiki/%D0%9F%D0%B8%D0%BA%D0%BE%D0%B2%D0%BE%D0%B5_%D0%BE%D1%82%D0%BD%D0%BE%D1%88%D0%B5%D0%BD%D0%B8%D0%B5_%D1%81%D0%B8%D0%B3%D0%BD%D0%B0%D0%BB%D0%B0_%D0%BA_%D1%88%D1%83%D0%BC%D1%83
#ifdef _DEBUG
		char fnr[100];
		sprintf(fnr, "%s-%s.csv", fn1, fn2);
		char* p = fnr;
		while(*(++p)) {if(*p == '\\' || *p == '/') *p = '_';}
		FILE* fr = fopen(fnr, "wb");
		fprintf(fr, "Compare files %s and %s (%d bytes)\ndiff;count\n", fn1, fn2, cnt);
#endif
		double mse = 0;
		for(int i = 1; i < 256; i++) {
			mse += (double)i * i * stat[i];
#ifdef _DEBUG
			fprintf(fr, "%d;%d\n", i, stat[i]);
#endif
		}
		mse /= cnt;
		bool equal = mse < 10;
		//double psnr = log10( 65025. / mse) * 10;
		printf("MSE %.1f %s\n", mse, (equal ? "normal" : "!!! BAD !!!"));
#ifdef _DEBUG
		printf("more in %s\n", fnr);
		fclose(fr);
#endif
		return equal;
	}
}

int main(int argc, char* argv[])
{
	bool equal = false;
	if(argc < 3) {
		printf("Compare ppm files\n\nppmcompare file1.ppm file2.ppm\n\n");
	} else {
		equal = ppm_comp(argv[1], argv[2]);
	}
#ifdef _DEBUG
	system("pause");
#endif
	return equal ? 0 : 1;
}
