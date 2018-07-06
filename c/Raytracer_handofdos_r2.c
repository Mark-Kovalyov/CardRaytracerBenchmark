/**
 *  Special thanks to Paul Heckbert
 *
 *  http://tproger.ru/translations/business-card-raytracer
 */
/*
	Siemargl port just to C is fastest
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

#define inline

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

//+
inline Vector* opAdd(Vector *me, const Vector *r) {
	me->x += r->x;
	me->y += r->y;
	me->z += r->z;
#ifdef AVX_VERSIONzzz
	me->zz += r->zz;
#endif
	return me;
}

//*
inline Vector* opMul(Vector *me, float r) {
	me->x *= r;
	me->y *= r;
	me->z *= r;
#ifdef AVX_VERSIONzzz
	me->zz *= r;
#endif
	return me;
}

//%
inline float opNormC(const Vector *restrict me, const Vector *restrict r) {
		return me->x * r->x + me->y * r->y + me->z * r->z;
}

inline float opNormC_single(const Vector *me) {
		return me->x * me->x + me->y * me->y + me->z * me->z;
}


/* SSE1 version - slower than SSE3 */
inline float hsum_ps_SSE1(__m128 v) {                                  // v = [ D C | B A ]
    __m128 shuf   = _mm_shuffle_ps(v, v, _MM_SHUFFLE(2, 3, 0, 1));  // [ C D | A B ]
    __m128 sums   = _mm_add_ps(v, shuf);      // sums = [ D+C C+D | B+A A+B ]
    shuf          = _mm_movehl_ps(shuf, sums);      //  [   C   D | D+C C+D ]  // let the compiler avoid a mov by reusing shuf
    sums          = _mm_add_ss(sums, shuf);
    return    _mm_cvtss_f32(sums);
}

inline float hsum_ps_SSE3(__m128 xx) {
    // xx = { xx3, xx2, xx1, xx0 }
    xx=_mm_hadd_ps(xx,xx);
    // xx = {xx3+xx2, xx1+xx0, xx3+xx2, xx1+xx0}
    xx=_mm_hadd_ps(xx,xx);
    // xx = {xx2+xx3+xx1+xx0, xx3+xx2+xx1+xx0, xx3+xx2+xx1+xx0, xx3+xx2+xx1+xx0}
    return    _mm_cvtss_f32(xx);
}


inline float opNormSSE(const __m128 me, const __m128 r) {
	return hsum_ps_SSE3(me*r);
}

inline float opNormSSE_single(const __m128 me) {
	return hsum_ps_SSE3(me*me);
}


//^
inline Vector* opCrossC(Vector *restrict me, const Vector * restrict r) {
	float newx, newy, newz;
	newx = me->y * r->z - me->z * r->y;
	newy = me->z * r->x - me->x * r->z;
	newz = me->x * r->y - me->y * r->x;

	me->x = newx;
	me->y = newy;
	me->z = newz;

	return me;
}

inline __m128 opCrossSSEint(const __m128 me, const __m128 r) {
    // me = [ ZZ3 Z2 | Y1 X0 ]
   __m128 shuf_me1   = _mm_shuffle_ps(me, me, _MM_SHUFFLE(3, 0, 2, 1));  // [ ZZ X | Z Y ]
   __m128 shuf_r1    = _mm_shuffle_ps(r, r, _MM_SHUFFLE(3, 1, 0, 2));  // [ ZZ Y | X Z ]
    shuf_me1 *= shuf_r1;

   __m128 shuf_me2   = _mm_shuffle_ps(me, me, _MM_SHUFFLE(3, 1, 0, 2));  // [ ZZ Y | X Z ]
   __m128 shuf_r2   = _mm_shuffle_ps(r, r, _MM_SHUFFLE(3, 0, 2, 1));  // [ ZZ X | Z Y ]
    shuf_me2 *= shuf_r2;

	return shuf_me1 - shuf_me2;
}

inline Vector* opCrossSSE(Vector *restrict me, const Vector * restrict r) {
    me->xmm = opCrossSSEint(me->xmm, r->xmm);
    return me;
}


//!
inline Vector* opNotC(Vector *me)
{
	return opMul(me, 1 / sqrt(opNormC_single(me)));
}


inline Vector* opNotSSE(Vector *me)
{
    /* vectors mul faster ??? */
    __m128  k = {1,1,1,1};
    me->xmm *= k / sqrtf(opNormSSE_single(me->xmm));

    //me->xmm *= 1.f / sqrtf(opNormSSE_single(me->xmm));
	return (Vector*)me;
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




#ifdef AVX_VERSION
//#define opNorm(a, b) opNormSSE((a)->xmm, (b)->xmm)
#define opNorm opNormC
//#define opNorm_single(a) opNormSSE_single ((a)->xmm)
#define opNorm_single opNormC_single
//#define opNot(a) opNotSSE(a)
#define opNot opNotC
//#define opCross opCrossSSE
#define opCross opCrossC
#else
#define opNorm opNormC
#define opNorm_single opNormC_single
#define opNot opNotC
#define opCross opCrossC
#endif





int tracer(const Vector *o, const Vector *d, float *t, Vector* restrict n) {
	*t = 1e9;
	int m = 0;
	float p = -o->z / d->z;
	if (.01 < p){
		*t = p;
		*n = (Vector){.x=0, .y=0, .z=1};
		m = 1;
	}
	for (int k = 19; k--;)
		for (int j = 9; j--;)
			if (G[j] & 1 << k) {
				Vector p = {.x=-k, .y=0, .z=-j - 4};				opAdd(&p, o);
				float b = opNorm(&p, d);
				float c = opNorm_single(&p) - 1;
				float q = b * b - c;

				if (q > 0) {
					float s = -b - sqrt(q);
					if (s < *t && s > .01) {
						*t = s;

						*n = *d;    opNot(opAdd(opMul(n, *t), &p));
						m = 2;
					}
				}
			}
	return m;
}

Vector sampler(const Vector *o, const Vector *d) {
	float t;
	Vector n, smpl;
	int m = tracer(o, d, &t, &n);
	if (!m){
		n = (Vector){.x=.7, .y=.6, .z=1};
		return *opMul(&n, pow(1 - d->z, 4));
	}
	Vector h = *d;		opAdd(opMul(&h, t), o);

	Vector hminus = h;	opMul(&hminus, -1);
    Vector l = (Vector){.x=9 + Random(), .y=9 + Random(), .z=16};  opNot(opAdd(&l, &hminus));

	Vector r = n;	opAdd(opMul(&r, opNorm(&n, d) * -2), d);

	float b = opNorm(&l, &n);
	if (b < 0 || tracer(&h, &l, &t, &n)){
		b = 0;
	}
	float p = pow(opNorm(&l, &r) * (b > 0), 99);
	if (m & 1) {
		opMul(&h, .2);

		if ((int) (ceil(h.x) + ceil(h.y)) & 1)
		{
			Vector resV = {.x=3, .y=1, .z=1};
			opMul(&resV, b * .2 + .1);
			return resV;
		}
		else
		{
			Vector resV = {.x=3, .y=3, .z=3};
			opMul(&resV, b * .2 + .1);
			return resV;
		}

	}

	Vector	resV = {.x=p, .y=p, .z=p};
	smpl = sampler(&h, &r);
	opAdd(&resV, opMul(&smpl, .5));

	return resV;
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
	Vector g = {.x=-6, .y=-16, .z=0}; opNot(&g);
    Vector a = {.x=0, .y=0, .z=1};  opMul(opNot(opCross(&a, &g)), .002);
    Vector b = g;   opMul(opNot(opCross(&b, &a)), .002);
    Vector c = a;   opAdd(opMul(opAdd(&c, &b), -256), &g);
	for (int y = HEIGHT; y--;) {
		for (int x = WIDTH; x--;) {
			Vector p = {.x=13, .y=13, .z=13};
			for (int r = 64; r--;) {
				Vector t1 = a;  opMul(&t1, (Random() - .5) * 99);
				Vector t2 = b;  opMul(&t2, (Random() - .5) * 99);
				opAdd(&t1, &t2);

				t2 = (Vector){.x=17, .y=16, .z=8};	opAdd(&t2, &t1);

				Vector randa = a;	opMul(&randa, (Random() + x));
				Vector randb = b;	opMul(&randb, (Random() + y));

				opMul(opAdd(opAdd(&randa, &randb), &c), 16);

				opNot(opAdd(opMul(&t1, -1), &randa));

				Vector smpl = sampler(&t2, &t1);	opMul(&smpl, 3.5);

				opAdd(&p, &smpl);
				//p = sampler(Vector(17, 16, 8) + t, !(t * -1 + (a * (Random() + x) + b * (y + Random()) + c) * 16)) * 3.5 + p;
			}
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
        opAdd(&r, &a);
    }

    printf("opAdd (%f) times %6.3f secs\n", r.x, ((float)clock()-clc)/CLOCKS_PER_SEC);
}

void bench_opMul()
{
    Vector a = {.x=1.1, .y = .2, .z = .3};
    clock_t clc = clock();

    for (long int i = cycles; i--;)
    {
        opMul(&a, 1.000001);
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
        res += opNorm(&r, &a);
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
        opCross(&r, &a);
    }

    printf("opCross (%f) times %6.3f secs\n", r.x, ((float)clock()-clc)/CLOCKS_PER_SEC);
}

void bench_opNot()
{
    Vector a = {.x=.1, .y = .2, .z = .3};
    clock_t clc = clock();

    for (long int i = cycles; i--;)
    {
        opNot(&a);
    }

    printf("opNot (%f) times %6.3f secs\n", a.x, ((float)clock()-clc)/CLOCKS_PER_SEC);
}

void bench_opRand()
{
    Vector a = {.x=.1, .y = .2, .z = .3};
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
