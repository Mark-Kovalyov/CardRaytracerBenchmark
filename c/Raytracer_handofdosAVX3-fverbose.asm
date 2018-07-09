	.file	"Raytracer_handofdos_r3experimental.c"
# GNU C11 (Ubuntu 7.3.0-16ubuntu3) version 7.3.0 (x86_64-linux-gnu)
#	compiled by GNU C version 7.3.0, GMP version 6.1.2, MPFR version 4.0.1, MPC version 1.1.0, isl version isl-0.19-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  -imultiarch x86_64-linux-gnu -D AVX_VERSION
# Raytracer_handofdos_r3experimental.c -march=broadwell -mmmx -mno-3dnow
# -msse -msse2 -msse3 -mssse3 -mno-sse4a -mcx16 -msahf -mmovbe -maes
# -mno-sha -mpclmul -mpopcnt -mabm -mno-lwp -mfma -mno-fma4 -mno-xop -mbmi
# -mno-sgx -mbmi2 -mno-tbm -mavx -mavx2 -msse4.1 -mlzcnt -mno-rtm -mno-hle
# -mrdrnd -mf16c -mfsgsbase -mrdseed -mprfchw -madx -mfxsr -mxsave
# -mxsaveopt -mno-avx512f -mno-avx512er -mno-avx512cd -mno-avx512pf
# -mno-prefetchwt1 -mno-clflushopt -mno-xsavec -mno-xsaves -mno-avx512dq
# -mno-avx512bw -mno-avx512vl -mno-avx512ifma -mno-avx512vbmi
# -mno-avx5124fmaps -mno-avx5124vnniw -mno-clwb -mno-mwaitx -mno-clzero
# -mno-pku -mno-rdpid --param l1-cache-size=32
# --param l1-cache-line-size=64 --param l2-cache-size=3072 -mtune=broadwell
# -m64 -msse4.2 -auxbase-strip Raytracer_handofdosAVX3-fverbose.asm -O3
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
	.globl	hsum_ps_SSE1
	.type	hsum_ps_SSE1, @function
hsum_ps_SSE1:
.LFB578:
	.cfi_startproc
# /usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h:746:   return (__m128) __builtin_ia32_shufps ((__v4sf)__A, (__v4sf)__B, __mask);
	vshufps	$177, %xmm0, %xmm0, %xmm1	#, v, v, tmp93
# /usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h:186:   return (__m128) ((__v4sf)__A + (__v4sf)__B);
	vaddps	%xmm1, %xmm0, %xmm0	# tmp93, v, _4
# /usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h:787:   return (__m128) __builtin_ia32_movhlps ((__v4sf)__A, (__v4sf)__B);
	vmovhlps	%xmm0, %xmm1, %xmm1	# _4, tmp93, tmp96
# /usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h:130:   return (__m128) __builtin_ia32_addss ((__v4sf)__A, (__v4sf)__B);
	vaddss	%xmm1, %xmm0, %xmm0	# tmp96, _4, tmp97
# Raytracer_handofdos_r3experimental.c:44: }
	ret
	.cfi_endproc
.LFE578:
	.size	hsum_ps_SSE1, .-hsum_ps_SSE1
	.p2align 4,,15
	.globl	hsum_ps_SSE3
	.type	hsum_ps_SSE3, @function
hsum_ps_SSE3:
.LFB579:
	.cfi_startproc
# /usr/lib/gcc/x86_64-linux-gnu/7/include/pmmintrin.h:58:   return (__m128) __builtin_ia32_haddps ((__v4sf)__X, (__v4sf)__Y);
	vhaddps	%xmm0, %xmm0, %xmm0	# xx, xx, tmp91
	vhaddps	%xmm0, %xmm0, %xmm0	# tmp91, tmp91, tmp92
# Raytracer_handofdos_r3experimental.c:53: }
	ret
	.cfi_endproc
.LFE579:
	.size	hsum_ps_SSE3, .-hsum_ps_SSE3
	.p2align 4,,15
	.globl	opNormSSE
	.type	opNormSSE, @function
opNormSSE:
.LFB580:
	.cfi_startproc
# Raytracer_handofdos_r3experimental.c:57: 	return hsum_ps_SSE3(me*r);
	vmulps	%xmm1, %xmm0, %xmm1	# r, me, _1
# /usr/lib/gcc/x86_64-linux-gnu/7/include/pmmintrin.h:58:   return (__m128) __builtin_ia32_haddps ((__v4sf)__X, (__v4sf)__Y);
	vhaddps	%xmm1, %xmm1, %xmm1	# _1, _1, tmp93
	vhaddps	%xmm1, %xmm1, %xmm1	# tmp93, tmp93, tmp94
# /usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h:969:   return ((__v4sf)__A)[0];
	vmovaps	%xmm1, %xmm0	# tmp94, tmp95
# Raytracer_handofdos_r3experimental.c:58: }
	ret
	.cfi_endproc
.LFE580:
	.size	opNormSSE, .-opNormSSE
	.p2align 4,,15
	.globl	opNormSSE_single
	.type	opNormSSE_single, @function
opNormSSE_single:
.LFB581:
	.cfi_startproc
# Raytracer_handofdos_r3experimental.c:61: 	return hsum_ps_SSE3(me*me);
	vmulps	%xmm0, %xmm0, %xmm0	# me, me, _1
# /usr/lib/gcc/x86_64-linux-gnu/7/include/pmmintrin.h:58:   return (__m128) __builtin_ia32_haddps ((__v4sf)__X, (__v4sf)__Y);
	vhaddps	%xmm0, %xmm0, %xmm0	# _1, _1, tmp92
	vhaddps	%xmm0, %xmm0, %xmm0	# tmp92, tmp92, tmp93
# Raytracer_handofdos_r3experimental.c:62: }
	ret
	.cfi_endproc
.LFE581:
	.size	opNormSSE_single, .-opNormSSE_single
	.p2align 4,,15
	.globl	opNormC
	.type	opNormC, @function
opNormC:
.LFB582:
	.cfi_startproc
# Raytracer_handofdos_r3experimental.c:68: 		return vme.x * vr.x + vme.y * vr.y + vme.z * vr.z
	vshufps	$85, %xmm1, %xmm1, %xmm4	#, r, r, tmp105
	vshufps	$85, %xmm0, %xmm0, %xmm2	#, me, me, tmp104
	vmulss	%xmm4, %xmm2, %xmm2	# tmp105, tmp104, tmp106
# Raytracer_handofdos_r3experimental.c:70: 		 + vme.zz * vr.zz
	vmovaps	%xmm0, %xmm3	# me, tmp103
	vunpckhps	%xmm0, %xmm0, %xmm4	# me, me, tmp109
	vfmadd132ss	%xmm1, %xmm2, %xmm3	# tmp107, tmp106, tmp108
	vshufps	$255, %xmm0, %xmm0, %xmm2	#, me, me, tmp110
	vshufps	$255, %xmm1, %xmm1, %xmm0	#, r, r, tmp111
	vunpckhps	%xmm1, %xmm1, %xmm1	# r, r, tmp113
	vmulss	%xmm0, %xmm2, %xmm2	# tmp111, tmp110, tmp112
	vfmadd132ss	%xmm4, %xmm2, %xmm1	# tmp109, tmp112, tmp114
	vaddss	%xmm1, %xmm3, %xmm0	# tmp114, tmp108, tmp102
# Raytracer_handofdos_r3experimental.c:73: }
	ret
	.cfi_endproc
.LFE582:
	.size	opNormC, .-opNormC
	.p2align 4,,15
	.globl	opCrossSSE
	.type	opCrossSSE, @function
opCrossSSE:
.LFB583:
	.cfi_startproc
# /usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h:746:   return (__m128) __builtin_ia32_shufps ((__v4sf)__A, (__v4sf)__B, __mask);
	vshufps	$201, %xmm0, %xmm0, %xmm2	#, me, me, tmp96
	vshufps	$210, %xmm1, %xmm1, %xmm3	#, r, r, tmp99
	vshufps	$210, %xmm0, %xmm0, %xmm0	#, me, me, tmp102
	vshufps	$201, %xmm1, %xmm1, %xmm1	#, r, r, tmp105
# Raytracer_handofdos_r3experimental.c:85:     shuf_me2 *= shuf_r2;
	vmulps	%xmm1, %xmm0, %xmm0	# tmp105, tmp102, shuf_me2
# Raytracer_handofdos_r3experimental.c:87: 	return shuf_me1 - shuf_me2;
	vfmsub231ps	%xmm3, %xmm2, %xmm0	# tmp99, tmp96, tmp108
# Raytracer_handofdos_r3experimental.c:88: }
	ret
	.cfi_endproc
.LFE583:
	.size	opCrossSSE, .-opCrossSSE
	.p2align 4,,15
	.globl	opNotSSE
	.type	opNotSSE, @function
opNotSSE:
.LFB584:
	.cfi_startproc
# Raytracer_handofdos_r3experimental.c:61: 	return hsum_ps_SSE3(me*me);
	vmulps	%xmm0, %xmm0, %xmm1	# me, me, _4
# /usr/lib/gcc/x86_64-linux-gnu/7/include/pmmintrin.h:58:   return (__m128) __builtin_ia32_haddps ((__v4sf)__X, (__v4sf)__Y);
	vhaddps	%xmm1, %xmm1, %xmm1	# _4, _4, tmp95
	vhaddps	%xmm1, %xmm1, %xmm1	# tmp95, tmp95, tmp96
# Raytracer_handofdos_r3experimental.c:102: 	return me * k / sqrtf(opNormSSE_single(me));
	vsqrtss	%xmm1, %xmm1, %xmm1	# tmp97, _5
	vshufps	$0, %xmm1, %xmm1, %xmm1	# _5, tmp99
	vrcpps	%xmm1, %xmm2	# tmp99, tmp100
	vmulps	%xmm1, %xmm2, %xmm1	# tmp99, tmp100, tmp101
	vmulps	%xmm1, %xmm2, %xmm1	# tmp101, tmp100, tmp101
	vaddps	%xmm2, %xmm2, %xmm2	# tmp100, tmp100, tmp102
	vsubps	%xmm1, %xmm2, %xmm1	# tmp101, tmp102, tmp103
	vmulps	%xmm1, %xmm0, %xmm0	# tmp103, me, tmp98
# Raytracer_handofdos_r3experimental.c:105: }
	ret
	.cfi_endproc
.LFE584:
	.size	opNotSSE, .-opNotSSE
	.p2align 4,,15
	.globl	GetUint
	.type	GetUint, @function
GetUint:
.LFB585:
	.cfi_startproc
# Raytracer_handofdos_r3experimental.c:124:     m_z = 36969 * (m_z & 65535) + (m_z >> 16);
	movl	m_z(%rip), %eax	# m_z, m_z.0_1
# Raytracer_handofdos_r3experimental.c:125:     m_w = 18000 * (m_w & 65535) + (m_w >> 16);
	movl	m_w(%rip), %ecx	# m_w, m_w.2_6
# Raytracer_handofdos_r3experimental.c:124:     m_z = 36969 * (m_z & 65535) + (m_z >> 16);
	movzwl	%ax, %edx	# m_z.0_1, m_z.0_1
	shrl	$16, %eax	#, tmp101
	imull	$36969, %edx, %edx	#, m_z.0_1, tmp100
	addl	%eax, %edx	# tmp101, _5
# Raytracer_handofdos_r3experimental.c:125:     m_w = 18000 * (m_w & 65535) + (m_w >> 16);
	movzwl	%cx, %eax	# m_w.2_6, m_w.2_6
	shrl	$16, %ecx	#, tmp104
	imull	$18000, %eax, %eax	#, m_w.2_6, tmp103
# Raytracer_handofdos_r3experimental.c:124:     m_z = 36969 * (m_z & 65535) + (m_z >> 16);
	movl	%edx, m_z(%rip)	# _5, m_z
# Raytracer_handofdos_r3experimental.c:126:     return (m_z << 16) + m_w;
	sall	$16, %edx	#, tmp106
# Raytracer_handofdos_r3experimental.c:125:     m_w = 18000 * (m_w & 65535) + (m_w >> 16);
	addl	%ecx, %eax	# tmp104, _10
	movl	%eax, m_w(%rip)	# _10, m_w
# Raytracer_handofdos_r3experimental.c:126:     return (m_z << 16) + m_w;
	addl	%edx, %eax	# tmp106, tmp105
# Raytracer_handofdos_r3experimental.c:127: }
	ret
	.cfi_endproc
.LFE585:
	.size	GetUint, .-GetUint
	.p2align 4,,15
	.globl	GetUniform
	.type	GetUniform, @function
GetUniform:
.LFB586:
	.cfi_startproc
# Raytracer_handofdos_r3experimental.c:124:     m_z = 36969 * (m_z & 65535) + (m_z >> 16);
	movl	m_z(%rip), %edx	# m_z, m_z.0_5
# Raytracer_handofdos_r3experimental.c:125:     m_w = 18000 * (m_w & 65535) + (m_w >> 16);
	movl	m_w(%rip), %ecx	# m_w, m_w.2_10
# Raytracer_handofdos_r3experimental.c:135:     return (u + 1.0) * 2.328306435454494e-10;
	vxorpd	%xmm0, %xmm0, %xmm0	# tmp111
# Raytracer_handofdos_r3experimental.c:124:     m_z = 36969 * (m_z & 65535) + (m_z >> 16);
	movzwl	%dx, %eax	# m_z.0_5, m_z.0_5
	shrl	$16, %edx	#, tmp104
	imull	$36969, %eax, %eax	#, m_z.0_5, tmp103
	addl	%edx, %eax	# tmp104, _9
# Raytracer_handofdos_r3experimental.c:125:     m_w = 18000 * (m_w & 65535) + (m_w >> 16);
	movzwl	%cx, %edx	# m_w.2_10, m_w.2_10
	shrl	$16, %ecx	#, tmp107
	imull	$18000, %edx, %edx	#, m_w.2_10, tmp106
# Raytracer_handofdos_r3experimental.c:124:     m_z = 36969 * (m_z & 65535) + (m_z >> 16);
	movl	%eax, m_z(%rip)	# _9, m_z
# Raytracer_handofdos_r3experimental.c:126:     return (m_z << 16) + m_w;
	sall	$16, %eax	#, tmp109
# Raytracer_handofdos_r3experimental.c:125:     m_w = 18000 * (m_w & 65535) + (m_w >> 16);
	addl	%ecx, %edx	# tmp107, _14
# Raytracer_handofdos_r3experimental.c:135:     return (u + 1.0) * 2.328306435454494e-10;
	addl	%edx, %eax	# _14, tmp112
# Raytracer_handofdos_r3experimental.c:125:     m_w = 18000 * (m_w & 65535) + (m_w >> 16);
	movl	%edx, m_w(%rip)	# _14, m_w
# Raytracer_handofdos_r3experimental.c:135:     return (u + 1.0) * 2.328306435454494e-10;
	vcvtsi2sdq	%rax, %xmm0, %xmm0	# tmp112, tmp111, tmp111
	vaddsd	.LC0(%rip), %xmm0, %xmm0	#, tmp111, tmp116
	vmulsd	.LC1(%rip), %xmm0, %xmm0	#, tmp116, tmp108
# Raytracer_handofdos_r3experimental.c:136: }
	ret
	.cfi_endproc
.LFE586:
	.size	GetUniform, .-GetUniform
	.p2align 4,,15
	.globl	Random
	.type	Random, @function
Random:
.LFB587:
	.cfi_startproc
# Raytracer_handofdos_r3experimental.c:124:     m_z = 36969 * (m_z & 65535) + (m_z >> 16);
	movl	m_z(%rip), %edx	# m_z, m_z.0_5
# Raytracer_handofdos_r3experimental.c:125:     m_w = 18000 * (m_w & 65535) + (m_w >> 16);
	movl	m_w(%rip), %ecx	# m_w, m_w.2_10
# Raytracer_handofdos_r3experimental.c:135:     return (u + 1.0) * 2.328306435454494e-10;
	vxorpd	%xmm0, %xmm0, %xmm0	# tmp112
# Raytracer_handofdos_r3experimental.c:124:     m_z = 36969 * (m_z & 65535) + (m_z >> 16);
	movzwl	%dx, %eax	# m_z.0_5, m_z.0_5
	shrl	$16, %edx	#, tmp105
	imull	$36969, %eax, %eax	#, m_z.0_5, tmp104
	addl	%edx, %eax	# tmp105, _9
# Raytracer_handofdos_r3experimental.c:125:     m_w = 18000 * (m_w & 65535) + (m_w >> 16);
	movzwl	%cx, %edx	# m_w.2_10, m_w.2_10
	shrl	$16, %ecx	#, tmp108
	imull	$18000, %edx, %edx	#, m_w.2_10, tmp107
# Raytracer_handofdos_r3experimental.c:124:     m_z = 36969 * (m_z & 65535) + (m_z >> 16);
	movl	%eax, m_z(%rip)	# _9, m_z
# Raytracer_handofdos_r3experimental.c:126:     return (m_z << 16) + m_w;
	sall	$16, %eax	#, tmp110
# Raytracer_handofdos_r3experimental.c:125:     m_w = 18000 * (m_w & 65535) + (m_w >> 16);
	addl	%ecx, %edx	# tmp108, _14
# Raytracer_handofdos_r3experimental.c:135:     return (u + 1.0) * 2.328306435454494e-10;
	addl	%edx, %eax	# _14, tmp113
# Raytracer_handofdos_r3experimental.c:125:     m_w = 18000 * (m_w & 65535) + (m_w >> 16);
	movl	%edx, m_w(%rip)	# _14, m_w
# Raytracer_handofdos_r3experimental.c:135:     return (u + 1.0) * 2.328306435454494e-10;
	vcvtsi2sdq	%rax, %xmm0, %xmm0	# tmp113, tmp112, tmp112
	vaddsd	.LC0(%rip), %xmm0, %xmm0	#, tmp112, tmp117
	vmulsd	.LC1(%rip), %xmm0, %xmm0	#, tmp117, tmp119
# Raytracer_handofdos_r3experimental.c:140:     return GetUniform();
	vcvtsd2ss	%xmm0, %xmm0, %xmm0	# tmp119, tmp109
# Raytracer_handofdos_r3experimental.c:141: }
	ret
	.cfi_endproc
.LFE587:
	.size	Random, .-Random
	.p2align 4,,15
	.globl	tracer
	.type	tracer, @function
tracer:
.LFB588:
	.cfi_startproc
	leaq	8(%rsp), %r10	#,
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp	#,
# Raytracer_handofdos_r3experimental.c:153: 	float p = -((Vector)o).z / ((Vector)d).z;
	vunpckhps	%xmm0, %xmm0, %xmm2	# o, o, tmp195
# Raytracer_handofdos_r3experimental.c:150: int tracer(const __m128 o, const __m128 d, float *t, Vector* restrict n) {
	pushq	-8(%r10)	#
# Raytracer_handofdos_r3experimental.c:153: 	float p = -((Vector)o).z / ((Vector)d).z;
	vunpckhps	%xmm1, %xmm1, %xmm3	# d, d, tmp198
# Raytracer_handofdos_r3experimental.c:150: int tracer(const __m128 o, const __m128 d, float *t, Vector* restrict n) {
	pushq	%rbp	#
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp	#,
	pushq	%r12	#
	pushq	%r10	#
	.cfi_escape 0xf,0x3,0x76,0x70,0x6
	.cfi_escape 0x10,0xc,0x2,0x76,0x78
	pushq	%rbx	#
	.cfi_escape 0x10,0x3,0x2,0x76,0x68
# Raytracer_handofdos_r3experimental.c:154: 	if (.01 < p){
	vmovsd	.LC3(%rip), %xmm7	#, tmp257
# Raytracer_handofdos_r3experimental.c:153: 	float p = -((Vector)o).z / ((Vector)d).z;
	vmovss	.LC2(%rip), %xmm6	#, tmp256
	vxorps	%xmm6, %xmm2, %xmm2	# tmp256, tmp195, tmp196
	vdivss	%xmm3, %xmm2, %xmm2	# tmp198, tmp196, p
# Raytracer_handofdos_r3experimental.c:154: 	if (.01 < p){
	vxorpd	%xmm3, %xmm3, %xmm3	# tmp199
	vcvtss2sd	%xmm2, %xmm3, %xmm3	# p, tmp199, tmp199
	vcomisd	%xmm7, %xmm3	# tmp257, tmp199
	jbe	.L37	#,
# Raytracer_handofdos_r3experimental.c:155: 		*t = p;
	vmovss	%xmm2, (%rdi)	# p, *t_37(D)
# Raytracer_handofdos_r3experimental.c:156: 		*n = (Vector){.x=0, .y=0, .z=1};
	vpxor	%xmm2, %xmm2, %xmm2	# tmp270
# Raytracer_handofdos_r3experimental.c:157: 		m = 1;
	movl	$1, %eax	#, <retval>
# Raytracer_handofdos_r3experimental.c:156: 		*n = (Vector){.x=0, .y=0, .z=1};
	vmovaps	%xmm2, (%rsi)	# tmp270, *n_44(D)
	movl	$0x3f800000, 8(%rsi)	#, *n_44(D).D.7144.z
.L19:
# Raytracer_handofdos_r3experimental.c:152: 	int m = 0;
	movl	$-18, %r9d	#, ivtmp.93
	leaq	G(%rip), %r8	#, tmp258
	movl	$1, %ebx	#, tmp254
# Raytracer_handofdos_r3experimental.c:164: 				float c = opNormSSE_single(p.xmm) - 1;
	vmovss	.LC4(%rip), %xmm5	#, tmp262
# Raytracer_handofdos_r3experimental.c:162: 				Vector p = {.x=-k, .y=0, .z=-j - 4};	p.xmm += o;
	movabsq	$-4294967296, %r11	#, tmp259
	movl	$-4, %r10d	#, tmp261
# Raytracer_handofdos_r3experimental.c:167: 				if (q > 0) {
	vxorps	%xmm4, %xmm4, %xmm4	# tmp263
	.p2align 4,,10
	.p2align 3
.L27:
# Raytracer_handofdos_r3experimental.c:162: 				Vector p = {.x=-k, .y=0, .z=-j - 4};	p.xmm += o;
	vxorps	%xmm9, %xmm9, %xmm9	# tmp260
	movl	%r9d, %ecx	# ivtmp.93, tmp253
# Raytracer_handofdos_r3experimental.c:150: int tracer(const __m128 o, const __m128 d, float *t, Vector* restrict n) {
	movl	$8, %edx	#, ivtmp.81
# Raytracer_handofdos_r3experimental.c:162: 				Vector p = {.x=-k, .y=0, .z=-j - 4};	p.xmm += o;
	vcvtsi2ss	%r9d, %xmm9, %xmm9	# ivtmp.93, tmp260, tmp260
	negl	%ecx	# tmp253
	shlx	%ecx, %ebx, %ecx	# tmp253, tmp254, shifttmp_25
	.p2align 4,,10
	.p2align 3
.L25:
# Raytracer_handofdos_r3experimental.c:161: 			if (G[j] & 1 << k) {
	testl	%ecx, (%r8,%rdx,4)	# shifttmp_25, MEM[symbol: G, index: _99, offset: 0B]
	je	.L20	#,
# Raytracer_handofdos_r3experimental.c:162: 				Vector p = {.x=-k, .y=0, .z=-j - 4};	p.xmm += o;
	movq	-96(%rbp), %r12	# %sfp, p
	movl	$0, -72(%rbp)	#,
	movl	%r12d, %r12d	# p, tmp273
	movq	%r12, -96(%rbp)	# tmp273, %sfp
	movq	-88(%rbp), %r12	# %sfp, tmp212
	andq	%r11, %r12	# tmp259, tmp212
	movq	%r12, -88(%rbp)	# tmp212, %sfp
	movl	%r10d, %r12d	# tmp261, tmp221
	vmovdqa	-96(%rbp), %xmm3	# %sfp, tmp275
	subl	%edx, %r12d	# ivtmp.81, tmp221
	vpinsrd	$3, -72(%rbp), %xmm3, %xmm8	#,, tmp275, tmp217
	vxorps	%xmm3, %xmm3, %xmm3	# tmp224
	vcvtsi2ss	%r12d, %xmm3, %xmm3	# tmp221, tmp224, tmp224
	vmovss	%xmm9, %xmm8, %xmm2	# tmp219, tmp217, tmp220
	vmovd	%xmm3, %r12d	# tmp224, tmp224
	vpinsrd	$2, %r12d, %xmm2, %xmm3	#, tmp224, tmp220, tmp225
	vmovaps	%xmm3, -96(%rbp)	# tmp225, %sfp
	vaddps	%xmm3, %xmm0, %xmm3	# tmp225, o, _13
# Raytracer_handofdos_r3experimental.c:57: 	return hsum_ps_SSE3(me*r);
	vmulps	%xmm1, %xmm3, %xmm2	# d, _13, _65
# /usr/lib/gcc/x86_64-linux-gnu/7/include/pmmintrin.h:58:   return (__m128) __builtin_ia32_haddps ((__v4sf)__X, (__v4sf)__Y);
	vhaddps	%xmm2, %xmm2, %xmm2	# _65, _65, tmp226
	vhaddps	%xmm2, %xmm2, %xmm2	# tmp226, tmp226, tmp227
# /usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h:969:   return ((__v4sf)__A)[0];
	vmovaps	%xmm2, %xmm8	# tmp227, _68
# Raytracer_handofdos_r3experimental.c:61: 	return hsum_ps_SSE3(me*me);
	vmulps	%xmm3, %xmm3, %xmm2	# _13, _13, _61
# /usr/lib/gcc/x86_64-linux-gnu/7/include/pmmintrin.h:58:   return (__m128) __builtin_ia32_haddps ((__v4sf)__X, (__v4sf)__Y);
	vhaddps	%xmm2, %xmm2, %xmm2	# _61, _61, tmp228
	vhaddps	%xmm2, %xmm2, %xmm2	# tmp228, tmp228, tmp229
# Raytracer_handofdos_r3experimental.c:164: 				float c = opNormSSE_single(p.xmm) - 1;
	vsubss	%xmm5, %xmm2, %xmm2	# tmp262, tmp230, c
# Raytracer_handofdos_r3experimental.c:165: 				float q = b * b - c;
	vfmsub231ss	%xmm8, %xmm8, %xmm2	# _68, _68, q
# Raytracer_handofdos_r3experimental.c:167: 				if (q > 0) {
	vcomiss	%xmm4, %xmm2	# tmp263, q
	jbe	.L20	#,
# Raytracer_handofdos_r3experimental.c:168: 					float s = -b - sqrt(q);
	vcvtss2sd	%xmm2, %xmm2, %xmm2	# q, tmp234
	vsqrtsd	%xmm2, %xmm2, %xmm2	# tmp234, _18
	vxorps	%xmm6, %xmm8, %xmm8	# tmp256, _68, tmp235
	vcvtss2sd	%xmm8, %xmm8, %xmm8	# tmp235, tmp237
	vsubsd	%xmm2, %xmm8, %xmm2	# _18, tmp237, tmp238
	vcvtsd2ss	%xmm2, %xmm2, %xmm2	# tmp238, s
# Raytracer_handofdos_r3experimental.c:169: 					if (s < *t && s > .01) {
	vcomiss	(%rdi), %xmm2	# *t_37(D), s
	jnb	.L20	#,
# Raytracer_handofdos_r3experimental.c:169: 					if (s < *t && s > .01) {
	vxorpd	%xmm8, %xmm8, %xmm8	# tmp239
	vcvtss2sd	%xmm2, %xmm8, %xmm8	# s, tmp239, tmp239
	vcomisd	%xmm7, %xmm8	# tmp257, tmp239
	jbe	.L20	#,
# Raytracer_handofdos_r3experimental.c:170: 						*t = s;
	vmovss	%xmm2, (%rdi)	# s, *t_37(D)
# Raytracer_handofdos_r3experimental.c:172: 						n->xmm = opNotSSE(p.xmm + d * *t);   //n = !(p + d * t);
	vshufps	$0, %xmm2, %xmm2, %xmm2	# s, tmp241
	vfmadd231ps	%xmm1, %xmm2, %xmm3	# d, tmp241, _24
# Raytracer_handofdos_r3experimental.c:173: 						m = 2;
	movl	$2, %eax	#, <retval>
# Raytracer_handofdos_r3experimental.c:61: 	return hsum_ps_SSE3(me*me);
	vmulps	%xmm3, %xmm3, %xmm2	# _24, _24, _69
# /usr/lib/gcc/x86_64-linux-gnu/7/include/pmmintrin.h:58:   return (__m128) __builtin_ia32_haddps ((__v4sf)__X, (__v4sf)__Y);
	vhaddps	%xmm2, %xmm2, %xmm2	# _69, _69, tmp242
	vhaddps	%xmm2, %xmm2, %xmm2	# tmp242, tmp242, tmp243
# Raytracer_handofdos_r3experimental.c:102: 	return me * k / sqrtf(opNormSSE_single(me));
	vsqrtss	%xmm2, %xmm2, %xmm2	# tmp244, _73
	vshufps	$0, %xmm2, %xmm2, %xmm2	# _73, tmp245
	vrcpps	%xmm2, %xmm8	# tmp245, tmp247
	vmulps	%xmm2, %xmm8, %xmm2	# tmp245, tmp247, tmp248
	vmulps	%xmm2, %xmm8, %xmm2	# tmp248, tmp247, tmp248
	vaddps	%xmm8, %xmm8, %xmm8	# tmp247, tmp247, tmp249
	vsubps	%xmm2, %xmm8, %xmm2	# tmp248, tmp249, tmp250
	vmulps	%xmm2, %xmm3, %xmm2	# tmp250, _24, tmp246
# Raytracer_handofdos_r3experimental.c:172: 						n->xmm = opNotSSE(p.xmm + d * *t);   //n = !(p + d * t);
	vmovaps	%xmm2, (%rsi)	# tmp246, *n_44(D).xmm
	.p2align 4,,10
	.p2align 3
.L20:
	subq	$1, %rdx	#, ivtmp.81
# Raytracer_handofdos_r3experimental.c:160: 		for (int j = 9; j--;)
	cmpq	$-1, %rdx	#, ivtmp.81
	jne	.L25	#,
	addl	$1, %r9d	#, ivtmp.93
# Raytracer_handofdos_r3experimental.c:159: 	for (int k = 19; k--;)
	cmpl	$1, %r9d	#, ivtmp.93
	jne	.L27	#,
# Raytracer_handofdos_r3experimental.c:178: }
	popq	%rbx	#
	popq	%r10	#
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	popq	%r12	#
	popq	%rbp	#
	leaq	-8(%r10), %rsp	#,
	.cfi_def_cfa 7, 8
	ret
.L37:
	.cfi_restore_state
# Raytracer_handofdos_r3experimental.c:151: 	*t = 1e9;
	movl	$0x4e6e6b28, (%rdi)	#, *t_37(D)
# Raytracer_handofdos_r3experimental.c:152: 	int m = 0;
	xorl	%eax, %eax	# <retval>
	jmp	.L19	#
	.cfi_endproc
.LFE588:
	.size	tracer, .-tracer
	.p2align 4,,15
	.globl	sampler
	.type	sampler, @function
sampler:
.LFB589:
	.cfi_startproc
	pushq	%r12	#
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	vmovaps	%xmm1, %xmm10	# d, d
	pushq	%rbp	#
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx	#
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	subq	$64, %rsp	#,
	.cfi_def_cfa_offset 96
# Raytracer_handofdos_r3experimental.c:180: __m128 sampler(const __m128 o, const __m128 d) {
	movq	%fs:40, %rax	#, tmp312
	movq	%rax, 56(%rsp)	# tmp312, D.7643
	xorl	%eax, %eax	# tmp312
# Raytracer_handofdos_r3experimental.c:183: 	int m = tracer(o, d, &t, &n);
	leaq	32(%rsp), %rbp	#, tmp300
	leaq	28(%rsp), %rbx	#, tmp299
	movq	%rbp, %rsi	# tmp300,
	movq	%rbx, %rdi	# tmp299,
	call	tracer	#
# Raytracer_handofdos_r3experimental.c:184: 	if (!m){
	testl	%eax, %eax	# m
	jne	.L43	#,
# Raytracer_handofdos_r3experimental.c:186: 		return n.xmm * (float)pow(1 - ((Vector)d).z, 4);
	vmovss	.LC4(%rip), %xmm0	#, tmp193
	vunpckhps	%xmm1, %xmm1, %xmm10	# d, d, tmp191
# Raytracer_handofdos_r3experimental.c:185: 		n = (Vector){.x=.7, .y=.6, .z=1};
	movabsq	$4546834186571559731, %rax	#, tmp314
	movl	$0, 44(%rsp)	#, MEM[(union  *)&n + 12B]
	movq	%rax, 32(%rsp)	# tmp314, MEM[(union  *)&n]
# Raytracer_handofdos_r3experimental.c:186: 		return n.xmm * (float)pow(1 - ((Vector)d).z, 4);
	vsubss	%xmm10, %xmm0, %xmm0	# tmp191, tmp193, tmp192
# Raytracer_handofdos_r3experimental.c:185: 		n = (Vector){.x=.7, .y=.6, .z=1};
	movl	$1065353216, 40(%rsp)	#, MEM[(union  *)&n + 8B]
# Raytracer_handofdos_r3experimental.c:186: 		return n.xmm * (float)pow(1 - ((Vector)d).z, 4);
	vcvtss2sd	%xmm0, %xmm0, %xmm0	# tmp192, _4
	vmulsd	%xmm0, %xmm0, %xmm0	# _4, _4, powmult_146
	vmulsd	%xmm0, %xmm0, %xmm0	# powmult_146, powmult_146, tmp194
	vcvtsd2ss	%xmm0, %xmm0, %xmm0	# tmp194, _86
	vshufps	$0, %xmm0, %xmm0, %xmm0	# _86, tmp195
	vmulps	32(%rsp), %xmm0, %xmm0	# n.xmm, tmp195, <retval>
.L42:
# Raytracer_handofdos_r3experimental.c:216: }
	movq	56(%rsp), %rax	# D.7643, tmp313
	xorq	%fs:40, %rax	#, tmp313
	jne	.L61	#,
	addq	$64, %rsp	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	popq	%rbx	#
	.cfi_def_cfa_offset 24
	popq	%rbp	#
	.cfi_def_cfa_offset 16
	popq	%r12	#
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L43:
	.cfi_restore_state
	movl	%eax, %r12d	#, m
	vmovaps	%xmm0, %xmm11	# o, o
# Raytracer_handofdos_r3experimental.c:124:     m_z = 36969 * (m_z & 65535) + (m_z >> 16);
	movl	m_z(%rip), %eax	# m_z, m_z.0_130
# Raytracer_handofdos_r3experimental.c:188: 	Vector h; h.xmm = d * t + o;
	vbroadcastss	28(%rsp), %xmm0	# t, tmp196
# Raytracer_handofdos_r3experimental.c:135:     return (u + 1.0) * 2.328306435454494e-10;
	vmovsd	.LC0(%rip), %xmm4	#, tmp213
	vmovsd	.LC1(%rip), %xmm3	#, tmp215
# Raytracer_handofdos_r3experimental.c:194: 	if (b < 0 || tracer(h.xmm, l.xmm, &t, &n)){
	vxorps	%xmm14, %xmm14, %xmm14	# _180
# Raytracer_handofdos_r3experimental.c:124:     m_z = 36969 * (m_z & 65535) + (m_z >> 16);
	movzwl	%ax, %ecx	# m_z.0_130, m_z.0_130
	shrl	$16, %eax	#, tmp201
# Raytracer_handofdos_r3experimental.c:188: 	Vector h; h.xmm = d * t + o;
	vfmadd231ps	%xmm1, %xmm0, %xmm11	# d, tmp196, _8
# Raytracer_handofdos_r3experimental.c:135:     return (u + 1.0) * 2.328306435454494e-10;
	vxorpd	%xmm0, %xmm0, %xmm0	# tmp207
# Raytracer_handofdos_r3experimental.c:124:     m_z = 36969 * (m_z & 65535) + (m_z >> 16);
	imull	$36969, %ecx, %ecx	#, m_z.0_130, tmp200
# Raytracer_handofdos_r3experimental.c:189:     Vector l = (Vector){.x=9 + Random(), .y=9 + Random(), .z=16};  l.xmm = opNotSSE(l.xmm -1 * h.xmm);
	vmovss	.LC7(%rip), %xmm2	#, tmp218
# Raytracer_handofdos_r3experimental.c:124:     m_z = 36969 * (m_z & 65535) + (m_z >> 16);
	addl	%eax, %ecx	# tmp201, _134
# Raytracer_handofdos_r3experimental.c:125:     m_w = 18000 * (m_w & 65535) + (m_w >> 16);
	movl	m_w(%rip), %eax	# m_w, m_w.2_135
	movzwl	%ax, %edx	# m_w.2_135, m_w.2_135
	shrl	$16, %eax	#, tmp204
	imull	$18000, %edx, %edx	#, m_w.2_135, tmp203
	addl	%eax, %edx	# tmp204, _139
# Raytracer_handofdos_r3experimental.c:126:     return (m_z << 16) + m_w;
	movl	%ecx, %eax	# _134, tmp205
	sall	$16, %eax	#, tmp205
# Raytracer_handofdos_r3experimental.c:135:     return (u + 1.0) * 2.328306435454494e-10;
	addl	%edx, %eax	# _139, tmp208
	vcvtsi2sdq	%rax, %xmm0, %xmm0	# tmp208, tmp207, tmp207
# Raytracer_handofdos_r3experimental.c:124:     m_z = 36969 * (m_z & 65535) + (m_z >> 16);
	movzwl	%cx, %eax	# _134, _134
	shrl	$16, %ecx	#, tmp223
	imull	$36969, %eax, %eax	#, _134, tmp222
# Raytracer_handofdos_r3experimental.c:135:     return (u + 1.0) * 2.328306435454494e-10;
	vaddsd	%xmm4, %xmm0, %xmm0	# tmp213, tmp207, tmp212
# Raytracer_handofdos_r3experimental.c:124:     m_z = 36969 * (m_z & 65535) + (m_z >> 16);
	addl	%eax, %ecx	# tmp222, _119
# Raytracer_handofdos_r3experimental.c:125:     m_w = 18000 * (m_w & 65535) + (m_w >> 16);
	movzwl	%dx, %eax	# _139, _139
	shrl	$16, %edx	#, tmp226
	imull	$18000, %eax, %eax	#, _139, tmp225
# Raytracer_handofdos_r3experimental.c:124:     m_z = 36969 * (m_z & 65535) + (m_z >> 16);
	movl	%ecx, m_z(%rip)	# _119, m_z
# Raytracer_handofdos_r3experimental.c:126:     return (m_z << 16) + m_w;
	sall	$16, %ecx	#, tmp227
# Raytracer_handofdos_r3experimental.c:135:     return (u + 1.0) * 2.328306435454494e-10;
	vmulsd	%xmm3, %xmm0, %xmm0	# tmp215, tmp212, tmp214
# Raytracer_handofdos_r3experimental.c:125:     m_w = 18000 * (m_w & 65535) + (m_w >> 16);
	addl	%eax, %edx	# tmp225, _124
# Raytracer_handofdos_r3experimental.c:135:     return (u + 1.0) * 2.328306435454494e-10;
	leal	(%rcx,%rdx), %eax	#, tmp230
# Raytracer_handofdos_r3experimental.c:125:     m_w = 18000 * (m_w & 65535) + (m_w >> 16);
	movl	%edx, m_w(%rip)	# _124, m_w
# Raytracer_handofdos_r3experimental.c:140:     return GetUniform();
	vcvtsd2ss	%xmm0, %xmm0, %xmm0	# tmp214, tmp216
# Raytracer_handofdos_r3experimental.c:189:     Vector l = (Vector){.x=9 + Random(), .y=9 + Random(), .z=16};  l.xmm = opNotSSE(l.xmm -1 * h.xmm);
	vaddss	%xmm2, %xmm0, %xmm0	# tmp218, tmp216, tmp219
	vinsertps	$0xe, %xmm0, %xmm0, %xmm1	# tmp219, tmp220
# Raytracer_handofdos_r3experimental.c:135:     return (u + 1.0) * 2.328306435454494e-10;
	vxorpd	%xmm0, %xmm0, %xmm0	# tmp229
	vcvtsi2sdq	%rax, %xmm0, %xmm0	# tmp230, tmp229, tmp229
	vaddsd	%xmm4, %xmm0, %xmm0	# tmp213, tmp229, tmp234
	vmulsd	%xmm3, %xmm0, %xmm0	# tmp215, tmp234, tmp236
# Raytracer_handofdos_r3experimental.c:191:     Vector r;   r.xmm = d + n.xmm * opNormSSE(n.xmm, d) * -2;
	vmovaps	32(%rsp), %xmm3	# n.xmm, _14
	vmulps	.LC9(%rip), %xmm3, %xmm13	#, _14, tmp256
# Raytracer_handofdos_r3experimental.c:57: 	return hsum_ps_SSE3(me*r);
	vmulps	%xmm10, %xmm3, %xmm4	# d, _14, _93
# Raytracer_handofdos_r3experimental.c:140:     return GetUniform();
	vcvtsd2ss	%xmm0, %xmm0, %xmm0	# tmp236, tmp238
# Raytracer_handofdos_r3experimental.c:189:     Vector l = (Vector){.x=9 + Random(), .y=9 + Random(), .z=16};  l.xmm = opNotSSE(l.xmm -1 * h.xmm);
	vaddss	%xmm2, %xmm0, %xmm0	# tmp218, tmp238, tmp241
# /usr/lib/gcc/x86_64-linux-gnu/7/include/pmmintrin.h:58:   return (__m128) __builtin_ia32_haddps ((__v4sf)__X, (__v4sf)__Y);
	vhaddps	%xmm4, %xmm4, %xmm4	# _93, _93, tmp253
# Raytracer_handofdos_r3experimental.c:189:     Vector l = (Vector){.x=9 + Random(), .y=9 + Random(), .z=16};  l.xmm = opNotSSE(l.xmm -1 * h.xmm);
	vmovd	%xmm0, %eax	# tmp241, tmp241
	vpinsrd	$1, %eax, %xmm1, %xmm0	#, tmp241, tmp220, tmp242
	movl	.LC8(%rip), %eax	#, tmp243
# /usr/lib/gcc/x86_64-linux-gnu/7/include/pmmintrin.h:58:   return (__m128) __builtin_ia32_haddps ((__v4sf)__X, (__v4sf)__Y);
	vhaddps	%xmm4, %xmm4, %xmm4	# tmp253, tmp253, tmp254
# Raytracer_handofdos_r3experimental.c:189:     Vector l = (Vector){.x=9 + Random(), .y=9 + Random(), .z=16};  l.xmm = opNotSSE(l.xmm -1 * h.xmm);
	vpinsrd	$2, %eax, %xmm0, %xmm0	#, tmp243, tmp242, tmp244
	vsubps	%xmm11, %xmm0, %xmm0	# _8, tmp244, _13
# Raytracer_handofdos_r3experimental.c:191:     Vector r;   r.xmm = d + n.xmm * opNormSSE(n.xmm, d) * -2;
	vpermilps	$0, %xmm4, %xmm4	#, tmp254, tmp255
	vfmadd132ps	%xmm4, %xmm10, %xmm13	# tmp255, d, _18
# Raytracer_handofdos_r3experimental.c:61: 	return hsum_ps_SSE3(me*me);
	vmulps	%xmm0, %xmm0, %xmm2	# _13, _13, _96
# /usr/lib/gcc/x86_64-linux-gnu/7/include/pmmintrin.h:58:   return (__m128) __builtin_ia32_haddps ((__v4sf)__X, (__v4sf)__Y);
	vhaddps	%xmm2, %xmm2, %xmm2	# _96, _96, tmp245
	vhaddps	%xmm2, %xmm2, %xmm2	# tmp245, tmp245, tmp246
# Raytracer_handofdos_r3experimental.c:102: 	return me * k / sqrtf(opNormSSE_single(me));
	vsqrtss	%xmm2, %xmm2, %xmm2	# tmp247, _100
	vshufps	$0, %xmm2, %xmm2, %xmm2	# _100, tmp248
	vrcpps	%xmm2, %xmm12	# tmp248, tmp249
	vmulps	%xmm2, %xmm12, %xmm2	# tmp248, tmp249, tmp250
	vmulps	%xmm2, %xmm12, %xmm2	# tmp250, tmp249, tmp250
	vaddps	%xmm12, %xmm12, %xmm12	# tmp249, tmp249, tmp251
	vsubps	%xmm2, %xmm12, %xmm12	# tmp250, tmp251, tmp252
	vmulps	%xmm12, %xmm0, %xmm12	# tmp252, _13, _102
# Raytracer_handofdos_r3experimental.c:57: 	return hsum_ps_SSE3(me*r);
	vmulps	%xmm12, %xmm3, %xmm3	# _102, _14, _65
# /usr/lib/gcc/x86_64-linux-gnu/7/include/pmmintrin.h:58:   return (__m128) __builtin_ia32_haddps ((__v4sf)__X, (__v4sf)__Y);
	vhaddps	%xmm3, %xmm3, %xmm3	# _65, _65, tmp258
	vhaddps	%xmm3, %xmm3, %xmm3	# tmp258, tmp258, tmp259
# Raytracer_handofdos_r3experimental.c:194: 	if (b < 0 || tracer(h.xmm, l.xmm, &t, &n)){
	vcomiss	%xmm3, %xmm14	# b, _180
# /usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h:969:   return ((__v4sf)__A)[0];
	vmovaps	%xmm3, %xmm10	# tmp259, b
# Raytracer_handofdos_r3experimental.c:194: 	if (b < 0 || tracer(h.xmm, l.xmm, &t, &n)){
	jbe	.L62	#,
.L49:
	vxorps	%xmm10, %xmm10, %xmm10	# b
.L50:
# Raytracer_handofdos_r3experimental.c:198: 	if (m & 1) {
	andl	$1, %r12d	#, tmp269
	je	.L52	#,
# Raytracer_handofdos_r3experimental.c:199:         h.xmm *= .2f;
	vmulps	.LC10(%rip), %xmm11, %xmm11	#, _8, _26
# Raytracer_handofdos_r3experimental.c:202: 		if ((int) (ceil(h.x) + ceil(h.y)) & 1)
	vroundss	$10, %xmm11, %xmm0, %xmm0	#, tmp271, _112
	vshufps	$85, %xmm11, %xmm11, %xmm11	#, _26, _26, tmp272
	vcvtss2sd	%xmm0, %xmm0, %xmm0	# _112, tmp273
	vroundss	$10, %xmm11, %xmm11, %xmm11	#, tmp272, _9
	vcvtss2sd	%xmm11, %xmm11, %xmm11	# _9, tmp274
	vaddsd	%xmm11, %xmm0, %xmm0	# tmp274, tmp273, tmp275
	vcvttsd2si	%xmm0, %eax	# tmp275, tmp276
	andl	$1, %eax	#, tmp277
	jne	.L63	#,
# Raytracer_handofdos_r3experimental.c:205: 			resV = (Vector){.x=3, .y=3, .z=3};
	movq	$0, (%rsp)	#, %sfp
	movq	$0, 8(%rsp)	#, %sfp
	vmovdqa	(%rsp), %xmm5	# %sfp, tmp321
	vpinsrd	$3, %eax, %xmm5, %xmm7	#, tmp277, tmp321, tmp320
	movabsq	$4629700418014806016, %rax	#, tmp322
	vmovaps	%xmm7, (%rsp)	# tmp320, %sfp
	movq	%rax, (%rsp)	# tmp322, %sfp
	vmovdqa	(%rsp), %xmm7	# %sfp, tmp324
	movl	$1077936128, %eax	#, tmp284
	vpinsrd	$2, %eax, %xmm7, %xmm6	#, tmp284, tmp324, tmp323
	vmovaps	%xmm6, (%rsp)	# tmp323, %sfp
.L54:
# Raytracer_handofdos_r3experimental.c:206:         resV.xmm *= b * .2f + .1f;
	vmovss	.LC11(%rip), %xmm0	#, _80
	vfmadd213ss	.LC12(%rip), %xmm10, %xmm0	#, b, _80
	vshufps	$0, %xmm0, %xmm0, %xmm0	# _80, tmp288
	vmulps	(%rsp), %xmm0, %xmm0	# %sfp, tmp288, <retval>
	jmp	.L42	#
	.p2align 4,,10
	.p2align 3
.L62:
# Raytracer_handofdos_r3experimental.c:194: 	if (b < 0 || tracer(h.xmm, l.xmm, &t, &n)){
	vmovaps	%xmm11, %xmm0	# _8,
	vmovaps	%xmm12, %xmm1	# _102,
	call	tracer	#
	vmulps	%xmm12, %xmm13, %xmm0	# _102, _18, _186
	vhaddps	%xmm0, %xmm0, %xmm0	# _186, _186, tmp263
	vhaddps	%xmm0, %xmm0, %xmm0	# tmp263, tmp263, tmp264
	testl	%eax, %eax	# _19
	jne	.L49	#,
# Raytracer_handofdos_r3experimental.c:197: 	float p = pow(opNormSSE(l.xmm, r.xmm) * (b > 0), 99);
	vcomiss	%xmm14, %xmm10	# _180, b
	jbe	.L50	#,
	vcvtss2sd	%xmm0, %xmm0, %xmm0	# _189, _166
	vmulsd	%xmm0, %xmm0, %xmm14	# _166, _166, _168
	vmulsd	%xmm14, %xmm14, %xmm14	# _168, _168, _169
	vmulsd	%xmm14, %xmm14, %xmm14	# _169, _169, _170
	vmulsd	%xmm14, %xmm14, %xmm14	# _170, _170, _171
	vmulsd	%xmm14, %xmm14, %xmm14	# _171, _171, tmp266
	vmulsd	%xmm0, %xmm14, %xmm0	# _166, tmp266, _173
	vmulsd	%xmm0, %xmm0, %xmm14	# _173, _173, tmp267
	vmulsd	%xmm0, %xmm14, %xmm14	# _173, tmp267, tmp268
	vcvtsd2ss	%xmm14, %xmm14, %xmm14	# tmp268, _180
	jmp	.L50	#
	.p2align 4,,10
	.p2align 3
.L63:
# Raytracer_handofdos_r3experimental.c:203: 			resV = (Vector){.x=3, .y=1, .z=1};
	movabsq	$4575657222486360064, %rax	#, tmp317
	xorl	%edx, %edx	#
	movq	%rax, (%rsp)	# tmp317, %sfp
	movl	$1065353216, %eax	#, tmp280
	movq	%rdx, 8(%rsp)	#, %sfp
	vmovdqa	(%rsp), %xmm6	# %sfp, tmp319
	vpinsrd	$2, %eax, %xmm6, %xmm5	#, tmp280, tmp319, tmp318
	vmovaps	%xmm5, (%rsp)	# tmp318, %sfp
	jmp	.L54	#
	.p2align 4,,10
	.p2align 3
.L52:
# Raytracer_handofdos_r3experimental.c:210: 	Vector	resV = {.x=p, .y=p, .z=p};
	vpxor	%xmm0, %xmm0, %xmm0	# resV
	vmovd	%xmm14, %eax	# _180, _180
	vpinsrd	$3, %r12d, %xmm0, %xmm1	#, tmp269, resV, tmp290
	vmovss	%xmm14, %xmm1, %xmm0	# _180, tmp290, tmp292
# Raytracer_handofdos_r3experimental.c:211: 	smpl.xmm = sampler(h.xmm, r.xmm);
	vmovaps	%xmm13, %xmm1	# _18,
# Raytracer_handofdos_r3experimental.c:210: 	Vector	resV = {.x=p, .y=p, .z=p};
	vpinsrd	$1, %eax, %xmm0, %xmm0	#, _180, tmp292, tmp294
	vpinsrd	$2, %eax, %xmm0, %xmm2	#, _180, tmp294, tmp296
# Raytracer_handofdos_r3experimental.c:211: 	smpl.xmm = sampler(h.xmm, r.xmm);
	vmovaps	%xmm11, %xmm0	# _8,
# Raytracer_handofdos_r3experimental.c:210: 	Vector	resV = {.x=p, .y=p, .z=p};
	vmovaps	%xmm2, (%rsp)	# tmp296, %sfp
# Raytracer_handofdos_r3experimental.c:211: 	smpl.xmm = sampler(h.xmm, r.xmm);
	call	sampler	#
# Raytracer_handofdos_r3experimental.c:213: 	resV.xmm += smpl.xmm * .5;
	vmovdqa	(%rsp), %xmm2	# %sfp, tmp296
	vfmadd132ps	.LC13(%rip), %xmm2, %xmm0	#, tmp296, <retval>
# Raytracer_handofdos_r3experimental.c:215: 	return resV.xmm;
	jmp	.L42	#
.L61:
# Raytracer_handofdos_r3experimental.c:216: }
	call	__stack_chk_fail@PLT	#
	.cfi_endproc
.LFE589:
	.size	sampler, .-sampler
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC14:
	.string	"\n\nUsage: card-raytracer <filename>.ppm\n"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC15:
	.string	"w"
.LC16:
	.string	"P6 %d %d 255 "
.LC23:
	.string	"%c%c%c"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB590:
	.cfi_startproc
	pushq	%r14	#
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13	#
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12	#
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp	#
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx	#
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	addq	$-128, %rsp	#,
	.cfi_def_cfa_offset 176
# Raytracer_handofdos_r3experimental.c:224: 	if (argc==1){
	cmpl	$1, %edi	#, argc
	je	.L83	#,
# Raytracer_handofdos_r3experimental.c:228: 	FILE *out = fopen(argv[1],"w");
	movq	8(%rsi), %rdi	# MEM[(char * *)argv_46(D) + 8B], MEM[(char * *)argv_46(D) + 8B]
	leaq	.LC15(%rip), %rsi	#,
# Raytracer_handofdos_r3experimental.c:236: 	for (int y = HEIGHT; y > 0; y--) {
	movl	$512, %r14d	#, <retval>
# Raytracer_handofdos_r3experimental.c:238: 			Vector p = {.x=13, .y=13, .z=13};
	xorl	%ebp, %ebp	# tmp295
# Raytracer_handofdos_r3experimental.c:228: 	FILE *out = fopen(argv[1],"w");
	call	fopen@PLT	#
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:97:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$512, %r8d	#,
	movl	$512, %ecx	#,
	leaq	.LC16(%rip), %rdx	#,
	movq	%rax, %rdi	# out,
# Raytracer_handofdos_r3experimental.c:228: 	FILE *out = fopen(argv[1],"w");
	movq	%rax, %r13	#, out
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:97:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$1, %esi	#,
	xorl	%eax, %eax	#
	call	__fprintf_chk@PLT	#
# Raytracer_handofdos_r3experimental.c:230: 	Vector g = {.x=-6, .y=-16, .z=0}; g.xmm = opNotSSE(g.xmm);
	vmovdqa	.LC27(%rip), %xmm2	#, g
# Raytracer_handofdos_r3experimental.c:231:     Vector a = {.x=0, .y=0, .z=1};  a.xmm = opNotSSE(opCrossSSE(a.xmm, g.xmm)) *.002f;
	movl	.LC4(%rip), %eax	#, tmp251
# Raytracer_handofdos_r3experimental.c:61: 	return hsum_ps_SSE3(me*me);
	vmulps	%xmm2, %xmm2, %xmm0	# g, g, _104
# /usr/lib/gcc/x86_64-linux-gnu/7/include/pmmintrin.h:58:   return (__m128) __builtin_ia32_haddps ((__v4sf)__X, (__v4sf)__Y);
	vhaddps	%xmm0, %xmm0, %xmm0	# _104, _104, tmp243
	vhaddps	%xmm0, %xmm0, %xmm0	# tmp243, tmp243, tmp244
# Raytracer_handofdos_r3experimental.c:102: 	return me * k / sqrtf(opNormSSE_single(me));
	vsqrtss	%xmm0, %xmm0, %xmm0	# tmp245, _108
	vshufps	$0, %xmm0, %xmm0, %xmm0	# _108, tmp246
	vrcpps	%xmm0, %xmm1	# tmp246, tmp247
	vmulps	%xmm0, %xmm1, %xmm0	# tmp246, tmp247, tmp248
	vmulps	%xmm0, %xmm1, %xmm0	# tmp248, tmp247, tmp248
	vaddps	%xmm1, %xmm1, %xmm1	# tmp247, tmp247, tmp249
	vsubps	%xmm0, %xmm1, %xmm0	# tmp248, tmp249, tmp250
	vmulps	%xmm2, %xmm0, %xmm1	# g, tmp250, _110
# Raytracer_handofdos_r3experimental.c:231:     Vector a = {.x=0, .y=0, .z=1};  a.xmm = opNotSSE(opCrossSSE(a.xmm, g.xmm)) *.002f;
	vpxor	%xmm0, %xmm0, %xmm0	# a
	vpinsrd	$2, %eax, %xmm0, %xmm0	#, tmp251, a, tmp252
# /usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h:746:   return (__m128) __builtin_ia32_shufps ((__v4sf)__A, (__v4sf)__B, __mask);
	vshufps	$201, %xmm0, %xmm0, %xmm5	#, tmp252, tmp252, tmp253
	vshufps	$210, %xmm0, %xmm0, %xmm0	#, tmp252, tmp252, tmp259
	vshufps	$201, %xmm1, %xmm1, %xmm4	#, _110, _110, tmp262
# Raytracer_handofdos_r3experimental.c:85:     shuf_me2 *= shuf_r2;
	vmulps	%xmm4, %xmm0, %xmm0	# tmp262, tmp259, shuf_me2
# /usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h:746:   return (__m128) __builtin_ia32_shufps ((__v4sf)__A, (__v4sf)__B, __mask);
	vshufps	$210, %xmm1, %xmm1, %xmm3	#, _110, _110, tmp256
# Raytracer_handofdos_r3experimental.c:87: 	return shuf_me1 - shuf_me2;
	vfmsub132ps	%xmm3, %xmm0, %xmm5	# tmp256, shuf_me2, _103
# Raytracer_handofdos_r3experimental.c:61: 	return hsum_ps_SSE3(me*me);
	vmulps	%xmm5, %xmm5, %xmm0	# _103, _103, _90
# /usr/lib/gcc/x86_64-linux-gnu/7/include/pmmintrin.h:58:   return (__m128) __builtin_ia32_haddps ((__v4sf)__X, (__v4sf)__Y);
	vhaddps	%xmm0, %xmm0, %xmm0	# _90, _90, tmp266
	vhaddps	%xmm0, %xmm0, %xmm0	# tmp266, tmp266, tmp267
# Raytracer_handofdos_r3experimental.c:102: 	return me * k / sqrtf(opNormSSE_single(me));
	vsqrtss	%xmm0, %xmm0, %xmm0	# tmp268, _94
	vshufps	$0, %xmm0, %xmm0, %xmm0	# _94, tmp269
	vrcpps	%xmm0, %xmm2	# tmp269, tmp271
	vmulps	%xmm0, %xmm2, %xmm0	# tmp269, tmp271, tmp272
	vmulps	%xmm0, %xmm2, %xmm0	# tmp272, tmp271, tmp272
	vaddps	%xmm2, %xmm2, %xmm2	# tmp271, tmp271, tmp273
	vsubps	%xmm0, %xmm2, %xmm0	# tmp272, tmp273, tmp274
	vmulps	%xmm0, %xmm5, %xmm5	# tmp274, _103, tmp270
# Raytracer_handofdos_r3experimental.c:231:     Vector a = {.x=0, .y=0, .z=1};  a.xmm = opNotSSE(opCrossSSE(a.xmm, g.xmm)) *.002f;
	vmovaps	.LC17(%rip), %xmm0	#, tmp275
	vmulps	%xmm0, %xmm5, %xmm7	# tmp275, tmp270, _5
# /usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h:746:   return (__m128) __builtin_ia32_shufps ((__v4sf)__A, (__v4sf)__B, __mask);
	vshufps	$201, %xmm7, %xmm7, %xmm5	#, _5, _5, tmp279
# Raytracer_handofdos_r3experimental.c:85:     shuf_me2 *= shuf_r2;
	vmulps	%xmm3, %xmm5, %xmm3	# tmp256, tmp279, shuf_me2
# /usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h:746:   return (__m128) __builtin_ia32_shufps ((__v4sf)__A, (__v4sf)__B, __mask);
	vshufps	$210, %xmm7, %xmm7, %xmm2	#, _5, _5, tmp276
	vmovsd	.LC0(%rip), %xmm5	#, tmp406
# Raytracer_handofdos_r3experimental.c:231:     Vector a = {.x=0, .y=0, .z=1};  a.xmm = opNotSSE(opCrossSSE(a.xmm, g.xmm)) *.002f;
	vmovaps	%xmm7, 48(%rsp)	# _5, %sfp
# Raytracer_handofdos_r3experimental.c:87: 	return shuf_me1 - shuf_me2;
	vfmsub132ps	%xmm2, %xmm3, %xmm4	# tmp276, shuf_me2, _89
# Raytracer_handofdos_r3experimental.c:61: 	return hsum_ps_SSE3(me*me);
	vmulps	%xmm4, %xmm4, %xmm2	# _89, _89, _57
# /usr/lib/gcc/x86_64-linux-gnu/7/include/pmmintrin.h:58:   return (__m128) __builtin_ia32_haddps ((__v4sf)__X, (__v4sf)__Y);
	vhaddps	%xmm2, %xmm2, %xmm2	# _57, _57, tmp283
	vhaddps	%xmm2, %xmm2, %xmm2	# tmp283, tmp283, tmp284
# Raytracer_handofdos_r3experimental.c:102: 	return me * k / sqrtf(opNormSSE_single(me));
	vsqrtss	%xmm2, %xmm2, %xmm2	# tmp285, _82
	vshufps	$0, %xmm2, %xmm2, %xmm2	# _82, tmp286
	vrcpps	%xmm2, %xmm3	# tmp286, tmp288
	vmulps	%xmm2, %xmm3, %xmm2	# tmp286, tmp288, tmp289
	vmulps	%xmm2, %xmm3, %xmm2	# tmp289, tmp288, tmp289
	vaddps	%xmm3, %xmm3, %xmm3	# tmp288, tmp288, tmp290
	vsubps	%xmm2, %xmm3, %xmm2	# tmp289, tmp290, tmp291
	vmulps	%xmm2, %xmm4, %xmm2	# tmp291, _89, tmp287
# Raytracer_handofdos_r3experimental.c:232:     Vector b;  b.xmm = opNotSSE(opCrossSSE(g.xmm, a.xmm)) * .002f;
	vmulps	%xmm0, %xmm2, %xmm4	# tmp275, tmp287, _6
# Raytracer_handofdos_r3experimental.c:233:     Vector c;  c.xmm = (a.xmm + b.xmm) * -256 + g.xmm;
	vaddps	%xmm7, %xmm4, %xmm0	# _5, _6, tmp293
# Raytracer_handofdos_r3experimental.c:232:     Vector b;  b.xmm = opNotSSE(opCrossSSE(g.xmm, a.xmm)) * .002f;
	vmovaps	%xmm4, 64(%rsp)	# _6, %sfp
# Raytracer_handofdos_r3experimental.c:233:     Vector c;  c.xmm = (a.xmm + b.xmm) * -256 + g.xmm;
	vfmadd132ps	.LC18(%rip), %xmm1, %xmm0	#, _110, tmp293
	vmovsd	.LC1(%rip), %xmm4	#, tmp407
	vmovaps	%xmm0, 80(%rsp)	# tmp293, %sfp
.L67:
	vxorps	%xmm7, %xmm7, %xmm7	# _616
# Raytracer_handofdos_r3experimental.c:237: 		for (int x = WIDTH; x--;) {
	movl	$511, %r12d	#, x
	vcvtsi2ss	%r14d, %xmm7, %xmm7	# <retval>, _616, _616
	vmovss	%xmm7, 108(%rsp)	# _616, %sfp
	.p2align 4,,10
	.p2align 3
.L77:
# Raytracer_handofdos_r3experimental.c:238: 			Vector p = {.x=13, .y=13, .z=13};
	vmovdqa	112(%rsp), %xmm7	# %sfp, tmp420
	movl	$64, %ebx	#, ivtmp_611
	movabsq	$4706261611697930240, %rax	#, tmp421
	vpinsrd	$3, %ebp, %xmm7, %xmm7	#, tmp295, tmp420, tmp419
	vmovaps	%xmm7, 112(%rsp)	# tmp419, %sfp
	movq	%rax, 112(%rsp)	# tmp421, %sfp
	vmovdqa	112(%rsp), %xmm7	# %sfp, tmp422
	movl	$1095761920, %eax	#, tmp297
	vpinsrd	$2, %eax, %xmm7, %xmm0	#, tmp297, tmp422, tmp298
	vxorps	%xmm7, %xmm7, %xmm7	# _618
	vcvtsi2ss	%r12d, %xmm7, %xmm7	# x, _618, _618
	vmovaps	%xmm0, 112(%rsp)	# tmp298, %sfp
	vmovaps	%xmm0, 16(%rsp)	# tmp298, %sfp
	vmovss	%xmm7, 104(%rsp)	# _618, %sfp
	.p2align 4,,10
	.p2align 3
.L76:
# Raytracer_handofdos_r3experimental.c:124:     m_z = 36969 * (m_z & 65535) + (m_z >> 16);
	movl	m_z(%rip), %ecx	# m_z, m_z.0_178
# Raytracer_handofdos_r3experimental.c:135:     return (u + 1.0) * 2.328306435454494e-10;
	vxorpd	%xmm6, %xmm6, %xmm6	# tmp307
	vxorpd	%xmm1, %xmm1, %xmm1	# tmp326
	vxorpd	%xmm2, %xmm2, %xmm2	# tmp370
# Raytracer_handofdos_r3experimental.c:125:     m_w = 18000 * (m_w & 65535) + (m_w >> 16);
	movl	m_w(%rip), %edi	# m_w, m_w.2_183
# Raytracer_handofdos_r3experimental.c:242:  				Vector c1 = {.x=17, .y=16, .z=8};
	vmovdqa	(%rsp), %xmm0	# %sfp, tmp431
# Raytracer_handofdos_r3experimental.c:135:     return (u + 1.0) * 2.328306435454494e-10;
	vmovsd	%xmm5, 96(%rsp)	# tmp406, %sfp
# Raytracer_handofdos_r3experimental.c:124:     m_z = 36969 * (m_z & 65535) + (m_z >> 16);
	movzwl	%cx, %esi	# m_z.0_178, m_z.0_178
	shrl	$16, %ecx	#, tmp301
# Raytracer_handofdos_r3experimental.c:240:  				Vector t;  t.xmm = a.xmm * (Random() - .5f) * 99 + b.xmm * (Random() - .5f) * 99;
	vmovaps	64(%rsp), %xmm7	# %sfp, _6
	vmovaps	48(%rsp), %xmm8	# %sfp, _5
# Raytracer_handofdos_r3experimental.c:124:     m_z = 36969 * (m_z & 65535) + (m_z >> 16);
	imull	$36969, %esi, %esi	#, m_z.0_178, tmp300
# Raytracer_handofdos_r3experimental.c:125:     m_w = 18000 * (m_w & 65535) + (m_w >> 16);
	movzwl	%di, %edx	# m_w.2_183, m_w.2_183
	shrl	$16, %edi	#, tmp304
# Raytracer_handofdos_r3experimental.c:242:  				Vector c1 = {.x=17, .y=16, .z=8};
	vpinsrd	$3, %ebp, %xmm0, %xmm3	#, tmp295, tmp431, tmp430
# Raytracer_handofdos_r3experimental.c:125:     m_w = 18000 * (m_w & 65535) + (m_w >> 16);
	imull	$18000, %edx, %edx	#, m_w.2_183, tmp303
# Raytracer_handofdos_r3experimental.c:242:  				Vector c1 = {.x=17, .y=16, .z=8};
	vmovaps	%xmm3, (%rsp)	# tmp430, %sfp
# Raytracer_handofdos_r3experimental.c:135:     return (u + 1.0) * 2.328306435454494e-10;
	vmovsd	%xmm4, 40(%rsp)	# tmp407, %sfp
# Raytracer_handofdos_r3experimental.c:124:     m_z = 36969 * (m_z & 65535) + (m_z >> 16);
	addl	%esi, %ecx	# tmp300, _182
# Raytracer_handofdos_r3experimental.c:126:     return (m_z << 16) + m_w;
	movl	%ecx, %eax	# _182, tmp305
# Raytracer_handofdos_r3experimental.c:125:     m_w = 18000 * (m_w & 65535) + (m_w >> 16);
	addl	%edx, %edi	# tmp303, _187
# Raytracer_handofdos_r3experimental.c:126:     return (m_z << 16) + m_w;
	sall	$16, %eax	#, tmp305
# Raytracer_handofdos_r3experimental.c:135:     return (u + 1.0) * 2.328306435454494e-10;
	leal	(%rax,%rdi), %esi	#, tmp308
# Raytracer_handofdos_r3experimental.c:124:     m_z = 36969 * (m_z & 65535) + (m_z >> 16);
	movzwl	%cx, %eax	# _182, _182
	imull	$36969, %eax, %eax	#, _182, tmp319
# Raytracer_handofdos_r3experimental.c:135:     return (u + 1.0) * 2.328306435454494e-10;
	vcvtsi2sdq	%rsi, %xmm6, %xmm6	# tmp308, tmp307, tmp307
# Raytracer_handofdos_r3experimental.c:124:     m_z = 36969 * (m_z & 65535) + (m_z >> 16);
	movl	%ecx, %esi	# _182, _182
# Raytracer_handofdos_r3experimental.c:125:     m_w = 18000 * (m_w & 65535) + (m_w >> 16);
	movzwl	%di, %ecx	# _187, _187
	shrl	$16, %edi	#, _187
# Raytracer_handofdos_r3experimental.c:124:     m_z = 36969 * (m_z & 65535) + (m_z >> 16);
	shrl	$16, %esi	#, _182
# Raytracer_handofdos_r3experimental.c:125:     m_w = 18000 * (m_w & 65535) + (m_w >> 16);
	imull	$18000, %ecx, %ecx	#, _187, tmp322
# Raytracer_handofdos_r3experimental.c:124:     m_z = 36969 * (m_z & 65535) + (m_z >> 16);
	addl	%esi, %eax	# tmp320, _167
# Raytracer_handofdos_r3experimental.c:126:     return (m_z << 16) + m_w;
	movl	%eax, %edx	# _167, tmp324
# Raytracer_handofdos_r3experimental.c:125:     m_w = 18000 * (m_w & 65535) + (m_w >> 16);
	addl	%edi, %ecx	# tmp323, _172
# Raytracer_handofdos_r3experimental.c:126:     return (m_z << 16) + m_w;
	sall	$16, %edx	#, tmp324
# Raytracer_handofdos_r3experimental.c:135:     return (u + 1.0) * 2.328306435454494e-10;
	vaddsd	%xmm5, %xmm6, %xmm6	# tmp406, tmp307, tmp312
# Raytracer_handofdos_r3experimental.c:242:  				Vector c1 = {.x=17, .y=16, .z=8};
	movabsq	$4719772410583711744, %rdi	#, tmp432
# Raytracer_handofdos_r3experimental.c:135:     return (u + 1.0) * 2.328306435454494e-10;
	addl	%ecx, %edx	# _172, tmp327
# Raytracer_handofdos_r3experimental.c:242:  				Vector c1 = {.x=17, .y=16, .z=8};
	movq	%rdi, (%rsp)	# tmp432, %sfp
	vmovdqa	(%rsp), %xmm3	# %sfp, tmp433
# Raytracer_handofdos_r3experimental.c:135:     return (u + 1.0) * 2.328306435454494e-10;
	vcvtsi2sdq	%rdx, %xmm1, %xmm1	# tmp327, tmp326, tmp326
# Raytracer_handofdos_r3experimental.c:242:  				Vector c1 = {.x=17, .y=16, .z=8};
	movl	$1090519040, %edx	#, tmp342
# Raytracer_handofdos_r3experimental.c:135:     return (u + 1.0) * 2.328306435454494e-10;
	vmulsd	%xmm4, %xmm6, %xmm6	# tmp407, tmp312, tmp314
# Raytracer_handofdos_r3experimental.c:242:  				Vector c1 = {.x=17, .y=16, .z=8};
	vpinsrd	$2, %edx, %xmm3, %xmm0	#, tmp342, tmp433, tmp343
# Raytracer_handofdos_r3experimental.c:124:     m_z = 36969 * (m_z & 65535) + (m_z >> 16);
	movzwl	%ax, %edx	# _167, _167
	shrl	$16, %eax	#, _167
	imull	$36969, %edx, %esi	#, _167, tmp345
	movl	%eax, %edx	# _167, tmp346
# Raytracer_handofdos_r3experimental.c:125:     m_w = 18000 * (m_w & 65535) + (m_w >> 16);
	movl	%ecx, %eax	# _172, _172
# Raytracer_handofdos_r3experimental.c:242:  				Vector c1 = {.x=17, .y=16, .z=8};
	vmovaps	%xmm0, (%rsp)	# tmp343, %sfp
# Raytracer_handofdos_r3experimental.c:125:     m_w = 18000 * (m_w & 65535) + (m_w >> 16);
	shrl	$16, %eax	#, _172
# Raytracer_handofdos_r3experimental.c:135:     return (u + 1.0) * 2.328306435454494e-10;
	vaddsd	%xmm5, %xmm1, %xmm1	# tmp406, tmp326, tmp331
# Raytracer_handofdos_r3experimental.c:124:     m_z = 36969 * (m_z & 65535) + (m_z >> 16);
	addl	%esi, %edx	# tmp345, _152
# Raytracer_handofdos_r3experimental.c:125:     m_w = 18000 * (m_w & 65535) + (m_w >> 16);
	movzwl	%cx, %esi	# _172, _172
	imull	$18000, %esi, %esi	#, _172, tmp348
# Raytracer_handofdos_r3experimental.c:140:     return GetUniform();
	vcvtsd2ss	%xmm6, %xmm6, %xmm6	# tmp314, tmp316
# Raytracer_handofdos_r3experimental.c:240:  				Vector t;  t.xmm = a.xmm * (Random() - .5f) * 99 + b.xmm * (Random() - .5f) * 99;
	vsubss	.LC19(%rip), %xmm6, %xmm6	#, tmp316, _67
# Raytracer_handofdos_r3experimental.c:135:     return (u + 1.0) * 2.328306435454494e-10;
	vmulsd	%xmm4, %xmm1, %xmm1	# tmp407, tmp331, tmp333
# Raytracer_handofdos_r3experimental.c:125:     m_w = 18000 * (m_w & 65535) + (m_w >> 16);
	leal	(%rsi,%rax), %ecx	#, _157
# Raytracer_handofdos_r3experimental.c:126:     return (m_z << 16) + m_w;
	movl	%edx, %eax	# _152, tmp350
# Raytracer_handofdos_r3experimental.c:240:  				Vector t;  t.xmm = a.xmm * (Random() - .5f) * 99 + b.xmm * (Random() - .5f) * 99;
	vshufps	$0, %xmm6, %xmm6, %xmm6	# _67, tmp339
# Raytracer_handofdos_r3experimental.c:126:     return (m_z << 16) + m_w;
	sall	$16, %eax	#, tmp350
# Raytracer_handofdos_r3experimental.c:135:     return (u + 1.0) * 2.328306435454494e-10;
	addl	%ecx, %eax	# _157, tmp353
# Raytracer_handofdos_r3experimental.c:140:     return GetUniform();
	vcvtsd2ss	%xmm1, %xmm1, %xmm1	# tmp333, tmp335
# Raytracer_handofdos_r3experimental.c:240:  				Vector t;  t.xmm = a.xmm * (Random() - .5f) * 99 + b.xmm * (Random() - .5f) * 99;
	vsubss	.LC19(%rip), %xmm1, %xmm1	#, tmp335, _68
	vshufps	$0, %xmm1, %xmm1, %xmm1	# _68, tmp337
	vmulps	%xmm7, %xmm1, %xmm1	# _6, tmp337, tmp338
	vfmadd132ps	%xmm8, %xmm1, %xmm6	# _5, tmp338, _14
# Raytracer_handofdos_r3experimental.c:135:     return (u + 1.0) * 2.328306435454494e-10;
	vxorpd	%xmm1, %xmm1, %xmm1	# tmp352
# Raytracer_handofdos_r3experimental.c:245: 				p.xmm += sampler(c1.xmm + t.xmm, c2) * 3.5;
	vfmadd231ps	.LC21(%rip), %xmm6, %xmm0	#, _14, tmp396
# Raytracer_handofdos_r3experimental.c:135:     return (u + 1.0) * 2.328306435454494e-10;
	vcvtsi2sdq	%rax, %xmm1, %xmm1	# tmp353, tmp352, tmp352
# Raytracer_handofdos_r3experimental.c:124:     m_z = 36969 * (m_z & 65535) + (m_z >> 16);
	movzwl	%dx, %eax	# _152, _152
	shrl	$16, %edx	#, tmp364
	imull	$36969, %eax, %eax	#, _152, tmp363
	addl	%eax, %edx	# tmp363, _137
# Raytracer_handofdos_r3experimental.c:125:     m_w = 18000 * (m_w & 65535) + (m_w >> 16);
	movzwl	%cx, %eax	# _157, _157
	shrl	$16, %ecx	#, tmp367
# Raytracer_handofdos_r3experimental.c:135:     return (u + 1.0) * 2.328306435454494e-10;
	vaddsd	%xmm5, %xmm1, %xmm1	# tmp406, tmp352, tmp357
# Raytracer_handofdos_r3experimental.c:125:     m_w = 18000 * (m_w & 65535) + (m_w >> 16);
	imull	$18000, %eax, %eax	#, _157, tmp366
# Raytracer_handofdos_r3experimental.c:124:     m_z = 36969 * (m_z & 65535) + (m_z >> 16);
	movl	%edx, m_z(%rip)	# _137, m_z
# Raytracer_handofdos_r3experimental.c:126:     return (m_z << 16) + m_w;
	sall	$16, %edx	#, tmp368
# Raytracer_handofdos_r3experimental.c:135:     return (u + 1.0) * 2.328306435454494e-10;
	vmulsd	%xmm4, %xmm1, %xmm1	# tmp407, tmp357, tmp359
# Raytracer_handofdos_r3experimental.c:125:     m_w = 18000 * (m_w & 65535) + (m_w >> 16);
	addl	%eax, %ecx	# tmp366, _142
# Raytracer_handofdos_r3experimental.c:135:     return (u + 1.0) * 2.328306435454494e-10;
	leal	(%rdx,%rcx), %eax	#, tmp371
# Raytracer_handofdos_r3experimental.c:125:     m_w = 18000 * (m_w & 65535) + (m_w >> 16);
	movl	%ecx, m_w(%rip)	# _142, m_w
# Raytracer_handofdos_r3experimental.c:135:     return (u + 1.0) * 2.328306435454494e-10;
	vcvtsi2sdq	%rax, %xmm2, %xmm2	# tmp371, tmp370, tmp370
# Raytracer_handofdos_r3experimental.c:140:     return GetUniform();
	vcvtsd2ss	%xmm1, %xmm1, %xmm1	# tmp359, tmp361
# Raytracer_handofdos_r3experimental.c:243:                 __m128 c2 = opNotSSE(t.xmm * -1 + (a.xmm * (Random() + x) + b.xmm * (y + Random()) + c.xmm) * 16);
	vaddss	104(%rsp), %xmm1, %xmm1	# %sfp, tmp361, _73
# Raytracer_handofdos_r3experimental.c:135:     return (u + 1.0) * 2.328306435454494e-10;
	vaddsd	%xmm5, %xmm2, %xmm2	# tmp406, tmp370, tmp375
# Raytracer_handofdos_r3experimental.c:243:                 __m128 c2 = opNotSSE(t.xmm * -1 + (a.xmm * (Random() + x) + b.xmm * (y + Random()) + c.xmm) * 16);
	vshufps	$0, %xmm1, %xmm1, %xmm3	# _73, tmp382
# Raytracer_handofdos_r3experimental.c:135:     return (u + 1.0) * 2.328306435454494e-10;
	vmulsd	%xmm4, %xmm2, %xmm2	# tmp407, tmp375, tmp377
# Raytracer_handofdos_r3experimental.c:140:     return GetUniform();
	vcvtsd2ss	%xmm2, %xmm2, %xmm2	# tmp377, tmp379
# Raytracer_handofdos_r3experimental.c:243:                 __m128 c2 = opNotSSE(t.xmm * -1 + (a.xmm * (Random() + x) + b.xmm * (y + Random()) + c.xmm) * 16);
	vaddss	108(%rsp), %xmm2, %xmm2	# %sfp, tmp379, _74
	vshufps	$0, %xmm2, %xmm2, %xmm2	# _74, tmp380
	vfmadd213ps	80(%rsp), %xmm7, %xmm2	# %sfp, _6, tmp381
	vfmadd132ps	%xmm8, %xmm2, %xmm3	# _5, tmp381, tmp383
	vmulps	.LC20(%rip), %xmm3, %xmm3	#, tmp383, tmp384
	vfnmadd231ps	.LC21(%rip), %xmm6, %xmm3	#, _14, _25
# Raytracer_handofdos_r3experimental.c:61: 	return hsum_ps_SSE3(me*me);
	vmulps	%xmm3, %xmm3, %xmm2	# _25, _25, _111
# /usr/lib/gcc/x86_64-linux-gnu/7/include/pmmintrin.h:58:   return (__m128) __builtin_ia32_haddps ((__v4sf)__X, (__v4sf)__Y);
	vhaddps	%xmm2, %xmm2, %xmm2	# _111, _111, tmp387
	vhaddps	%xmm2, %xmm2, %xmm2	# tmp387, tmp387, tmp388
# Raytracer_handofdos_r3experimental.c:102: 	return me * k / sqrtf(opNormSSE_single(me));
	vsqrtss	%xmm2, %xmm2, %xmm2	# tmp389, _115
	vshufps	$0, %xmm2, %xmm2, %xmm2	# _115, tmp390
	vrcpps	%xmm2, %xmm1	# tmp390, tmp392
	vmulps	%xmm2, %xmm1, %xmm2	# tmp390, tmp392, tmp393
	vmulps	%xmm2, %xmm1, %xmm2	# tmp393, tmp392, tmp393
	vaddps	%xmm1, %xmm1, %xmm1	# tmp392, tmp392, tmp394
	vsubps	%xmm2, %xmm1, %xmm1	# tmp393, tmp394, tmp395
# Raytracer_handofdos_r3experimental.c:245: 				p.xmm += sampler(c1.xmm + t.xmm, c2) * 3.5;
	vmulps	%xmm1, %xmm3, %xmm1	# tmp395, _25,
	call	sampler	#
	vmovaps	16(%rsp), %xmm4	# %sfp, _30
# Raytracer_handofdos_r3experimental.c:239: 			for (int r = 64; r--;) {
	subl	$1, %ebx	#, ivtmp_611
# Raytracer_handofdos_r3experimental.c:245: 				p.xmm += sampler(c1.xmm + t.xmm, c2) * 3.5;
	vfmadd231ps	.LC22(%rip), %xmm0, %xmm4	#, _28, _30
# Raytracer_handofdos_r3experimental.c:239: 			for (int r = 64; r--;) {
	vmovsd	96(%rsp), %xmm5	# %sfp, tmp406
# Raytracer_handofdos_r3experimental.c:245: 				p.xmm += sampler(c1.xmm + t.xmm, c2) * 3.5;
	vmovaps	%xmm4, 16(%rsp)	# _30, %sfp
# Raytracer_handofdos_r3experimental.c:239: 			for (int r = 64; r--;) {
	vmovsd	40(%rsp), %xmm4	# %sfp, tmp407
	jne	.L76	#,
# Raytracer_handofdos_r3experimental.c:248: 			fprintf(out,"%c%c%c", (int) p.x, (int) p.y, (int) p.z);
	vmovaps	16(%rsp), %xmm7	# %sfp, _30
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:97:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	xorl	%eax, %eax	#
	movl	$1, %esi	#,
	movq	%r13, %rdi	# out,
	leaq	.LC23(%rip), %rdx	#,
# Raytracer_handofdos_r3experimental.c:237: 		for (int x = WIDTH; x--;) {
	subl	$1, %r12d	#, x
	vmovsd	%xmm4, 96(%rsp)	# tmp407, %sfp
# Raytracer_handofdos_r3experimental.c:248: 			fprintf(out,"%c%c%c", (int) p.x, (int) p.y, (int) p.z);
	vunpckhps	%xmm7, %xmm7, %xmm1	# _30, _30, tmp399
	vshufps	$85, %xmm7, %xmm7, %xmm0	#, _30, _30, tmp401
	vcvttss2si	%xmm7, %ecx	# _30, tmp404
	vmovsd	%xmm5, 40(%rsp)	# tmp406, %sfp
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:97:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	vcvttss2si	%xmm1, %r9d	# tmp399,
	vcvttss2si	%xmm0, %r8d	# tmp401,
	call	__fprintf_chk@PLT	#
# Raytracer_handofdos_r3experimental.c:237: 		for (int x = WIDTH; x--;) {
	cmpl	$-1, %r12d	#, x
	vmovsd	40(%rsp), %xmm5	# %sfp, tmp406
	vmovsd	96(%rsp), %xmm4	# %sfp, tmp407
	jne	.L77	#,
# Raytracer_handofdos_r3experimental.c:236: 	for (int y = HEIGHT; y > 0; y--) {
	subl	$1, %r14d	#, <retval>
	jne	.L67	#,
# Raytracer_handofdos_r3experimental.c:251: 	fclose(out);
	movq	%r13, %rdi	# out,
	call	fclose@PLT	#
# Raytracer_handofdos_r3experimental.c:252: 	return 0;
	jmp	.L81	#
.L83:
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:97:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$39, %edx	#,
	movq	stderr(%rip), %rcx	# stderr,
	movl	$1, %esi	#,
	leaq	.LC14(%rip), %rdi	#,
# Raytracer_handofdos_r3experimental.c:226: 		return -1;
	movl	$-1, %r14d	#, <retval>
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:97:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	call	fwrite@PLT	#
.L81:
# Raytracer_handofdos_r3experimental.c:253: }
	subq	$-128, %rsp	#,
	.cfi_def_cfa_offset 48
	movl	%r14d, %eax	# <retval>,
	popq	%rbx	#
	.cfi_def_cfa_offset 40
	popq	%rbp	#
	.cfi_def_cfa_offset 32
	popq	%r12	#
	.cfi_def_cfa_offset 24
	popq	%r13	#
	.cfi_def_cfa_offset 16
	popq	%r14	#
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE590:
	.size	main, .-main
	.section	.rodata.str1.1
.LC29:
	.string	"opAdd (%f) times %6.3f secs\n"
	.text
	.p2align 4,,15
	.globl	bench_opAdd
	.type	bench_opAdd, @function
bench_opAdd:
.LFB591:
	.cfi_startproc
	pushq	%rbx	#
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
# Raytracer_handofdos_r3experimental.c:261:     Vector a = {.x=.1, .y = .2, .z = .3};
	movl	$1050253722, %eax	#, tmp102
# Raytracer_handofdos_r3experimental.c:260: {
	subq	$16, %rsp	#,
	.cfi_def_cfa_offset 32
# Raytracer_handofdos_r3experimental.c:261:     Vector a = {.x=.1, .y = .2, .z = .3};
	vmovdqa	.LC30(%rip), %xmm0	#, a
	vpinsrd	$2, %eax, %xmm0, %xmm3	#, tmp102, a, tmp103
	vmovaps	%xmm3, (%rsp)	# tmp103, %sfp
# Raytracer_handofdos_r3experimental.c:263:     clock_t clc = clock();
	call	clock@PLT	#
# Raytracer_handofdos_r3experimental.c:267:         r.xmm += a.xmm;
	vmovaps	(%rsp), %xmm1	# %sfp, _2
	vxorps	%xmm0, %xmm0, %xmm0	# r_xmm_lsm.115
# Raytracer_handofdos_r3experimental.c:263:     clock_t clc = clock();
	movq	%rax, %rbx	#, clc
# Raytracer_handofdos_r3experimental.c:267:         r.xmm += a.xmm;
	movl	$2147483647, %eax	#, ivtmp_30
	.p2align 4,,10
	.p2align 3
.L85:
	vaddps	%xmm1, %xmm0, %xmm0	# _2, r_xmm_lsm.115, r_xmm_lsm.115
# Raytracer_handofdos_r3experimental.c:265:     for (long int i = cycles; i--;)
	subq	$1, %rax	#, ivtmp_30
	jne	.L85	#,
	vmovaps	%xmm0, (%rsp)	# r_xmm_lsm.115, %sfp
# Raytracer_handofdos_r3experimental.c:270:     printf("opAdd (%f) times %6.3f secs\n", r.x, ((float)clock()-clc)/CLOCKS_PER_SEC);
	call	clock@PLT	#
	vxorps	%xmm1, %xmm1, %xmm1	# tmp104
	vxorps	%xmm2, %xmm2, %xmm2	# tmp105
	vmovaps	(%rsp), %xmm0	# %sfp, r_xmm_lsm.115
	vcvtsi2ssq	%rax, %xmm1, %xmm1	# _4, tmp104, tmp104
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:104:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movl	$1, %edi	#,
	movl	$2, %eax	#,
# Raytracer_handofdos_r3experimental.c:270:     printf("opAdd (%f) times %6.3f secs\n", r.x, ((float)clock()-clc)/CLOCKS_PER_SEC);
	vcvtsi2ssq	%rbx, %xmm2, %xmm2	# clc, tmp105, tmp105
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:104:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC29(%rip), %rsi	#,
# Raytracer_handofdos_r3experimental.c:270:     printf("opAdd (%f) times %6.3f secs\n", r.x, ((float)clock()-clc)/CLOCKS_PER_SEC);
	vcvtss2sd	%xmm0, %xmm0, %xmm0	# tmp110, tmp111
	vsubss	%xmm2, %xmm1, %xmm1	# tmp105, tmp104, tmp106
	vmulss	.LC28(%rip), %xmm1, %xmm1	#, tmp106, tmp107
# Raytracer_handofdos_r3experimental.c:271: }
	addq	$16, %rsp	#,
	.cfi_def_cfa_offset 16
	popq	%rbx	#
	.cfi_def_cfa_offset 8
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:104:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	vcvtss2sd	%xmm1, %xmm1, %xmm1	# tmp107,
	jmp	__printf_chk@PLT	#
	.cfi_endproc
.LFE591:
	.size	bench_opAdd, .-bench_opAdd
	.section	.rodata.str1.1
.LC32:
	.string	"opMul (%f) times %6.3f secs\n"
	.text
	.p2align 4,,15
	.globl	bench_opMul
	.type	bench_opMul, @function
bench_opMul:
.LFB592:
	.cfi_startproc
	pushq	%rbx	#
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
# Raytracer_handofdos_r3experimental.c:275:     Vector a = {.x=1.1, .y = .2, .z = .3};
	movl	$1050253722, %eax	#, tmp101
# Raytracer_handofdos_r3experimental.c:274: {
	subq	$16, %rsp	#,
	.cfi_def_cfa_offset 32
# Raytracer_handofdos_r3experimental.c:275:     Vector a = {.x=1.1, .y = .2, .z = .3};
	vmovdqa	.LC33(%rip), %xmm0	#, a
	vpinsrd	$2, %eax, %xmm0, %xmm3	#, tmp101, a, tmp102
	vmovaps	%xmm3, (%rsp)	# tmp102, %sfp
# Raytracer_handofdos_r3experimental.c:276:     clock_t clc = clock();
	call	clock@PLT	#
	vmovaps	(%rsp), %xmm0	# %sfp, a_xmm_lsm.124
	vmovaps	.LC31(%rip), %xmm1	#, tmp112
	movq	%rax, %rbx	#, clc
	movl	$2147483647, %eax	#, ivtmp_27
	.p2align 4,,10
	.p2align 3
.L89:
# Raytracer_handofdos_r3experimental.c:280:         a.xmm *= 1.000001f;
	vmulps	%xmm1, %xmm0, %xmm0	# tmp112, a_xmm_lsm.124, a_xmm_lsm.124
# Raytracer_handofdos_r3experimental.c:278:     for (long int i = cycles; i--;)
	subq	$1, %rax	#, ivtmp_27
	jne	.L89	#,
	vmovaps	%xmm0, (%rsp)	# a_xmm_lsm.124, %sfp
# Raytracer_handofdos_r3experimental.c:283:     printf("opMul (%f) times %6.3f secs\n", a.x, ((float)clock()-clc)/CLOCKS_PER_SEC);
	call	clock@PLT	#
	vxorps	%xmm1, %xmm1, %xmm1	# tmp104
	vxorps	%xmm2, %xmm2, %xmm2	# tmp105
	vmovaps	(%rsp), %xmm0	# %sfp, a_xmm_lsm.124
	vcvtsi2ssq	%rax, %xmm1, %xmm1	# _3, tmp104, tmp104
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:104:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movl	$1, %edi	#,
	movl	$2, %eax	#,
# Raytracer_handofdos_r3experimental.c:283:     printf("opMul (%f) times %6.3f secs\n", a.x, ((float)clock()-clc)/CLOCKS_PER_SEC);
	vcvtsi2ssq	%rbx, %xmm2, %xmm2	# clc, tmp105, tmp105
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:104:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC32(%rip), %rsi	#,
# Raytracer_handofdos_r3experimental.c:283:     printf("opMul (%f) times %6.3f secs\n", a.x, ((float)clock()-clc)/CLOCKS_PER_SEC);
	vcvtss2sd	%xmm0, %xmm0, %xmm0	# tmp110, tmp111
	vsubss	%xmm2, %xmm1, %xmm1	# tmp105, tmp104, tmp106
	vmulss	.LC28(%rip), %xmm1, %xmm1	#, tmp106, tmp107
# Raytracer_handofdos_r3experimental.c:284: }
	addq	$16, %rsp	#,
	.cfi_def_cfa_offset 16
	popq	%rbx	#
	.cfi_def_cfa_offset 8
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:104:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	vcvtss2sd	%xmm1, %xmm1, %xmm1	# tmp107,
	jmp	__printf_chk@PLT	#
	.cfi_endproc
.LFE592:
	.size	bench_opMul, .-bench_opMul
	.section	.rodata.str1.1
.LC36:
	.string	"opNorm (%f) times %6.3f secs\n"
	.text
	.p2align 4,,15
	.globl	bench_opNorm
	.type	bench_opNorm, @function
bench_opNorm:
.LFB593:
	.cfi_startproc
	pushq	%rbx	#
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
# Raytracer_handofdos_r3experimental.c:288:     Vector a = {.x=.1, .y = .2, .z = .3};
	movl	$1050253722, %eax	#, tmp105
# Raytracer_handofdos_r3experimental.c:287: {
	subq	$16, %rsp	#,
	.cfi_def_cfa_offset 32
# Raytracer_handofdos_r3experimental.c:288:     Vector a = {.x=.1, .y = .2, .z = .3};
	vmovdqa	.LC30(%rip), %xmm0	#, a
	vpinsrd	$2, %eax, %xmm0, %xmm0	#, tmp105, a, tmp106
	vmovaps	%xmm0, (%rsp)	# tmp106, %sfp
# Raytracer_handofdos_r3experimental.c:290:     clock_t clc = clock();
	call	clock@PLT	#
# Raytracer_handofdos_r3experimental.c:57: 	return hsum_ps_SSE3(me*r);
	vmovdqa	(%rsp), %xmm0	# %sfp, tmp106
# Raytracer_handofdos_r3experimental.c:290:     clock_t clc = clock();
	movq	%rax, %rbx	#, clc
# Raytracer_handofdos_r3experimental.c:57: 	return hsum_ps_SSE3(me*r);
	vmulps	%xmm0, %xmm0, %xmm0	# tmp106, tmp106, _25
# /usr/lib/gcc/x86_64-linux-gnu/7/include/pmmintrin.h:58:   return (__m128) __builtin_ia32_haddps ((__v4sf)__X, (__v4sf)__Y);
	vhaddps	%xmm0, %xmm0, %xmm0	# _25, _25, tmp107
	vhaddps	%xmm0, %xmm0, %xmm0	# tmp107, tmp107, tmp108
# Raytracer_handofdos_r3experimental.c:295:         res += opNormSSE(r.xmm, a.xmm);
	vmulss	.LC34(%rip), %xmm0, %xmm1	#, _28, tmp109
	vfmadd132ss	.LC35(%rip), %xmm1, %xmm0	#, tmp109, _28
	vmovss	%xmm0, (%rsp)	# _28, %sfp
# Raytracer_handofdos_r3experimental.c:298:     printf("opNorm (%f) times %6.3f secs\n", res, ((float)clock()-clc)/CLOCKS_PER_SEC);
	call	clock@PLT	#
	vxorps	%xmm1, %xmm1, %xmm1	# tmp112
	vxorps	%xmm0, %xmm0, %xmm0	# tmp113
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:104:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC36(%rip), %rsi	#,
# Raytracer_handofdos_r3experimental.c:298:     printf("opNorm (%f) times %6.3f secs\n", res, ((float)clock()-clc)/CLOCKS_PER_SEC);
	vcvtsi2ssq	%rbx, %xmm0, %xmm0	# clc, tmp113, tmp113
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:104:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movl	$1, %edi	#,
# Raytracer_handofdos_r3experimental.c:298:     printf("opNorm (%f) times %6.3f secs\n", res, ((float)clock()-clc)/CLOCKS_PER_SEC);
	vcvtsi2ssq	%rax, %xmm1, %xmm1	# _2, tmp112, tmp112
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:104:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movl	$2, %eax	#,
# Raytracer_handofdos_r3experimental.c:298:     printf("opNorm (%f) times %6.3f secs\n", res, ((float)clock()-clc)/CLOCKS_PER_SEC);
	vsubss	%xmm0, %xmm1, %xmm1	# tmp113, tmp112, tmp114
	vmulss	.LC28(%rip), %xmm1, %xmm1	#, tmp114, tmp115
	vxorpd	%xmm0, %xmm0, %xmm0	# tmp118
	vcvtss2sd	(%rsp), %xmm0, %xmm0	# %sfp, tmp118, tmp118
# Raytracer_handofdos_r3experimental.c:299: }
	addq	$16, %rsp	#,
	.cfi_def_cfa_offset 16
	popq	%rbx	#
	.cfi_def_cfa_offset 8
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:104:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	vcvtss2sd	%xmm1, %xmm1, %xmm1	# tmp115,
	jmp	__printf_chk@PLT	#
	.cfi_endproc
.LFE593:
	.size	bench_opNorm, .-bench_opNorm
	.section	.rodata.str1.8
	.align 8
.LC37:
	.string	"opCross (%f) times %6.3f secs\n"
	.text
	.p2align 4,,15
	.globl	bench_opCross
	.type	bench_opCross, @function
bench_opCross:
.LFB594:
	.cfi_startproc
	pushq	%rbx	#
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
# Raytracer_handofdos_r3experimental.c:303:     Vector a = {.x=.1, .y = .2, .z = .3};
	movl	$1050253722, %eax	#, tmp109
# Raytracer_handofdos_r3experimental.c:302: {
	subq	$16, %rsp	#,
	.cfi_def_cfa_offset 32
# Raytracer_handofdos_r3experimental.c:303:     Vector a = {.x=.1, .y = .2, .z = .3};
	vmovdqa	.LC30(%rip), %xmm2	#, a
	vpinsrd	$2, %eax, %xmm2, %xmm2	#, tmp109, a, tmp110
	vmovaps	%xmm2, (%rsp)	# tmp110, %sfp
# Raytracer_handofdos_r3experimental.c:305:     clock_t clc = clock();
	call	clock@PLT	#
	vmovdqa	(%rsp), %xmm2	# %sfp, tmp110
	movq	%rax, %rbx	#, clc
# /usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h:746:   return (__m128) __builtin_ia32_shufps ((__v4sf)__A, (__v4sf)__B, __mask);
	movl	$2147483647, %eax	#, ivtmp_36
	vmovaps	%xmm2, %xmm0	# tmp110, r_xmm_lsm.143
	vshufps	$210, %xmm2, %xmm2, %xmm3	#, tmp110, tmp110, _27
	vshufps	$201, %xmm2, %xmm2, %xmm2	#, tmp110, tmp110, _30
	.p2align 4,,10
	.p2align 3
.L95:
	vshufps	$201, %xmm0, %xmm0, %xmm1	#, r_xmm_lsm.143, r_xmm_lsm.143, tmp117
	vshufps	$210, %xmm0, %xmm0, %xmm0	#, r_xmm_lsm.143, r_xmm_lsm.143, tmp120
# Raytracer_handofdos_r3experimental.c:85:     shuf_me2 *= shuf_r2;
	vmulps	%xmm2, %xmm0, %xmm0	# _30, tmp120, shuf_me2
# Raytracer_handofdos_r3experimental.c:87: 	return shuf_me1 - shuf_me2;
	vfmsub231ps	%xmm3, %xmm1, %xmm0	# _27, tmp117, r_xmm_lsm.143
# Raytracer_handofdos_r3experimental.c:307:     for (long int i = cycles; i--;)
	subq	$1, %rax	#, ivtmp_36
	jne	.L95	#,
	vmovaps	%xmm0, (%rsp)	# r_xmm_lsm.143, %sfp
# Raytracer_handofdos_r3experimental.c:312:     printf("opCross (%f) times %6.3f secs\n", r.x, ((float)clock()-clc)/CLOCKS_PER_SEC);
	call	clock@PLT	#
	vxorps	%xmm1, %xmm1, %xmm1	# tmp124
	vxorps	%xmm2, %xmm2, %xmm2	# tmp125
	vmovaps	(%rsp), %xmm0	# %sfp, r_xmm_lsm.143
	vcvtsi2ssq	%rax, %xmm1, %xmm1	# _3, tmp124, tmp124
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:104:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movl	$1, %edi	#,
	movl	$2, %eax	#,
# Raytracer_handofdos_r3experimental.c:312:     printf("opCross (%f) times %6.3f secs\n", r.x, ((float)clock()-clc)/CLOCKS_PER_SEC);
	vcvtsi2ssq	%rbx, %xmm2, %xmm2	# clc, tmp125, tmp125
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:104:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC37(%rip), %rsi	#,
# Raytracer_handofdos_r3experimental.c:312:     printf("opCross (%f) times %6.3f secs\n", r.x, ((float)clock()-clc)/CLOCKS_PER_SEC);
	vcvtss2sd	%xmm0, %xmm0, %xmm0	# tmp130, tmp131
	vsubss	%xmm2, %xmm1, %xmm1	# tmp125, tmp124, tmp126
	vmulss	.LC28(%rip), %xmm1, %xmm1	#, tmp126, tmp127
# Raytracer_handofdos_r3experimental.c:313: }
	addq	$16, %rsp	#,
	.cfi_def_cfa_offset 16
	popq	%rbx	#
	.cfi_def_cfa_offset 8
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:104:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	vcvtss2sd	%xmm1, %xmm1, %xmm1	# tmp127,
	jmp	__printf_chk@PLT	#
	.cfi_endproc
.LFE594:
	.size	bench_opCross, .-bench_opCross
	.section	.rodata.str1.1
.LC38:
	.string	"opNot (%f) times %6.3f secs\n"
	.text
	.p2align 4,,15
	.globl	bench_opNot
	.type	bench_opNot, @function
bench_opNot:
.LFB595:
	.cfi_startproc
	pushq	%rbx	#
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
# Raytracer_handofdos_r3experimental.c:317:     Vector a = {.x=.1, .y = .2, .z = .3};
	movl	$1050253722, %eax	#, tmp107
# Raytracer_handofdos_r3experimental.c:316: {
	subq	$16, %rsp	#,
	.cfi_def_cfa_offset 32
# Raytracer_handofdos_r3experimental.c:317:     Vector a = {.x=.1, .y = .2, .z = .3};
	vmovdqa	.LC30(%rip), %xmm0	#, a
	vpinsrd	$2, %eax, %xmm0, %xmm3	#, tmp107, a, tmp108
	vmovaps	%xmm3, (%rsp)	# tmp108, %sfp
# Raytracer_handofdos_r3experimental.c:318:     clock_t clc = clock();
	call	clock@PLT	#
	vmovaps	(%rsp), %xmm2	# %sfp, a_xmm_lsm.152
	movq	%rax, %rbx	#, clc
	movl	$2147483647, %eax	#, ivtmp_33
	.p2align 4,,10
	.p2align 3
.L99:
# Raytracer_handofdos_r3experimental.c:61: 	return hsum_ps_SSE3(me*me);
	vmulps	%xmm2, %xmm2, %xmm0	# a_xmm_lsm.152, a_xmm_lsm.152, _23
# /usr/lib/gcc/x86_64-linux-gnu/7/include/pmmintrin.h:58:   return (__m128) __builtin_ia32_haddps ((__v4sf)__X, (__v4sf)__Y);
	vhaddps	%xmm0, %xmm0, %xmm0	# _23, _23, tmp109
	vhaddps	%xmm0, %xmm0, %xmm0	# tmp109, tmp109, tmp110
# Raytracer_handofdos_r3experimental.c:102: 	return me * k / sqrtf(opNormSSE_single(me));
	vsqrtss	%xmm0, %xmm0, %xmm0	# tmp111, _27
	vshufps	$0, %xmm0, %xmm0, %xmm0	# _27, tmp112
	vrcpps	%xmm0, %xmm1	# tmp112, tmp118
	vmulps	%xmm0, %xmm1, %xmm0	# tmp112, tmp118, tmp119
	vmulps	%xmm0, %xmm1, %xmm0	# tmp119, tmp118, tmp119
	vaddps	%xmm1, %xmm1, %xmm1	# tmp118, tmp118, tmp120
	vsubps	%xmm0, %xmm1, %xmm0	# tmp119, tmp120, tmp121
	vmulps	%xmm0, %xmm2, %xmm2	# tmp121, a_xmm_lsm.152, a_xmm_lsm.152
# Raytracer_handofdos_r3experimental.c:320:     for (long int i = cycles; i--;)
	subq	$1, %rax	#, ivtmp_33
	jne	.L99	#,
	vmovaps	%xmm2, (%rsp)	# a_xmm_lsm.152, %sfp
# Raytracer_handofdos_r3experimental.c:325:     printf("opNot (%f) times %6.3f secs\n", a.x, ((float)clock()-clc)/CLOCKS_PER_SEC);
	call	clock@PLT	#
	vxorps	%xmm1, %xmm1, %xmm1	# tmp122
	vxorps	%xmm0, %xmm0, %xmm0	# tmp123
	vmovaps	(%rsp), %xmm2	# %sfp, a_xmm_lsm.152
	vcvtsi2ssq	%rbx, %xmm0, %xmm0	# clc, tmp123, tmp123
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:104:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC38(%rip), %rsi	#,
	movl	$1, %edi	#,
# Raytracer_handofdos_r3experimental.c:325:     printf("opNot (%f) times %6.3f secs\n", a.x, ((float)clock()-clc)/CLOCKS_PER_SEC);
	vcvtsi2ssq	%rax, %xmm1, %xmm1	# _2, tmp122, tmp122
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:104:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movl	$2, %eax	#,
# Raytracer_handofdos_r3experimental.c:325:     printf("opNot (%f) times %6.3f secs\n", a.x, ((float)clock()-clc)/CLOCKS_PER_SEC);
	vsubss	%xmm0, %xmm1, %xmm1	# tmp123, tmp122, tmp124
	vmulss	.LC28(%rip), %xmm1, %xmm1	#, tmp124, tmp125
# Raytracer_handofdos_r3experimental.c:326: }
	addq	$16, %rsp	#,
	.cfi_def_cfa_offset 16
# Raytracer_handofdos_r3experimental.c:325:     printf("opNot (%f) times %6.3f secs\n", a.x, ((float)clock()-clc)/CLOCKS_PER_SEC);
	vxorpd	%xmm0, %xmm0, %xmm0	# tmp129
# Raytracer_handofdos_r3experimental.c:326: }
	popq	%rbx	#
	.cfi_def_cfa_offset 8
# Raytracer_handofdos_r3experimental.c:325:     printf("opNot (%f) times %6.3f secs\n", a.x, ((float)clock()-clc)/CLOCKS_PER_SEC);
	vcvtss2sd	%xmm2, %xmm0, %xmm0	# tmp128, tmp129, tmp129
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:104:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	vcvtss2sd	%xmm1, %xmm1, %xmm1	# tmp125,
	jmp	__printf_chk@PLT	#
	.cfi_endproc
.LFE595:
	.size	bench_opNot, .-bench_opNot
	.section	.rodata.str1.1
.LC39:
	.string	"Random (%f) times %6.3f secs\n"
	.text
	.p2align 4,,15
	.globl	bench_opRand
	.type	bench_opRand, @function
bench_opRand:
.LFB596:
	.cfi_startproc
	pushq	%rbx	#
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	subq	$16, %rsp	#,
	.cfi_def_cfa_offset 32
# Raytracer_handofdos_r3experimental.c:330:     clock_t clc = clock();
	call	clock@PLT	#
	movl	m_z(%rip), %ecx	# m_z, m_z_lsm.161
	movl	m_w(%rip), %edx	# m_w, m_w_lsm.163
	movl	$2147483647, %esi	#, ivtmp_95
	vmovsd	.LC0(%rip), %xmm3	#, tmp136
	vmovsd	.LC1(%rip), %xmm2	#, tmp137
	movq	%rax, %rbx	#, clc
# Raytracer_handofdos_r3experimental.c:331:     float res = 0;
	vxorps	%xmm0, %xmm0, %xmm0	# res
	.p2align 4,,10
	.p2align 3
.L105:
# Raytracer_handofdos_r3experimental.c:124:     m_z = 36969 * (m_z & 65535) + (m_z >> 16);
	movzwl	%cx, %eax	# m_z_lsm.161, m_z_lsm.161
	shrl	$16, %ecx	#, tmp113
# Raytracer_handofdos_r3experimental.c:135:     return (u + 1.0) * 2.328306435454494e-10;
	vxorpd	%xmm1, %xmm1, %xmm1	# tmp119
# Raytracer_handofdos_r3experimental.c:124:     m_z = 36969 * (m_z & 65535) + (m_z >> 16);
	imull	$36969, %eax, %eax	#, m_z_lsm.161, tmp112
	addl	%eax, %ecx	# tmp112, m_z_lsm.161
# Raytracer_handofdos_r3experimental.c:125:     m_w = 18000 * (m_w & 65535) + (m_w >> 16);
	movzwl	%dx, %eax	# m_w_lsm.163, m_w_lsm.163
	shrl	$16, %edx	#, tmp116
	imull	$18000, %eax, %eax	#, m_w_lsm.163, tmp115
	addl	%eax, %edx	# tmp115, m_w_lsm.163
# Raytracer_handofdos_r3experimental.c:126:     return (m_z << 16) + m_w;
	movl	%ecx, %eax	# m_z_lsm.161, tmp117
	sall	$16, %eax	#, tmp117
# Raytracer_handofdos_r3experimental.c:135:     return (u + 1.0) * 2.328306435454494e-10;
	addl	%edx, %eax	# m_w_lsm.163, tmp120
	vcvtsi2sdq	%rax, %xmm1, %xmm1	# tmp120, tmp119, tmp119
	vaddsd	%xmm3, %xmm1, %xmm1	# tmp136, tmp119, tmp124
	vmulsd	%xmm2, %xmm1, %xmm1	# tmp137, tmp124, tmp126
# Raytracer_handofdos_r3experimental.c:140:     return GetUniform();
	vcvtsd2ss	%xmm1, %xmm1, %xmm1	# tmp126, tmp128
# Raytracer_handofdos_r3experimental.c:335:         res += Random();
	vaddss	%xmm1, %xmm0, %xmm0	# tmp128, res, res
# Raytracer_handofdos_r3experimental.c:333:     for (long int i = cycles; i--;)
	subq	$1, %rsi	#, ivtmp_95
	jne	.L105	#,
	vmovss	%xmm0, 12(%rsp)	# res, %sfp
	movl	%ecx, m_z(%rip)	# m_z_lsm.161, m_z
	movl	%edx, m_w(%rip)	# m_w_lsm.163, m_w
# Raytracer_handofdos_r3experimental.c:338:     printf("Random (%f) times %6.3f secs\n", res, ((float)clock()-clc)/CLOCKS_PER_SEC);
	call	clock@PLT	#
	vxorps	%xmm1, %xmm1, %xmm1	# tmp129
	vxorps	%xmm2, %xmm2, %xmm2	# tmp130
	vmovss	12(%rsp), %xmm0	# %sfp, res
	vcvtsi2ssq	%rax, %xmm1, %xmm1	# _2, tmp129, tmp129
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:104:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movl	$1, %edi	#,
	movl	$2, %eax	#,
# Raytracer_handofdos_r3experimental.c:338:     printf("Random (%f) times %6.3f secs\n", res, ((float)clock()-clc)/CLOCKS_PER_SEC);
	vcvtsi2ssq	%rbx, %xmm2, %xmm2	# clc, tmp130, tmp130
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:104:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC39(%rip), %rsi	#,
# Raytracer_handofdos_r3experimental.c:338:     printf("Random (%f) times %6.3f secs\n", res, ((float)clock()-clc)/CLOCKS_PER_SEC);
	vcvtss2sd	%xmm0, %xmm0, %xmm0	# res, tmp135
	vsubss	%xmm2, %xmm1, %xmm1	# tmp130, tmp129, tmp131
	vmulss	.LC28(%rip), %xmm1, %xmm1	#, tmp131, tmp132
# Raytracer_handofdos_r3experimental.c:339: }
	addq	$16, %rsp	#,
	.cfi_def_cfa_offset 16
	popq	%rbx	#
	.cfi_def_cfa_offset 8
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:104:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	vcvtss2sd	%xmm1, %xmm1, %xmm1	# tmp132,
	jmp	__printf_chk@PLT	#
	.cfi_endproc
.LFE596:
	.size	bench_opRand, .-bench_opRand
	.p2align 4,,15
	.globl	benchOps
	.type	benchOps, @function
benchOps:
.LFB597:
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
# Raytracer_handofdos_r3experimental.c:261:     Vector a = {.x=.1, .y = .2, .z = .3};
	movl	$1050253722, %eax	#, tmp192
# Raytracer_handofdos_r3experimental.c:344: {
	pushq	%rbx	#
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$40, %rsp	#,
	.cfi_def_cfa_offset 64
# Raytracer_handofdos_r3experimental.c:261:     Vector a = {.x=.1, .y = .2, .z = .3};
	vmovdqa	.LC30(%rip), %xmm0	#, a
	vpinsrd	$2, %eax, %xmm0, %xmm4	#, tmp192, a, tmp193
	vmovaps	%xmm4, (%rsp)	# tmp193, %sfp
# Raytracer_handofdos_r3experimental.c:263:     clock_t clc = clock();
	call	clock@PLT	#
# Raytracer_handofdos_r3experimental.c:267:         r.xmm += a.xmm;
	vmovaps	(%rsp), %xmm1	# %sfp, _95
	vxorps	%xmm0, %xmm0, %xmm0	# r_xmm_lsm.182
# Raytracer_handofdos_r3experimental.c:263:     clock_t clc = clock();
	movq	%rax, %rbx	#, clc
# Raytracer_handofdos_r3experimental.c:267:         r.xmm += a.xmm;
	movl	$2147483647, %eax	#, ivtmp_302
	.p2align 4,,10
	.p2align 3
.L109:
	vaddps	%xmm1, %xmm0, %xmm0	# _95, r_xmm_lsm.182, r_xmm_lsm.182
# Raytracer_handofdos_r3experimental.c:265:     for (long int i = cycles; i--;)
	subq	$1, %rax	#, ivtmp_302
	jne	.L109	#,
	vmovaps	%xmm0, (%rsp)	# r_xmm_lsm.182, %sfp
# Raytracer_handofdos_r3experimental.c:270:     printf("opAdd (%f) times %6.3f secs\n", r.x, ((float)clock()-clc)/CLOCKS_PER_SEC);
	call	clock@PLT	#
	vxorps	%xmm1, %xmm1, %xmm1	# tmp194
	vxorps	%xmm2, %xmm2, %xmm2	# tmp195
	vmovaps	(%rsp), %xmm0	# %sfp, r_xmm_lsm.182
	vcvtsi2ssq	%rbx, %xmm2, %xmm2	# clc, tmp195, tmp195
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:104:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC29(%rip), %rsi	#,
	movl	$1, %edi	#,
# Raytracer_handofdos_r3experimental.c:270:     printf("opAdd (%f) times %6.3f secs\n", r.x, ((float)clock()-clc)/CLOCKS_PER_SEC);
	vcvtsi2ssq	%rax, %xmm1, %xmm1	# _99, tmp194, tmp194
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:104:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movl	$2, %eax	#,
# Raytracer_handofdos_r3experimental.c:270:     printf("opAdd (%f) times %6.3f secs\n", r.x, ((float)clock()-clc)/CLOCKS_PER_SEC);
	vcvtss2sd	%xmm0, %xmm0, %xmm0	# tmp200, tmp201
	vsubss	%xmm2, %xmm1, %xmm1	# tmp195, tmp194, tmp196
	vmulss	.LC28(%rip), %xmm1, %xmm1	#, tmp196, tmp197
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:104:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	vcvtss2sd	%xmm1, %xmm1, %xmm1	# tmp197,
	call	__printf_chk@PLT	#
# Raytracer_handofdos_r3experimental.c:275:     Vector a = {.x=1.1, .y = .2, .z = .3};
	movl	$1050253722, %eax	#, tmp204
	vmovdqa	.LC33(%rip), %xmm0	#, a
	vpinsrd	$2, %eax, %xmm0, %xmm5	#, tmp204, a, tmp205
	vmovaps	%xmm5, (%rsp)	# tmp205, %sfp
# Raytracer_handofdos_r3experimental.c:276:     clock_t clc = clock();
	call	clock@PLT	#
	vmovaps	(%rsp), %xmm0	# %sfp, a_xmm_lsm.180
	vmovaps	.LC31(%rip), %xmm1	#, tmp306
	movq	%rax, %rbx	#, clc
	movl	$2147483647, %eax	#, ivtmp_304
	.p2align 4,,10
	.p2align 3
.L110:
# Raytracer_handofdos_r3experimental.c:280:         a.xmm *= 1.000001f;
	vmulps	%xmm1, %xmm0, %xmm0	# tmp306, a_xmm_lsm.180, a_xmm_lsm.180
# Raytracer_handofdos_r3experimental.c:278:     for (long int i = cycles; i--;)
	subq	$1, %rax	#, ivtmp_304
	jne	.L110	#,
	vmovaps	%xmm0, (%rsp)	# a_xmm_lsm.180, %sfp
# Raytracer_handofdos_r3experimental.c:288:     Vector a = {.x=.1, .y = .2, .z = .3};
	movl	$1050253722, %ebp	#, tmp217
# Raytracer_handofdos_r3experimental.c:283:     printf("opMul (%f) times %6.3f secs\n", a.x, ((float)clock()-clc)/CLOCKS_PER_SEC);
	call	clock@PLT	#
	vxorps	%xmm1, %xmm1, %xmm1	# tmp207
	vxorps	%xmm2, %xmm2, %xmm2	# tmp208
	vmovaps	(%rsp), %xmm0	# %sfp, a_xmm_lsm.180
	vcvtsi2ssq	%rbx, %xmm2, %xmm2	# clc, tmp208, tmp208
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:104:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC32(%rip), %rsi	#,
	movl	$1, %edi	#,
# Raytracer_handofdos_r3experimental.c:283:     printf("opMul (%f) times %6.3f secs\n", a.x, ((float)clock()-clc)/CLOCKS_PER_SEC);
	vcvtsi2ssq	%rax, %xmm1, %xmm1	# _85, tmp207, tmp207
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:104:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movl	$2, %eax	#,
# Raytracer_handofdos_r3experimental.c:283:     printf("opMul (%f) times %6.3f secs\n", a.x, ((float)clock()-clc)/CLOCKS_PER_SEC);
	vcvtss2sd	%xmm0, %xmm0, %xmm0	# tmp213, tmp214
	vsubss	%xmm2, %xmm1, %xmm1	# tmp208, tmp207, tmp209
	vmulss	.LC28(%rip), %xmm1, %xmm1	#, tmp209, tmp210
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:104:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	vcvtss2sd	%xmm1, %xmm1, %xmm1	# tmp210,
	call	__printf_chk@PLT	#
# Raytracer_handofdos_r3experimental.c:288:     Vector a = {.x=.1, .y = .2, .z = .3};
	vmovdqa	.LC30(%rip), %xmm2	#, a
	vpinsrd	$2, %ebp, %xmm2, %xmm0	#, tmp217, a, tmp218
	vmovaps	%xmm2, 16(%rsp)	# a, %sfp
	vmovaps	%xmm0, (%rsp)	# tmp218, %sfp
# Raytracer_handofdos_r3experimental.c:290:     clock_t clc = clock();
	call	clock@PLT	#
# Raytracer_handofdos_r3experimental.c:57: 	return hsum_ps_SSE3(me*r);
	vmovdqa	(%rsp), %xmm0	# %sfp, tmp218
# Raytracer_handofdos_r3experimental.c:290:     clock_t clc = clock();
	movq	%rax, %rbx	#, clc
# Raytracer_handofdos_r3experimental.c:57: 	return hsum_ps_SSE3(me*r);
	vmulps	%xmm0, %xmm0, %xmm0	# tmp218, tmp218, _64
# /usr/lib/gcc/x86_64-linux-gnu/7/include/pmmintrin.h:58:   return (__m128) __builtin_ia32_haddps ((__v4sf)__X, (__v4sf)__Y);
	vhaddps	%xmm0, %xmm0, %xmm0	# _64, _64, tmp219
	vhaddps	%xmm0, %xmm0, %xmm0	# tmp219, tmp219, tmp220
# Raytracer_handofdos_r3experimental.c:295:         res += opNormSSE(r.xmm, a.xmm);
	vmulss	.LC34(%rip), %xmm0, %xmm1	#, _67, tmp221
	vfmadd132ss	.LC35(%rip), %xmm1, %xmm0	#, tmp221, _67
	vmovss	%xmm0, (%rsp)	# _67, %sfp
# Raytracer_handofdos_r3experimental.c:298:     printf("opNorm (%f) times %6.3f secs\n", res, ((float)clock()-clc)/CLOCKS_PER_SEC);
	call	clock@PLT	#
	vxorps	%xmm1, %xmm1, %xmm1	# tmp224
	vxorps	%xmm0, %xmm0, %xmm0	# tmp225
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:104:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC36(%rip), %rsi	#,
# Raytracer_handofdos_r3experimental.c:298:     printf("opNorm (%f) times %6.3f secs\n", res, ((float)clock()-clc)/CLOCKS_PER_SEC);
	vcvtsi2ssq	%rbx, %xmm0, %xmm0	# clc, tmp225, tmp225
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:104:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movl	$1, %edi	#,
# Raytracer_handofdos_r3experimental.c:298:     printf("opNorm (%f) times %6.3f secs\n", res, ((float)clock()-clc)/CLOCKS_PER_SEC);
	vcvtsi2ssq	%rax, %xmm1, %xmm1	# _72, tmp224, tmp224
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:104:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movl	$2, %eax	#,
# Raytracer_handofdos_r3experimental.c:298:     printf("opNorm (%f) times %6.3f secs\n", res, ((float)clock()-clc)/CLOCKS_PER_SEC);
	vsubss	%xmm0, %xmm1, %xmm1	# tmp225, tmp224, tmp226
	vmulss	.LC28(%rip), %xmm1, %xmm1	#, tmp226, tmp227
	vxorpd	%xmm0, %xmm0, %xmm0	# tmp230
	vcvtss2sd	(%rsp), %xmm0, %xmm0	# %sfp, tmp230, tmp230
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:104:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	vcvtss2sd	%xmm1, %xmm1, %xmm1	# tmp227,
	call	__printf_chk@PLT	#
# Raytracer_handofdos_r3experimental.c:303:     Vector a = {.x=.1, .y = .2, .z = .3};
	vmovdqa	16(%rsp), %xmm2	# %sfp, a
	movq	$0, 8(%rsp)	#, %sfp
	vmovq	%xmm2, (%rsp)	# a, %sfp
	vmovdqa	(%rsp), %xmm6	# %sfp, tmp314
	vpinsrd	$2, %ebp, %xmm6, %xmm2	#, tmp217, tmp314, tmp234
	vmovaps	%xmm2, (%rsp)	# tmp234, %sfp
# Raytracer_handofdos_r3experimental.c:305:     clock_t clc = clock();
	call	clock@PLT	#
	vmovdqa	(%rsp), %xmm2	# %sfp, tmp234
	movq	%rax, %rbx	#, clc
# /usr/lib/gcc/x86_64-linux-gnu/7/include/xmmintrin.h:746:   return (__m128) __builtin_ia32_shufps ((__v4sf)__A, (__v4sf)__B, __mask);
	movl	$2147483647, %eax	#, ivtmp_308
	vmovaps	%xmm2, %xmm0	# tmp234, r_xmm_lsm.178
	vshufps	$210, %xmm2, %xmm2, %xmm3	#, tmp234, tmp234, _46
	vshufps	$201, %xmm2, %xmm2, %xmm2	#, tmp234, tmp234, _49
	.p2align 4,,10
	.p2align 3
.L111:
	vshufps	$201, %xmm0, %xmm0, %xmm1	#, r_xmm_lsm.178, r_xmm_lsm.178, tmp241
	vshufps	$210, %xmm0, %xmm0, %xmm0	#, r_xmm_lsm.178, r_xmm_lsm.178, tmp244
# Raytracer_handofdos_r3experimental.c:85:     shuf_me2 *= shuf_r2;
	vmulps	%xmm2, %xmm0, %xmm0	# _49, tmp244, shuf_me2
# Raytracer_handofdos_r3experimental.c:87: 	return shuf_me1 - shuf_me2;
	vfmsub231ps	%xmm3, %xmm1, %xmm0	# _46, tmp241, r_xmm_lsm.178
# Raytracer_handofdos_r3experimental.c:307:     for (long int i = cycles; i--;)
	subq	$1, %rax	#, ivtmp_308
	jne	.L111	#,
	vmovaps	%xmm0, (%rsp)	# r_xmm_lsm.178, %sfp
# Raytracer_handofdos_r3experimental.c:312:     printf("opCross (%f) times %6.3f secs\n", r.x, ((float)clock()-clc)/CLOCKS_PER_SEC);
	call	clock@PLT	#
	vxorps	%xmm1, %xmm1, %xmm1	# tmp248
	vxorps	%xmm2, %xmm2, %xmm2	# tmp249
	vmovaps	(%rsp), %xmm0	# %sfp, r_xmm_lsm.178
	vcvtsi2ssq	%rbx, %xmm2, %xmm2	# clc, tmp249, tmp249
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:104:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC37(%rip), %rsi	#,
	movl	$1, %edi	#,
# Raytracer_handofdos_r3experimental.c:312:     printf("opCross (%f) times %6.3f secs\n", r.x, ((float)clock()-clc)/CLOCKS_PER_SEC);
	vcvtsi2ssq	%rax, %xmm1, %xmm1	# _54, tmp248, tmp248
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:104:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movl	$2, %eax	#,
# Raytracer_handofdos_r3experimental.c:312:     printf("opCross (%f) times %6.3f secs\n", r.x, ((float)clock()-clc)/CLOCKS_PER_SEC);
	vcvtss2sd	%xmm0, %xmm0, %xmm0	# tmp254, tmp255
	vsubss	%xmm2, %xmm1, %xmm1	# tmp249, tmp248, tmp250
	vmulss	.LC28(%rip), %xmm1, %xmm1	#, tmp250, tmp251
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:104:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	vcvtss2sd	%xmm1, %xmm1, %xmm1	# tmp251,
	call	__printf_chk@PLT	#
# Raytracer_handofdos_r3experimental.c:317:     Vector a = {.x=.1, .y = .2, .z = .3};
	movl	$1050253722, %eax	#, tmp258
	vmovdqa	.LC30(%rip), %xmm0	#, a
	vpinsrd	$2, %eax, %xmm0, %xmm7	#, tmp258, a, tmp259
	vmovaps	%xmm7, (%rsp)	# tmp259, %sfp
# Raytracer_handofdos_r3experimental.c:318:     clock_t clc = clock();
	call	clock@PLT	#
	vmovaps	(%rsp), %xmm2	# %sfp, a_xmm_lsm.176
	movq	%rax, %rbx	#, clc
	movl	$2147483647, %eax	#, ivtmp_209
	.p2align 4,,10
	.p2align 3
.L112:
# Raytracer_handofdos_r3experimental.c:61: 	return hsum_ps_SSE3(me*me);
	vmulps	%xmm2, %xmm2, %xmm0	# a_xmm_lsm.176, a_xmm_lsm.176, _25
# /usr/lib/gcc/x86_64-linux-gnu/7/include/pmmintrin.h:58:   return (__m128) __builtin_ia32_haddps ((__v4sf)__X, (__v4sf)__Y);
	vhaddps	%xmm0, %xmm0, %xmm0	# _25, _25, tmp260
	vhaddps	%xmm0, %xmm0, %xmm0	# tmp260, tmp260, tmp261
# Raytracer_handofdos_r3experimental.c:102: 	return me * k / sqrtf(opNormSSE_single(me));
	vsqrtss	%xmm0, %xmm0, %xmm0	# tmp262, _29
	vshufps	$0, %xmm0, %xmm0, %xmm0	# _29, tmp263
	vrcpps	%xmm0, %xmm1	# tmp263, tmp269
	vmulps	%xmm0, %xmm1, %xmm0	# tmp263, tmp269, tmp270
	vmulps	%xmm0, %xmm1, %xmm0	# tmp270, tmp269, tmp270
	vaddps	%xmm1, %xmm1, %xmm1	# tmp269, tmp269, tmp271
	vsubps	%xmm0, %xmm1, %xmm0	# tmp270, tmp271, tmp272
	vmulps	%xmm0, %xmm2, %xmm2	# tmp272, a_xmm_lsm.176, a_xmm_lsm.176
# Raytracer_handofdos_r3experimental.c:320:     for (long int i = cycles; i--;)
	subq	$1, %rax	#, ivtmp_209
	jne	.L112	#,
	vmovaps	%xmm2, (%rsp)	# a_xmm_lsm.176, %sfp
# Raytracer_handofdos_r3experimental.c:325:     printf("opNot (%f) times %6.3f secs\n", a.x, ((float)clock()-clc)/CLOCKS_PER_SEC);
	call	clock@PLT	#
	vxorps	%xmm1, %xmm1, %xmm1	# tmp273
	vxorps	%xmm0, %xmm0, %xmm0	# tmp274
	vmovaps	(%rsp), %xmm2	# %sfp, a_xmm_lsm.176
	vcvtsi2ssq	%rbx, %xmm0, %xmm0	# clc, tmp274, tmp274
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:104:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC38(%rip), %rsi	#,
	movl	$1, %edi	#,
# Raytracer_handofdos_r3experimental.c:325:     printf("opNot (%f) times %6.3f secs\n", a.x, ((float)clock()-clc)/CLOCKS_PER_SEC);
	vcvtsi2ssq	%rax, %xmm1, %xmm1	# _34, tmp273, tmp273
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:104:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movl	$2, %eax	#,
# Raytracer_handofdos_r3experimental.c:325:     printf("opNot (%f) times %6.3f secs\n", a.x, ((float)clock()-clc)/CLOCKS_PER_SEC);
	vsubss	%xmm0, %xmm1, %xmm1	# tmp274, tmp273, tmp275
	vmulss	.LC28(%rip), %xmm1, %xmm1	#, tmp275, tmp276
	vxorpd	%xmm0, %xmm0, %xmm0	# tmp280
	vcvtss2sd	%xmm2, %xmm0, %xmm0	# tmp279, tmp280, tmp280
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:104:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	vcvtss2sd	%xmm1, %xmm1, %xmm1	# tmp276,
	call	__printf_chk@PLT	#
# Raytracer_handofdos_r3experimental.c:330:     clock_t clc = clock();
	call	clock@PLT	#
	movl	m_z(%rip), %ecx	# m_z, m_z_lsm.172
	movl	m_w(%rip), %edx	# m_w, m_w_lsm.174
	movl	$2147483647, %esi	#, ivtmp_186
	vmovsd	.LC0(%rip), %xmm3	#, tmp307
	vmovsd	.LC1(%rip), %xmm2	#, tmp308
	movq	%rax, %rbx	#, clc
# Raytracer_handofdos_r3experimental.c:331:     float res = 0;
	vxorps	%xmm0, %xmm0, %xmm0	# res
	.p2align 4,,10
	.p2align 3
.L115:
# Raytracer_handofdos_r3experimental.c:124:     m_z = 36969 * (m_z & 65535) + (m_z >> 16);
	movzwl	%cx, %eax	# m_z_lsm.172, m_z_lsm.172
	shrl	$16, %ecx	#, tmp283
# Raytracer_handofdos_r3experimental.c:135:     return (u + 1.0) * 2.328306435454494e-10;
	vxorpd	%xmm1, %xmm1, %xmm1	# tmp289
# Raytracer_handofdos_r3experimental.c:124:     m_z = 36969 * (m_z & 65535) + (m_z >> 16);
	imull	$36969, %eax, %eax	#, m_z_lsm.172, tmp282
	addl	%eax, %ecx	# tmp282, m_z_lsm.172
# Raytracer_handofdos_r3experimental.c:125:     m_w = 18000 * (m_w & 65535) + (m_w >> 16);
	movzwl	%dx, %eax	# m_w_lsm.174, m_w_lsm.174
	shrl	$16, %edx	#, tmp286
	imull	$18000, %eax, %eax	#, m_w_lsm.174, tmp285
	addl	%eax, %edx	# tmp285, m_w_lsm.174
# Raytracer_handofdos_r3experimental.c:126:     return (m_z << 16) + m_w;
	movl	%ecx, %eax	# m_z_lsm.172, tmp287
	sall	$16, %eax	#, tmp287
# Raytracer_handofdos_r3experimental.c:135:     return (u + 1.0) * 2.328306435454494e-10;
	addl	%edx, %eax	# m_w_lsm.174, tmp290
	vcvtsi2sdq	%rax, %xmm1, %xmm1	# tmp290, tmp289, tmp289
	vaddsd	%xmm3, %xmm1, %xmm1	# tmp307, tmp289, tmp294
	vmulsd	%xmm2, %xmm1, %xmm1	# tmp308, tmp294, tmp296
# Raytracer_handofdos_r3experimental.c:140:     return GetUniform();
	vcvtsd2ss	%xmm1, %xmm1, %xmm1	# tmp296, tmp298
# Raytracer_handofdos_r3experimental.c:335:         res += Random();
	vaddss	%xmm1, %xmm0, %xmm0	# tmp298, res, res
# Raytracer_handofdos_r3experimental.c:333:     for (long int i = cycles; i--;)
	subq	$1, %rsi	#, ivtmp_186
	jne	.L115	#,
	vmovss	%xmm0, (%rsp)	# res, %sfp
	movl	%ecx, m_z(%rip)	# m_z_lsm.172, m_z
	movl	%edx, m_w(%rip)	# m_w_lsm.174, m_w
# Raytracer_handofdos_r3experimental.c:338:     printf("Random (%f) times %6.3f secs\n", res, ((float)clock()-clc)/CLOCKS_PER_SEC);
	call	clock@PLT	#
	vxorps	%xmm1, %xmm1, %xmm1	# tmp299
	vxorps	%xmm2, %xmm2, %xmm2	# tmp300
	vmovss	(%rsp), %xmm0	# %sfp, res
	vcvtsi2ssq	%rax, %xmm1, %xmm1	# _15, tmp299, tmp299
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:104:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movl	$1, %edi	#,
	movl	$2, %eax	#,
# Raytracer_handofdos_r3experimental.c:338:     printf("Random (%f) times %6.3f secs\n", res, ((float)clock()-clc)/CLOCKS_PER_SEC);
	vcvtsi2ssq	%rbx, %xmm2, %xmm2	# clc, tmp300, tmp300
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:104:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC39(%rip), %rsi	#,
# Raytracer_handofdos_r3experimental.c:338:     printf("Random (%f) times %6.3f secs\n", res, ((float)clock()-clc)/CLOCKS_PER_SEC);
	vcvtss2sd	%xmm0, %xmm0, %xmm0	# res, tmp305
	vsubss	%xmm2, %xmm1, %xmm1	# tmp300, tmp299, tmp301
	vmulss	.LC28(%rip), %xmm1, %xmm1	#, tmp301, tmp302
# Raytracer_handofdos_r3experimental.c:351: }
	addq	$40, %rsp	#,
	.cfi_def_cfa_offset 24
	popq	%rbx	#
	.cfi_def_cfa_offset 16
	popq	%rbp	#
	.cfi_def_cfa_offset 8
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:104:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	vcvtss2sd	%xmm1, %xmm1, %xmm1	# tmp302,
	jmp	__printf_chk@PLT	#
	.cfi_endproc
.LFE597:
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
	.align 8
.LC1:
	.long	4290772992
	.long	1039138815
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC2:
	.long	2147483648
	.long	0
	.long	0
	.long	0
	.section	.rodata.cst8
	.align 8
.LC3:
	.long	1202590843
	.long	1065646817
	.section	.rodata.cst4,"aM",@progbits,4
	.align 4
.LC4:
	.long	1065353216
	.align 4
.LC7:
	.long	1091567616
	.align 4
.LC8:
	.long	1098907648
	.section	.rodata.cst16
	.align 16
.LC9:
	.long	3221225472
	.long	3221225472
	.long	3221225472
	.long	3221225472
	.align 16
.LC10:
	.long	1045220557
	.long	1045220557
	.long	1045220557
	.long	1045220557
	.section	.rodata.cst4
	.align 4
.LC11:
	.long	1045220557
	.align 4
.LC12:
	.long	1036831949
	.section	.rodata.cst16
	.align 16
.LC13:
	.long	1056964608
	.long	1056964608
	.long	1056964608
	.long	1056964608
	.align 16
.LC17:
	.long	990057071
	.long	990057071
	.long	990057071
	.long	990057071
	.align 16
.LC18:
	.long	3279945728
	.long	3279945728
	.long	3279945728
	.long	3279945728
	.section	.rodata.cst4
	.align 4
.LC19:
	.long	1056964608
	.section	.rodata.cst16
	.align 16
.LC20:
	.long	1098907648
	.long	1098907648
	.long	1098907648
	.long	1098907648
	.align 16
.LC21:
	.long	1120272384
	.long	1120272384
	.long	1120272384
	.long	1120272384
	.align 16
.LC22:
	.long	1080033280
	.long	1080033280
	.long	1080033280
	.long	1080033280
	.align 16
.LC27:
	.quad	-4503599624136687616
	.quad	0
	.section	.rodata.cst4
	.align 4
.LC28:
	.long	897988541
	.section	.rodata.cst16
	.align 16
.LC30:
	.quad	4489188110458735821
	.quad	0
	.align 16
.LC31:
	.long	1065353224
	.long	1065353224
	.long	1065353224
	.long	1065353224
	.align 16
.LC33:
	.quad	4489188110488095949
	.quad	0
	.section	.rodata.cst4
	.align 4
.LC34:
	.long	1088421888
	.align 4
.LC35:
	.long	1325400064
	.ident	"GCC: (Ubuntu 7.3.0-16ubuntu3) 7.3.0"
	.section	.note.GNU-stack,"",@progbits
