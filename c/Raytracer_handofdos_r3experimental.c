/**
 *  Special thanks to Paul Heckbert
 *
 *  http://tproger.ru/translations/business-card-raytracer
 */
/*
	Siemargl port just to C is fastest

	Experimental version - embedded SSE C-operations
    Added OpenMP pragmas - but not faster because of sync barrier needed - compile adding -fopenmp option
*/
//#define AVX_VERSION

#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <stdint.h>
#include <xmmintrin.h>
#include <pmmintrin.h>  // SSE3

#include <time.h>

#define WIDTH  512
#define HEIGHT 512

typedef union __attribute__ ((aligned(16))) {
    struct {
        float x, y, z
#ifdef AVX_VERSION
        , zz
#endif
        ;
    };
    __m128 xmm;
} Vector;

/* SSE1 version - slower than SSE3 */
 float hsum_ps_SSE1(__m128 v) {                                  // v = [ D C | B A ]
    __m128 shuf   = _mm_shuffle_ps(v, v, _MM_SHUFFLE(2, 3, 0, 1));  // [ C D | A B ]
    __m128 sums   = _mm_add_ps(v, shuf);      // sums = [ D+C C+D | B+A A+B ]
    shuf          = _mm_movehl_ps(shuf, sums);      //  [   C   D | D+C C+D ]  // let the compiler avoid a mov by reusing shuf
    sums          = _mm_add_ss(sums, shuf);
    return    _mm_cvtss_f32(sums);
}

 float hsum_ps_SSE3(__m128 xx) {
    // xx = { xx3, xx2, xx1, xx0 }
    xx=_mm_hadd_ps(xx,xx);
    // xx = {xx3+xx2, xx1+xx0, xx3+xx2, xx1+xx0}
    xx=_mm_hadd_ps(xx,xx);
    // xx = {xx2+xx3+xx1+xx0, xx3+xx2+xx1+xx0, xx3+xx2+xx1+xx0, xx3+xx2+xx1+xx0}
    return    _mm_cvtss_f32(xx);
}

//%
 float opNormSSE(const __m128 me, const __m128 r) {
	return hsum_ps_SSE3(me*r);
}

 float opNormSSE_single(const __m128 me) {
	return hsum_ps_SSE3(me*me);
}

 float opNormC(const __m128 me, const __m128 r) {
    const Vector vme = {.xmm = me};
    const Vector vr = {.xmm = r};

		return vme.x * vr.x + vme.y * vr.y + vme.z * vr.z
#ifdef AVX_VERSION
		 + vme.zz * vr.zz
#endif
		 ;
}


//^
 __m128 opCrossSSE(const __m128 me, const __m128 r) {
    // me = [ ZZ3 Z2 | Y1 X0 ]
   __m128 shuf_me1   = _mm_shuffle_ps(me, me, _MM_SHUFFLE(3, 0, 2, 1));  // [ ZZ X | Z Y ]
   __m128 shuf_r1    = _mm_shuffle_ps(r, r, _MM_SHUFFLE(3, 1, 0, 2));  // [ ZZ Y | X Z ]
    shuf_me1 *= shuf_r1;

   __m128 shuf_me2   = _mm_shuffle_ps(me, me, _MM_SHUFFLE(3, 1, 0, 2));  // [ ZZ Y | X Z ]
   __m128 shuf_r2   = _mm_shuffle_ps(r, r, _MM_SHUFFLE(3, 0, 2, 1));  // [ ZZ X | Z Y ]
    shuf_me2 *= shuf_r2;

	return shuf_me1 - shuf_me2;
}

/*
 Vector* opCrossSSE(Vector *restrict me, const Vector * restrict r) {
    me->xmm = opCrossSSEint(me->xmm, r->xmm);
    return me;
}
*/

//!
 __m128 opNotSSE(const __m128 me)
{
    /* lucky faster ??? */
    __m128  k = {1,1,1,1};
	return me * k / sqrtf(opNormSSE_single(me));

//	return me * 1.0f / sqrtf(opNormSSE_single(me));
}

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


//Marsaglia's MWC (multiply with carry) algorithm
static uint32_t m_z = 333, m_w = 888;  // any seeds not null
uint32_t GetUint()
{
    m_z = 36969 * (m_z & 65535) + (m_z >> 16);
    m_w = 18000 * (m_w & 65535) + (m_w >> 16);
    return (m_z << 16) + m_w;
}

double GetUniform()
{
    // 0 <= u < 2^32
    uint32_t u = GetUint();
    // The magic number below is 1/(2^32 + 2).
    // The result is strictly between 0 and 1.
    return (u + 1.0) * 2.328306435454494e-10;
}

float Random() {
//	return (float) rand() / RAND_MAX;
    return GetUniform();
}


#ifndef AVX_VERSION
#error plain C version only in previous release
#endif



int tracer(const __m128 o, const __m128 d, float *t, Vector* restrict n) {
	*t = 1e9;
	int m = 0;
	float p = -((Vector)o).z / ((Vector)d).z;
	if (.01 < p){
		*t = p;
		*n = (Vector){.x=0, .y=0, .z=1};
		m = 1;
	}
	for (int k = 19; k--;)
		for (int j = 9; j--;)
			if (G[j] & 1 << k) {
				Vector p = {.x=-k, .y=0, .z=-j - 4};	p.xmm += o;
				float b = opNormSSE(p.xmm, d);
				float c = opNormSSE_single(p.xmm) - 1;
				float q = b * b - c;

				if (q > 0) {
					float s = -b - sqrt(q);
					if (s < *t && s > .01) {
						*t = s;

						n->xmm = opNotSSE(p.xmm + d * *t);   //n = !(p + d * t);
						m = 2;
					}
				}
			}
	return m;
}

__m128 sampler(const __m128 o, const __m128 d) {
	float t;
	Vector n, smpl;
	int m = tracer(o, d, &t, &n);
	if (!m){
		n = (Vector){.x=.7, .y=.6, .z=1};
		return n.xmm * (float)pow(1 - ((Vector)d).z, 4);
	}
	Vector h; h.xmm = d * t + o;
    Vector l = (Vector){.x=9 + Random(), .y=9 + Random(), .z=16};  l.xmm = opNotSSE(l.xmm -1 * h.xmm);

    Vector r;   r.xmm = d + n.xmm * opNormSSE(n.xmm, d) * -2;

	float b = opNormSSE(l.xmm, n.xmm);
	if (b < 0 || tracer(h.xmm, l.xmm, &t, &n)){
		b = 0;
	}
	float p = pow(opNormSSE(l.xmm, r.xmm) * (b > 0), 99);
	if (m & 1) {
        h.xmm *= .2f;

        Vector resV;
		if ((int) (ceil(h.x) + ceil(h.y)) & 1)
			resV = (Vector){.x=3, .y=1, .z=1};
		else
			resV = (Vector){.x=3, .y=3, .z=3};
        resV.xmm *= b * .2f + .1f;
        return resV.xmm;
	}

	Vector	resV = {.x=p, .y=p, .z=p};
	smpl.xmm = sampler(h.xmm, r.xmm);

	resV.xmm += smpl.xmm * .5;

	return resV.xmm;
}

void benchOps();
int main(int argc,char **argv) {
//   benchOps();
//    return 0;


	if (argc==1){
		fprintf(stderr,"\n\nUsage: card-raytracer <filename>.ppm\n");
		return -1;
	}
	FILE *out = fopen(argv[1],"w");
	fprintf(out,"P6 %d %d 255 ",WIDTH,HEIGHT);
	Vector g = {.x=-6, .y=-16, .z=0}; g.xmm = opNotSSE(g.xmm);
    Vector a = {.x=0, .y=0, .z=1};  a.xmm = opNotSSE(opCrossSSE(a.xmm, g.xmm)) *.002f;
    Vector b;  b.xmm = opNotSSE(opCrossSSE(g.xmm, a.xmm)) * .002f;
    Vector c;  c.xmm = (a.xmm + b.xmm) * -256 + g.xmm;

#pragma omp parallel for ordered num_threads(8)
	for (int y = HEIGHT; y > 0; y--) {
		for (int x = WIDTH; x--;) {
			Vector p = {.x=13, .y=13, .z=13};
			for (int r = 64; r--;) {
 				Vector t;  t.xmm = a.xmm * (Random() - .5f) * 99 + b.xmm * (Random() - .5f) * 99;

 				Vector c1 = {.x=17, .y=16, .z=8};
                __m128 c2 = opNotSSE(t.xmm * -1 + (a.xmm * (Random() + x) + b.xmm * (y + Random()) + c.xmm) * 16);

				p.xmm += sampler(c1.xmm + t.xmm, c2) * 3.5;
			}
			#pragma omp ordered
			fprintf(out,"%c%c%c", (int) p.x, (int) p.y, (int) p.z);
		}
	}
	fclose(out);
	return 0;
}


const long int cycles = (int)1e10;


void bench_opAdd()
{
    Vector a = {.x=.1, .y = .2, .z = .3};
    Vector r = {.xmm = 0};
    clock_t clc = clock();

    for (long int i = cycles; i--;)
    {
        r.xmm += a.xmm;
    }

    printf("opAdd (%f) times %6.3f secs\n", r.x, ((float)clock()-clc)/CLOCKS_PER_SEC);
}

void bench_opMul()
{
    Vector a = {.x=1.1, .y = .2, .z = .3};
    clock_t clc = clock();

    for (long int i = cycles; i--;)
    {
        a.xmm *= 1.000001f;
    }

    printf("opMul (%f) times %6.3f secs\n", a.x, ((float)clock()-clc)/CLOCKS_PER_SEC);
}

void bench_opNorm()
{
    Vector a = {.x=.1, .y = .2, .z = .3};
    Vector r = a;
    clock_t clc = clock();
    float res = 0;

    for (long int i = cycles; i--;)
    {
        res += opNormSSE(r.xmm, a.xmm);
    }

    printf("opNorm (%f) times %6.3f secs\n", res, ((float)clock()-clc)/CLOCKS_PER_SEC);
}

void bench_opCross()
{
    Vector a = {.x=.1, .y = .2, .z = .3};
    Vector r = a;
    clock_t clc = clock();

    for (long int i = cycles; i--;)
    {
        r.xmm = opCrossSSE(r.xmm, a.xmm);
    }

    printf("opCross (%f) times %6.3f secs\n", r.x, ((float)clock()-clc)/CLOCKS_PER_SEC);
}

void bench_opNot()
{
    Vector a = {.x=.1, .y = .2, .z = .3};
    clock_t clc = clock();

    for (long int i = cycles; i--;)
    {
        a.xmm = opNotSSE(a.xmm);
    }

    printf("opNot (%f) times %6.3f secs\n", a.x, ((float)clock()-clc)/CLOCKS_PER_SEC);
}

void bench_opRand()
{
    clock_t clc = clock();
    float res = 0;

    for (long int i = cycles; i--;)
    {
        res += Random();
    }

    printf("Random (%f) times %6.3f secs\n", res, ((float)clock()-clc)/CLOCKS_PER_SEC);
}



void benchOps()
{
    bench_opAdd();
    bench_opMul();
    bench_opNorm();
    bench_opCross();
    bench_opNot();
    bench_opRand();
}
