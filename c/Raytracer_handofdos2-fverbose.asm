	.file	"Raytracer_handofdos_r2.c"
# GNU C11 (Ubuntu 7.3.0-16ubuntu3) version 7.3.0 (x86_64-linux-gnu)
#	compiled by GNU C version 7.3.0, GMP version 6.1.2, MPFR version 4.0.1, MPC version 1.1.0, isl version isl-0.19-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  -imultiarch x86_64-linux-gnu Raytracer_handofdos_r2.c
# -march=broadwell -mmmx -mno-3dnow -msse -msse2 -msse3 -mssse3 -mno-sse4a
# -mcx16 -msahf -mmovbe -maes -mno-sha -mpclmul -mpopcnt -mabm -mno-lwp
# -mfma -mno-fma4 -mno-xop -mbmi -mno-sgx -mbmi2 -mno-tbm -mavx -mavx2
# -msse4.1 -mlzcnt -mno-rtm -mno-hle -mrdrnd -mf16c -mfsgsbase -mrdseed
# -mprfchw -madx -mfxsr -mxsave -mxsaveopt -mno-avx512f -mno-avx512er
# -mno-avx512cd -mno-avx512pf -mno-prefetchwt1 -mno-clflushopt -mno-xsavec
# -mno-xsaves -mno-avx512dq -mno-avx512bw -mno-avx512vl -mno-avx512ifma
# -mno-avx512vbmi -mno-avx5124fmaps -mno-avx5124vnniw -mno-clwb -mno-mwaitx
# -mno-clzero -mno-pku -mno-rdpid --param l1-cache-size=32
# --param l1-cache-line-size=64 --param l2-cache-size=3072 -mtune=broadwell
# -m64 -msse4.2 -auxbase-strip Raytracer_handofdos2-fverbose.asm -O3
# -ffast-math -fverbose-asm -fstack-protector-strong -Wformat
# -Wformat-security
# options enabled:  -fPIC -fPIE -faggressive-loop-optimizations
# -falign-labels -fassociative-math -fasynchronous-unwind-tables
# -fauto-inc-dec -fbranch-count-reg -fcaller-saves
# -fchkp-check-incomplete-type -fchkp-check-read -fchkp-check-write
# -fchkp-instrument-calls -fchkp-narrow-bounds -fchkp-optimize
# -fchkp-store-bounds -fchkp-use-static-bounds
# -fchkp-use-static-const-bounds -fchkp-use-wrappers -fcode-hoisting
# -fcombine-stack-adjustments -fcommon -fcompare-elim -fcprop-registers
# -fcrossjumping -fcse-follow-jumps -fcx-limited-range -fdefer-pop
# -fdelete-null-pointer-checks -fdevirtualize -fdevirtualize-speculatively
# -fdwarf2-cfi-asm -fearly-inlining -feliminate-unused-debug-types
# -fexpensive-optimizations -ffinite-math-only -fforward-propagate
# -ffp-int-builtin-inexact -ffunction-cse -fgcse -fgcse-after-reload
# -fgcse-lm -fgnu-runtime -fgnu-unique -fguess-branch-probability
# -fhoist-adjacent-loads -fident -fif-conversion -fif-conversion2
# -findirect-inlining -finline -finline-atomics -finline-functions
# -finline-functions-called-once -finline-small-functions -fipa-bit-cp
# -fipa-cp -fipa-cp-clone -fipa-icf -fipa-icf-functions -fipa-icf-variables
# -fipa-profile -fipa-pure-const -fipa-ra -fipa-reference -fipa-sra
# -fipa-vrp -fira-hoist-pressure -fira-share-save-slots
# -fira-share-spill-slots -fisolate-erroneous-paths-dereference -fivopts
# -fkeep-static-consts -fleading-underscore -flifetime-dse -flra-remat
# -flto-odr-type-merging -fmerge-constants -fmerge-debug-strings
# -fmove-loop-invariants -fomit-frame-pointer -foptimize-sibling-calls
# -foptimize-strlen -fpartial-inlining -fpeel-loops -fpeephole -fpeephole2
# -fplt -fpredictive-commoning -fprefetch-loop-arrays -freciprocal-math
# -free -freg-struct-return -freorder-blocks -freorder-functions
# -frerun-cse-after-loop -fsched-critical-path-heuristic
# -fsched-dep-count-heuristic -fsched-group-heuristic -fsched-interblock
# -fsched-last-insn-heuristic -fsched-rank-heuristic -fsched-spec
# -fsched-spec-insn-heuristic -fsched-stalled-insns-dep -fschedule-fusion
# -fschedule-insns2 -fsemantic-interposition -fshow-column -fshrink-wrap
# -fshrink-wrap-separate -fsplit-ivs-in-unroller -fsplit-loops
# -fsplit-paths -fsplit-wide-types -fssa-backprop -fssa-phiopt
# -fstack-protector-strong -fstdarg-opt -fstore-merging -fstrict-aliasing
# -fstrict-overflow -fstrict-volatile-bitfields -fsync-libcalls
# -fthread-jumps -ftoplevel-reorder -ftree-bit-ccp -ftree-builtin-call-dce
# -ftree-ccp -ftree-ch -ftree-coalesce-vars -ftree-copy-prop -ftree-cselim
# -ftree-dce -ftree-dominator-opts -ftree-dse -ftree-forwprop -ftree-fre
# -ftree-loop-distribute-patterns -ftree-loop-if-convert -ftree-loop-im
# -ftree-loop-ivcanon -ftree-loop-optimize -ftree-loop-vectorize
# -ftree-parallelize-loops= -ftree-partial-pre -ftree-phiprop -ftree-pre
# -ftree-pta -ftree-reassoc -ftree-scev-cprop -ftree-sink
# -ftree-slp-vectorize -ftree-slsr -ftree-sra -ftree-switch-conversion
# -ftree-tail-merge -ftree-ter -ftree-vrp -funit-at-a-time
# -funsafe-math-optimizations -funswitch-loops -funwind-tables
# -fverbose-asm -fzero-initialized-in-bss -m128bit-long-double -m64 -m80387
# -mabm -madx -maes -malign-stringops -mavx -mavx2 -mbmi -mbmi2 -mcx16
# -mf16c -mfancy-math-387 -mfma -mfp-ret-in-387 -mfsgsbase -mfxsr -mglibc
# -mhle -mlong-double-80 -mlzcnt -mmmx -mmovbe -mpclmul -mpopcnt -mprfchw
# -mpush-args -mrdrnd -mrdseed -mred-zone -msahf -msse -msse2 -msse3 -msse4
# -msse4.1 -msse4.2 -mssse3 -mstv -mtls-direct-seg-refs -mvzeroupper
# -mxsave -mxsaveopt

	.text
	.p2align 4,,15
	.globl	opAdd
	.type	opAdd, @function
opAdd:
.LFB578:
	.cfi_startproc
# Raytracer_handofdos_r2.c:38: 	me->x += r->x;
	vmovss	(%rdi), %xmm0	# me_11(D)->D.7143.x, me_11(D)->D.7143.x
	vaddss	(%rsi), %xmm0, %xmm0	# r_12(D)->D.7143.x, me_11(D)->D.7143.x, tmp99
# Raytracer_handofdos_r2.c:37: inline Vector* opAdd(Vector *me, const Vector *r) {
	movq	%rdi, %rax	# me, me
# Raytracer_handofdos_r2.c:38: 	me->x += r->x;
	vmovss	%xmm0, (%rdi)	# tmp99, me_11(D)->D.7143.x
# Raytracer_handofdos_r2.c:39: 	me->y += r->y;
	vmovss	4(%rdi), %xmm0	# me_11(D)->D.7143.y, me_11(D)->D.7143.y
	vaddss	4(%rsi), %xmm0, %xmm0	# r_12(D)->D.7143.y, me_11(D)->D.7143.y, tmp101
	vmovss	%xmm0, 4(%rdi)	# tmp101, me_11(D)->D.7143.y
# Raytracer_handofdos_r2.c:40: 	me->z += r->z;
	vmovss	8(%rdi), %xmm0	# me_11(D)->D.7143.z, me_11(D)->D.7143.z
	vaddss	8(%rsi), %xmm0, %xmm0	# r_12(D)->D.7143.z, me_11(D)->D.7143.z, tmp103
	vmovss	%xmm0, 8(%rdi)	# tmp103, me_11(D)->D.7143.z
# Raytracer_handofdos_r2.c:45: }
	ret
	.cfi_endproc
.LFE578:
	.size	opAdd, .-opAdd
	.p2align 4,,15
	.globl	opMul
	.type	opMul, @function
opMul:
.LFB579:
	.cfi_startproc
# Raytracer_handofdos_r2.c:49: 	me->x *= r;
	vmulss	(%rdi), %xmm0, %xmm1	# me_8(D)->D.7143.x, r, tmp96
# Raytracer_handofdos_r2.c:48: inline Vector* opMul(Vector *me, float r) {
	movq	%rdi, %rax	# me, me
# Raytracer_handofdos_r2.c:49: 	me->x *= r;
	vmovss	%xmm1, (%rdi)	# tmp96, me_8(D)->D.7143.x
# Raytracer_handofdos_r2.c:50: 	me->y *= r;
	vmulss	4(%rdi), %xmm0, %xmm1	# me_8(D)->D.7143.y, r, tmp98
# Raytracer_handofdos_r2.c:51: 	me->z *= r;
	vmulss	8(%rdi), %xmm0, %xmm0	# me_8(D)->D.7143.z, r, tmp100
# Raytracer_handofdos_r2.c:50: 	me->y *= r;
	vmovss	%xmm1, 4(%rdi)	# tmp98, me_8(D)->D.7143.y
# Raytracer_handofdos_r2.c:51: 	me->z *= r;
	vmovss	%xmm0, 8(%rdi)	# tmp100, me_8(D)->D.7143.z
# Raytracer_handofdos_r2.c:56: }
	ret
	.cfi_endproc
.LFE579:
	.size	opMul, .-opMul
	.p2align 4,,15
	.globl	opNormC
	.type	opNormC, @function
opNormC:
.LFB580:
	.cfi_startproc
# Raytracer_handofdos_r2.c:60: 		return me->x * r->x + me->y * r->y + me->z * r->z;
	vmovss	4(%rdi), %xmm0	# *me_12(D).D.7143.y, *me_12(D).D.7143.y
	vmulss	4(%rsi), %xmm0, %xmm0	# *r_13(D).D.7143.y, *me_12(D).D.7143.y, tmp99
	vmovss	(%rdi), %xmm1	# *me_12(D).D.7143.x, tmp102
	vfmadd231ss	(%rsi), %xmm1, %xmm0	# *r_13(D).D.7143.x, tmp102, tmp101
	vmovss	8(%rdi), %xmm2	# *me_12(D).D.7143.z, tmp103
	vfmadd231ss	8(%rsi), %xmm2, %xmm0	# *r_13(D).D.7143.z, tmp103, tmp98
# Raytracer_handofdos_r2.c:61: }
	ret
	.cfi_endproc
.LFE580:
	.size	opNormC, .-opNormC
	.p2align 4,,15
	.globl	opNormC_single
	.type	opNormC_single, @function
opNormC_single:
.LFB581:
	.cfi_startproc
# Raytracer_handofdos_r2.c:64: 		return me->x * me->x + me->y * me->y + me->z * me->z;
	vmovss	4(%rdi), %xmm2	# me_9(D)->D.7143.y, _3
	vmovss	(%rdi), %xmm1	# me_9(D)->D.7143.x, _1
	vmovss	8(%rdi), %xmm0	# me_9(D)->D.7143.z, _6
	vmulss	%xmm2, %xmm2, %xmm2	# _3, _3, tmp95
	vfmadd132ss	%xmm1, %xmm2, %xmm1	# _1, tmp95, tmp96
	vfmadd132ss	%xmm0, %xmm1, %xmm0	# _6, tmp96, tmp94
# Raytracer_handofdos_r2.c:65: }
	ret
	.cfi_endproc
.LFE581:
	.size	opNormC_single, .-opNormC_single
	.p2align 4,,15
	.globl	hsum_ps_SSE1
	.type	hsum_ps_SSE1, @function
hsum_ps_SSE1:
.LFB582:
	.cfi_startproc
# /usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h:746:   return (__m128) __builtin_ia32_shufps ((__v4sf)__A, (__v4sf)__B, __mask);
	vshufps	$177, %xmm0, %xmm0, %xmm1	#, v, v, tmp93
# /usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h:186:   return (__m128) ((__v4sf)__A + (__v4sf)__B);
	vaddps	%xmm1, %xmm0, %xmm0	# tmp93, v, _4
# /usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h:787:   return (__m128) __builtin_ia32_movhlps ((__v4sf)__A, (__v4sf)__B);
	vmovhlps	%xmm0, %xmm1, %xmm1	# _4, tmp93, tmp96
# /usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h:130:   return (__m128) __builtin_ia32_addss ((__v4sf)__A, (__v4sf)__B);
	vaddss	%xmm1, %xmm0, %xmm0	# tmp96, _4, tmp97
# Raytracer_handofdos_r2.c:75: }
	ret
	.cfi_endproc
.LFE582:
	.size	hsum_ps_SSE1, .-hsum_ps_SSE1
	.p2align 4,,15
	.globl	hsum_ps_SSE3
	.type	hsum_ps_SSE3, @function
hsum_ps_SSE3:
.LFB583:
	.cfi_startproc
# /usr/lib/gcc/x86_64-linux-gnu/7/include/pmmintrin.h:58:   return (__m128) __builtin_ia32_haddps ((__v4sf)__X, (__v4sf)__Y);
	vhaddps	%xmm0, %xmm0, %xmm0	# xx, xx, tmp91
	vhaddps	%xmm0, %xmm0, %xmm0	# tmp91, tmp91, tmp92
# Raytracer_handofdos_r2.c:84: }
	ret
	.cfi_endproc
.LFE583:
	.size	hsum_ps_SSE3, .-hsum_ps_SSE3
	.p2align 4,,15
	.globl	opNormSSE
	.type	opNormSSE, @function
opNormSSE:
.LFB584:
	.cfi_startproc
# Raytracer_handofdos_r2.c:88: 	return hsum_ps_SSE3(me*r);
	vmulps	%xmm1, %xmm0, %xmm1	# r, me, _1
# /usr/lib/gcc/x86_64-linux-gnu/7/include/pmmintrin.h:58:   return (__m128) __builtin_ia32_haddps ((__v4sf)__X, (__v4sf)__Y);
	vhaddps	%xmm1, %xmm1, %xmm1	# _1, _1, tmp93
	vhaddps	%xmm1, %xmm1, %xmm1	# tmp93, tmp93, tmp94
# /usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h:969:   return ((__v4sf)__A)[0];
	vmovaps	%xmm1, %xmm0	# tmp94, tmp95
# Raytracer_handofdos_r2.c:89: }
	ret
	.cfi_endproc
.LFE584:
	.size	opNormSSE, .-opNormSSE
	.p2align 4,,15
	.globl	opNormSSE_single
	.type	opNormSSE_single, @function
opNormSSE_single:
.LFB585:
	.cfi_startproc
# Raytracer_handofdos_r2.c:92: 	return hsum_ps_SSE3(me*me);
	vmulps	%xmm0, %xmm0, %xmm0	# me, me, _1
# /usr/lib/gcc/x86_64-linux-gnu/7/include/pmmintrin.h:58:   return (__m128) __builtin_ia32_haddps ((__v4sf)__X, (__v4sf)__Y);
	vhaddps	%xmm0, %xmm0, %xmm0	# _1, _1, tmp92
	vhaddps	%xmm0, %xmm0, %xmm0	# tmp92, tmp92, tmp93
# Raytracer_handofdos_r2.c:93: }
	ret
	.cfi_endproc
.LFE585:
	.size	opNormSSE_single, .-opNormSSE_single
	.p2align 4,,15
	.globl	opCrossC
	.type	opCrossC, @function
opCrossC:
.LFB586:
	.cfi_startproc
# Raytracer_handofdos_r2.c:99: 	newx = me->y * r->z - me->z * r->y;
	vmovss	8(%rdi), %xmm2	# *me_14(D).D.7143.z, _4
	vmovss	4(%rsi), %xmm0	# *r_15(D).D.7143.y, _5
# Raytracer_handofdos_r2.c:97: inline Vector* opCrossC(Vector *restrict me, const Vector * restrict r) {
	movq	%rdi, %rax	# me, me
# Raytracer_handofdos_r2.c:99: 	newx = me->y * r->z - me->z * r->y;
	vmovss	4(%rdi), %xmm1	# *me_14(D).D.7143.y, _1
# Raytracer_handofdos_r2.c:100: 	newy = me->z * r->x - me->x * r->z;
	vmovss	(%rdi), %xmm5	# *me_14(D).D.7143.x, _9
# Raytracer_handofdos_r2.c:99: 	newx = me->y * r->z - me->z * r->y;
	vmulss	%xmm0, %xmm2, %xmm4	# _5, _4, tmp105
	vmovss	8(%rsi), %xmm3	# *r_15(D).D.7143.z, _2
# Raytracer_handofdos_r2.c:100: 	newy = me->z * r->x - me->x * r->z;
	vmovss	(%rsi), %xmm6	# *r_15(D).D.7143.x, _7
# Raytracer_handofdos_r2.c:99: 	newx = me->y * r->z - me->z * r->y;
	vfmsub231ss	%xmm3, %xmm1, %xmm4	# _2, _1, newx
# Raytracer_handofdos_r2.c:100: 	newy = me->z * r->x - me->x * r->z;
	vmulss	%xmm5, %xmm3, %xmm3	# _9, _2, tmp107
# Raytracer_handofdos_r2.c:101: 	newz = me->x * r->y - me->y * r->x;
	vmulss	%xmm6, %xmm1, %xmm1	# _7, _1, tmp109
# Raytracer_handofdos_r2.c:103: 	me->x = newx;
	vmovss	%xmm4, (%rdi)	# newx, *me_14(D).D.7143.x
# Raytracer_handofdos_r2.c:100: 	newy = me->z * r->x - me->x * r->z;
	vfmsub132ss	%xmm6, %xmm3, %xmm2	# _7, tmp107, newy
# Raytracer_handofdos_r2.c:101: 	newz = me->x * r->y - me->y * r->x;
	vfmsub132ss	%xmm5, %xmm1, %xmm0	# _9, tmp109, newz
# Raytracer_handofdos_r2.c:104: 	me->y = newy;
	vmovss	%xmm2, 4(%rdi)	# newy, *me_14(D).D.7143.y
# Raytracer_handofdos_r2.c:105: 	me->z = newz;
	vmovss	%xmm0, 8(%rdi)	# newz, *me_14(D).D.7143.z
# Raytracer_handofdos_r2.c:108: }
	ret
	.cfi_endproc
.LFE586:
	.size	opCrossC, .-opCrossC
	.p2align 4,,15
	.globl	opCrossSSEint
	.type	opCrossSSEint, @function
opCrossSSEint:
.LFB587:
	.cfi_startproc
# /usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h:746:   return (__m128) __builtin_ia32_shufps ((__v4sf)__A, (__v4sf)__B, __mask);
	vshufps	$201, %xmm0, %xmm0, %xmm2	#, me, me, tmp96
	vshufps	$210, %xmm1, %xmm1, %xmm3	#, r, r, tmp99
	vshufps	$210, %xmm0, %xmm0, %xmm0	#, me, me, tmp102
	vshufps	$201, %xmm1, %xmm1, %xmm1	#, r, r, tmp105
# Raytracer_handofdos_r2.c:118:     shuf_me2 *= shuf_r2;
	vmulps	%xmm1, %xmm0, %xmm0	# tmp105, tmp102, shuf_me2
# Raytracer_handofdos_r2.c:120: 	return shuf_me1 - shuf_me2;
	vfmsub231ps	%xmm3, %xmm2, %xmm0	# tmp99, tmp96, tmp108
# Raytracer_handofdos_r2.c:121: }
	ret
	.cfi_endproc
.LFE587:
	.size	opCrossSSEint, .-opCrossSSEint
	.p2align 4,,15
	.globl	opCrossSSE
	.type	opCrossSSE, @function
opCrossSSE:
.LFB588:
	.cfi_startproc
# Raytracer_handofdos_r2.c:124:     me->xmm = opCrossSSEint(me->xmm, r->xmm);
	vmovaps	(%rdi), %xmm0	# *me_5(D).xmm, _2
	vmovaps	(%rsi), %xmm1	# *r_4(D).xmm, _1
# Raytracer_handofdos_r2.c:123: inline Vector* opCrossSSE(Vector *restrict me, const Vector * restrict r) {
	movq	%rdi, %rax	# me, me
# /usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h:746:   return (__m128) __builtin_ia32_shufps ((__v4sf)__A, (__v4sf)__B, __mask);
	vshufps	$201, %xmm0, %xmm0, %xmm2	#, _2, _2, tmp99
	vshufps	$210, %xmm1, %xmm1, %xmm3	#, _1, _1, tmp102
	vshufps	$210, %xmm0, %xmm0, %xmm0	#, _2, _2, tmp105
	vshufps	$201, %xmm1, %xmm1, %xmm1	#, _1, _1, tmp108
# Raytracer_handofdos_r2.c:118:     shuf_me2 *= shuf_r2;
	vmulps	%xmm1, %xmm0, %xmm0	# tmp108, tmp105, shuf_me2
# Raytracer_handofdos_r2.c:120: 	return shuf_me1 - shuf_me2;
	vfmsub231ps	%xmm3, %xmm2, %xmm0	# tmp102, tmp99, tmp112
# Raytracer_handofdos_r2.c:124:     me->xmm = opCrossSSEint(me->xmm, r->xmm);
	vmovaps	%xmm0, (%rdi)	# tmp112, *me_5(D).xmm
# Raytracer_handofdos_r2.c:126: }
	ret
	.cfi_endproc
.LFE588:
	.size	opCrossSSE, .-opCrossSSE
	.p2align 4,,15
	.globl	opNotC
	.type	opNotC, @function
opNotC:
.LFB589:
	.cfi_startproc
# Raytracer_handofdos_r2.c:64: 		return me->x * me->x + me->y * me->y + me->z * me->z;
	vmovss	4(%rdi), %xmm2	# MEM[(const union Vector *)me_6(D)].D.7143.y, _12
	vmovss	(%rdi), %xmm3	# MEM[(const union Vector *)me_6(D)].D.7143.x, _10
# Raytracer_handofdos_r2.c:132: 	return opMul(me, 1 / sqrt(opNormC_single(me)));
	vxorpd	%xmm0, %xmm0, %xmm0	# tmp105
# Raytracer_handofdos_r2.c:131: {
	movq	%rdi, %rax	# me, me
# Raytracer_handofdos_r2.c:64: 		return me->x * me->x + me->y * me->y + me->z * me->z;
	vmovss	8(%rdi), %xmm4	# MEM[(const union Vector *)me_6(D)].D.7143.z, _15
	vmulss	%xmm2, %xmm2, %xmm1	# _12, _12, tmp102
	vfmadd231ss	%xmm3, %xmm3, %xmm1	# _10, _10, tmp103
	vfmadd231ss	%xmm4, %xmm4, %xmm1	# _15, _15, tmp104
# Raytracer_handofdos_r2.c:132: 	return opMul(me, 1 / sqrt(opNormC_single(me)));
	vcvtss2sd	%xmm1, %xmm0, %xmm0	# tmp104, tmp105, tmp105
	vsqrtsd	%xmm0, %xmm1, %xmm1	# tmp105, _2
	vmovsd	.LC0(%rip), %xmm0	#, tmp107
	vdivsd	%xmm1, %xmm0, %xmm0	# _2, tmp107, tmp106
	vcvtsd2ss	%xmm0, %xmm0, %xmm0	# tmp106, _4
# Raytracer_handofdos_r2.c:49: 	me->x *= r;
	vmulss	%xmm3, %xmm0, %xmm3	# _10, _4, tmp108
# Raytracer_handofdos_r2.c:50: 	me->y *= r;
	vmulss	%xmm2, %xmm0, %xmm2	# _12, _4, tmp109
# Raytracer_handofdos_r2.c:51: 	me->z *= r;
	vmulss	%xmm4, %xmm0, %xmm0	# _15, _4, tmp110
# Raytracer_handofdos_r2.c:49: 	me->x *= r;
	vmovss	%xmm3, (%rdi)	# tmp108, me_6(D)->D.7143.x
# Raytracer_handofdos_r2.c:50: 	me->y *= r;
	vmovss	%xmm2, 4(%rdi)	# tmp109, me_6(D)->D.7143.y
# Raytracer_handofdos_r2.c:51: 	me->z *= r;
	vmovss	%xmm0, 8(%rdi)	# tmp110, me_6(D)->D.7143.z
# Raytracer_handofdos_r2.c:133: }
	ret
	.cfi_endproc
.LFE589:
	.size	opNotC, .-opNotC
	.p2align 4,,15
	.globl	opNotSSE
	.type	opNotSSE, @function
opNotSSE:
.LFB590:
	.cfi_startproc
# Raytracer_handofdos_r2.c:140:     me->xmm *= k / sqrtf(opNormSSE_single(me->xmm));
	vmovaps	(%rdi), %xmm2	# me_5(D)->xmm, _2
	vmovss	.LC1(%rip), %xmm1	#, tmp101
# Raytracer_handofdos_r2.c:137: {
	movq	%rdi, %rax	# me, me
# Raytracer_handofdos_r2.c:92: 	return hsum_ps_SSE3(me*me);
	vmulps	%xmm2, %xmm2, %xmm0	# _2, _2, _6
# /usr/lib/gcc/x86_64-linux-gnu/7/include/pmmintrin.h:58:   return (__m128) __builtin_ia32_haddps ((__v4sf)__X, (__v4sf)__Y);
	vhaddps	%xmm0, %xmm0, %xmm0	# _6, _6, tmp98
	vhaddps	%xmm0, %xmm0, %xmm0	# tmp98, tmp98, tmp99
# Raytracer_handofdos_r2.c:140:     me->xmm *= k / sqrtf(opNormSSE_single(me->xmm));
	vsqrtss	%xmm0, %xmm0, %xmm0	# tmp100, _7
	vdivss	%xmm0, %xmm1, %xmm0	# _7, tmp101, _13
	vshufps	$0, %xmm0, %xmm0, %xmm0	# _13, tmp102
	vmulps	%xmm2, %xmm0, %xmm0	# _2, tmp102, tmp103
	vmovaps	%xmm0, (%rdi)	# tmp103, me_5(D)->xmm
# Raytracer_handofdos_r2.c:144: }
	ret
	.cfi_endproc
.LFE590:
	.size	opNotSSE, .-opNotSSE
	.p2align 4,,15
	.globl	GetUint
	.type	GetUint, @function
GetUint:
.LFB591:
	.cfi_startproc
# Raytracer_handofdos_r2.c:163:     m_z = 36969 * (m_z & 65535) + (m_z >> 16);
	movl	m_z(%rip), %eax	# m_z, m_z.0_1
# Raytracer_handofdos_r2.c:164:     m_w = 18000 * (m_w & 65535) + (m_w >> 16);
	movl	m_w(%rip), %ecx	# m_w, m_w.2_6
# Raytracer_handofdos_r2.c:163:     m_z = 36969 * (m_z & 65535) + (m_z >> 16);
	movzwl	%ax, %edx	# m_z.0_1, m_z.0_1
	shrl	$16, %eax	#, tmp101
	imull	$36969, %edx, %edx	#, m_z.0_1, tmp100
	addl	%eax, %edx	# tmp101, _5
# Raytracer_handofdos_r2.c:164:     m_w = 18000 * (m_w & 65535) + (m_w >> 16);
	movzwl	%cx, %eax	# m_w.2_6, m_w.2_6
	shrl	$16, %ecx	#, tmp104
	imull	$18000, %eax, %eax	#, m_w.2_6, tmp103
# Raytracer_handofdos_r2.c:163:     m_z = 36969 * (m_z & 65535) + (m_z >> 16);
	movl	%edx, m_z(%rip)	# _5, m_z
# Raytracer_handofdos_r2.c:165:     return (m_z << 16) + m_w;
	sall	$16, %edx	#, tmp106
# Raytracer_handofdos_r2.c:164:     m_w = 18000 * (m_w & 65535) + (m_w >> 16);
	addl	%ecx, %eax	# tmp104, _10
	movl	%eax, m_w(%rip)	# _10, m_w
# Raytracer_handofdos_r2.c:165:     return (m_z << 16) + m_w;
	addl	%edx, %eax	# tmp106, tmp105
# Raytracer_handofdos_r2.c:166: }
	ret
	.cfi_endproc
.LFE591:
	.size	GetUint, .-GetUint
	.p2align 4,,15
	.globl	GetUniform
	.type	GetUniform, @function
GetUniform:
.LFB592:
	.cfi_startproc
# Raytracer_handofdos_r2.c:163:     m_z = 36969 * (m_z & 65535) + (m_z >> 16);
	movl	m_z(%rip), %edx	# m_z, m_z.0_5
# Raytracer_handofdos_r2.c:164:     m_w = 18000 * (m_w & 65535) + (m_w >> 16);
	movl	m_w(%rip), %ecx	# m_w, m_w.2_10
# Raytracer_handofdos_r2.c:174:     return (u + 1.0) * 2.328306435454494e-10;
	vxorpd	%xmm0, %xmm0, %xmm0	# tmp111
# Raytracer_handofdos_r2.c:163:     m_z = 36969 * (m_z & 65535) + (m_z >> 16);
	movzwl	%dx, %eax	# m_z.0_5, m_z.0_5
	shrl	$16, %edx	#, tmp104
	imull	$36969, %eax, %eax	#, m_z.0_5, tmp103
	addl	%edx, %eax	# tmp104, _9
# Raytracer_handofdos_r2.c:164:     m_w = 18000 * (m_w & 65535) + (m_w >> 16);
	movzwl	%cx, %edx	# m_w.2_10, m_w.2_10
	shrl	$16, %ecx	#, tmp107
	imull	$18000, %edx, %edx	#, m_w.2_10, tmp106
# Raytracer_handofdos_r2.c:163:     m_z = 36969 * (m_z & 65535) + (m_z >> 16);
	movl	%eax, m_z(%rip)	# _9, m_z
# Raytracer_handofdos_r2.c:165:     return (m_z << 16) + m_w;
	sall	$16, %eax	#, tmp109
# Raytracer_handofdos_r2.c:164:     m_w = 18000 * (m_w & 65535) + (m_w >> 16);
	addl	%ecx, %edx	# tmp107, _14
# Raytracer_handofdos_r2.c:174:     return (u + 1.0) * 2.328306435454494e-10;
	addl	%edx, %eax	# _14, tmp112
# Raytracer_handofdos_r2.c:164:     m_w = 18000 * (m_w & 65535) + (m_w >> 16);
	movl	%edx, m_w(%rip)	# _14, m_w
# Raytracer_handofdos_r2.c:174:     return (u + 1.0) * 2.328306435454494e-10;
	vcvtsi2sdq	%rax, %xmm0, %xmm0	# tmp112, tmp111, tmp111
	vaddsd	.LC0(%rip), %xmm0, %xmm0	#, tmp111, tmp116
	vmulsd	.LC2(%rip), %xmm0, %xmm0	#, tmp116, tmp108
# Raytracer_handofdos_r2.c:175: }
	ret
	.cfi_endproc
.LFE592:
	.size	GetUniform, .-GetUniform
	.p2align 4,,15
	.globl	Random
	.type	Random, @function
Random:
.LFB593:
	.cfi_startproc
# Raytracer_handofdos_r2.c:163:     m_z = 36969 * (m_z & 65535) + (m_z >> 16);
	movl	m_z(%rip), %edx	# m_z, m_z.0_5
# Raytracer_handofdos_r2.c:164:     m_w = 18000 * (m_w & 65535) + (m_w >> 16);
	movl	m_w(%rip), %ecx	# m_w, m_w.2_10
# Raytracer_handofdos_r2.c:174:     return (u + 1.0) * 2.328306435454494e-10;
	vxorpd	%xmm0, %xmm0, %xmm0	# tmp112
# Raytracer_handofdos_r2.c:163:     m_z = 36969 * (m_z & 65535) + (m_z >> 16);
	movzwl	%dx, %eax	# m_z.0_5, m_z.0_5
	shrl	$16, %edx	#, tmp105
	imull	$36969, %eax, %eax	#, m_z.0_5, tmp104
	addl	%edx, %eax	# tmp105, _9
# Raytracer_handofdos_r2.c:164:     m_w = 18000 * (m_w & 65535) + (m_w >> 16);
	movzwl	%cx, %edx	# m_w.2_10, m_w.2_10
	shrl	$16, %ecx	#, tmp108
	imull	$18000, %edx, %edx	#, m_w.2_10, tmp107
# Raytracer_handofdos_r2.c:163:     m_z = 36969 * (m_z & 65535) + (m_z >> 16);
	movl	%eax, m_z(%rip)	# _9, m_z
# Raytracer_handofdos_r2.c:165:     return (m_z << 16) + m_w;
	sall	$16, %eax	#, tmp110
# Raytracer_handofdos_r2.c:164:     m_w = 18000 * (m_w & 65535) + (m_w >> 16);
	addl	%ecx, %edx	# tmp108, _14
# Raytracer_handofdos_r2.c:174:     return (u + 1.0) * 2.328306435454494e-10;
	addl	%edx, %eax	# _14, tmp113
# Raytracer_handofdos_r2.c:164:     m_w = 18000 * (m_w & 65535) + (m_w >> 16);
	movl	%edx, m_w(%rip)	# _14, m_w
# Raytracer_handofdos_r2.c:174:     return (u + 1.0) * 2.328306435454494e-10;
	vcvtsi2sdq	%rax, %xmm0, %xmm0	# tmp113, tmp112, tmp112
	vaddsd	.LC0(%rip), %xmm0, %xmm0	#, tmp112, tmp117
	vmulsd	.LC2(%rip), %xmm0, %xmm0	#, tmp117, tmp119
# Raytracer_handofdos_r2.c:179:     return GetUniform();
	vcvtsd2ss	%xmm0, %xmm0, %xmm0	# tmp119, tmp109
# Raytracer_handofdos_r2.c:180: }
	ret
	.cfi_endproc
.LFE593:
	.size	Random, .-Random
	.p2align 4,,15
	.globl	tracer
	.type	tracer, @function
tracer:
.LFB594:
	.cfi_startproc
# Raytracer_handofdos_r2.c:209: 	if (.01 < p){
	vmovsd	.LC5(%rip), %xmm8	#, tmp233
	vxorpd	%xmm1, %xmm1, %xmm1	# tmp194
# Raytracer_handofdos_r2.c:207: 	int m = 0;
	xorl	%eax, %eax	# <retval>
# Raytracer_handofdos_r2.c:205: int tracer(const Vector *o, const Vector *d, float *t, Vector* restrict n) {
	pushq	%r12	#
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
# Raytracer_handofdos_r2.c:206: 	*t = 1e9;
	movl	$0x4e6e6b28, (%rdx)	#, *t_32(D)
# Raytracer_handofdos_r2.c:208: 	float p = -o->z / d->z;
	vmovss	8(%rdi), %xmm0	# *o_34(D).D.7143.z, *o_34(D).D.7143.z
	vmovss	.LC4(%rip), %xmm7	#, tmp232
# Raytracer_handofdos_r2.c:205: int tracer(const Vector *o, const Vector *d, float *t, Vector* restrict n) {
	pushq	%rbp	#
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
# Raytracer_handofdos_r2.c:208: 	float p = -o->z / d->z;
	vxorps	%xmm7, %xmm0, %xmm0	# tmp232, *o_34(D).D.7143.z, tmp191
	vdivss	8(%rsi), %xmm0, %xmm0	# *d_35(D).D.7143.z, tmp191, p
# Raytracer_handofdos_r2.c:209: 	if (.01 < p){
	vcvtss2sd	%xmm0, %xmm1, %xmm1	# p, tmp194, tmp194
# Raytracer_handofdos_r2.c:205: int tracer(const Vector *o, const Vector *d, float *t, Vector* restrict n) {
	pushq	%rbx	#
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
# Raytracer_handofdos_r2.c:209: 	if (.01 < p){
	vcomisd	%xmm8, %xmm1	# tmp233, tmp194
	jbe	.L23	#,
# Raytracer_handofdos_r2.c:210: 		*t = p;
	vmovss	%xmm0, (%rdx)	# p, *t_32(D)
# Raytracer_handofdos_r2.c:211: 		*n = (Vector){.x=0, .y=0, .z=1};
	vpxor	%xmm0, %xmm0, %xmm0	# tmp246
# Raytracer_handofdos_r2.c:212: 		m = 1;
	movl	$1, %eax	#, <retval>
# Raytracer_handofdos_r2.c:211: 		*n = (Vector){.x=0, .y=0, .z=1};
	vmovaps	%xmm0, (%rcx)	# tmp246, *n_38(D)
	movl	$0x3f800000, 8(%rcx)	#, *n_38(D).D.7143.z
.L23:
# Raytracer_handofdos_r2.c:207: 	int m = 0;
	movl	$-18, %r11d	#, ivtmp.157
	movl	$1, %ebp	#, tmp231
# Raytracer_handofdos_r2.c:222: 				if (q > 0) {
	vxorps	%xmm5, %xmm5, %xmm5	# tmp238
# Raytracer_handofdos_r2.c:220: 				float q = b * b - c;
	vmovss	.LC1(%rip), %xmm6	#, tmp237
# Raytracer_handofdos_r2.c:132: 	return opMul(me, 1 / sqrt(opNormC_single(me)));
	vmovsd	.LC0(%rip), %xmm9	#, tmp239
	leaq	G(%rip), %r10	#, tmp234
# Raytracer_handofdos_r2.c:217: 				Vector p = {.x=-k, .y=0, .z=-j - 4};				opAdd(&p, o);
	movl	$-4, %ebx	#, tmp236
	.p2align 4,,10
	.p2align 3
.L31:
# Raytracer_handofdos_r2.c:217: 				Vector p = {.x=-k, .y=0, .z=-j - 4};				opAdd(&p, o);
	vxorps	%xmm11, %xmm11, %xmm11	# tmp235
	movl	%r11d, %r9d	# ivtmp.157, tmp230
# Raytracer_handofdos_r2.c:205: int tracer(const Vector *o, const Vector *d, float *t, Vector* restrict n) {
	movl	$8, %r8d	#, ivtmp.143
# Raytracer_handofdos_r2.c:217: 				Vector p = {.x=-k, .y=0, .z=-j - 4};				opAdd(&p, o);
	vcvtsi2ss	%r11d, %xmm11, %xmm11	# ivtmp.157, tmp235, tmp235
	negl	%r9d	# tmp230
	shlx	%r9d, %ebp, %r9d	# tmp230, tmp231, shifttmp_81
	.p2align 4,,10
	.p2align 3
.L29:
# Raytracer_handofdos_r2.c:216: 			if (G[j] & 1 << k) {
	testl	%r9d, (%r10,%r8,4)	# shifttmp_81, MEM[symbol: G, index: _165, offset: 0B]
	je	.L25	#,
# Raytracer_handofdos_r2.c:39: 	me->y += r->y;
	vmovss	4(%rdi), %xmm4	# *o_34(D).D.7143.y, _65
# Raytracer_handofdos_r2.c:217: 				Vector p = {.x=-k, .y=0, .z=-j - 4};				opAdd(&p, o);
	movl	%ebx, %r12d	# tmp236, tmp201
# Raytracer_handofdos_r2.c:38: 	me->x += r->x;
	vaddss	(%rdi), %xmm11, %xmm10	# *o_34(D).D.7143.x, tmp235, _64
# Raytracer_handofdos_r2.c:217: 				Vector p = {.x=-k, .y=0, .z=-j - 4};				opAdd(&p, o);
	vxorps	%xmm3, %xmm3, %xmm3	# tmp203
# Raytracer_handofdos_r2.c:60: 		return me->x * r->x + me->y * r->y + me->z * r->z;
	vmulss	4(%rsi), %xmm4, %xmm0	# *d_35(D).D.7143.y, _65, tmp204
# Raytracer_handofdos_r2.c:217: 				Vector p = {.x=-k, .y=0, .z=-j - 4};				opAdd(&p, o);
	subl	%r8d, %r12d	# ivtmp.143, tmp201
# Raytracer_handofdos_r2.c:60: 		return me->x * r->x + me->y * r->y + me->z * r->z;
	vfmadd231ss	(%rsi), %xmm10, %xmm0	# *d_35(D).D.7143.x, _64, tmp205
# Raytracer_handofdos_r2.c:217: 				Vector p = {.x=-k, .y=0, .z=-j - 4};				opAdd(&p, o);
	vcvtsi2ss	%r12d, %xmm3, %xmm3	# tmp201, tmp203, tmp203
# Raytracer_handofdos_r2.c:40: 	me->z += r->z;
	vaddss	8(%rdi), %xmm3, %xmm3	# *o_34(D).D.7143.z, tmp203, _67
# Raytracer_handofdos_r2.c:60: 		return me->x * r->x + me->y * r->y + me->z * r->z;
	vfmadd231ss	8(%rsi), %xmm3, %xmm0	# *d_35(D).D.7143.z, _67, _62
# Raytracer_handofdos_r2.c:220: 				float q = b * b - c;
	vmovaps	%xmm4, %xmm2	# _65, tmp206
	vfnmadd132ss	%xmm4, %xmm6, %xmm2	# _65, tmp237, tmp206
	vmulss	%xmm0, %xmm0, %xmm1	# _62, _62, tmp209
	vfnmadd231ss	%xmm10, %xmm10, %xmm2	# _64, _64, tmp208
	vfnmadd231ss	%xmm3, %xmm3, %xmm1	# _67, _67, tmp210
	vaddss	%xmm1, %xmm2, %xmm1	# tmp210, tmp208, q
# Raytracer_handofdos_r2.c:222: 				if (q > 0) {
	vcomiss	%xmm5, %xmm1	# tmp238, q
	jbe	.L25	#,
# Raytracer_handofdos_r2.c:223: 					float s = -b - sqrt(q);
	vcvtss2sd	%xmm1, %xmm1, %xmm1	# q, tmp212
	vsqrtsd	%xmm1, %xmm1, %xmm1	# tmp212, _16
	vxorps	%xmm7, %xmm0, %xmm0	# tmp232, _62, tmp213
	vcvtss2sd	%xmm0, %xmm0, %xmm0	# tmp213, tmp215
	vsubsd	%xmm1, %xmm0, %xmm0	# _16, tmp215, tmp216
	vcvtsd2ss	%xmm0, %xmm0, %xmm0	# tmp216, s
# Raytracer_handofdos_r2.c:224: 					if (s < *t && s > .01) {
	vcomiss	(%rdx), %xmm0	# *t_32(D), s
	jnb	.L25	#,
# Raytracer_handofdos_r2.c:224: 					if (s < *t && s > .01) {
	vxorpd	%xmm1, %xmm1, %xmm1	# tmp217
	vcvtss2sd	%xmm0, %xmm1, %xmm1	# s, tmp217, tmp217
	vcomisd	%xmm8, %xmm1	# tmp233, tmp217
	ja	.L47	#,
	.p2align 4,,10
	.p2align 3
.L25:
	subq	$1, %r8	#, ivtmp.143
# Raytracer_handofdos_r2.c:215: 		for (int j = 9; j--;)
	cmpq	$-1, %r8	#, ivtmp.143
	jne	.L29	#,
	addl	$1, %r11d	#, ivtmp.157
# Raytracer_handofdos_r2.c:214: 	for (int k = 19; k--;)
	cmpl	$1, %r11d	#, ivtmp.157
	jne	.L31	#,
# Raytracer_handofdos_r2.c:233: }
	popq	%rbx	#
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp	#
	.cfi_def_cfa_offset 16
	popq	%r12	#
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L47:
	.cfi_restore_state
# Raytracer_handofdos_r2.c:225: 						*t = s;
	vmovss	%xmm0, (%rdx)	# s, *t_32(D)
# Raytracer_handofdos_r2.c:227: 						*n = *d;    opNot(opAdd(opMul(n, *t), &p));
	vmovdqa	(%rsi), %xmm1	# *d_35(D), *d_35(D)
# Raytracer_handofdos_r2.c:228: 						m = 2;
	movl	$2, %eax	#, <retval>
# Raytracer_handofdos_r2.c:227: 						*n = *d;    opNot(opAdd(opMul(n, *t), &p));
	vmovaps	%xmm1, (%rcx)	# *d_35(D), *n_38(D)
# Raytracer_handofdos_r2.c:39: 	me->y += r->y;
	vfmadd231ss	4(%rcx), %xmm0, %xmm4	# *n_38(D).D.7143.y, s, _69
# Raytracer_handofdos_r2.c:38: 	me->x += r->x;
	vfmadd231ss	(%rcx), %xmm0, %xmm10	# *n_38(D).D.7143.x, s, _68
# Raytracer_handofdos_r2.c:40: 	me->z += r->z;
	vfmadd132ss	8(%rcx), %xmm3, %xmm0	# *n_38(D).D.7143.z, _67, _70
# Raytracer_handofdos_r2.c:64: 		return me->x * me->x + me->y * me->y + me->z * me->z;
	vmulss	%xmm4, %xmm4, %xmm1	# _69, _69, tmp220
	vfmadd231ss	%xmm10, %xmm10, %xmm1	# _68, _68, tmp221
	vfmadd231ss	%xmm0, %xmm0, %xmm1	# _70, _70, tmp222
# Raytracer_handofdos_r2.c:132: 	return opMul(me, 1 / sqrt(opNormC_single(me)));
	vcvtss2sd	%xmm1, %xmm1, %xmm1	# tmp222, tmp223
	vsqrtsd	%xmm1, %xmm1, %xmm1	# tmp223, _92
	vdivsd	%xmm1, %xmm9, %xmm1	# _92, tmp239, tmp224
	vcvtsd2ss	%xmm1, %xmm1, %xmm1	# tmp224, _94
# Raytracer_handofdos_r2.c:49: 	me->x *= r;
	vmulss	%xmm1, %xmm10, %xmm10	# _94, _68, tmp226
# Raytracer_handofdos_r2.c:50: 	me->y *= r;
	vmulss	%xmm1, %xmm4, %xmm4	# _94, _69, tmp227
# Raytracer_handofdos_r2.c:51: 	me->z *= r;
	vmulss	%xmm1, %xmm0, %xmm0	# _94, _70, tmp228
# Raytracer_handofdos_r2.c:49: 	me->x *= r;
	vmovss	%xmm10, (%rcx)	# tmp226, *n_38(D).D.7143.x
# Raytracer_handofdos_r2.c:50: 	me->y *= r;
	vmovss	%xmm4, 4(%rcx)	# tmp227, *n_38(D).D.7143.y
# Raytracer_handofdos_r2.c:51: 	me->z *= r;
	vmovss	%xmm0, 8(%rcx)	# tmp228, *n_38(D).D.7143.z
	jmp	.L25	#
	.cfi_endproc
.LFE594:
	.size	tracer, .-tracer
	.p2align 4,,15
	.globl	sampler
	.type	sampler, @function
sampler:
.LFB595:
	.cfi_startproc
	leaq	8(%rsp), %r10	#,
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp	#,
	pushq	-8(%r10)	#
	pushq	%rbp	#
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp	#,
	pushq	%r15	#
	pushq	%r14	#
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	movq	%rsi, %r14	# d, d
	pushq	%r13	#
	pushq	%r12	#
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
# Raytracer_handofdos_r2.c:238: 	int m = tracer(o, d, &t, &n);
	leaq	-176(%rbp), %r12	#, tmp324
# Raytracer_handofdos_r2.c:235: Vector sampler(const Vector *o, const Vector *d) {
	pushq	%r10	#
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
# Raytracer_handofdos_r2.c:238: 	int m = tracer(o, d, &t, &n);
	movq	%r12, %rcx	# tmp324,
# Raytracer_handofdos_r2.c:235: Vector sampler(const Vector *o, const Vector *d) {
	pushq	%rbx	#
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
# Raytracer_handofdos_r2.c:238: 	int m = tracer(o, d, &t, &n);
	leaq	-180(%rbp), %rbx	#, tmp323
	movq	%rbx, %rdx	# tmp323,
# Raytracer_handofdos_r2.c:235: Vector sampler(const Vector *o, const Vector *d) {
	subq	$224, %rsp	#,
# Raytracer_handofdos_r2.c:235: Vector sampler(const Vector *o, const Vector *d) {
	movq	%fs:40, %rax	#, tmp337
	movq	%rax, -56(%rbp)	# tmp337, D.7876
	xorl	%eax, %eax	# tmp337
# Raytracer_handofdos_r2.c:238: 	int m = tracer(o, d, &t, &n);
	call	tracer	#
# Raytracer_handofdos_r2.c:239: 	if (!m){
	testl	%eax, %eax	# m
	jne	.L49	#,
# Raytracer_handofdos_r2.c:241: 		return *opMul(&n, pow(1 - d->z, 4));
	vmovss	.LC1(%rip), %xmm0	#, tmp216
	vsubss	8(%rsi), %xmm0, %xmm0	# d_36(D)->D.7143.z, tmp216, tmp215
# Raytracer_handofdos_r2.c:240: 		n = (Vector){.x=.7, .y=.6, .z=1};
	movl	$0, -164(%rbp)	#, MEM[(union  *)&n + 12B]
# Raytracer_handofdos_r2.c:241: 		return *opMul(&n, pow(1 - d->z, 4));
	vcvtss2sd	%xmm0, %xmm0, %xmm0	# tmp215, _3
	vmulsd	%xmm0, %xmm0, %xmm0	# _3, _3, powmult_170
	vmulsd	%xmm0, %xmm0, %xmm0	# powmult_170, powmult_170, tmp217
	vcvtsd2ss	%xmm0, %xmm0, %xmm0	# tmp217, _5
# Raytracer_handofdos_r2.c:49: 	me->x *= r;
	vmulss	.LC7(%rip), %xmm0, %xmm1	#, _5, tmp218
# Raytracer_handofdos_r2.c:51: 	me->z *= r;
	vmovss	%xmm0, -168(%rbp)	# _5, n.D.7143.z
# Raytracer_handofdos_r2.c:49: 	me->x *= r;
	vmovss	%xmm1, -176(%rbp)	# tmp218, n.D.7143.x
# Raytracer_handofdos_r2.c:50: 	me->y *= r;
	vmulss	.LC8(%rip), %xmm0, %xmm1	#, _5, tmp220
	vmovss	%xmm1, -172(%rbp)	# tmp220, n.D.7143.y
# Raytracer_handofdos_r2.c:241: 		return *opMul(&n, pow(1 - d->z, 4));
	vmovdqa	-176(%rbp), %xmm0	# n, n
	vmovaps	%xmm0, -80(%rbp)	# n, D.7399
.L50:
# Raytracer_handofdos_r2.c:278: }
	movq	-56(%rbp), %rax	# D.7876, tmp338
	xorq	%fs:40, %rax	#, tmp338
	vmovq	-80(%rbp), %xmm0	# D.7399,
	vmovq	-72(%rbp), %xmm1	# D.7399,
	jne	.L67	#,
# Raytracer_handofdos_r2.c:278: }
	addq	$224, %rsp	#,
	popq	%rbx	#
	popq	%r10	#
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	popq	%r12	#
	popq	%r13	#
	popq	%r14	#
	popq	%r15	#
	popq	%rbp	#
	leaq	-8(%r10), %rsp	#,
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L49:
	.cfi_restore_state
	movl	%eax, %r13d	#, m
# Raytracer_handofdos_r2.c:243: 	Vector h = *d;		opAdd(opMul(&h, t), o);
	vmovdqa	(%rsi), %xmm0	# *d_36(D), *d_36(D)
# Raytracer_handofdos_r2.c:163:     m_z = 36969 * (m_z & 65535) + (m_z >> 16);
	movl	m_z(%rip), %eax	# m_z, m_z.0_197
# Raytracer_handofdos_r2.c:246:     Vector l = (Vector){.x=9 + Random(), .y=9 + Random(), .z=16};  opNot(opAdd(&l, &hminus));
	movl	$0, -116(%rbp)	#, MEM[(union  *)&l + 12B]
# Raytracer_handofdos_r2.c:164:     m_w = 18000 * (m_w & 65535) + (m_w >> 16);
	movl	m_w(%rip), %edx	# m_w, m_w.2_202
# Raytracer_handofdos_r2.c:243: 	Vector h = *d;		opAdd(opMul(&h, t), o);
	vmovss	-180(%rbp), %xmm12	# t, t.8_6
# Raytracer_handofdos_r2.c:251: 	if (b < 0 || tracer(&h, &l, &t, &n)){
	vxorps	%xmm13, %xmm13, %xmm13	# _302
# Raytracer_handofdos_r2.c:163:     m_z = 36969 * (m_z & 65535) + (m_z >> 16);
	movzwl	%ax, %esi	# m_z.0_197, m_z.0_197
	shrl	$16, %eax	#, tmp226
# Raytracer_handofdos_r2.c:243: 	Vector h = *d;		opAdd(opMul(&h, t), o);
	vmovaps	%xmm0, -144(%rbp)	# *d_36(D), h
# Raytracer_handofdos_r2.c:174:     return (u + 1.0) * 2.328306435454494e-10;
	vxorpd	%xmm0, %xmm0, %xmm0	# tmp238
# Raytracer_handofdos_r2.c:163:     m_z = 36969 * (m_z & 65535) + (m_z >> 16);
	imull	$36969, %esi, %esi	#, m_z.0_197, tmp225
# Raytracer_handofdos_r2.c:38: 	me->x += r->x;
	vmovss	-144(%rbp), %xmm2	# h.D.7143.x, _107
# Raytracer_handofdos_r2.c:39: 	me->y += r->y;
	vmovss	-140(%rbp), %xmm5	# h.D.7143.y, _109
# Raytracer_handofdos_r2.c:38: 	me->x += r->x;
	vfmadd213ss	(%rdi), %xmm12, %xmm2	# o_35(D)->D.7143.x, t.8_6, _107
# Raytracer_handofdos_r2.c:39: 	me->y += r->y;
	vfmadd213ss	4(%rdi), %xmm12, %xmm5	# o_35(D)->D.7143.y, t.8_6, _109
# Raytracer_handofdos_r2.c:40: 	me->z += r->z;
	vmovss	-136(%rbp), %xmm4	# h.D.7143.z, _111
	vfmadd213ss	8(%rdi), %xmm12, %xmm4	# o_35(D)->D.7143.z, t.8_6, _111
# Raytracer_handofdos_r2.c:163:     m_z = 36969 * (m_z & 65535) + (m_z >> 16);
	addl	%eax, %esi	# tmp226, _201
# Raytracer_handofdos_r2.c:164:     m_w = 18000 * (m_w & 65535) + (m_w >> 16);
	movzwl	%dx, %eax	# m_w.2_202, m_w.2_202
	shrl	$16, %edx	#, tmp229
# Raytracer_handofdos_r2.c:174:     return (u + 1.0) * 2.328306435454494e-10;
	vmovsd	.LC0(%rip), %xmm3	#, tmp244
# Raytracer_handofdos_r2.c:164:     m_w = 18000 * (m_w & 65535) + (m_w >> 16);
	imull	$18000, %eax, %eax	#, m_w.2_202, tmp228
# Raytracer_handofdos_r2.c:163:     m_z = 36969 * (m_z & 65535) + (m_z >> 16);
	movl	%esi, %ecx	# _201, tmp232
# Raytracer_handofdos_r2.c:174:     return (u + 1.0) * 2.328306435454494e-10;
	vmovsd	.LC2(%rip), %xmm6	#, tmp246
# Raytracer_handofdos_r2.c:246:     Vector l = (Vector){.x=9 + Random(), .y=9 + Random(), .z=16};  opNot(opAdd(&l, &hminus));
	vmovss	.LC9(%rip), %xmm1	#, tmp249
# Raytracer_handofdos_r2.c:163:     m_z = 36969 * (m_z & 65535) + (m_z >> 16);
	shrl	$16, %ecx	#, tmp232
	vmovss	.LC10(%rip), %xmm12	#, tmp264
# Raytracer_handofdos_r2.c:60: 		return me->x * r->x + me->y * r->y + me->z * r->z;
	vmovss	-168(%rbp), %xmm7	# MEM[(const union Vector *)&n].D.7143.z, _91
# Raytracer_handofdos_r2.c:38: 	me->x += r->x;
	vmovss	%xmm2, -144(%rbp)	# _107, h.D.7143.x
# Raytracer_handofdos_r2.c:60: 		return me->x * r->x + me->y * r->y + me->z * r->z;
	vmovss	8(%r14), %xmm8	# *d_36(D).D.7143.z, _92
# Raytracer_handofdos_r2.c:164:     m_w = 18000 * (m_w & 65535) + (m_w >> 16);
	addl	%edx, %eax	# tmp229, _206
# Raytracer_handofdos_r2.c:163:     m_z = 36969 * (m_z & 65535) + (m_z >> 16);
	movzwl	%si, %edx	# _201, _201
# Raytracer_handofdos_r2.c:165:     return (m_z << 16) + m_w;
	sall	$16, %esi	#, tmp236
# Raytracer_handofdos_r2.c:40: 	me->z += r->z;
	vmovss	%xmm4, -136(%rbp)	# _111, h.D.7143.z
# Raytracer_handofdos_r2.c:163:     m_z = 36969 * (m_z & 65535) + (m_z >> 16);
	imull	$36969, %edx, %edx	#, _201, tmp231
# Raytracer_handofdos_r2.c:164:     m_w = 18000 * (m_w & 65535) + (m_w >> 16);
	movl	%eax, %edi	# _206, tmp235
	vsubss	%xmm4, %xmm12, %xmm4	# _111, tmp264, _217
# Raytracer_handofdos_r2.c:39: 	me->y += r->y;
	vmovss	%xmm5, -140(%rbp)	# _109, h.D.7143.y
# Raytracer_handofdos_r2.c:164:     m_w = 18000 * (m_w & 65535) + (m_w >> 16);
	shrl	$16, %edi	#, tmp235
# Raytracer_handofdos_r2.c:163:     m_z = 36969 * (m_z & 65535) + (m_z >> 16);
	addl	%ecx, %edx	# tmp232, _186
# Raytracer_handofdos_r2.c:164:     m_w = 18000 * (m_w & 65535) + (m_w >> 16);
	movzwl	%ax, %ecx	# _206, _206
# Raytracer_handofdos_r2.c:174:     return (u + 1.0) * 2.328306435454494e-10;
	addl	%esi, %eax	# tmp236, tmp239
	vcvtsi2sdq	%rax, %xmm0, %xmm0	# tmp239, tmp238, tmp238
# Raytracer_handofdos_r2.c:163:     m_z = 36969 * (m_z & 65535) + (m_z >> 16);
	movl	%edx, m_z(%rip)	# _186, m_z
# Raytracer_handofdos_r2.c:165:     return (m_z << 16) + m_w;
	sall	$16, %edx	#, tmp250
# Raytracer_handofdos_r2.c:164:     m_w = 18000 * (m_w & 65535) + (m_w >> 16);
	imull	$18000, %ecx, %ecx	#, _206, tmp234
# Raytracer_handofdos_r2.c:174:     return (u + 1.0) * 2.328306435454494e-10;
	vaddsd	%xmm3, %xmm0, %xmm0	# tmp244, tmp238, tmp243
# Raytracer_handofdos_r2.c:164:     m_w = 18000 * (m_w & 65535) + (m_w >> 16);
	addl	%edi, %ecx	# tmp235, _191
# Raytracer_handofdos_r2.c:174:     return (u + 1.0) * 2.328306435454494e-10;
	leal	(%rdx,%rcx), %eax	#, tmp253
# Raytracer_handofdos_r2.c:164:     m_w = 18000 * (m_w & 65535) + (m_w >> 16);
	movl	%ecx, m_w(%rip)	# _191, m_w
# Raytracer_handofdos_r2.c:174:     return (u + 1.0) * 2.328306435454494e-10;
	vmulsd	%xmm6, %xmm0, %xmm0	# tmp246, tmp243, tmp245
# Raytracer_handofdos_r2.c:179:     return GetUniform();
	vcvtsd2ss	%xmm0, %xmm0, %xmm0	# tmp245, tmp247
# Raytracer_handofdos_r2.c:246:     Vector l = (Vector){.x=9 + Random(), .y=9 + Random(), .z=16};  opNot(opAdd(&l, &hminus));
	vaddss	%xmm1, %xmm0, %xmm0	# tmp249, tmp247, tmp248
	vsubss	%xmm2, %xmm0, %xmm0	# _107, tmp248, _214
# Raytracer_handofdos_r2.c:174:     return (u + 1.0) * 2.328306435454494e-10;
	vxorpd	%xmm2, %xmm2, %xmm2	# tmp252
	vcvtsi2sdq	%rax, %xmm2, %xmm2	# tmp253, tmp252, tmp252
	vaddsd	%xmm3, %xmm2, %xmm2	# tmp244, tmp252, tmp257
	vmulsd	%xmm6, %xmm2, %xmm2	# tmp246, tmp257, tmp259
# Raytracer_handofdos_r2.c:60: 		return me->x * r->x + me->y * r->y + me->z * r->z;
	vmovss	(%r14), %xmm6	# *d_36(D).D.7143.x, _85
# Raytracer_handofdos_r2.c:179:     return GetUniform();
	vcvtsd2ss	%xmm2, %xmm2, %xmm2	# tmp259, tmp261
# Raytracer_handofdos_r2.c:246:     Vector l = (Vector){.x=9 + Random(), .y=9 + Random(), .z=16};  opNot(opAdd(&l, &hminus));
	vaddss	%xmm1, %xmm2, %xmm1	# tmp249, tmp261, tmp262
# Raytracer_handofdos_r2.c:248: 	Vector r = n;	opAdd(opMul(&r, opNorm(&n, d) * -2), d);
	vmovdqa	-176(%rbp), %xmm2	# n, n
	vmovaps	%xmm2, -112(%rbp)	# n, r
# Raytracer_handofdos_r2.c:60: 		return me->x * r->x + me->y * r->y + me->z * r->z;
	vmovss	-176(%rbp), %xmm2	# MEM[(const union Vector *)&n].D.7143.x, _84
	vsubss	%xmm5, %xmm1, %xmm1	# _109, tmp262, _101
	vmovss	4(%r14), %xmm5	# *d_36(D).D.7143.y, _88
# Raytracer_handofdos_r2.c:64: 		return me->x * me->x + me->y * me->y + me->z * me->z;
	vmulss	%xmm1, %xmm1, %xmm12	# _101, _101, tmp265
	vfmadd231ss	%xmm0, %xmm0, %xmm12	# _214, _214, tmp266
	vfmadd231ss	%xmm4, %xmm4, %xmm12	# _217, _217, tmp267
# Raytracer_handofdos_r2.c:132: 	return opMul(me, 1 / sqrt(opNormC_single(me)));
	vcvtss2sd	%xmm12, %xmm12, %xmm12	# tmp267, tmp268
	vsqrtsd	%xmm12, %xmm12, %xmm12	# tmp268, _176
	vdivsd	%xmm12, %xmm3, %xmm12	# _176, tmp244, tmp269
	vcvtsd2ss	%xmm12, %xmm12, %xmm12	# tmp269, _178
# Raytracer_handofdos_r2.c:49: 	me->x *= r;
	vmulss	%xmm0, %xmm12, %xmm0	# _214, _178, _179
# Raytracer_handofdos_r2.c:50: 	me->y *= r;
	vmulss	%xmm12, %xmm1, %xmm1	# _178, _101, _180
# Raytracer_handofdos_r2.c:51: 	me->z *= r;
	vmulss	%xmm4, %xmm12, %xmm12	# _217, _178, _181
# Raytracer_handofdos_r2.c:60: 		return me->x * r->x + me->y * r->y + me->z * r->z;
	vmovss	-172(%rbp), %xmm4	# MEM[(const union Vector *)&n].D.7143.y, _87
	vmulss	%xmm5, %xmm4, %xmm3	# _88, _87, tmp272
# Raytracer_handofdos_r2.c:49: 	me->x *= r;
	vmovss	%xmm0, -128(%rbp)	# _179, l.D.7143.x
# Raytracer_handofdos_r2.c:50: 	me->y *= r;
	vmovss	%xmm1, -124(%rbp)	# _180, l.D.7143.y
# Raytracer_handofdos_r2.c:60: 		return me->x * r->x + me->y * r->y + me->z * r->z;
	vmulss	%xmm1, %xmm4, %xmm1	# _180, _87, tmp279
# Raytracer_handofdos_r2.c:51: 	me->z *= r;
	vmovss	%xmm12, -120(%rbp)	# _181, l.D.7143.z
# Raytracer_handofdos_r2.c:60: 		return me->x * r->x + me->y * r->y + me->z * r->z;
	vfmadd231ss	%xmm6, %xmm2, %xmm3	# _85, _84, tmp273
	vfmadd231ss	%xmm8, %xmm7, %xmm3	# _92, _91, tmp274
# Raytracer_handofdos_r2.c:248: 	Vector r = n;	opAdd(opMul(&r, opNorm(&n, d) * -2), d);
	vmulss	.LC11(%rip), %xmm3, %xmm3	#, tmp274, _10
# Raytracer_handofdos_r2.c:38: 	me->x += r->x;
	vfmadd231ss	%xmm2, %xmm3, %xmm6	# _84, _10, tmp276
# Raytracer_handofdos_r2.c:60: 		return me->x * r->x + me->y * r->y + me->z * r->z;
	vfmadd132ss	%xmm0, %xmm1, %xmm2	# _179, tmp279, tmp280
# Raytracer_handofdos_r2.c:39: 	me->y += r->y;
	vfmadd231ss	%xmm4, %xmm3, %xmm5	# _87, _10, tmp277
# Raytracer_handofdos_r2.c:40: 	me->z += r->z;
	vfmadd132ss	%xmm7, %xmm8, %xmm3	# _91, _92, tmp278
# Raytracer_handofdos_r2.c:60: 		return me->x * r->x + me->y * r->y + me->z * r->z;
	vfmadd132ss	%xmm7, %xmm2, %xmm12	# _91, tmp280, b
# Raytracer_handofdos_r2.c:38: 	me->x += r->x;
	vmovss	%xmm6, -112(%rbp)	# tmp276, r.D.7143.x
# Raytracer_handofdos_r2.c:39: 	me->y += r->y;
	vmovss	%xmm5, -108(%rbp)	# tmp277, r.D.7143.y
# Raytracer_handofdos_r2.c:40: 	me->z += r->z;
	vmovss	%xmm3, -104(%rbp)	# tmp278, r.D.7143.z
# Raytracer_handofdos_r2.c:251: 	if (b < 0 || tracer(&h, &l, &t, &n)){
	vcomiss	%xmm12, %xmm13	# b, _302
	jbe	.L68	#,
.L55:
	vxorps	%xmm12, %xmm12, %xmm12	# b
.L56:
# Raytracer_handofdos_r2.c:255: 	if (m & 1) {
	andl	$1, %r13d	#, m
	je	.L58	#,
# Raytracer_handofdos_r2.c:49: 	me->x *= r;
	vmovss	.LC12(%rip), %xmm1	#, tmp295
	vmulss	-144(%rbp), %xmm1, %xmm0	# h.D.7143.x, tmp295, _130
	vcvtss2sd	%xmm12, %xmm12, %xmm12	# b, tmp299
# Raytracer_handofdos_r2.c:260: 			Vector resV = {.x=3, .y=1, .z=1};
	movl	$0, -84(%rbp)	#,
# Raytracer_handofdos_r2.c:50: 	me->y *= r;
	vmulss	-140(%rbp), %xmm1, %xmm1	# h.D.7143.y, tmp295, tmp296
	vmovsd	.LC14(%rip), %xmm7	#, tmp346
	vfmadd132sd	.LC13(%rip), %xmm7, %xmm12	#, tmp346, tmp300
# Raytracer_handofdos_r2.c:49: 	me->x *= r;
	vmovss	%xmm0, -144(%rbp)	# _130, h.D.7143.x
# Raytracer_handofdos_r2.c:258: 		if ((int) (ceil(h.x) + ceil(h.y)) & 1)
	vroundss	$10, %xmm0, %xmm0, %xmm0	#, _130, _141
	vcvtss2sd	%xmm0, %xmm0, %xmm0	# _141, tmp304
	vroundss	$10, %xmm1, %xmm1, %xmm1	#, tmp296, _7
	vcvtss2sd	%xmm1, %xmm1, %xmm1	# _7, tmp305
	vaddsd	%xmm1, %xmm0, %xmm0	# tmp305, tmp304, tmp306
	vcvtsd2ss	%xmm12, %xmm12, %xmm12	# tmp300, _313
	vmulss	.LC15(%rip), %xmm12, %xmm2	#, _313, _314
	vcvttsd2si	%xmm0, %eax	# tmp306, tmp307
# Raytracer_handofdos_r2.c:262: 			return resV;
	vmovss	%xmm2, -96(%rbp)	# _314,
# Raytracer_handofdos_r2.c:258: 		if ((int) (ceil(h.x) + ceil(h.y)) & 1)
	testb	$1, %al	#, tmp307
	je	.L59	#,
# Raytracer_handofdos_r2.c:262: 			return resV;
	vmovss	%xmm12, -92(%rbp)	# _313, MEM[(union  *)&resV + 4B]
	vmovss	%xmm12, -88(%rbp)	# _313, MEM[(union  *)&resV + 8B]
	vmovdqa	-96(%rbp), %xmm0	#, resV
	vmovaps	%xmm0, -80(%rbp)	# resV, D.7399
	jmp	.L50	#
	.p2align 4,,10
	.p2align 3
.L68:
# Raytracer_handofdos_r2.c:251: 	if (b < 0 || tracer(&h, &l, &t, &n)){
	leaq	-128(%rbp), %rsi	#, tmp284
	leaq	-144(%rbp), %rdi	#, tmp285
	movq	%r12, %rcx	# tmp324,
	movq	%rbx, %rdx	# tmp323,
	call	tracer	#
	testl	%eax, %eax	# _11
	jne	.L55	#,
# Raytracer_handofdos_r2.c:254: 	float p = pow(opNorm(&l, &r) * (b > 0), 99);
	vcomiss	%xmm13, %xmm12	# _302, b
# Raytracer_handofdos_r2.c:60: 		return me->x * r->x + me->y * r->y + me->z * r->z;
	vmovss	-124(%rbp), %xmm0	# MEM[(const union Vector *)&l].D.7143.y, MEM[(const union Vector *)&l].D.7143.y
	vmovss	-128(%rbp), %xmm7	# MEM[(const union Vector *)&l].D.7143.x, tmp344
	vmulss	-108(%rbp), %xmm0, %xmm0	# MEM[(const union Vector *)&r].D.7143.y, MEM[(const union Vector *)&l].D.7143.y, tmp286
	vfmadd231ss	-112(%rbp), %xmm7, %xmm0	# MEM[(const union Vector *)&r].D.7143.x, tmp344, tmp288
	vmovss	-120(%rbp), %xmm7	# MEM[(const union Vector *)&l].D.7143.z, tmp345
	vfmadd231ss	-104(%rbp), %xmm7, %xmm0	# MEM[(const union Vector *)&r].D.7143.z, tmp345, _128
# Raytracer_handofdos_r2.c:254: 	float p = pow(opNorm(&l, &r) * (b > 0), 99);
	jbe	.L56	#,
	vcvtss2sd	%xmm0, %xmm0, %xmm0	# _128, _290
	vmulsd	%xmm0, %xmm0, %xmm13	# _290, _290, _292
	vmulsd	%xmm13, %xmm13, %xmm13	# _292, _292, _293
	vmulsd	%xmm13, %xmm13, %xmm13	# _293, _293, _294
	vmulsd	%xmm13, %xmm13, %xmm13	# _294, _294, _295
	vmulsd	%xmm13, %xmm13, %xmm13	# _295, _295, tmp290
	vmulsd	%xmm0, %xmm13, %xmm0	# _290, tmp290, _297
	vmulsd	%xmm0, %xmm0, %xmm13	# _297, _297, tmp291
	vmulsd	%xmm0, %xmm13, %xmm13	# _297, tmp291, tmp292
	vcvtsd2ss	%xmm13, %xmm13, %xmm13	# tmp292, _302
	jmp	.L56	#
	.p2align 4,,10
	.p2align 3
.L59:
# Raytracer_handofdos_r2.c:268: 			return resV;
	vmovss	%xmm2, -92(%rbp)	# _314, MEM[(union  *)&resV + 4B]
	vmovss	%xmm2, -88(%rbp)	# _314, MEM[(union  *)&resV + 8B]
	vmovdqa	-96(%rbp), %xmm0	#, resV
	vmovaps	%xmm0, -80(%rbp)	# resV, D.7399
	jmp	.L50	#
	.p2align 4,,10
	.p2align 3
.L58:
# Raytracer_handofdos_r2.c:274: 	smpl = sampler(&h, &r);
	leaq	-112(%rbp), %rsi	#, tmp311
	leaq	-144(%rbp), %rdi	#, tmp312
	vmovss	%xmm13, -244(%rbp)	# _302, %sfp
# Raytracer_handofdos_r2.c:273: 	Vector	resV = {.x=p, .y=p, .z=p};
	movl	$0, -84(%rbp)	#, MEM[(union  *)&resV + 12B]
# Raytracer_handofdos_r2.c:274: 	smpl = sampler(&h, &r);
	call	sampler	#
# Raytracer_handofdos_r2.c:39: 	me->y += r->y;
	vmovss	-244(%rbp), %xmm13	# %sfp, _302
# Raytracer_handofdos_r2.c:274: 	smpl = sampler(&h, &r);
	vmovq	%xmm0, -160(%rbp)	# tmp313, smpl
# Raytracer_handofdos_r2.c:39: 	me->y += r->y;
	vmovss	.LC16(%rip), %xmm0	#, tmp315
# Raytracer_handofdos_r2.c:274: 	smpl = sampler(&h, &r);
	vmovq	%xmm1, -152(%rbp)	#, smpl
# Raytracer_handofdos_r2.c:39: 	me->y += r->y;
	vmovaps	%xmm0, %xmm2	# tmp315, _136
# Raytracer_handofdos_r2.c:40: 	me->z += r->z;
	vmovaps	%xmm0, %xmm1	# tmp315, _137
# Raytracer_handofdos_r2.c:39: 	me->y += r->y;
	vfmadd132ss	-156(%rbp), %xmm13, %xmm2	# MEM[(union  *)&smpl + 4B], _302, _136
# Raytracer_handofdos_r2.c:40: 	me->z += r->z;
	vfmadd132ss	-152(%rbp), %xmm13, %xmm1	# MEM[(union  *)&smpl + 8B], _302, _137
# Raytracer_handofdos_r2.c:38: 	me->x += r->x;
	vfmadd231ss	-160(%rbp), %xmm0, %xmm13	# MEM[(union  *)&smpl], tmp315, tmp317
# Raytracer_handofdos_r2.c:277: 	return resV;
	vmovss	%xmm2, -92(%rbp)	# _136, MEM[(union  *)&resV + 4B]
	vmovss	%xmm13, -96(%rbp)	# tmp317, MEM[(union  *)&resV]
	vmovss	%xmm1, -88(%rbp)	# _137, MEM[(union  *)&resV + 8B]
	vmovdqa	-96(%rbp), %xmm0	#, resV
	vmovaps	%xmm0, -80(%rbp)	# resV, D.7399
	jmp	.L50	#
.L67:
# Raytracer_handofdos_r2.c:278: }
	call	__stack_chk_fail@PLT	#
	.cfi_endproc
.LFE595:
	.size	sampler, .-sampler
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC18:
	.string	"\n\nUsage: card-raytracer <filename>.ppm\n"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC19:
	.string	"w"
.LC20:
	.string	"P6 %d %d 255 "
.LC28:
	.string	"%c%c%c"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB596:
	.cfi_startproc
	pushq	%r15	#
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14	#
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13	#
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12	#
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp	#
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx	#
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$184, %rsp	#,
	.cfi_def_cfa_offset 240
# Raytracer_handofdos_r2.c:281: int main(int argc,char **argv) {
	movq	%fs:40, %rax	#, tmp486
	movq	%rax, 168(%rsp)	# tmp486, D.7921
	xorl	%eax, %eax	# tmp486
# Raytracer_handofdos_r2.c:286: 	if (argc==1){
	cmpl	$1, %edi	#, argc
	je	.L89	#,
# Raytracer_handofdos_r2.c:290: 	FILE *out = fopen(argv[1],"w");
	movq	8(%rsi), %rdi	# MEM[(char * *)argv_33(D) + 8B], MEM[(char * *)argv_33(D) + 8B]
	leaq	.LC19(%rip), %rsi	#,
	leaq	112(%rsp), %r12	#, tmp446
	leaq	128(%rsp), %rbp	#, tmp451
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:97:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC28(%rip), %r15	#, tmp453
# Raytracer_handofdos_r2.c:290: 	FILE *out = fopen(argv[1],"w");
	call	fopen@PLT	#
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:97:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$512, %r8d	#,
	movl	$512, %ecx	#,
	leaq	.LC20(%rip), %rdx	#,
	movl	$1, %esi	#,
	movq	%rax, %rdi	# out,
# Raytracer_handofdos_r2.c:290: 	FILE *out = fopen(argv[1],"w");
	movq	%rax, %r14	#, out
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:97:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	xorl	%eax, %eax	#
	call	__fprintf_chk@PLT	#
# Raytracer_handofdos_r2.c:292: 	Vector g = {.x=-6, .y=-16, .z=0}; opNot(&g);
	leaq	64(%rsp), %rdi	#, tmp282
	movabsq	$-4503599624136687616, %rax	#, tmp488
	movq	$0, 72(%rsp)	#, MEM[(union  *)&g + 8B]
	movq	%rax, 64(%rsp)	# tmp488, MEM[(union  *)&g]
	call	opNotC	#
# Raytracer_handofdos_r2.c:99: 	newx = me->y * r->z - me->z * r->y;
	vmovss	68(%rsp), %xmm0	# MEM[(const union Vector *)&g].D.7143.y, MEM[(const union Vector *)&g].D.7143.y
	vxorps	.LC4(%rip), %xmm0, %xmm0	#, MEM[(const union Vector *)&g].D.7143.y, newx
# Raytracer_handofdos_r2.c:293:     Vector a = {.x=0, .y=0, .z=1};  opMul(opNot(opCross(&a, &g)), .002);
	leaq	80(%rsp), %rdi	#, tmp287
	movl	$0, 92(%rsp)	#, MEM[(union  *)&a + 12B]
# Raytracer_handofdos_r2.c:103: 	me->x = newx;
	vmovss	%xmm0, 80(%rsp)	# newx, a.D.7143.x
# Raytracer_handofdos_r2.c:104: 	me->y = newy;
	vmovss	64(%rsp), %xmm0	# MEM[(const union Vector *)&g].D.7143.x, _122
# Raytracer_handofdos_r2.c:105: 	me->z = newz;
	movl	$0x00000000, 88(%rsp)	#, a.D.7143.z
# Raytracer_handofdos_r2.c:104: 	me->y = newy;
	vmovss	%xmm0, 84(%rsp)	# _122, a.D.7143.y
# Raytracer_handofdos_r2.c:293:     Vector a = {.x=0, .y=0, .z=1};  opMul(opNot(opCross(&a, &g)), .002);
	call	opNotC	#
# Raytracer_handofdos_r2.c:49: 	me->x *= r;
	vmovss	.LC21(%rip), %xmm5	#, tmp290
# Raytracer_handofdos_r2.c:294:     Vector b = g;   opMul(opNot(opCross(&b, &a)), .002);
	leaq	96(%rsp), %rdi	#, tmp304
# Raytracer_handofdos_r2.c:49: 	me->x *= r;
	vmulss	(%rax), %xmm5, %xmm0	# _5->D.7143.x, tmp290, tmp288
	vmovss	%xmm0, (%rax)	# tmp288, _5->D.7143.x
# Raytracer_handofdos_r2.c:50: 	me->y *= r;
	vmulss	4(%rax), %xmm5, %xmm0	# _5->D.7143.y, tmp290, tmp291
# Raytracer_handofdos_r2.c:100: 	newy = me->z * r->x - me->x * r->z;
	vmovss	80(%rsp), %xmm7	# MEM[(const union Vector *)&a].D.7143.x, _103
# Raytracer_handofdos_r2.c:50: 	me->y *= r;
	vmovss	%xmm0, 4(%rax)	# tmp291, _5->D.7143.y
# Raytracer_handofdos_r2.c:51: 	me->z *= r;
	vmulss	8(%rax), %xmm5, %xmm0	# _5->D.7143.z, tmp290, tmp294
	vmovss	%xmm0, 8(%rax)	# tmp294, _5->D.7143.z
# Raytracer_handofdos_r2.c:294:     Vector b = g;   opMul(opNot(opCross(&b, &a)), .002);
	vmovdqa	64(%rsp), %xmm0	# g, g
# Raytracer_handofdos_r2.c:99: 	newx = me->y * r->z - me->z * r->y;
	vmovss	88(%rsp), %xmm3	# MEM[(const union Vector *)&a].D.7143.z, _97
# Raytracer_handofdos_r2.c:294:     Vector b = g;   opMul(opNot(opCross(&b, &a)), .002);
	vmovaps	%xmm0, 96(%rsp)	# g, b
# Raytracer_handofdos_r2.c:99: 	newx = me->y * r->z - me->z * r->y;
	vmovss	84(%rsp), %xmm0	# MEM[(const union Vector *)&a].D.7143.y, _100
	vmovss	104(%rsp), %xmm2	# b.D.7143.z, _99
# Raytracer_handofdos_r2.c:100: 	newy = me->z * r->x - me->x * r->z;
	vmovss	96(%rsp), %xmm6	# b.D.7143.x, _105
# Raytracer_handofdos_r2.c:99: 	newx = me->y * r->z - me->z * r->y;
	vmovss	100(%rsp), %xmm1	# b.D.7143.y, _96
	vmulss	%xmm0, %xmm2, %xmm4	# _100, _99, tmp298
	vfmsub231ss	%xmm3, %xmm1, %xmm4	# _97, _96, newx
# Raytracer_handofdos_r2.c:100: 	newy = me->z * r->x - me->x * r->z;
	vmulss	%xmm6, %xmm3, %xmm3	# _105, _97, tmp300
# Raytracer_handofdos_r2.c:101: 	newz = me->x * r->y - me->y * r->x;
	vmulss	%xmm7, %xmm1, %xmm1	# _103, _96, tmp302
# Raytracer_handofdos_r2.c:103: 	me->x = newx;
	vmovss	%xmm4, 96(%rsp)	# newx, b.D.7143.x
# Raytracer_handofdos_r2.c:100: 	newy = me->z * r->x - me->x * r->z;
	vfmsub132ss	%xmm7, %xmm3, %xmm2	# _103, tmp300, newy
# Raytracer_handofdos_r2.c:101: 	newz = me->x * r->y - me->y * r->x;
	vfmsub132ss	%xmm6, %xmm1, %xmm0	# _105, tmp302, newz
# Raytracer_handofdos_r2.c:104: 	me->y = newy;
	vmovss	%xmm2, 100(%rsp)	# newy, b.D.7143.y
# Raytracer_handofdos_r2.c:105: 	me->z = newz;
	vmovss	%xmm0, 104(%rsp)	# newz, b.D.7143.z
# Raytracer_handofdos_r2.c:294:     Vector b = g;   opMul(opNot(opCross(&b, &a)), .002);
	call	opNotC	#
# Raytracer_handofdos_r2.c:296: 	for (int y = HEIGHT; y--;) {
	movl	$511, 60(%rsp)	#, %sfp
	vmovsd	.LC0(%rip), %xmm8	#, tmp450
# Raytracer_handofdos_r2.c:49: 	me->x *= r;
	vmulss	(%rax), %xmm5, %xmm0	# _6->D.7143.x, tmp290, tmp305
	vmovsd	.LC2(%rip), %xmm9	#, tmp452
	vmovss	.LC10(%rip), %xmm11	#, tmp442
	vmovss	.LC27(%rip), %xmm10	#, tmp449
	vmovss	%xmm0, (%rax)	# tmp305, _6->D.7143.x
# Raytracer_handofdos_r2.c:50: 	me->y *= r;
	vmulss	4(%rax), %xmm5, %xmm0	# _6->D.7143.y, tmp290, tmp308
# Raytracer_handofdos_r2.c:38: 	me->x += r->x;
	vmovss	96(%rsp), %xmm7	# b.D.7143.x, pretmp_738
# Raytracer_handofdos_r2.c:51: 	me->z *= r;
	vmulss	8(%rax), %xmm5, %xmm5	# _6->D.7143.z, tmp290, tmp311
# Raytracer_handofdos_r2.c:295:     Vector c = a;   opAdd(opMul(opAdd(&c, &b), -256), &g);
	vmovss	80(%rsp), %xmm15	# MEM[(union  *)&a], c$D7143$x
# Raytracer_handofdos_r2.c:38: 	me->x += r->x;
	vaddss	%xmm7, %xmm15, %xmm1	# pretmp_738, c$D7143$x, tmp314
# Raytracer_handofdos_r2.c:50: 	me->y *= r;
	vmovss	%xmm0, 4(%rax)	# tmp308, _6->D.7143.y
# Raytracer_handofdos_r2.c:38: 	me->x += r->x;
	vmovss	.LC22(%rip), %xmm0	#, tmp315
	vfmadd213ss	64(%rsp), %xmm0, %xmm1	# g.D.7143.x, tmp315, tmp314
# Raytracer_handofdos_r2.c:51: 	me->z *= r;
	vmovss	%xmm5, 8(%rax)	# tmp311, _6->D.7143.z
# Raytracer_handofdos_r2.c:39: 	me->y += r->y;
	vmovss	100(%rsp), %xmm14	# b.D.7143.y, pretmp_748
# Raytracer_handofdos_r2.c:295:     Vector c = a;   opAdd(opMul(opAdd(&c, &b), -256), &g);
	vmovss	84(%rsp), %xmm5	# MEM[(union  *)&a + 4B], c$D7143$y
# Raytracer_handofdos_r2.c:40: 	me->z += r->z;
	vmovss	104(%rsp), %xmm13	# b.D.7143.z, pretmp_750
# Raytracer_handofdos_r2.c:295:     Vector c = a;   opAdd(opMul(opAdd(&c, &b), -256), &g);
	vmovss	88(%rsp), %xmm3	# MEM[(union  *)&a + 8B], c$D7143$z
	vmovaps	%xmm13, %xmm6	# pretmp_750, pretmp_750
# Raytracer_handofdos_r2.c:38: 	me->x += r->x;
	vmovss	%xmm1, 44(%rsp)	# tmp314, %sfp
# Raytracer_handofdos_r2.c:39: 	me->y += r->y;
	vaddss	%xmm5, %xmm14, %xmm1	# c$D7143$y, pretmp_748, tmp316
	vfmadd213ss	68(%rsp), %xmm0, %xmm1	# g.D.7143.y, tmp315, tmp316
	vmovss	%xmm1, 48(%rsp)	# tmp316, %sfp
# Raytracer_handofdos_r2.c:40: 	me->z += r->z;
	vaddss	%xmm3, %xmm13, %xmm1	# c$D7143$z, pretmp_750, tmp318
	vmovaps	%xmm5, %xmm13	# c$D7143$y, c$D7143$y
	vmovaps	%xmm7, %xmm5	# pretmp_738, pretmp_738
	vfmadd213ss	72(%rsp), %xmm0, %xmm1	# g.D.7143.z, tmp315, tmp318
	vmovaps	%xmm6, %xmm7	# pretmp_750, pretmp_750
	vmovss	%xmm1, 52(%rsp)	# tmp318, %sfp
.L72:
	vxorps	%xmm6, %xmm6, %xmm6	# _723
# Raytracer_handofdos_r2.c:297: 		for (int x = WIDTH; x--;) {
	movl	$511, %r13d	#, x
	vcvtsi2ss	60(%rsp), %xmm6, %xmm6	# %sfp, _723, _723
	vmovss	%xmm6, 56(%rsp)	# _723, %sfp
	.p2align 4,,10
	.p2align 3
.L85:
	vxorps	%xmm6, %xmm6, %xmm6	# _737
# Raytracer_handofdos_r2.c:281: int main(int argc,char **argv) {
	movl	$64, %ebx	#, ivtmp_703
# Raytracer_handofdos_r2.c:298: 			Vector p = {.x=13, .y=13, .z=13};
	vmovss	.LC17(%rip), %xmm12	#, p$D7143$z
	movl	$0x41500000, (%rsp)	#, %sfp
	vcvtsi2ss	%r13d, %xmm6, %xmm6	# x, _737, _737
	movl	$0x41500000, 4(%rsp)	#, %sfp
	vmovss	%xmm6, 40(%rsp)	# _737, %sfp
	jmp	.L83	#
	.p2align 4,,10
	.p2align 3
.L81:
	vmovss	96(%rsp), %xmm5	# MEM[(union  *)&b], pretmp_738
	vmovss	80(%rsp), %xmm15	# MEM[(union  *)&a], c$D7143$x
	vmovss	84(%rsp), %xmm13	# MEM[(union  *)&a + 4B], c$D7143$y
	vmovss	88(%rsp), %xmm3	# MEM[(union  *)&a + 8B], c$D7143$z
	vmovss	100(%rsp), %xmm14	# MEM[(union  *)&b + 4B], pretmp_748
	vmovss	104(%rsp), %xmm7	# MEM[(union  *)&b + 8B], pretmp_750
.L83:
# Raytracer_handofdos_r2.c:163:     m_z = 36969 * (m_z & 65535) + (m_z >> 16);
	movl	m_z(%rip), %ecx	# m_z, m_z.0_284
# Raytracer_handofdos_r2.c:164:     m_w = 18000 * (m_w & 65535) + (m_w >> 16);
	movl	m_w(%rip), %eax	# m_w, m_w.2_289
# Raytracer_handofdos_r2.c:174:     return (u + 1.0) * 2.328306435454494e-10;
	vxorpd	%xmm1, %xmm1, %xmm1	# tmp353
	vxorpd	%xmm2, %xmm2, %xmm2	# tmp329
# Raytracer_handofdos_r2.c:300: 				Vector t1 = a;  opMul(&t1, (Random() - .5) * 99);
	vmovdqa	80(%rsp), %xmm0	# a, a
	vmovss	%xmm12, 36(%rsp)	# p$D7143$z, %sfp
# Raytracer_handofdos_r2.c:163:     m_z = 36969 * (m_z & 65535) + (m_z >> 16);
	movzwl	%cx, %r8d	# m_z.0_284, m_z.0_284
# Raytracer_handofdos_r2.c:164:     m_w = 18000 * (m_w & 65535) + (m_w >> 16);
	movzwl	%ax, %edi	# m_w.2_289, m_w.2_289
# Raytracer_handofdos_r2.c:163:     m_z = 36969 * (m_z & 65535) + (m_z >> 16);
	shrl	$16, %ecx	#, tmp323
	vmovss	%xmm10, 24(%rsp)	# tmp449, %sfp
	imull	$36969, %r8d, %r8d	#, m_z.0_284, tmp322
# Raytracer_handofdos_r2.c:164:     m_w = 18000 * (m_w & 65535) + (m_w >> 16);
	shrl	$16, %eax	#, tmp326
# Raytracer_handofdos_r2.c:300: 				Vector t1 = a;  opMul(&t1, (Random() - .5) * 99);
	vmovaps	%xmm0, 112(%rsp)	# a, t1
# Raytracer_handofdos_r2.c:301: 				Vector t2 = b;  opMul(&t2, (Random() - .5) * 99);
	vmovdqa	96(%rsp), %xmm0	# b, b
# Raytracer_handofdos_r2.c:164:     m_w = 18000 * (m_w & 65535) + (m_w >> 16);
	imull	$18000, %edi, %edi	#, m_w.2_289, tmp325
# Raytracer_handofdos_r2.c:174:     return (u + 1.0) * 2.328306435454494e-10;
	vmovsd	%xmm9, 16(%rsp)	# tmp452, %sfp
# Raytracer_handofdos_r2.c:301: 				Vector t2 = b;  opMul(&t2, (Random() - .5) * 99);
	vmovaps	%xmm0, 128(%rsp)	# b, t2
# Raytracer_handofdos_r2.c:304: 				t2 = (Vector){.x=17, .y=16, .z=8};	opAdd(&t2, &t1);
	movl	$0, 140(%rsp)	#, MEM[(union  *)&t2 + 12B]
# Raytracer_handofdos_r2.c:163:     m_z = 36969 * (m_z & 65535) + (m_z >> 16);
	addl	%ecx, %r8d	# tmp323, _288
	movzwl	%r8w, %edx	# _288, _288
# Raytracer_handofdos_r2.c:164:     m_w = 18000 * (m_w & 65535) + (m_w >> 16);
	addl	%eax, %edi	# tmp326, _293
# Raytracer_handofdos_r2.c:165:     return (m_z << 16) + m_w;
	movl	%r8d, %eax	# _288, tmp327
# Raytracer_handofdos_r2.c:163:     m_z = 36969 * (m_z & 65535) + (m_z >> 16);
	shrl	$16, %r8d	#, tmp347
	imull	$36969, %edx, %edx	#, _288, tmp346
# Raytracer_handofdos_r2.c:164:     m_w = 18000 * (m_w & 65535) + (m_w >> 16);
	movzwl	%di, %ecx	# _293, _293
# Raytracer_handofdos_r2.c:165:     return (m_z << 16) + m_w;
	sall	$16, %eax	#, tmp327
# Raytracer_handofdos_r2.c:164:     m_w = 18000 * (m_w & 65535) + (m_w >> 16);
	imull	$18000, %ecx, %ecx	#, _293, tmp349
# Raytracer_handofdos_r2.c:174:     return (u + 1.0) * 2.328306435454494e-10;
	leal	(%rax,%rdi), %esi	#, tmp330
# Raytracer_handofdos_r2.c:164:     m_w = 18000 * (m_w & 65535) + (m_w >> 16);
	shrl	$16, %edi	#, tmp350
# Raytracer_handofdos_r2.c:174:     return (u + 1.0) * 2.328306435454494e-10;
	vcvtsi2sdq	%rsi, %xmm2, %xmm2	# tmp330, tmp329, tmp329
# Raytracer_handofdos_r2.c:313: 				Vector smpl = sampler(&t2, &t1);	opMul(&smpl, 3.5);
	movq	%r12, %rsi	# tmp446,
# Raytracer_handofdos_r2.c:163:     m_z = 36969 * (m_z & 65535) + (m_z >> 16);
	addl	%r8d, %edx	# tmp347, _273
# Raytracer_handofdos_r2.c:165:     return (m_z << 16) + m_w;
	movl	%edx, %eax	# _273, tmp351
# Raytracer_handofdos_r2.c:164:     m_w = 18000 * (m_w & 65535) + (m_w >> 16);
	addl	%edi, %ecx	# tmp350, _278
# Raytracer_handofdos_r2.c:313: 				Vector smpl = sampler(&t2, &t1);	opMul(&smpl, 3.5);
	movq	%rbp, %rdi	# tmp451,
# Raytracer_handofdos_r2.c:165:     return (m_z << 16) + m_w;
	sall	$16, %eax	#, tmp351
# Raytracer_handofdos_r2.c:174:     return (u + 1.0) * 2.328306435454494e-10;
	addl	%ecx, %eax	# _278, tmp354
	vaddsd	%xmm8, %xmm2, %xmm2	# tmp450, tmp329, tmp334
	vcvtsi2sdq	%rax, %xmm1, %xmm1	# tmp354, tmp353, tmp353
# Raytracer_handofdos_r2.c:163:     m_z = 36969 * (m_z & 65535) + (m_z >> 16);
	movzwl	%dx, %eax	# _273, _273
	shrl	$16, %edx	#, tmp379
	imull	$36969, %eax, %eax	#, _273, tmp378
# Raytracer_handofdos_r2.c:174:     return (u + 1.0) * 2.328306435454494e-10;
	vmulsd	%xmm9, %xmm2, %xmm2	# tmp452, tmp334, tmp336
	vaddsd	%xmm8, %xmm1, %xmm1	# tmp450, tmp353, tmp358
# Raytracer_handofdos_r2.c:163:     m_z = 36969 * (m_z & 65535) + (m_z >> 16);
	addl	%edx, %eax	# tmp379, _258
# Raytracer_handofdos_r2.c:164:     m_w = 18000 * (m_w & 65535) + (m_w >> 16);
	movzwl	%cx, %edx	# _278, _278
	shrl	$16, %ecx	#, tmp382
	imull	$18000, %edx, %edx	#, _278, tmp381
# Raytracer_handofdos_r2.c:174:     return (u + 1.0) * 2.328306435454494e-10;
	vmulsd	%xmm9, %xmm1, %xmm1	# tmp452, tmp358, tmp360
# Raytracer_handofdos_r2.c:179:     return GetUniform();
	vcvtsd2ss	%xmm2, %xmm2, %xmm2	# tmp336, tmp338
# Raytracer_handofdos_r2.c:300: 				Vector t1 = a;  opMul(&t1, (Random() - .5) * 99);
	vcvtss2sd	%xmm2, %xmm2, %xmm2	# tmp338, tmp339
	vsubsd	.LC23(%rip), %xmm2, %xmm2	#, tmp339, tmp340
	vmulsd	.LC24(%rip), %xmm2, %xmm2	#, tmp340, tmp342
# Raytracer_handofdos_r2.c:164:     m_w = 18000 * (m_w & 65535) + (m_w >> 16);
	addl	%edx, %ecx	# tmp381, _263
# Raytracer_handofdos_r2.c:165:     return (m_z << 16) + m_w;
	movl	%eax, %edx	# _258, tmp383
	sall	$16, %edx	#, tmp383
# Raytracer_handofdos_r2.c:174:     return (u + 1.0) * 2.328306435454494e-10;
	addl	%ecx, %edx	# _263, tmp386
# Raytracer_handofdos_r2.c:179:     return GetUniform();
	vcvtsd2ss	%xmm1, %xmm1, %xmm1	# tmp360, tmp362
# Raytracer_handofdos_r2.c:301: 				Vector t2 = b;  opMul(&t2, (Random() - .5) * 99);
	vcvtss2sd	%xmm1, %xmm1, %xmm1	# tmp362, tmp363
	vsubsd	.LC23(%rip), %xmm1, %xmm1	#, tmp363, tmp364
	vmulsd	.LC24(%rip), %xmm1, %xmm1	#, tmp364, tmp366
# Raytracer_handofdos_r2.c:300: 				Vector t1 = a;  opMul(&t1, (Random() - .5) * 99);
	vcvtsd2ss	%xmm2, %xmm2, %xmm2	# tmp342, _10
# Raytracer_handofdos_r2.c:301: 				Vector t2 = b;  opMul(&t2, (Random() - .5) * 99);
	vcvtsd2ss	%xmm1, %xmm1, %xmm1	# tmp366, _15
# Raytracer_handofdos_r2.c:50: 	me->y *= r;
	vmulss	132(%rsp), %xmm1, %xmm4	# t2.D.7143.y, _15, tmp369
# Raytracer_handofdos_r2.c:49: 	me->x *= r;
	vmulss	128(%rsp), %xmm1, %xmm6	# t2.D.7143.x, _15, tmp368
# Raytracer_handofdos_r2.c:39: 	me->y += r->y;
	vfmadd231ss	116(%rsp), %xmm2, %xmm4	# t1.D.7143.y, _10, _163
# Raytracer_handofdos_r2.c:51: 	me->z *= r;
	vmulss	136(%rsp), %xmm1, %xmm1	# t2.D.7143.z, _15, tmp370
# Raytracer_handofdos_r2.c:38: 	me->x += r->x;
	vfmadd231ss	112(%rsp), %xmm2, %xmm6	# t1.D.7143.x, _10, _161
	vaddss	.LC25(%rip), %xmm6, %xmm0	#, _161, tmp371
# Raytracer_handofdos_r2.c:40: 	me->z += r->z;
	vfmadd231ss	120(%rsp), %xmm2, %xmm1	# t1.D.7143.z, _10, _165
# Raytracer_handofdos_r2.c:174:     return (u + 1.0) * 2.328306435454494e-10;
	vxorpd	%xmm2, %xmm2, %xmm2	# tmp403
# Raytracer_handofdos_r2.c:38: 	me->x += r->x;
	vmovss	%xmm0, 128(%rsp)	# tmp371, t2.D.7143.x
# Raytracer_handofdos_r2.c:39: 	me->y += r->y;
	vaddss	%xmm11, %xmm4, %xmm0	# tmp442, _163, tmp373
	vmovss	%xmm0, 132(%rsp)	# tmp373, t2.D.7143.y
# Raytracer_handofdos_r2.c:40: 	me->z += r->z;
	vaddss	.LC26(%rip), %xmm1, %xmm0	#, _165, tmp375
	vmovss	%xmm0, 136(%rsp)	# tmp375, t2.D.7143.z
# Raytracer_handofdos_r2.c:174:     return (u + 1.0) * 2.328306435454494e-10;
	vxorpd	%xmm0, %xmm0, %xmm0	# tmp385
	vcvtsi2sdq	%rdx, %xmm0, %xmm0	# tmp386, tmp385, tmp385
# Raytracer_handofdos_r2.c:163:     m_z = 36969 * (m_z & 65535) + (m_z >> 16);
	movzwl	%ax, %edx	# _258, _258
	shrl	$16, %eax	#, tmp397
	imull	$36969, %edx, %edx	#, _258, tmp396
	addl	%edx, %eax	# tmp396, _243
# Raytracer_handofdos_r2.c:164:     m_w = 18000 * (m_w & 65535) + (m_w >> 16);
	movzwl	%cx, %edx	# _263, _263
	shrl	$16, %ecx	#, tmp400
# Raytracer_handofdos_r2.c:174:     return (u + 1.0) * 2.328306435454494e-10;
	vaddsd	%xmm8, %xmm0, %xmm0	# tmp450, tmp385, tmp390
# Raytracer_handofdos_r2.c:164:     m_w = 18000 * (m_w & 65535) + (m_w >> 16);
	imull	$18000, %edx, %edx	#, _263, tmp399
# Raytracer_handofdos_r2.c:163:     m_z = 36969 * (m_z & 65535) + (m_z >> 16);
	movl	%eax, m_z(%rip)	# _243, m_z
# Raytracer_handofdos_r2.c:165:     return (m_z << 16) + m_w;
	sall	$16, %eax	#, tmp401
# Raytracer_handofdos_r2.c:174:     return (u + 1.0) * 2.328306435454494e-10;
	vmulsd	%xmm9, %xmm0, %xmm0	# tmp452, tmp390, tmp392
# Raytracer_handofdos_r2.c:164:     m_w = 18000 * (m_w & 65535) + (m_w >> 16);
	addl	%edx, %ecx	# tmp399, _248
# Raytracer_handofdos_r2.c:174:     return (u + 1.0) * 2.328306435454494e-10;
	addl	%ecx, %eax	# _248, tmp404
# Raytracer_handofdos_r2.c:164:     m_w = 18000 * (m_w & 65535) + (m_w >> 16);
	movl	%ecx, m_w(%rip)	# _248, m_w
# Raytracer_handofdos_r2.c:174:     return (u + 1.0) * 2.328306435454494e-10;
	vcvtsi2sdq	%rax, %xmm2, %xmm2	# tmp404, tmp403, tmp403
# Raytracer_handofdos_r2.c:179:     return GetUniform();
	vcvtsd2ss	%xmm0, %xmm0, %xmm0	# tmp392, tmp394
# Raytracer_handofdos_r2.c:306: 				Vector randa = a;	opMul(&randa, (Random() + x));
	vaddss	40(%rsp), %xmm0, %xmm0	# %sfp, tmp394, _17
# Raytracer_handofdos_r2.c:174:     return (u + 1.0) * 2.328306435454494e-10;
	vaddsd	%xmm8, %xmm2, %xmm2	# tmp450, tmp403, tmp408
	vmulsd	%xmm9, %xmm2, %xmm2	# tmp452, tmp408, tmp410
# Raytracer_handofdos_r2.c:179:     return GetUniform();
	vcvtsd2ss	%xmm2, %xmm2, %xmm2	# tmp410, tmp412
# Raytracer_handofdos_r2.c:307: 				Vector randb = b;	opMul(&randb, (Random() + y));
	vaddss	56(%rsp), %xmm2, %xmm2	# %sfp, tmp412, _20
# Raytracer_handofdos_r2.c:39: 	me->y += r->y;
	vfmadd213ss	48(%rsp), %xmm2, %xmm14	# %sfp, _20, tmp416
# Raytracer_handofdos_r2.c:38: 	me->x += r->x;
	vfmadd213ss	44(%rsp), %xmm2, %xmm5	# %sfp, _20, tmp413
# Raytracer_handofdos_r2.c:40: 	me->z += r->z;
	vfmadd213ss	52(%rsp), %xmm7, %xmm2	# %sfp, pretmp_750, tmp419
	vmovss	%xmm11, 32(%rsp)	# tmp442, %sfp
# Raytracer_handofdos_r2.c:132: 	return opMul(me, 1 / sqrt(opNormC_single(me)));
	vmovsd	%xmm8, 8(%rsp)	# tmp450, %sfp
# Raytracer_handofdos_r2.c:39: 	me->y += r->y;
	vfmadd132ss	%xmm0, %xmm14, %xmm13	# _17, tmp416, tmp417
# Raytracer_handofdos_r2.c:38: 	me->x += r->x;
	vfmadd132ss	%xmm0, %xmm5, %xmm15	# _17, tmp413, tmp414
# Raytracer_handofdos_r2.c:40: 	me->z += r->z;
	vfmadd231ss	%xmm3, %xmm0, %xmm2	# c$D7143$z, _17, tmp420
	vfmsub231ss	%xmm11, %xmm13, %xmm4	# tmp442, tmp417, _118
	vfmsub231ss	%xmm11, %xmm15, %xmm6	# tmp442, tmp414, _117
	vfmsub132ss	%xmm11, %xmm1, %xmm2	# tmp442, _165, _119
# Raytracer_handofdos_r2.c:64: 		return me->x * me->x + me->y * me->y + me->z * me->z;
	vmulss	%xmm4, %xmm4, %xmm13	# _118, _118, tmp422
	vfmadd231ss	%xmm6, %xmm6, %xmm13	# _117, _117, tmp423
	vfmadd231ss	%xmm2, %xmm2, %xmm13	# _119, _119, tmp424
# Raytracer_handofdos_r2.c:132: 	return opMul(me, 1 / sqrt(opNormC_single(me)));
	vcvtss2sd	%xmm13, %xmm13, %xmm13	# tmp424, tmp425
	vsqrtsd	%xmm13, %xmm13, %xmm13	# tmp425, _233
	vdivsd	%xmm13, %xmm8, %xmm13	# _233, tmp450, tmp426
	vcvtsd2ss	%xmm13, %xmm13, %xmm13	# tmp426, _235
# Raytracer_handofdos_r2.c:49: 	me->x *= r;
	vmulss	%xmm13, %xmm6, %xmm7	# _235, _117, tmp428
# Raytracer_handofdos_r2.c:50: 	me->y *= r;
	vmulss	%xmm13, %xmm4, %xmm4	# _235, _118, tmp429
# Raytracer_handofdos_r2.c:51: 	me->z *= r;
	vmulss	%xmm13, %xmm2, %xmm2	# _235, _119, tmp430
# Raytracer_handofdos_r2.c:49: 	me->x *= r;
	vmovss	%xmm7, 112(%rsp)	# tmp428, t1.D.7143.x
# Raytracer_handofdos_r2.c:50: 	me->y *= r;
	vmovss	%xmm4, 116(%rsp)	# tmp429, t1.D.7143.y
# Raytracer_handofdos_r2.c:51: 	me->z *= r;
	vmovss	%xmm2, 120(%rsp)	# tmp430, t1.D.7143.z
# Raytracer_handofdos_r2.c:313: 				Vector smpl = sampler(&t2, &t1);	opMul(&smpl, 3.5);
	call	sampler	#
# Raytracer_handofdos_r2.c:38: 	me->x += r->x;
	vmovss	24(%rsp), %xmm10	# %sfp, tmp449
# Raytracer_handofdos_r2.c:39: 	me->y += r->y;
	vmovss	(%rsp), %xmm7	# %sfp, p$D7143$y
# Raytracer_handofdos_r2.c:299: 			for (int r = 64; r--;) {
	subl	$1, %ebx	#, ivtmp_703
# Raytracer_handofdos_r2.c:313: 				Vector smpl = sampler(&t2, &t1);	opMul(&smpl, 3.5);
	vmovq	%xmm0, 144(%rsp)	# tmp433, smpl
# Raytracer_handofdos_r2.c:38: 	me->x += r->x;
	vmovss	4(%rsp), %xmm3	# %sfp, p$D7143$x
# Raytracer_handofdos_r2.c:39: 	me->y += r->y;
	vfmadd231ss	148(%rsp), %xmm10, %xmm7	# MEM[(union  *)&smpl + 4B], tmp449, p$D7143$y
# Raytracer_handofdos_r2.c:313: 				Vector smpl = sampler(&t2, &t1);	opMul(&smpl, 3.5);
	vmovq	%xmm1, 152(%rsp)	#, smpl
# Raytracer_handofdos_r2.c:40: 	me->z += r->z;
	vmovss	36(%rsp), %xmm12	# %sfp, p$D7143$z
# Raytracer_handofdos_r2.c:38: 	me->x += r->x;
	vfmadd231ss	144(%rsp), %xmm10, %xmm3	# MEM[(union  *)&smpl], tmp449, p$D7143$x
# Raytracer_handofdos_r2.c:299: 			for (int r = 64; r--;) {
	vmovsd	8(%rsp), %xmm8	# %sfp, tmp450
	vmovss	32(%rsp), %xmm11	# %sfp, tmp442
# Raytracer_handofdos_r2.c:40: 	me->z += r->z;
	vfmadd231ss	152(%rsp), %xmm10, %xmm12	# MEM[(union  *)&smpl + 8B], tmp449, p$D7143$z
# Raytracer_handofdos_r2.c:299: 			for (int r = 64; r--;) {
	vmovsd	16(%rsp), %xmm9	# %sfp, tmp452
# Raytracer_handofdos_r2.c:39: 	me->y += r->y;
	vmovss	%xmm7, (%rsp)	# p$D7143$y, %sfp
# Raytracer_handofdos_r2.c:38: 	me->x += r->x;
	vmovss	%xmm3, 4(%rsp)	# p$D7143$x, %sfp
# Raytracer_handofdos_r2.c:299: 			for (int r = 64; r--;) {
	jne	.L81	#,
# Raytracer_handofdos_r2.c:318: 			fprintf(out,"%c%c%c", (int) p.x, (int) p.y, (int) p.z);
	vcvttss2si	%xmm3, %ecx	#, tmp440
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:97:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	xorl	%eax, %eax	#
	movq	%r15, %rdx	# tmp453,
	movl	$1, %esi	#,
	vcvttss2si	%xmm12, %r9d	# p$D7143$z,
	movq	%r14, %rdi	# out,
# Raytracer_handofdos_r2.c:297: 		for (int x = WIDTH; x--;) {
	subl	$1, %r13d	#, x
	vmovsd	%xmm9, 24(%rsp)	# tmp452, %sfp
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:97:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	vcvttss2si	%xmm7, %r8d	#,
	vmovsd	%xmm8, 16(%rsp)	# tmp450, %sfp
	vmovss	%xmm10, 32(%rsp)	# tmp449, %sfp
	vmovss	%xmm11, 8(%rsp)	# tmp442, %sfp
	call	__fprintf_chk@PLT	#
# Raytracer_handofdos_r2.c:297: 		for (int x = WIDTH; x--;) {
	cmpl	$-1, %r13d	#, x
	vmovss	8(%rsp), %xmm11	# %sfp, tmp442
	vmovss	32(%rsp), %xmm10	# %sfp, tmp449
	vmovsd	16(%rsp), %xmm8	# %sfp, tmp450
	vmovsd	24(%rsp), %xmm9	# %sfp, tmp452
	je	.L82	#,
	vmovss	96(%rsp), %xmm5	# MEM[(union  *)&b], pretmp_738
	vmovss	80(%rsp), %xmm15	# MEM[(union  *)&a], c$D7143$x
	vmovss	84(%rsp), %xmm13	# MEM[(union  *)&a + 4B], c$D7143$y
	vmovss	100(%rsp), %xmm14	# MEM[(union  *)&b + 4B], pretmp_748
	vmovss	88(%rsp), %xmm3	# MEM[(union  *)&a + 8B], c$D7143$z
	vmovss	104(%rsp), %xmm7	# MEM[(union  *)&b + 8B], pretmp_750
	jmp	.L85	#
.L82:
# Raytracer_handofdos_r2.c:296: 	for (int y = HEIGHT; y--;) {
	subl	$1, 60(%rsp)	#, %sfp
	movl	60(%rsp), %eax	# %sfp, y
	cmpl	$-1, %eax	#, y
	je	.L84	#,
	vmovss	96(%rsp), %xmm5	# MEM[(union  *)&b], pretmp_738
	vmovss	80(%rsp), %xmm15	# MEM[(union  *)&a], c$D7143$x
	vmovss	84(%rsp), %xmm13	# MEM[(union  *)&a + 4B], c$D7143$y
	vmovss	100(%rsp), %xmm14	# MEM[(union  *)&b + 4B], pretmp_748
	vmovss	88(%rsp), %xmm3	# MEM[(union  *)&a + 8B], c$D7143$z
	vmovss	104(%rsp), %xmm7	# MEM[(union  *)&b + 8B], pretmp_750
	jmp	.L72	#
.L89:
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:97:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	# stderr,
	movl	$39, %edx	#,
	movl	$1, %esi	#,
	leaq	.LC18(%rip), %rdi	#,
	call	fwrite@PLT	#
# Raytracer_handofdos_r2.c:288: 		return -1;
	movl	$-1, %eax	#, <retval>
.L69:
# Raytracer_handofdos_r2.c:323: }
	movq	168(%rsp), %rbx	# D.7921, tmp487
	xorq	%fs:40, %rbx	#, tmp487
	jne	.L90	#,
	addq	$184, %rsp	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx	#
	.cfi_def_cfa_offset 48
	popq	%rbp	#
	.cfi_def_cfa_offset 40
	popq	%r12	#
	.cfi_def_cfa_offset 32
	popq	%r13	#
	.cfi_def_cfa_offset 24
	popq	%r14	#
	.cfi_def_cfa_offset 16
	popq	%r15	#
	.cfi_def_cfa_offset 8
	ret
.L84:
	.cfi_restore_state
# Raytracer_handofdos_r2.c:321: 	fclose(out);
	movq	%r14, %rdi	# out,
	call	fclose@PLT	#
# Raytracer_handofdos_r2.c:322: 	return 0;
	xorl	%eax, %eax	# <retval>
	jmp	.L69	#
.L90:
# Raytracer_handofdos_r2.c:323: }
	call	__stack_chk_fail@PLT	#
	.cfi_endproc
.LFE596:
	.size	main, .-main
	.section	.rodata.str1.1
.LC31:
	.string	"opAdd (%f) times %6.3f secs\n"
	.text
	.p2align 4,,15
	.globl	bench_opAdd
	.type	bench_opAdd, @function
bench_opAdd:
.LFB597:
	.cfi_startproc
	pushq	%rbx	#
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
# Raytracer_handofdos_r2.c:333:     clock_t clc = clock();
	call	clock@PLT	#
	movq	%rax, %rbx	#, clc
# Raytracer_handofdos_r2.c:340:     printf("opAdd (%f) times %6.3f secs\n", r.x, ((float)clock()-clc)/CLOCKS_PER_SEC);
	call	clock@PLT	#
	vxorps	%xmm1, %xmm1, %xmm1	# tmp94
	vxorps	%xmm0, %xmm0, %xmm0	# tmp95
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:104:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC31(%rip), %rsi	#,
# Raytracer_handofdos_r2.c:340:     printf("opAdd (%f) times %6.3f secs\n", r.x, ((float)clock()-clc)/CLOCKS_PER_SEC);
	vcvtsi2ssq	%rbx, %xmm0, %xmm0	# clc, tmp95, tmp95
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:104:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movl	$1, %edi	#,
# Raytracer_handofdos_r2.c:341: }
	popq	%rbx	#
	.cfi_def_cfa_offset 8
# Raytracer_handofdos_r2.c:340:     printf("opAdd (%f) times %6.3f secs\n", r.x, ((float)clock()-clc)/CLOCKS_PER_SEC);
	vcvtsi2ssq	%rax, %xmm1, %xmm1	# _1, tmp94, tmp94
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:104:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movl	$2, %eax	#,
# Raytracer_handofdos_r2.c:340:     printf("opAdd (%f) times %6.3f secs\n", r.x, ((float)clock()-clc)/CLOCKS_PER_SEC);
	vsubss	%xmm0, %xmm1, %xmm1	# tmp95, tmp94, tmp96
	vmulss	.LC29(%rip), %xmm1, %xmm1	#, tmp96, tmp97
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:104:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	vmovsd	.LC30(%rip), %xmm0	#,
	vcvtss2sd	%xmm1, %xmm1, %xmm1	# tmp97,
	jmp	__printf_chk@PLT	#
	.cfi_endproc
.LFE597:
	.size	bench_opAdd, .-bench_opAdd
	.section	.rodata.str1.1
.LC35:
	.string	"opMul (%f) times %6.3f secs\n"
	.text
	.p2align 4,,15
	.globl	bench_opMul
	.type	bench_opMul, @function
bench_opMul:
.LFB598:
	.cfi_startproc
	pushq	%r13	#
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	leaq	16(%rsp), %r13	#,
	.cfi_def_cfa 13, 0
	andq	$-32, %rsp	#,
	pushq	-8(%r13)	#
	pushq	%rbp	#
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp	#,
	pushq	%r13	#
	.cfi_escape 0xf,0x3,0x76,0x78,0x6
	pushq	%rbx	#
	subq	$64, %rsp	#,
	.cfi_escape 0x10,0x3,0x2,0x76,0x70
# Raytracer_handofdos_r2.c:346:     clock_t clc = clock();
	call	clock@PLT	#
	vmovaps	.LC32(%rip), %ymm0	#, vect__17.221
	vmovaps	.LC33(%rip), %ymm1	#, tmp125
	movq	%rax, %rbx	#, clc
	xorl	%eax, %eax	# ivtmp.225
	.p2align 4,,10
	.p2align 3
.L94:
# Raytracer_handofdos_r2.c:49: 	me->x *= r;
	vmulps	%ymm1, %ymm0, %ymm0	# tmp125, vect__17.221, vect__17.221
	addl	$1, %eax	#, ivtmp.225
	cmpl	$268435455, %eax	#, ivtmp.225
	jne	.L94	#,
	vxorps	%xmm1, %xmm1, %xmm1	# tmp106
	vperm2f128	$33, %ymm1, %ymm0, %ymm2	#, tmp106, vect__17.221, vect__17.223
	vmulps	%ymm2, %ymm0, %ymm0	# vect__17.223, vect__17.221, vect__17.223
	vperm2f128	$33, %ymm1, %ymm0, %ymm2	#, tmp106, vect__17.223, tmp108
	vshufps	$78, %ymm2, %ymm0, %ymm2	#, tmp108, vect__17.223, vect__17.223
	vmulps	%ymm2, %ymm0, %ymm0	# vect__17.223, vect__17.223, vect__17.223
	vperm2f128	$33, %ymm1, %ymm0, %ymm1	#, tmp106, vect__17.223, tmp110
	vmovaps	%ymm0, -80(%rbp)	# vect__17.223, %sfp
	vpalignr	$4, %ymm0, %ymm1, %ymm3	#, vect__17.223, tmp110, tmp111
	vmovdqa	%ymm3, -48(%rbp)	# tmp111, %sfp
# Raytracer_handofdos_r2.c:353:     printf("opMul (%f) times %6.3f secs\n", a.x, ((float)clock()-clc)/CLOCKS_PER_SEC);
	vzeroupper
	call	clock@PLT	#
	vxorps	%xmm1, %xmm1, %xmm1	# tmp112
	vxorps	%xmm2, %xmm2, %xmm2	# tmp113
# Raytracer_handofdos_r2.c:49: 	me->x *= r;
	vmovaps	-80(%rbp), %ymm0	# %sfp, vect__17.223
# Raytracer_handofdos_r2.c:353:     printf("opMul (%f) times %6.3f secs\n", a.x, ((float)clock()-clc)/CLOCKS_PER_SEC);
	vcvtsi2ssq	%rax, %xmm1, %xmm1	# _1, tmp112, tmp112
# Raytracer_handofdos_r2.c:49: 	me->x *= r;
	vmulps	-48(%rbp), %ymm0, %ymm0	# %sfp, vect__17.223, vect__17.223
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:104:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC35(%rip), %rsi	#,
	movl	$1, %edi	#,
# Raytracer_handofdos_r2.c:353:     printf("opMul (%f) times %6.3f secs\n", a.x, ((float)clock()-clc)/CLOCKS_PER_SEC);
	vcvtsi2ssq	%rbx, %xmm2, %xmm2	# clc, tmp113, tmp113
# Raytracer_handofdos_r2.c:49: 	me->x *= r;
	vmulss	.LC34(%rip), %xmm0, %xmm0	#, stmp__17.222, tmp121
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:104:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movl	$2, %eax	#,
# Raytracer_handofdos_r2.c:353:     printf("opMul (%f) times %6.3f secs\n", a.x, ((float)clock()-clc)/CLOCKS_PER_SEC);
	vsubss	%xmm2, %xmm1, %xmm1	# tmp113, tmp112, tmp114
	vmulss	.LC29(%rip), %xmm1, %xmm1	#, tmp114, tmp115
	vcvtss2sd	%xmm0, %xmm0, %xmm0	# tmp121, tmp123
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:104:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	vcvtss2sd	%xmm1, %xmm1, %xmm1	# tmp115,
	vzeroupper
# Raytracer_handofdos_r2.c:354: }
	addq	$64, %rsp	#,
	popq	%rbx	#
	popq	%r13	#
	.cfi_def_cfa 13, 0
	popq	%rbp	#
	leaq	-16(%r13), %rsp	#,
	.cfi_def_cfa 7, 16
	popq	%r13	#
	.cfi_def_cfa_offset 8
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:104:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	jmp	__printf_chk@PLT	#
	.cfi_endproc
.LFE598:
	.size	bench_opMul, .-bench_opMul
	.section	.rodata.str1.1
.LC37:
	.string	"opNorm (%f) times %6.3f secs\n"
	.text
	.p2align 4,,15
	.globl	bench_opNorm
	.type	bench_opNorm, @function
bench_opNorm:
.LFB599:
	.cfi_startproc
	pushq	%rbx	#
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
# Raytracer_handofdos_r2.c:360:     clock_t clc = clock();
	call	clock@PLT	#
	movq	%rax, %rbx	#, clc
# Raytracer_handofdos_r2.c:368:     printf("opNorm (%f) times %6.3f secs\n", res, ((float)clock()-clc)/CLOCKS_PER_SEC);
	call	clock@PLT	#
	vxorps	%xmm1, %xmm1, %xmm1	# tmp94
	vxorps	%xmm0, %xmm0, %xmm0	# tmp95
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:104:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC37(%rip), %rsi	#,
# Raytracer_handofdos_r2.c:368:     printf("opNorm (%f) times %6.3f secs\n", res, ((float)clock()-clc)/CLOCKS_PER_SEC);
	vcvtsi2ssq	%rbx, %xmm0, %xmm0	# clc, tmp95, tmp95
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:104:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movl	$1, %edi	#,
# Raytracer_handofdos_r2.c:369: }
	popq	%rbx	#
	.cfi_def_cfa_offset 8
# Raytracer_handofdos_r2.c:368:     printf("opNorm (%f) times %6.3f secs\n", res, ((float)clock()-clc)/CLOCKS_PER_SEC);
	vcvtsi2ssq	%rax, %xmm1, %xmm1	# _1, tmp94, tmp94
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:104:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movl	$2, %eax	#,
# Raytracer_handofdos_r2.c:368:     printf("opNorm (%f) times %6.3f secs\n", res, ((float)clock()-clc)/CLOCKS_PER_SEC);
	vsubss	%xmm0, %xmm1, %xmm1	# tmp95, tmp94, tmp96
	vmulss	.LC29(%rip), %xmm1, %xmm1	#, tmp96, tmp97
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:104:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	vmovsd	.LC36(%rip), %xmm0	#,
	vcvtss2sd	%xmm1, %xmm1, %xmm1	# tmp97,
	jmp	__printf_chk@PLT	#
	.cfi_endproc
.LFE599:
	.size	bench_opNorm, .-bench_opNorm
	.section	.rodata.str1.8
	.align 8
.LC40:
	.string	"opCross (%f) times %6.3f secs\n"
	.text
	.p2align 4,,15
	.globl	bench_opCross
	.type	bench_opCross, @function
bench_opCross:
.LFB600:
	.cfi_startproc
	pushq	%rbx	#
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	subq	$16, %rsp	#,
	.cfi_def_cfa_offset 32
# Raytracer_handofdos_r2.c:375:     clock_t clc = clock();
	call	clock@PLT	#
# Raytracer_handofdos_r2.c:374:     Vector r = a;
	vmovss	.LC38(%rip), %xmm6	#, tmp124
	vmovss	.LC12(%rip), %xmm5	#, tmp123
	vmovss	.LC39(%rip), %xmm4	#, tmp125
# Raytracer_handofdos_r2.c:375:     clock_t clc = clock();
	movq	%rax, %rbx	#, clc
	movl	$2147483647, %eax	#, ivtmp_50
# Raytracer_handofdos_r2.c:374:     Vector r = a;
	vmovaps	%xmm6, %xmm1	# tmp124, newz
	vmovaps	%xmm5, %xmm3	# tmp123, r$D7143$y
	vmovaps	%xmm4, %xmm0	# tmp125, r$D7143$x
	.p2align 4,,10
	.p2align 3
.L100:
# Raytracer_handofdos_r2.c:99: 	newx = me->y * r->z - me->z * r->y;
	vmulss	%xmm5, %xmm1, %xmm7	# tmp123, newz, tmp107
# Raytracer_handofdos_r2.c:100: 	newy = me->z * r->x - me->x * r->z;
	vmulss	%xmm6, %xmm0, %xmm2	# tmp124, r$D7143$x, tmp110
	vfmsub231ss	%xmm4, %xmm1, %xmm2	# tmp125, newz, newy
# Raytracer_handofdos_r2.c:101: 	newz = me->x * r->y - me->y * r->x;
	vmulss	%xmm4, %xmm3, %xmm1	# tmp125, r$D7143$y, tmp113
# Raytracer_handofdos_r2.c:99: 	newx = me->y * r->z - me->z * r->y;
	vfmsub132ss	%xmm6, %xmm7, %xmm3	# tmp124, tmp107, r$D7143$y
# Raytracer_handofdos_r2.c:101: 	newz = me->x * r->y - me->y * r->x;
	vfmsub231ss	%xmm5, %xmm0, %xmm1	# tmp123, r$D7143$x, newz
# Raytracer_handofdos_r2.c:99: 	newx = me->y * r->z - me->z * r->y;
	vmovaps	%xmm3, %xmm0	# r$D7143$y, r$D7143$x
# Raytracer_handofdos_r2.c:104: 	me->y = newy;
	vmovaps	%xmm2, %xmm3	# newy, r$D7143$y
# Raytracer_handofdos_r2.c:377:     for (long int i = cycles; i--;)
	subq	$1, %rax	#, ivtmp_50
	jne	.L100	#,
	vmovss	%xmm0, 12(%rsp)	# r$D7143$x, %sfp
# Raytracer_handofdos_r2.c:382:     printf("opCross (%f) times %6.3f secs\n", r.x, ((float)clock()-clc)/CLOCKS_PER_SEC);
	call	clock@PLT	#
	vxorps	%xmm1, %xmm1, %xmm1	# tmp116
	vxorps	%xmm2, %xmm2, %xmm2	# tmp117
	vmovss	12(%rsp), %xmm0	# %sfp, r$D7143$x
	vcvtsi2ssq	%rax, %xmm1, %xmm1	# _1, tmp116, tmp116
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:104:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movl	$1, %edi	#,
	movl	$2, %eax	#,
# Raytracer_handofdos_r2.c:382:     printf("opCross (%f) times %6.3f secs\n", r.x, ((float)clock()-clc)/CLOCKS_PER_SEC);
	vcvtsi2ssq	%rbx, %xmm2, %xmm2	# clc, tmp117, tmp117
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:104:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC40(%rip), %rsi	#,
# Raytracer_handofdos_r2.c:382:     printf("opCross (%f) times %6.3f secs\n", r.x, ((float)clock()-clc)/CLOCKS_PER_SEC);
	vcvtss2sd	%xmm0, %xmm0, %xmm0	# r$D7143$x, tmp122
	vsubss	%xmm2, %xmm1, %xmm1	# tmp117, tmp116, tmp118
	vmulss	.LC29(%rip), %xmm1, %xmm1	#, tmp118, tmp119
# Raytracer_handofdos_r2.c:383: }
	addq	$16, %rsp	#,
	.cfi_def_cfa_offset 16
	popq	%rbx	#
	.cfi_def_cfa_offset 8
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:104:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	vcvtss2sd	%xmm1, %xmm1, %xmm1	# tmp119,
	jmp	__printf_chk@PLT	#
	.cfi_endproc
.LFE600:
	.size	bench_opCross, .-bench_opCross
	.section	.rodata.str1.1
.LC42:
	.string	"opNot (%f) times %6.3f secs\n"
	.text
	.p2align 4,,15
	.globl	bench_opNot
	.type	bench_opNot, @function
bench_opNot:
.LFB601:
	.cfi_startproc
	pushq	%rbx	#
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	subq	$16, %rsp	#,
	.cfi_def_cfa_offset 32
# Raytracer_handofdos_r2.c:388:     clock_t clc = clock();
	call	clock@PLT	#
	vmovsd	.LC41(%rip), %xmm1	#, _54
# Raytracer_handofdos_r2.c:387:     Vector a = {.x=.1, .y = .2, .z = .3};
	vmovss	.LC38(%rip), %xmm3	#, a$D7143$z
# Raytracer_handofdos_r2.c:388:     clock_t clc = clock();
	movq	%rax, %rbx	#, clc
# Raytracer_handofdos_r2.c:387:     Vector a = {.x=.1, .y = .2, .z = .3};
	vmovss	.LC12(%rip), %xmm2	#, a$D7143$y
# Raytracer_handofdos_r2.c:388:     clock_t clc = clock();
	movl	$2147483647, %eax	#, ivtmp_27
# Raytracer_handofdos_r2.c:387:     Vector a = {.x=.1, .y = .2, .z = .3};
	vmovss	.LC39(%rip), %xmm0	#, a$D7143$x
	vmovsd	.LC0(%rip), %xmm4	#, tmp119
	jmp	.L105	#
	.p2align 4,,10
	.p2align 3
.L107:
	vmulss	%xmm2, %xmm2, %xmm1	# a$D7143$y, a$D7143$y, tmp108
	vfmadd231ss	%xmm0, %xmm0, %xmm1	# a$D7143$x, a$D7143$x, tmp109
	vfmadd231ss	%xmm3, %xmm3, %xmm1	# a$D7143$z, a$D7143$z, tmp110
	vcvtss2sd	%xmm1, %xmm1, %xmm1	# tmp110, tmp111
	vsqrtsd	%xmm1, %xmm1, %xmm1	# tmp111, _54
.L105:
# Raytracer_handofdos_r2.c:132: 	return opMul(me, 1 / sqrt(opNormC_single(me)));
	vdivsd	%xmm1, %xmm4, %xmm1	# _54, tmp119, tmp106
	vcvtsd2ss	%xmm1, %xmm1, %xmm1	# tmp106, _34
# Raytracer_handofdos_r2.c:49: 	me->x *= r;
	vmulss	%xmm1, %xmm0, %xmm0	# _34, a$D7143$x, a$D7143$x
# Raytracer_handofdos_r2.c:50: 	me->y *= r;
	vmulss	%xmm1, %xmm2, %xmm2	# _34, a$D7143$y, a$D7143$y
# Raytracer_handofdos_r2.c:51: 	me->z *= r;
	vmulss	%xmm1, %xmm3, %xmm3	# _34, a$D7143$z, a$D7143$z
# Raytracer_handofdos_r2.c:390:     for (long int i = cycles; i--;)
	subq	$1, %rax	#, ivtmp_27
	jne	.L107	#,
	vmovss	%xmm0, 12(%rsp)	# a$D7143$x, %sfp
# Raytracer_handofdos_r2.c:395:     printf("opNot (%f) times %6.3f secs\n", a.x, ((float)clock()-clc)/CLOCKS_PER_SEC);
	call	clock@PLT	#
	vxorps	%xmm1, %xmm1, %xmm1	# tmp112
	vxorps	%xmm2, %xmm2, %xmm2	# tmp113
	vmovss	12(%rsp), %xmm0	# %sfp, a$D7143$x
	vcvtsi2ssq	%rax, %xmm1, %xmm1	# _1, tmp112, tmp112
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:104:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movl	$1, %edi	#,
	movl	$2, %eax	#,
# Raytracer_handofdos_r2.c:395:     printf("opNot (%f) times %6.3f secs\n", a.x, ((float)clock()-clc)/CLOCKS_PER_SEC);
	vcvtsi2ssq	%rbx, %xmm2, %xmm2	# clc, tmp113, tmp113
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:104:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC42(%rip), %rsi	#,
# Raytracer_handofdos_r2.c:395:     printf("opNot (%f) times %6.3f secs\n", a.x, ((float)clock()-clc)/CLOCKS_PER_SEC);
	vcvtss2sd	%xmm0, %xmm0, %xmm0	# a$D7143$x, tmp118
	vsubss	%xmm2, %xmm1, %xmm1	# tmp113, tmp112, tmp114
	vmulss	.LC29(%rip), %xmm1, %xmm1	#, tmp114, tmp115
# Raytracer_handofdos_r2.c:396: }
	addq	$16, %rsp	#,
	.cfi_def_cfa_offset 16
	popq	%rbx	#
	.cfi_def_cfa_offset 8
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:104:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	vcvtss2sd	%xmm1, %xmm1, %xmm1	# tmp115,
	jmp	__printf_chk@PLT	#
	.cfi_endproc
.LFE601:
	.size	bench_opNot, .-bench_opNot
	.section	.rodata.str1.1
.LC43:
	.string	"Random (%f) times %6.3f secs\n"
	.text
	.p2align 4,,15
	.globl	bench_opRand
	.type	bench_opRand, @function
bench_opRand:
.LFB602:
	.cfi_startproc
	pushq	%rbx	#
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	subq	$16, %rsp	#,
	.cfi_def_cfa_offset 32
# Raytracer_handofdos_r2.c:401:     clock_t clc = clock();
	call	clock@PLT	#
	movl	m_z(%rip), %ecx	# m_z, m_z_lsm.261
	movl	m_w(%rip), %edx	# m_w, m_w_lsm.263
	movl	$2147483647, %esi	#, ivtmp_95
	vmovsd	.LC0(%rip), %xmm3	#, tmp136
	vmovsd	.LC2(%rip), %xmm2	#, tmp137
	movq	%rax, %rbx	#, clc
# Raytracer_handofdos_r2.c:402:     float res = 0;
	vxorps	%xmm0, %xmm0, %xmm0	# res
	.p2align 4,,10
	.p2align 3
.L111:
# Raytracer_handofdos_r2.c:163:     m_z = 36969 * (m_z & 65535) + (m_z >> 16);
	movzwl	%cx, %eax	# m_z_lsm.261, m_z_lsm.261
	shrl	$16, %ecx	#, tmp113
# Raytracer_handofdos_r2.c:174:     return (u + 1.0) * 2.328306435454494e-10;
	vxorpd	%xmm1, %xmm1, %xmm1	# tmp119
# Raytracer_handofdos_r2.c:163:     m_z = 36969 * (m_z & 65535) + (m_z >> 16);
	imull	$36969, %eax, %eax	#, m_z_lsm.261, tmp112
	addl	%eax, %ecx	# tmp112, m_z_lsm.261
# Raytracer_handofdos_r2.c:164:     m_w = 18000 * (m_w & 65535) + (m_w >> 16);
	movzwl	%dx, %eax	# m_w_lsm.263, m_w_lsm.263
	shrl	$16, %edx	#, tmp116
	imull	$18000, %eax, %eax	#, m_w_lsm.263, tmp115
	addl	%eax, %edx	# tmp115, m_w_lsm.263
# Raytracer_handofdos_r2.c:165:     return (m_z << 16) + m_w;
	movl	%ecx, %eax	# m_z_lsm.261, tmp117
	sall	$16, %eax	#, tmp117
# Raytracer_handofdos_r2.c:174:     return (u + 1.0) * 2.328306435454494e-10;
	addl	%edx, %eax	# m_w_lsm.263, tmp120
	vcvtsi2sdq	%rax, %xmm1, %xmm1	# tmp120, tmp119, tmp119
	vaddsd	%xmm3, %xmm1, %xmm1	# tmp136, tmp119, tmp124
	vmulsd	%xmm2, %xmm1, %xmm1	# tmp137, tmp124, tmp126
# Raytracer_handofdos_r2.c:179:     return GetUniform();
	vcvtsd2ss	%xmm1, %xmm1, %xmm1	# tmp126, tmp128
# Raytracer_handofdos_r2.c:406:         res += Random();
	vaddss	%xmm1, %xmm0, %xmm0	# tmp128, res, res
# Raytracer_handofdos_r2.c:404:     for (long int i = cycles; i--;)
	subq	$1, %rsi	#, ivtmp_95
	jne	.L111	#,
	vmovss	%xmm0, 12(%rsp)	# res, %sfp
	movl	%ecx, m_z(%rip)	# m_z_lsm.261, m_z
	movl	%edx, m_w(%rip)	# m_w_lsm.263, m_w
# Raytracer_handofdos_r2.c:409:     printf("Random (%f) times %6.3f secs\n", res, ((float)clock()-clc)/CLOCKS_PER_SEC);
	call	clock@PLT	#
	vxorps	%xmm1, %xmm1, %xmm1	# tmp129
	vxorps	%xmm2, %xmm2, %xmm2	# tmp130
	vmovss	12(%rsp), %xmm0	# %sfp, res
	vcvtsi2ssq	%rax, %xmm1, %xmm1	# _2, tmp129, tmp129
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:104:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movl	$1, %edi	#,
	movl	$2, %eax	#,
# Raytracer_handofdos_r2.c:409:     printf("Random (%f) times %6.3f secs\n", res, ((float)clock()-clc)/CLOCKS_PER_SEC);
	vcvtsi2ssq	%rbx, %xmm2, %xmm2	# clc, tmp130, tmp130
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:104:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC43(%rip), %rsi	#,
# Raytracer_handofdos_r2.c:409:     printf("Random (%f) times %6.3f secs\n", res, ((float)clock()-clc)/CLOCKS_PER_SEC);
	vcvtss2sd	%xmm0, %xmm0, %xmm0	# res, tmp135
	vsubss	%xmm2, %xmm1, %xmm1	# tmp130, tmp129, tmp131
	vmulss	.LC29(%rip), %xmm1, %xmm1	#, tmp131, tmp132
# Raytracer_handofdos_r2.c:410: }
	addq	$16, %rsp	#,
	.cfi_def_cfa_offset 16
	popq	%rbx	#
	.cfi_def_cfa_offset 8
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:104:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	vcvtss2sd	%xmm1, %xmm1, %xmm1	# tmp132,
	jmp	__printf_chk@PLT	#
	.cfi_endproc
.LFE602:
	.size	bench_opRand, .-bench_opRand
	.p2align 4,,15
	.globl	benchOps
	.type	benchOps, @function
benchOps:
.LFB603:
	.cfi_startproc
	pushq	%r13	#
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	leaq	16(%rsp), %r13	#,
	.cfi_def_cfa 13, 0
	andq	$-32, %rsp	#,
	pushq	-8(%r13)	#
	pushq	%rbp	#
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp	#,
	pushq	%r13	#
	.cfi_escape 0xf,0x3,0x76,0x78,0x6
	pushq	%rbx	#
	subq	$96, %rsp	#,
	.cfi_escape 0x10,0x3,0x2,0x76,0x70
# Raytracer_handofdos_r2.c:333:     clock_t clc = clock();
	call	clock@PLT	#
	movq	%rax, %rbx	#, clc
# Raytracer_handofdos_r2.c:340:     printf("opAdd (%f) times %6.3f secs\n", r.x, ((float)clock()-clc)/CLOCKS_PER_SEC);
	call	clock@PLT	#
	vxorps	%xmm1, %xmm1, %xmm1	# tmp182
	vxorps	%xmm0, %xmm0, %xmm0	# tmp183
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:104:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC31(%rip), %rsi	#,
# Raytracer_handofdos_r2.c:340:     printf("opAdd (%f) times %6.3f secs\n", r.x, ((float)clock()-clc)/CLOCKS_PER_SEC);
	vcvtsi2ssq	%rbx, %xmm0, %xmm0	# clc, tmp183, tmp183
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:104:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movl	$1, %edi	#,
# Raytracer_handofdos_r2.c:340:     printf("opAdd (%f) times %6.3f secs\n", r.x, ((float)clock()-clc)/CLOCKS_PER_SEC);
	vcvtsi2ssq	%rax, %xmm1, %xmm1	# _88, tmp182, tmp182
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:104:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movl	$2, %eax	#,
# Raytracer_handofdos_r2.c:340:     printf("opAdd (%f) times %6.3f secs\n", r.x, ((float)clock()-clc)/CLOCKS_PER_SEC);
	vsubss	%xmm0, %xmm1, %xmm1	# tmp183, tmp182, tmp184
	vmulss	.LC29(%rip), %xmm1, %xmm1	#, tmp184, tmp185
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:104:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	vmovsd	.LC30(%rip), %xmm0	#,
	vcvtss2sd	%xmm1, %xmm1, %xmm1	# tmp185,
	call	__printf_chk@PLT	#
# Raytracer_handofdos_r2.c:346:     clock_t clc = clock();
	call	clock@PLT	#
	vmovaps	.LC32(%rip), %ymm0	#, vect__72.289
	vmovaps	.LC33(%rip), %ymm1	#, tmp270
	movq	%rax, %rbx	#, clc
	xorl	%eax, %eax	# ivtmp.321
	.p2align 4,,10
	.p2align 3
.L115:
# Raytracer_handofdos_r2.c:49: 	me->x *= r;
	vmulps	%ymm1, %ymm0, %ymm0	# tmp270, vect__72.289, vect__72.289
	addl	$1, %eax	#, ivtmp.321
	cmpl	$268435455, %eax	#, ivtmp.321
	jne	.L115	#,
	vxorps	%xmm1, %xmm1, %xmm1	# tmp190
	vperm2f128	$33, %ymm1, %ymm0, %ymm2	#, tmp190, vect__72.289, vect__72.291
	vmulps	%ymm0, %ymm2, %ymm2	# vect__72.289, vect__72.291, vect__72.291
	vperm2f128	$33, %ymm1, %ymm2, %ymm0	#, tmp190, vect__72.291, tmp192
	vshufps	$78, %ymm0, %ymm2, %ymm0	#, tmp192, vect__72.291, vect__72.291
	vmulps	%ymm2, %ymm0, %ymm0	# vect__72.291, vect__72.291, vect__72.291
	vperm2f128	$33, %ymm1, %ymm0, %ymm1	#, tmp190, vect__72.291, tmp194
	vmovaps	%ymm0, -80(%rbp)	# vect__72.291, %sfp
	vpalignr	$4, %ymm0, %ymm1, %ymm6	#, vect__72.291, tmp194, tmp195
	vmovdqa	%ymm6, -48(%rbp)	# tmp195, %sfp
# Raytracer_handofdos_r2.c:353:     printf("opMul (%f) times %6.3f secs\n", a.x, ((float)clock()-clc)/CLOCKS_PER_SEC);
	vzeroupper
	call	clock@PLT	#
	vxorps	%xmm1, %xmm1, %xmm1	# tmp196
	vxorps	%xmm2, %xmm2, %xmm2	# tmp197
# Raytracer_handofdos_r2.c:49: 	me->x *= r;
	vmovaps	-80(%rbp), %ymm0	# %sfp, vect__72.291
# Raytracer_handofdos_r2.c:353:     printf("opMul (%f) times %6.3f secs\n", a.x, ((float)clock()-clc)/CLOCKS_PER_SEC);
	vcvtsi2ssq	%rax, %xmm1, %xmm1	# _75, tmp196, tmp196
# Raytracer_handofdos_r2.c:49: 	me->x *= r;
	vmulps	-48(%rbp), %ymm0, %ymm0	# %sfp, vect__72.291, vect__72.291
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:104:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC35(%rip), %rsi	#,
	movl	$1, %edi	#,
# Raytracer_handofdos_r2.c:353:     printf("opMul (%f) times %6.3f secs\n", a.x, ((float)clock()-clc)/CLOCKS_PER_SEC);
	vcvtsi2ssq	%rbx, %xmm2, %xmm2	# clc, tmp197, tmp197
# Raytracer_handofdos_r2.c:49: 	me->x *= r;
	vmulss	.LC34(%rip), %xmm0, %xmm0	#, stmp__72.290, tmp205
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:104:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movl	$2, %eax	#,
# Raytracer_handofdos_r2.c:353:     printf("opMul (%f) times %6.3f secs\n", a.x, ((float)clock()-clc)/CLOCKS_PER_SEC);
	vsubss	%xmm2, %xmm1, %xmm1	# tmp197, tmp196, tmp198
	vmulss	.LC29(%rip), %xmm1, %xmm1	#, tmp198, tmp199
	vcvtss2sd	%xmm0, %xmm0, %xmm0	# tmp205, tmp207
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:104:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	vcvtss2sd	%xmm1, %xmm1, %xmm1	# tmp199,
	vzeroupper
	call	__printf_chk@PLT	#
# Raytracer_handofdos_r2.c:360:     clock_t clc = clock();
	call	clock@PLT	#
	movq	%rax, %rbx	#, clc
# Raytracer_handofdos_r2.c:368:     printf("opNorm (%f) times %6.3f secs\n", res, ((float)clock()-clc)/CLOCKS_PER_SEC);
	call	clock@PLT	#
	vxorps	%xmm1, %xmm1, %xmm1	# tmp208
	vxorps	%xmm0, %xmm0, %xmm0	# tmp209
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:104:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC37(%rip), %rsi	#,
# Raytracer_handofdos_r2.c:368:     printf("opNorm (%f) times %6.3f secs\n", res, ((float)clock()-clc)/CLOCKS_PER_SEC);
	vcvtsi2ssq	%rbx, %xmm0, %xmm0	# clc, tmp209, tmp209
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:104:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movl	$1, %edi	#,
# Raytracer_handofdos_r2.c:368:     printf("opNorm (%f) times %6.3f secs\n", res, ((float)clock()-clc)/CLOCKS_PER_SEC);
	vcvtsi2ssq	%rax, %xmm1, %xmm1	# _62, tmp208, tmp208
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:104:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movl	$2, %eax	#,
# Raytracer_handofdos_r2.c:368:     printf("opNorm (%f) times %6.3f secs\n", res, ((float)clock()-clc)/CLOCKS_PER_SEC);
	vsubss	%xmm0, %xmm1, %xmm1	# tmp209, tmp208, tmp210
	vmulss	.LC29(%rip), %xmm1, %xmm1	#, tmp210, tmp211
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:104:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	vmovsd	.LC36(%rip), %xmm0	#,
	vcvtss2sd	%xmm1, %xmm1, %xmm1	# tmp211,
	call	__printf_chk@PLT	#
# Raytracer_handofdos_r2.c:375:     clock_t clc = clock();
	call	clock@PLT	#
# Raytracer_handofdos_r2.c:374:     Vector r = a;
	vmovss	.LC39(%rip), %xmm2	#, tmp272
	vmovss	.LC38(%rip), %xmm4	#, tmp271
	vmovss	.LC12(%rip), %xmm3	#, tmp273
# Raytracer_handofdos_r2.c:375:     clock_t clc = clock();
	movq	%rax, %rbx	#, clc
	movl	$2147483647, %eax	#, ivtmp_282
# Raytracer_handofdos_r2.c:374:     Vector r = a;
	vmovaps	%xmm2, %xmm0	# tmp272, r$D7143$x
	vmovaps	%xmm4, %xmm7	# tmp271, newz
	vmovaps	%xmm3, %xmm1	# tmp273, r$D7143$y
	.p2align 4,,10
	.p2align 3
.L116:
# Raytracer_handofdos_r2.c:99: 	newx = me->y * r->z - me->z * r->y;
	vmulss	%xmm3, %xmm7, %xmm5	# tmp273, newz, tmp215
# Raytracer_handofdos_r2.c:100: 	newy = me->z * r->x - me->x * r->z;
	vmulss	%xmm4, %xmm0, %xmm6	# tmp271, r$D7143$x, tmp218
# Raytracer_handofdos_r2.c:99: 	newx = me->y * r->z - me->z * r->y;
	vfmsub231ss	%xmm4, %xmm1, %xmm5	# tmp271, r$D7143$y, newx
# Raytracer_handofdos_r2.c:101: 	newz = me->x * r->y - me->y * r->x;
	vmulss	%xmm2, %xmm1, %xmm1	# tmp272, r$D7143$y, tmp221
# Raytracer_handofdos_r2.c:100: 	newy = me->z * r->x - me->x * r->z;
	vfmsub231ss	%xmm2, %xmm7, %xmm6	# tmp272, newz, newy
# Raytracer_handofdos_r2.c:101: 	newz = me->x * r->y - me->y * r->x;
	vmovaps	%xmm0, %xmm7	# r$D7143$x, r$D7143$x
# Raytracer_handofdos_r2.c:99: 	newx = me->y * r->z - me->z * r->y;
	vmovaps	%xmm5, %xmm0	# newx, r$D7143$x
# Raytracer_handofdos_r2.c:101: 	newz = me->x * r->y - me->y * r->x;
	vfmsub132ss	%xmm3, %xmm1, %xmm7	# tmp273, tmp221, r$D7143$x
# Raytracer_handofdos_r2.c:104: 	me->y = newy;
	vmovaps	%xmm6, %xmm1	# newy, r$D7143$y
# Raytracer_handofdos_r2.c:377:     for (long int i = cycles; i--;)
	subq	$1, %rax	#, ivtmp_282
	jne	.L116	#,
	vmovss	%xmm3, -88(%rbp)	# tmp273, %sfp
	vmovss	%xmm2, -84(%rbp)	# tmp272, %sfp
	vmovss	%xmm4, -80(%rbp)	# tmp271, %sfp
	vmovss	%xmm5, -48(%rbp)	# r$D7143$x, %sfp
# Raytracer_handofdos_r2.c:382:     printf("opCross (%f) times %6.3f secs\n", r.x, ((float)clock()-clc)/CLOCKS_PER_SEC);
	call	clock@PLT	#
	vxorps	%xmm1, %xmm1, %xmm1	# tmp224
	vxorps	%xmm5, %xmm5, %xmm5	# tmp225
	vmovss	-48(%rbp), %xmm0	# %sfp, r$D7143$x
	vcvtsi2ssq	%rbx, %xmm5, %xmm5	# clc, tmp225, tmp225
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:104:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC40(%rip), %rsi	#,
	movl	$1, %edi	#,
# Raytracer_handofdos_r2.c:382:     printf("opCross (%f) times %6.3f secs\n", r.x, ((float)clock()-clc)/CLOCKS_PER_SEC);
	vcvtsi2ssq	%rax, %xmm1, %xmm1	# _49, tmp224, tmp224
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:104:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movl	$2, %eax	#,
# Raytracer_handofdos_r2.c:382:     printf("opCross (%f) times %6.3f secs\n", r.x, ((float)clock()-clc)/CLOCKS_PER_SEC);
	vcvtss2sd	%xmm0, %xmm0, %xmm0	# r$D7143$x, tmp230
	vsubss	%xmm5, %xmm1, %xmm1	# tmp225, tmp224, tmp226
	vmulss	.LC29(%rip), %xmm1, %xmm1	#, tmp226, tmp227
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:104:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	vcvtss2sd	%xmm1, %xmm1, %xmm1	# tmp227,
	call	__printf_chk@PLT	#
# Raytracer_handofdos_r2.c:388:     clock_t clc = clock();
	call	clock@PLT	#
# Raytracer_handofdos_r2.c:387:     Vector a = {.x=.1, .y = .2, .z = .3};
	vmovss	-84(%rbp), %xmm2	# %sfp, tmp272
	vmovss	-80(%rbp), %xmm4	# %sfp, tmp271
# Raytracer_handofdos_r2.c:388:     clock_t clc = clock();
	movq	%rax, %rbx	#, clc
	vmovsd	.LC41(%rip), %xmm1	#, _254
	movl	$2147483647, %eax	#, ivtmp_170
# Raytracer_handofdos_r2.c:387:     Vector a = {.x=.1, .y = .2, .z = .3};
	vmovss	-88(%rbp), %xmm3	# %sfp, tmp273
	vmovaps	%xmm2, %xmm0	# tmp272, a$D7143$x
	vmovsd	.LC0(%rip), %xmm2	#, tmp274
	jmp	.L118	#
	.p2align 4,,10
	.p2align 3
.L126:
	vmulss	%xmm0, %xmm0, %xmm1	# a$D7143$x, a$D7143$x, tmp233
	vfmadd231ss	%xmm4, %xmm4, %xmm1	# a$D7143$z, a$D7143$z, tmp234
	vfmadd231ss	%xmm3, %xmm3, %xmm1	# a$D7143$y, a$D7143$y, tmp235
	vcvtss2sd	%xmm1, %xmm1, %xmm1	# tmp235, tmp236
	vsqrtsd	%xmm1, %xmm1, %xmm1	# tmp236, _254
.L118:
# Raytracer_handofdos_r2.c:132: 	return opMul(me, 1 / sqrt(opNormC_single(me)));
	vdivsd	%xmm1, %xmm2, %xmm1	# _254, tmp274, tmp231
	vcvtsd2ss	%xmm1, %xmm1, %xmm1	# tmp231, _107
# Raytracer_handofdos_r2.c:49: 	me->x *= r;
	vmulss	%xmm1, %xmm0, %xmm0	# _107, a$D7143$x, a$D7143$x
# Raytracer_handofdos_r2.c:50: 	me->y *= r;
	vmulss	%xmm1, %xmm3, %xmm3	# _107, a$D7143$y, a$D7143$y
# Raytracer_handofdos_r2.c:51: 	me->z *= r;
	vmulss	%xmm1, %xmm4, %xmm4	# _107, a$D7143$z, a$D7143$z
# Raytracer_handofdos_r2.c:390:     for (long int i = cycles; i--;)
	subq	$1, %rax	#, ivtmp_170
	jne	.L126	#,
	vmovsd	%xmm2, -80(%rbp)	# tmp274, %sfp
	vmovss	%xmm0, -48(%rbp)	# a$D7143$x, %sfp
# Raytracer_handofdos_r2.c:395:     printf("opNot (%f) times %6.3f secs\n", a.x, ((float)clock()-clc)/CLOCKS_PER_SEC);
	call	clock@PLT	#
	vxorps	%xmm1, %xmm1, %xmm1	# tmp237
	vxorps	%xmm3, %xmm3, %xmm3	# tmp238
	vmovss	-48(%rbp), %xmm0	# %sfp, a$D7143$x
	vcvtsi2ssq	%rbx, %xmm3, %xmm3	# clc, tmp238, tmp238
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:104:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC42(%rip), %rsi	#,
	movl	$1, %edi	#,
# Raytracer_handofdos_r2.c:395:     printf("opNot (%f) times %6.3f secs\n", a.x, ((float)clock()-clc)/CLOCKS_PER_SEC);
	vcvtsi2ssq	%rax, %xmm1, %xmm1	# _26, tmp237, tmp237
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:104:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movl	$2, %eax	#,
# Raytracer_handofdos_r2.c:395:     printf("opNot (%f) times %6.3f secs\n", a.x, ((float)clock()-clc)/CLOCKS_PER_SEC);
	vcvtss2sd	%xmm0, %xmm0, %xmm0	# a$D7143$x, tmp243
	vsubss	%xmm3, %xmm1, %xmm1	# tmp238, tmp237, tmp239
	vmulss	.LC29(%rip), %xmm1, %xmm1	#, tmp239, tmp240
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:104:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	vcvtss2sd	%xmm1, %xmm1, %xmm1	# tmp240,
	call	__printf_chk@PLT	#
# Raytracer_handofdos_r2.c:401:     clock_t clc = clock();
	call	clock@PLT	#
	movl	m_z(%rip), %ecx	# m_z, m_z_lsm.275
	movl	m_w(%rip), %edx	# m_w, m_w_lsm.277
	movl	$2147483647, %esi	#, ivtmp_162
	vmovsd	.LC2(%rip), %xmm3	#, tmp275
	vmovsd	-80(%rbp), %xmm2	# %sfp, tmp274
	movq	%rax, %rbx	#, clc
# Raytracer_handofdos_r2.c:402:     float res = 0;
	vxorps	%xmm0, %xmm0, %xmm0	# res
	.p2align 4,,10
	.p2align 3
.L121:
# Raytracer_handofdos_r2.c:163:     m_z = 36969 * (m_z & 65535) + (m_z >> 16);
	movzwl	%cx, %eax	# m_z_lsm.275, m_z_lsm.275
	shrl	$16, %ecx	#, tmp246
# Raytracer_handofdos_r2.c:174:     return (u + 1.0) * 2.328306435454494e-10;
	vxorpd	%xmm1, %xmm1, %xmm1	# tmp252
# Raytracer_handofdos_r2.c:163:     m_z = 36969 * (m_z & 65535) + (m_z >> 16);
	imull	$36969, %eax, %eax	#, m_z_lsm.275, tmp245
	addl	%eax, %ecx	# tmp245, m_z_lsm.275
# Raytracer_handofdos_r2.c:164:     m_w = 18000 * (m_w & 65535) + (m_w >> 16);
	movzwl	%dx, %eax	# m_w_lsm.277, m_w_lsm.277
	shrl	$16, %edx	#, tmp249
	imull	$18000, %eax, %eax	#, m_w_lsm.277, tmp248
	addl	%eax, %edx	# tmp248, m_w_lsm.277
# Raytracer_handofdos_r2.c:165:     return (m_z << 16) + m_w;
	movl	%ecx, %eax	# m_z_lsm.275, tmp250
	sall	$16, %eax	#, tmp250
# Raytracer_handofdos_r2.c:174:     return (u + 1.0) * 2.328306435454494e-10;
	addl	%edx, %eax	# m_w_lsm.277, tmp253
	vcvtsi2sdq	%rax, %xmm1, %xmm1	# tmp253, tmp252, tmp252
	vaddsd	%xmm2, %xmm1, %xmm1	# tmp274, tmp252, tmp257
	vmulsd	%xmm3, %xmm1, %xmm1	# tmp275, tmp257, tmp259
# Raytracer_handofdos_r2.c:179:     return GetUniform();
	vcvtsd2ss	%xmm1, %xmm1, %xmm1	# tmp259, tmp261
# Raytracer_handofdos_r2.c:406:         res += Random();
	vaddss	%xmm1, %xmm0, %xmm0	# tmp261, res, res
# Raytracer_handofdos_r2.c:404:     for (long int i = cycles; i--;)
	subq	$1, %rsi	#, ivtmp_162
	jne	.L121	#,
	vmovss	%xmm0, -48(%rbp)	# res, %sfp
	movl	%ecx, m_z(%rip)	# m_z_lsm.275, m_z
	movl	%edx, m_w(%rip)	# m_w_lsm.277, m_w
# Raytracer_handofdos_r2.c:409:     printf("Random (%f) times %6.3f secs\n", res, ((float)clock()-clc)/CLOCKS_PER_SEC);
	call	clock@PLT	#
	vxorps	%xmm1, %xmm1, %xmm1	# tmp262
	vxorps	%xmm2, %xmm2, %xmm2	# tmp263
	vmovss	-48(%rbp), %xmm0	# %sfp, res
	vcvtsi2ssq	%rax, %xmm1, %xmm1	# _15, tmp262, tmp262
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:104:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movl	$1, %edi	#,
	movl	$2, %eax	#,
# Raytracer_handofdos_r2.c:409:     printf("Random (%f) times %6.3f secs\n", res, ((float)clock()-clc)/CLOCKS_PER_SEC);
	vcvtsi2ssq	%rbx, %xmm2, %xmm2	# clc, tmp263, tmp263
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:104:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC43(%rip), %rsi	#,
# Raytracer_handofdos_r2.c:409:     printf("Random (%f) times %6.3f secs\n", res, ((float)clock()-clc)/CLOCKS_PER_SEC);
	vcvtss2sd	%xmm0, %xmm0, %xmm0	# res, tmp268
	vsubss	%xmm2, %xmm1, %xmm1	# tmp263, tmp262, tmp264
	vmulss	.LC29(%rip), %xmm1, %xmm1	#, tmp264, tmp265
# Raytracer_handofdos_r2.c:422: }
	addq	$96, %rsp	#,
	popq	%rbx	#
	popq	%r13	#
	.cfi_def_cfa 13, 0
	popq	%rbp	#
	leaq	-16(%r13), %rsp	#,
	.cfi_def_cfa 7, 16
	popq	%r13	#
	.cfi_def_cfa_offset 8
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:104:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	vcvtss2sd	%xmm1, %xmm1, %xmm1	# tmp265,
	jmp	__printf_chk@PLT	#
	.cfi_endproc
.LFE603:
	.size	benchOps, .-benchOps
	.globl	cycles
	.section	.rodata
	.align 8
	.type	cycles, @object
	.size	cycles, 8
cycles:
	.quad	2147483647
	.data
	.align 4
	.type	m_w, @object
	.size	m_w, 4
m_w:
	.long	888
	.align 4
	.type	m_z, @object
	.size	m_z, 4
m_z:
	.long	333
	.globl	G
	.align 32
	.type	G, @object
	.size	G, 36
G:
	.long	247570
	.long	280596
	.long	280600
	.long	249748
	.long	18578
	.long	18577
	.long	231184
	.long	16
	.long	16
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	0
	.long	1072693248
	.section	.rodata.cst4,"aM",@progbits,4
	.align 4
.LC1:
	.long	1065353216
	.section	.rodata.cst8
	.align 8
.LC2:
	.long	4290772992
	.long	1039138815
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC4:
	.long	2147483648
	.long	0
	.long	0
	.long	0
	.section	.rodata.cst8
	.align 8
.LC5:
	.long	1202590843
	.long	1065646817
	.section	.rodata.cst4
	.align 4
.LC7:
	.long	1060320051
	.align 4
.LC8:
	.long	1058642330
	.align 4
.LC9:
	.long	1091567616
	.align 4
.LC10:
	.long	1098907648
	.align 4
.LC11:
	.long	3221225472
	.align 4
.LC12:
	.long	1045220557
	.section	.rodata.cst8
	.align 8
.LC13:
	.long	2576980378
	.long	1070176665
	.align 8
.LC14:
	.long	2576980378
	.long	1069128089
	.section	.rodata.cst4
	.align 4
.LC15:
	.long	1077936128
	.align 4
.LC16:
	.long	1056964608
	.align 4
.LC17:
	.long	1095761920
	.align 4
.LC21:
	.long	990057071
	.align 4
.LC22:
	.long	3279945728
	.section	.rodata.cst8
	.align 8
.LC23:
	.long	0
	.long	1071644672
	.align 8
.LC24:
	.long	0
	.long	1079558144
	.section	.rodata.cst4
	.align 4
.LC25:
	.long	1099431936
	.align 4
.LC26:
	.long	1090519040
	.align 4
.LC27:
	.long	1080033280
	.align 4
.LC29:
	.long	897988541
	.section	.rodata.cst8
	.align 8
.LC30:
	.long	2684354560
	.long	1101633945
	.section	.rodata.cst32,"aM",@progbits,32
	.align 32
.LC32:
	.long	1065353216
	.long	1065353216
	.long	1065353216
	.long	1065353216
	.long	1065353216
	.long	1065353216
	.long	1065353216
	.long	1065353216
	.align 32
.LC33:
	.long	1065353224
	.long	1065353224
	.long	1065353224
	.long	1065353224
	.long	1065353224
	.long	1065353224
	.long	1065353224
	.long	1065353224
	.section	.rodata.cst4
	.align 4
.LC34:
	.long	1066192140
	.section	.rodata.cst8
	.align 8
.LC36:
	.long	1073741824
	.long	1102179205
	.section	.rodata.cst4
	.align 4
.LC38:
	.long	1050253722
	.align 4
.LC39:
	.long	1036831949
	.section	.rodata.cst8
	.align 8
.LC41:
	.long	4042669966
	.long	1071116884
	.ident	"GCC: (Ubuntu 7.3.0-16ubuntu3) 7.3.0"
	.section	.note.GNU-stack,"",@progbits
