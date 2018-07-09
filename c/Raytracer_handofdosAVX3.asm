	.file	"Raytracer_handofdos_r3experimental.c"
	.text
	.p2align 4,,15
	.globl	hsum_ps_SSE1
	.type	hsum_ps_SSE1, @function
hsum_ps_SSE1:
.LFB578:
	.cfi_startproc
	vshufps	$177, %xmm0, %xmm0, %xmm1
	vaddps	%xmm1, %xmm0, %xmm0
	vmovhlps	%xmm0, %xmm1, %xmm1
	vaddss	%xmm1, %xmm0, %xmm0
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
	vhaddps	%xmm0, %xmm0, %xmm0
	vhaddps	%xmm0, %xmm0, %xmm0
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
	vmulps	%xmm1, %xmm0, %xmm1
	vhaddps	%xmm1, %xmm1, %xmm1
	vhaddps	%xmm1, %xmm1, %xmm1
	vmovaps	%xmm1, %xmm0
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
	vmulps	%xmm0, %xmm0, %xmm0
	vhaddps	%xmm0, %xmm0, %xmm0
	vhaddps	%xmm0, %xmm0, %xmm0
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
	vshufps	$85, %xmm1, %xmm1, %xmm4
	vshufps	$85, %xmm0, %xmm0, %xmm2
	vmulss	%xmm4, %xmm2, %xmm2
	vmovaps	%xmm0, %xmm3
	vunpckhps	%xmm0, %xmm0, %xmm4
	vfmadd132ss	%xmm1, %xmm2, %xmm3
	vshufps	$255, %xmm0, %xmm0, %xmm2
	vshufps	$255, %xmm1, %xmm1, %xmm0
	vunpckhps	%xmm1, %xmm1, %xmm1
	vmulss	%xmm0, %xmm2, %xmm2
	vfmadd132ss	%xmm4, %xmm2, %xmm1
	vaddss	%xmm1, %xmm3, %xmm0
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
	vshufps	$201, %xmm0, %xmm0, %xmm2
	vshufps	$210, %xmm1, %xmm1, %xmm3
	vshufps	$210, %xmm0, %xmm0, %xmm0
	vshufps	$201, %xmm1, %xmm1, %xmm1
	vmulps	%xmm1, %xmm0, %xmm0
	vfmsub231ps	%xmm3, %xmm2, %xmm0
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
	vmulps	%xmm0, %xmm0, %xmm1
	vhaddps	%xmm1, %xmm1, %xmm1
	vhaddps	%xmm1, %xmm1, %xmm1
	vsqrtss	%xmm1, %xmm1, %xmm1
	vshufps	$0, %xmm1, %xmm1, %xmm1
	vrcpps	%xmm1, %xmm2
	vmulps	%xmm1, %xmm2, %xmm1
	vmulps	%xmm1, %xmm2, %xmm1
	vaddps	%xmm2, %xmm2, %xmm2
	vsubps	%xmm1, %xmm2, %xmm1
	vmulps	%xmm1, %xmm0, %xmm0
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
	movl	m_z(%rip), %eax
	movl	m_w(%rip), %ecx
	movzwl	%ax, %edx
	shrl	$16, %eax
	imull	$36969, %edx, %edx
	addl	%eax, %edx
	movzwl	%cx, %eax
	shrl	$16, %ecx
	imull	$18000, %eax, %eax
	movl	%edx, m_z(%rip)
	sall	$16, %edx
	addl	%ecx, %eax
	movl	%eax, m_w(%rip)
	addl	%edx, %eax
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
	movl	m_z(%rip), %edx
	movl	m_w(%rip), %ecx
	vxorpd	%xmm0, %xmm0, %xmm0
	movzwl	%dx, %eax
	shrl	$16, %edx
	imull	$36969, %eax, %eax
	addl	%edx, %eax
	movzwl	%cx, %edx
	shrl	$16, %ecx
	imull	$18000, %edx, %edx
	movl	%eax, m_z(%rip)
	sall	$16, %eax
	addl	%ecx, %edx
	addl	%edx, %eax
	movl	%edx, m_w(%rip)
	vcvtsi2sdq	%rax, %xmm0, %xmm0
	vaddsd	.LC0(%rip), %xmm0, %xmm0
	vmulsd	.LC1(%rip), %xmm0, %xmm0
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
	movl	m_z(%rip), %edx
	movl	m_w(%rip), %ecx
	vxorpd	%xmm0, %xmm0, %xmm0
	movzwl	%dx, %eax
	shrl	$16, %edx
	imull	$36969, %eax, %eax
	addl	%edx, %eax
	movzwl	%cx, %edx
	shrl	$16, %ecx
	imull	$18000, %edx, %edx
	movl	%eax, m_z(%rip)
	sall	$16, %eax
	addl	%ecx, %edx
	addl	%edx, %eax
	movl	%edx, m_w(%rip)
	vcvtsi2sdq	%rax, %xmm0, %xmm0
	vaddsd	.LC0(%rip), %xmm0, %xmm0
	vmulsd	.LC1(%rip), %xmm0, %xmm0
	vcvtsd2ss	%xmm0, %xmm0, %xmm0
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
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	vunpckhps	%xmm0, %xmm0, %xmm2
	pushq	-8(%r10)
	vunpckhps	%xmm1, %xmm1, %xmm3
	pushq	%rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp
	pushq	%r12
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x70,0x6
	.cfi_escape 0x10,0xc,0x2,0x76,0x78
	pushq	%rbx
	.cfi_escape 0x10,0x3,0x2,0x76,0x68
	vmovsd	.LC3(%rip), %xmm7
	vmovss	.LC2(%rip), %xmm6
	vxorps	%xmm6, %xmm2, %xmm2
	vdivss	%xmm3, %xmm2, %xmm2
	vxorpd	%xmm3, %xmm3, %xmm3
	vcvtss2sd	%xmm2, %xmm3, %xmm3
	vcomisd	%xmm7, %xmm3
	jbe	.L37
	vmovss	%xmm2, (%rdi)
	vpxor	%xmm2, %xmm2, %xmm2
	movl	$1, %eax
	vmovaps	%xmm2, (%rsi)
	movl	$0x3f800000, 8(%rsi)
.L19:
	movl	$-18, %r9d
	leaq	G(%rip), %r8
	movl	$1, %ebx
	vmovss	.LC4(%rip), %xmm5
	movabsq	$-4294967296, %r11
	movl	$-4, %r10d
	vxorps	%xmm4, %xmm4, %xmm4
	.p2align 4,,10
	.p2align 3
.L27:
	vxorps	%xmm9, %xmm9, %xmm9
	movl	%r9d, %ecx
	movl	$8, %edx
	vcvtsi2ss	%r9d, %xmm9, %xmm9
	negl	%ecx
	shlx	%ecx, %ebx, %ecx
	.p2align 4,,10
	.p2align 3
.L25:
	testl	%ecx, (%r8,%rdx,4)
	je	.L20
	movq	-96(%rbp), %r12
	movl	$0, -72(%rbp)
	movl	%r12d, %r12d
	movq	%r12, -96(%rbp)
	movq	-88(%rbp), %r12
	andq	%r11, %r12
	movq	%r12, -88(%rbp)
	movl	%r10d, %r12d
	vmovdqa	-96(%rbp), %xmm3
	subl	%edx, %r12d
	vpinsrd	$3, -72(%rbp), %xmm3, %xmm8
	vxorps	%xmm3, %xmm3, %xmm3
	vcvtsi2ss	%r12d, %xmm3, %xmm3
	vmovss	%xmm9, %xmm8, %xmm2
	vmovd	%xmm3, %r12d
	vpinsrd	$2, %r12d, %xmm2, %xmm3
	vmovaps	%xmm3, -96(%rbp)
	vaddps	%xmm3, %xmm0, %xmm3
	vmulps	%xmm1, %xmm3, %xmm2
	vhaddps	%xmm2, %xmm2, %xmm2
	vhaddps	%xmm2, %xmm2, %xmm2
	vmovaps	%xmm2, %xmm8
	vmulps	%xmm3, %xmm3, %xmm2
	vhaddps	%xmm2, %xmm2, %xmm2
	vhaddps	%xmm2, %xmm2, %xmm2
	vsubss	%xmm5, %xmm2, %xmm2
	vfmsub231ss	%xmm8, %xmm8, %xmm2
	vcomiss	%xmm4, %xmm2
	jbe	.L20
	vcvtss2sd	%xmm2, %xmm2, %xmm2
	vsqrtsd	%xmm2, %xmm2, %xmm2
	vxorps	%xmm6, %xmm8, %xmm8
	vcvtss2sd	%xmm8, %xmm8, %xmm8
	vsubsd	%xmm2, %xmm8, %xmm2
	vcvtsd2ss	%xmm2, %xmm2, %xmm2
	vcomiss	(%rdi), %xmm2
	jnb	.L20
	vxorpd	%xmm8, %xmm8, %xmm8
	vcvtss2sd	%xmm2, %xmm8, %xmm8
	vcomisd	%xmm7, %xmm8
	jbe	.L20
	vmovss	%xmm2, (%rdi)
	vshufps	$0, %xmm2, %xmm2, %xmm2
	vfmadd231ps	%xmm1, %xmm2, %xmm3
	movl	$2, %eax
	vmulps	%xmm3, %xmm3, %xmm2
	vhaddps	%xmm2, %xmm2, %xmm2
	vhaddps	%xmm2, %xmm2, %xmm2
	vsqrtss	%xmm2, %xmm2, %xmm2
	vshufps	$0, %xmm2, %xmm2, %xmm2
	vrcpps	%xmm2, %xmm8
	vmulps	%xmm2, %xmm8, %xmm2
	vmulps	%xmm2, %xmm8, %xmm2
	vaddps	%xmm8, %xmm8, %xmm8
	vsubps	%xmm2, %xmm8, %xmm2
	vmulps	%xmm2, %xmm3, %xmm2
	vmovaps	%xmm2, (%rsi)
	.p2align 4,,10
	.p2align 3
.L20:
	subq	$1, %rdx
	cmpq	$-1, %rdx
	jne	.L25
	addl	$1, %r9d
	cmpl	$1, %r9d
	jne	.L27
	popq	%rbx
	popq	%r10
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	popq	%r12
	popq	%rbp
	leaq	-8(%r10), %rsp
	.cfi_def_cfa 7, 8
	ret
.L37:
	.cfi_restore_state
	movl	$0x4e6e6b28, (%rdi)
	xorl	%eax, %eax
	jmp	.L19
	.cfi_endproc
.LFE588:
	.size	tracer, .-tracer
	.p2align 4,,15
	.globl	sampler
	.type	sampler, @function
sampler:
.LFB589:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	vmovaps	%xmm1, %xmm10
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	subq	$64, %rsp
	.cfi_def_cfa_offset 96
	movq	%fs:40, %rax
	movq	%rax, 56(%rsp)
	xorl	%eax, %eax
	leaq	32(%rsp), %rbp
	leaq	28(%rsp), %rbx
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	tracer
	testl	%eax, %eax
	jne	.L43
	vmovss	.LC4(%rip), %xmm0
	vunpckhps	%xmm1, %xmm1, %xmm10
	movabsq	$4546834186571559731, %rax
	movl	$0, 44(%rsp)
	movq	%rax, 32(%rsp)
	vsubss	%xmm10, %xmm0, %xmm0
	movl	$1065353216, 40(%rsp)
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vmulsd	%xmm0, %xmm0, %xmm0
	vmulsd	%xmm0, %xmm0, %xmm0
	vcvtsd2ss	%xmm0, %xmm0, %xmm0
	vshufps	$0, %xmm0, %xmm0, %xmm0
	vmulps	32(%rsp), %xmm0, %xmm0
.L42:
	movq	56(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L61
	addq	$64, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L43:
	.cfi_restore_state
	movl	%eax, %r12d
	vmovaps	%xmm0, %xmm11
	movl	m_z(%rip), %eax
	vbroadcastss	28(%rsp), %xmm0
	vmovsd	.LC0(%rip), %xmm4
	vmovsd	.LC1(%rip), %xmm3
	vxorps	%xmm14, %xmm14, %xmm14
	movzwl	%ax, %ecx
	shrl	$16, %eax
	vfmadd231ps	%xmm1, %xmm0, %xmm11
	vxorpd	%xmm0, %xmm0, %xmm0
	imull	$36969, %ecx, %ecx
	vmovss	.LC7(%rip), %xmm2
	addl	%eax, %ecx
	movl	m_w(%rip), %eax
	movzwl	%ax, %edx
	shrl	$16, %eax
	imull	$18000, %edx, %edx
	addl	%eax, %edx
	movl	%ecx, %eax
	sall	$16, %eax
	addl	%edx, %eax
	vcvtsi2sdq	%rax, %xmm0, %xmm0
	movzwl	%cx, %eax
	shrl	$16, %ecx
	imull	$36969, %eax, %eax
	vaddsd	%xmm4, %xmm0, %xmm0
	addl	%eax, %ecx
	movzwl	%dx, %eax
	shrl	$16, %edx
	imull	$18000, %eax, %eax
	movl	%ecx, m_z(%rip)
	sall	$16, %ecx
	vmulsd	%xmm3, %xmm0, %xmm0
	addl	%eax, %edx
	leal	(%rcx,%rdx), %eax
	movl	%edx, m_w(%rip)
	vcvtsd2ss	%xmm0, %xmm0, %xmm0
	vaddss	%xmm2, %xmm0, %xmm0
	vinsertps	$0xe, %xmm0, %xmm0, %xmm1
	vxorpd	%xmm0, %xmm0, %xmm0
	vcvtsi2sdq	%rax, %xmm0, %xmm0
	vaddsd	%xmm4, %xmm0, %xmm0
	vmulsd	%xmm3, %xmm0, %xmm0
	vmovaps	32(%rsp), %xmm3
	vmulps	.LC9(%rip), %xmm3, %xmm13
	vmulps	%xmm10, %xmm3, %xmm4
	vcvtsd2ss	%xmm0, %xmm0, %xmm0
	vaddss	%xmm2, %xmm0, %xmm0
	vhaddps	%xmm4, %xmm4, %xmm4
	vmovd	%xmm0, %eax
	vpinsrd	$1, %eax, %xmm1, %xmm0
	movl	.LC8(%rip), %eax
	vhaddps	%xmm4, %xmm4, %xmm4
	vpinsrd	$2, %eax, %xmm0, %xmm0
	vsubps	%xmm11, %xmm0, %xmm0
	vpermilps	$0, %xmm4, %xmm4
	vfmadd132ps	%xmm4, %xmm10, %xmm13
	vmulps	%xmm0, %xmm0, %xmm2
	vhaddps	%xmm2, %xmm2, %xmm2
	vhaddps	%xmm2, %xmm2, %xmm2
	vsqrtss	%xmm2, %xmm2, %xmm2
	vshufps	$0, %xmm2, %xmm2, %xmm2
	vrcpps	%xmm2, %xmm12
	vmulps	%xmm2, %xmm12, %xmm2
	vmulps	%xmm2, %xmm12, %xmm2
	vaddps	%xmm12, %xmm12, %xmm12
	vsubps	%xmm2, %xmm12, %xmm12
	vmulps	%xmm12, %xmm0, %xmm12
	vmulps	%xmm12, %xmm3, %xmm3
	vhaddps	%xmm3, %xmm3, %xmm3
	vhaddps	%xmm3, %xmm3, %xmm3
	vcomiss	%xmm3, %xmm14
	vmovaps	%xmm3, %xmm10
	jbe	.L62
.L49:
	vxorps	%xmm10, %xmm10, %xmm10
.L50:
	andl	$1, %r12d
	je	.L52
	vmulps	.LC10(%rip), %xmm11, %xmm11
	vroundss	$10, %xmm11, %xmm0, %xmm0
	vshufps	$85, %xmm11, %xmm11, %xmm11
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vroundss	$10, %xmm11, %xmm11, %xmm11
	vcvtss2sd	%xmm11, %xmm11, %xmm11
	vaddsd	%xmm11, %xmm0, %xmm0
	vcvttsd2si	%xmm0, %eax
	andl	$1, %eax
	jne	.L63
	movq	$0, (%rsp)
	movq	$0, 8(%rsp)
	vmovdqa	(%rsp), %xmm5
	vpinsrd	$3, %eax, %xmm5, %xmm7
	movabsq	$4629700418014806016, %rax
	vmovaps	%xmm7, (%rsp)
	movq	%rax, (%rsp)
	vmovdqa	(%rsp), %xmm7
	movl	$1077936128, %eax
	vpinsrd	$2, %eax, %xmm7, %xmm6
	vmovaps	%xmm6, (%rsp)
.L54:
	vmovss	.LC11(%rip), %xmm0
	vfmadd213ss	.LC12(%rip), %xmm10, %xmm0
	vshufps	$0, %xmm0, %xmm0, %xmm0
	vmulps	(%rsp), %xmm0, %xmm0
	jmp	.L42
	.p2align 4,,10
	.p2align 3
.L62:
	vmovaps	%xmm11, %xmm0
	vmovaps	%xmm12, %xmm1
	call	tracer
	vmulps	%xmm12, %xmm13, %xmm0
	vhaddps	%xmm0, %xmm0, %xmm0
	vhaddps	%xmm0, %xmm0, %xmm0
	testl	%eax, %eax
	jne	.L49
	vcomiss	%xmm14, %xmm10
	jbe	.L50
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vmulsd	%xmm0, %xmm0, %xmm14
	vmulsd	%xmm14, %xmm14, %xmm14
	vmulsd	%xmm14, %xmm14, %xmm14
	vmulsd	%xmm14, %xmm14, %xmm14
	vmulsd	%xmm14, %xmm14, %xmm14
	vmulsd	%xmm0, %xmm14, %xmm0
	vmulsd	%xmm0, %xmm0, %xmm14
	vmulsd	%xmm0, %xmm14, %xmm14
	vcvtsd2ss	%xmm14, %xmm14, %xmm14
	jmp	.L50
	.p2align 4,,10
	.p2align 3
.L63:
	movabsq	$4575657222486360064, %rax
	xorl	%edx, %edx
	movq	%rax, (%rsp)
	movl	$1065353216, %eax
	movq	%rdx, 8(%rsp)
	vmovdqa	(%rsp), %xmm6
	vpinsrd	$2, %eax, %xmm6, %xmm5
	vmovaps	%xmm5, (%rsp)
	jmp	.L54
	.p2align 4,,10
	.p2align 3
.L52:
	vpxor	%xmm0, %xmm0, %xmm0
	vmovd	%xmm14, %eax
	vpinsrd	$3, %r12d, %xmm0, %xmm1
	vmovss	%xmm14, %xmm1, %xmm0
	vmovaps	%xmm13, %xmm1
	vpinsrd	$1, %eax, %xmm0, %xmm0
	vpinsrd	$2, %eax, %xmm0, %xmm2
	vmovaps	%xmm11, %xmm0
	vmovaps	%xmm2, (%rsp)
	call	sampler
	vmovdqa	(%rsp), %xmm2
	vfmadd132ps	.LC13(%rip), %xmm2, %xmm0
	jmp	.L42
.L61:
	call	__stack_chk_fail@PLT
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
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	addq	$-128, %rsp
	.cfi_def_cfa_offset 176
	cmpl	$1, %edi
	je	.L83
	movq	8(%rsi), %rdi
	leaq	.LC15(%rip), %rsi
	movl	$512, %r14d
	xorl	%ebp, %ebp
	call	fopen@PLT
	movl	$512, %r8d
	movl	$512, %ecx
	leaq	.LC16(%rip), %rdx
	movq	%rax, %rdi
	movq	%rax, %r13
	movl	$1, %esi
	xorl	%eax, %eax
	call	__fprintf_chk@PLT
	vmovdqa	.LC27(%rip), %xmm2
	movl	.LC4(%rip), %eax
	vmulps	%xmm2, %xmm2, %xmm0
	vhaddps	%xmm0, %xmm0, %xmm0
	vhaddps	%xmm0, %xmm0, %xmm0
	vsqrtss	%xmm0, %xmm0, %xmm0
	vshufps	$0, %xmm0, %xmm0, %xmm0
	vrcpps	%xmm0, %xmm1
	vmulps	%xmm0, %xmm1, %xmm0
	vmulps	%xmm0, %xmm1, %xmm0
	vaddps	%xmm1, %xmm1, %xmm1
	vsubps	%xmm0, %xmm1, %xmm0
	vmulps	%xmm2, %xmm0, %xmm1
	vpxor	%xmm0, %xmm0, %xmm0
	vpinsrd	$2, %eax, %xmm0, %xmm0
	vshufps	$201, %xmm0, %xmm0, %xmm5
	vshufps	$210, %xmm0, %xmm0, %xmm0
	vshufps	$201, %xmm1, %xmm1, %xmm4
	vmulps	%xmm4, %xmm0, %xmm0
	vshufps	$210, %xmm1, %xmm1, %xmm3
	vfmsub132ps	%xmm3, %xmm0, %xmm5
	vmulps	%xmm5, %xmm5, %xmm0
	vhaddps	%xmm0, %xmm0, %xmm0
	vhaddps	%xmm0, %xmm0, %xmm0
	vsqrtss	%xmm0, %xmm0, %xmm0
	vshufps	$0, %xmm0, %xmm0, %xmm0
	vrcpps	%xmm0, %xmm2
	vmulps	%xmm0, %xmm2, %xmm0
	vmulps	%xmm0, %xmm2, %xmm0
	vaddps	%xmm2, %xmm2, %xmm2
	vsubps	%xmm0, %xmm2, %xmm0
	vmulps	%xmm0, %xmm5, %xmm5
	vmovaps	.LC17(%rip), %xmm0
	vmulps	%xmm0, %xmm5, %xmm7
	vshufps	$201, %xmm7, %xmm7, %xmm5
	vmulps	%xmm3, %xmm5, %xmm3
	vshufps	$210, %xmm7, %xmm7, %xmm2
	vmovsd	.LC0(%rip), %xmm5
	vmovaps	%xmm7, 48(%rsp)
	vfmsub132ps	%xmm2, %xmm3, %xmm4
	vmulps	%xmm4, %xmm4, %xmm2
	vhaddps	%xmm2, %xmm2, %xmm2
	vhaddps	%xmm2, %xmm2, %xmm2
	vsqrtss	%xmm2, %xmm2, %xmm2
	vshufps	$0, %xmm2, %xmm2, %xmm2
	vrcpps	%xmm2, %xmm3
	vmulps	%xmm2, %xmm3, %xmm2
	vmulps	%xmm2, %xmm3, %xmm2
	vaddps	%xmm3, %xmm3, %xmm3
	vsubps	%xmm2, %xmm3, %xmm2
	vmulps	%xmm2, %xmm4, %xmm2
	vmulps	%xmm0, %xmm2, %xmm4
	vaddps	%xmm7, %xmm4, %xmm0
	vmovaps	%xmm4, 64(%rsp)
	vfmadd132ps	.LC18(%rip), %xmm1, %xmm0
	vmovsd	.LC1(%rip), %xmm4
	vmovaps	%xmm0, 80(%rsp)
.L67:
	vxorps	%xmm7, %xmm7, %xmm7
	movl	$511, %r12d
	vcvtsi2ss	%r14d, %xmm7, %xmm7
	vmovss	%xmm7, 108(%rsp)
	.p2align 4,,10
	.p2align 3
.L77:
	vmovdqa	112(%rsp), %xmm7
	movl	$64, %ebx
	movabsq	$4706261611697930240, %rax
	vpinsrd	$3, %ebp, %xmm7, %xmm7
	vmovaps	%xmm7, 112(%rsp)
	movq	%rax, 112(%rsp)
	vmovdqa	112(%rsp), %xmm7
	movl	$1095761920, %eax
	vpinsrd	$2, %eax, %xmm7, %xmm0
	vxorps	%xmm7, %xmm7, %xmm7
	vcvtsi2ss	%r12d, %xmm7, %xmm7
	vmovaps	%xmm0, 112(%rsp)
	vmovaps	%xmm0, 16(%rsp)
	vmovss	%xmm7, 104(%rsp)
	.p2align 4,,10
	.p2align 3
.L76:
	movl	m_z(%rip), %ecx
	vxorpd	%xmm6, %xmm6, %xmm6
	vxorpd	%xmm1, %xmm1, %xmm1
	vxorpd	%xmm2, %xmm2, %xmm2
	movl	m_w(%rip), %edi
	vmovdqa	(%rsp), %xmm0
	vmovsd	%xmm5, 96(%rsp)
	movzwl	%cx, %esi
	shrl	$16, %ecx
	vmovaps	64(%rsp), %xmm7
	vmovaps	48(%rsp), %xmm8
	imull	$36969, %esi, %esi
	movzwl	%di, %edx
	shrl	$16, %edi
	vpinsrd	$3, %ebp, %xmm0, %xmm3
	imull	$18000, %edx, %edx
	vmovaps	%xmm3, (%rsp)
	vmovsd	%xmm4, 40(%rsp)
	addl	%esi, %ecx
	movl	%ecx, %eax
	addl	%edx, %edi
	sall	$16, %eax
	leal	(%rax,%rdi), %esi
	movzwl	%cx, %eax
	imull	$36969, %eax, %eax
	vcvtsi2sdq	%rsi, %xmm6, %xmm6
	movl	%ecx, %esi
	movzwl	%di, %ecx
	shrl	$16, %edi
	shrl	$16, %esi
	imull	$18000, %ecx, %ecx
	addl	%esi, %eax
	movl	%eax, %edx
	addl	%edi, %ecx
	sall	$16, %edx
	vaddsd	%xmm5, %xmm6, %xmm6
	movabsq	$4719772410583711744, %rdi
	addl	%ecx, %edx
	movq	%rdi, (%rsp)
	vmovdqa	(%rsp), %xmm3
	vcvtsi2sdq	%rdx, %xmm1, %xmm1
	movl	$1090519040, %edx
	vmulsd	%xmm4, %xmm6, %xmm6
	vpinsrd	$2, %edx, %xmm3, %xmm0
	movzwl	%ax, %edx
	shrl	$16, %eax
	imull	$36969, %edx, %esi
	movl	%eax, %edx
	movl	%ecx, %eax
	vmovaps	%xmm0, (%rsp)
	shrl	$16, %eax
	vaddsd	%xmm5, %xmm1, %xmm1
	addl	%esi, %edx
	movzwl	%cx, %esi
	imull	$18000, %esi, %esi
	vcvtsd2ss	%xmm6, %xmm6, %xmm6
	vsubss	.LC19(%rip), %xmm6, %xmm6
	vmulsd	%xmm4, %xmm1, %xmm1
	leal	(%rsi,%rax), %ecx
	movl	%edx, %eax
	vshufps	$0, %xmm6, %xmm6, %xmm6
	sall	$16, %eax
	addl	%ecx, %eax
	vcvtsd2ss	%xmm1, %xmm1, %xmm1
	vsubss	.LC19(%rip), %xmm1, %xmm1
	vshufps	$0, %xmm1, %xmm1, %xmm1
	vmulps	%xmm7, %xmm1, %xmm1
	vfmadd132ps	%xmm8, %xmm1, %xmm6
	vxorpd	%xmm1, %xmm1, %xmm1
	vfmadd231ps	.LC21(%rip), %xmm6, %xmm0
	vcvtsi2sdq	%rax, %xmm1, %xmm1
	movzwl	%dx, %eax
	shrl	$16, %edx
	imull	$36969, %eax, %eax
	addl	%eax, %edx
	movzwl	%cx, %eax
	shrl	$16, %ecx
	vaddsd	%xmm5, %xmm1, %xmm1
	imull	$18000, %eax, %eax
	movl	%edx, m_z(%rip)
	sall	$16, %edx
	vmulsd	%xmm4, %xmm1, %xmm1
	addl	%eax, %ecx
	leal	(%rdx,%rcx), %eax
	movl	%ecx, m_w(%rip)
	vcvtsi2sdq	%rax, %xmm2, %xmm2
	vcvtsd2ss	%xmm1, %xmm1, %xmm1
	vaddss	104(%rsp), %xmm1, %xmm1
	vaddsd	%xmm5, %xmm2, %xmm2
	vshufps	$0, %xmm1, %xmm1, %xmm3
	vmulsd	%xmm4, %xmm2, %xmm2
	vcvtsd2ss	%xmm2, %xmm2, %xmm2
	vaddss	108(%rsp), %xmm2, %xmm2
	vshufps	$0, %xmm2, %xmm2, %xmm2
	vfmadd213ps	80(%rsp), %xmm7, %xmm2
	vfmadd132ps	%xmm8, %xmm2, %xmm3
	vmulps	.LC20(%rip), %xmm3, %xmm3
	vfnmadd231ps	.LC21(%rip), %xmm6, %xmm3
	vmulps	%xmm3, %xmm3, %xmm2
	vhaddps	%xmm2, %xmm2, %xmm2
	vhaddps	%xmm2, %xmm2, %xmm2
	vsqrtss	%xmm2, %xmm2, %xmm2
	vshufps	$0, %xmm2, %xmm2, %xmm2
	vrcpps	%xmm2, %xmm1
	vmulps	%xmm2, %xmm1, %xmm2
	vmulps	%xmm2, %xmm1, %xmm2
	vaddps	%xmm1, %xmm1, %xmm1
	vsubps	%xmm2, %xmm1, %xmm1
	vmulps	%xmm1, %xmm3, %xmm1
	call	sampler
	vmovaps	16(%rsp), %xmm4
	subl	$1, %ebx
	vfmadd231ps	.LC22(%rip), %xmm0, %xmm4
	vmovsd	96(%rsp), %xmm5
	vmovaps	%xmm4, 16(%rsp)
	vmovsd	40(%rsp), %xmm4
	jne	.L76
	vmovaps	16(%rsp), %xmm7
	xorl	%eax, %eax
	movl	$1, %esi
	movq	%r13, %rdi
	leaq	.LC23(%rip), %rdx
	subl	$1, %r12d
	vmovsd	%xmm4, 96(%rsp)
	vunpckhps	%xmm7, %xmm7, %xmm1
	vshufps	$85, %xmm7, %xmm7, %xmm0
	vcvttss2si	%xmm7, %ecx
	vmovsd	%xmm5, 40(%rsp)
	vcvttss2si	%xmm1, %r9d
	vcvttss2si	%xmm0, %r8d
	call	__fprintf_chk@PLT
	cmpl	$-1, %r12d
	vmovsd	40(%rsp), %xmm5
	vmovsd	96(%rsp), %xmm4
	jne	.L77
	subl	$1, %r14d
	jne	.L67
	movq	%r13, %rdi
	call	fclose@PLT
	jmp	.L81
.L83:
	movl	$39, %edx
	movq	stderr(%rip), %rcx
	movl	$1, %esi
	leaq	.LC14(%rip), %rdi
	movl	$-1, %r14d
	call	fwrite@PLT
.L81:
	subq	$-128, %rsp
	.cfi_def_cfa_offset 48
	movl	%r14d, %eax
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
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
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movl	$1050253722, %eax
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	vmovdqa	.LC30(%rip), %xmm0
	vpinsrd	$2, %eax, %xmm0, %xmm3
	vmovaps	%xmm3, (%rsp)
	call	clock@PLT
	vmovaps	(%rsp), %xmm1
	vxorps	%xmm0, %xmm0, %xmm0
	movq	%rax, %rbx
	movl	$2147483647, %eax
	.p2align 4,,10
	.p2align 3
.L85:
	vaddps	%xmm1, %xmm0, %xmm0
	subq	$1, %rax
	jne	.L85
	vmovaps	%xmm0, (%rsp)
	call	clock@PLT
	vxorps	%xmm1, %xmm1, %xmm1
	vxorps	%xmm2, %xmm2, %xmm2
	vmovaps	(%rsp), %xmm0
	vcvtsi2ssq	%rax, %xmm1, %xmm1
	movl	$1, %edi
	movl	$2, %eax
	vcvtsi2ssq	%rbx, %xmm2, %xmm2
	leaq	.LC29(%rip), %rsi
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vsubss	%xmm2, %xmm1, %xmm1
	vmulss	.LC28(%rip), %xmm1, %xmm1
	addq	$16, %rsp
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	vcvtss2sd	%xmm1, %xmm1, %xmm1
	jmp	__printf_chk@PLT
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
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movl	$1050253722, %eax
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	vmovdqa	.LC33(%rip), %xmm0
	vpinsrd	$2, %eax, %xmm0, %xmm3
	vmovaps	%xmm3, (%rsp)
	call	clock@PLT
	vmovaps	(%rsp), %xmm0
	vmovaps	.LC31(%rip), %xmm1
	movq	%rax, %rbx
	movl	$2147483647, %eax
	.p2align 4,,10
	.p2align 3
.L89:
	vmulps	%xmm1, %xmm0, %xmm0
	subq	$1, %rax
	jne	.L89
	vmovaps	%xmm0, (%rsp)
	call	clock@PLT
	vxorps	%xmm1, %xmm1, %xmm1
	vxorps	%xmm2, %xmm2, %xmm2
	vmovaps	(%rsp), %xmm0
	vcvtsi2ssq	%rax, %xmm1, %xmm1
	movl	$1, %edi
	movl	$2, %eax
	vcvtsi2ssq	%rbx, %xmm2, %xmm2
	leaq	.LC32(%rip), %rsi
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vsubss	%xmm2, %xmm1, %xmm1
	vmulss	.LC28(%rip), %xmm1, %xmm1
	addq	$16, %rsp
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	vcvtss2sd	%xmm1, %xmm1, %xmm1
	jmp	__printf_chk@PLT
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
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movl	$1050253722, %eax
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	vmovdqa	.LC30(%rip), %xmm0
	vpinsrd	$2, %eax, %xmm0, %xmm0
	vmovaps	%xmm0, (%rsp)
	call	clock@PLT
	vmovdqa	(%rsp), %xmm0
	movq	%rax, %rbx
	vmulps	%xmm0, %xmm0, %xmm0
	vhaddps	%xmm0, %xmm0, %xmm0
	vhaddps	%xmm0, %xmm0, %xmm0
	vmulss	.LC34(%rip), %xmm0, %xmm1
	vfmadd132ss	.LC35(%rip), %xmm1, %xmm0
	vmovss	%xmm0, (%rsp)
	call	clock@PLT
	vxorps	%xmm1, %xmm1, %xmm1
	vxorps	%xmm0, %xmm0, %xmm0
	leaq	.LC36(%rip), %rsi
	vcvtsi2ssq	%rbx, %xmm0, %xmm0
	movl	$1, %edi
	vcvtsi2ssq	%rax, %xmm1, %xmm1
	movl	$2, %eax
	vsubss	%xmm0, %xmm1, %xmm1
	vmulss	.LC28(%rip), %xmm1, %xmm1
	vxorpd	%xmm0, %xmm0, %xmm0
	vcvtss2sd	(%rsp), %xmm0, %xmm0
	addq	$16, %rsp
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	vcvtss2sd	%xmm1, %xmm1, %xmm1
	jmp	__printf_chk@PLT
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
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movl	$1050253722, %eax
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	vmovdqa	.LC30(%rip), %xmm2
	vpinsrd	$2, %eax, %xmm2, %xmm2
	vmovaps	%xmm2, (%rsp)
	call	clock@PLT
	vmovdqa	(%rsp), %xmm2
	movq	%rax, %rbx
	movl	$2147483647, %eax
	vmovaps	%xmm2, %xmm0
	vshufps	$210, %xmm2, %xmm2, %xmm3
	vshufps	$201, %xmm2, %xmm2, %xmm2
	.p2align 4,,10
	.p2align 3
.L95:
	vshufps	$201, %xmm0, %xmm0, %xmm1
	vshufps	$210, %xmm0, %xmm0, %xmm0
	vmulps	%xmm2, %xmm0, %xmm0
	vfmsub231ps	%xmm3, %xmm1, %xmm0
	subq	$1, %rax
	jne	.L95
	vmovaps	%xmm0, (%rsp)
	call	clock@PLT
	vxorps	%xmm1, %xmm1, %xmm1
	vxorps	%xmm2, %xmm2, %xmm2
	vmovaps	(%rsp), %xmm0
	vcvtsi2ssq	%rax, %xmm1, %xmm1
	movl	$1, %edi
	movl	$2, %eax
	vcvtsi2ssq	%rbx, %xmm2, %xmm2
	leaq	.LC37(%rip), %rsi
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vsubss	%xmm2, %xmm1, %xmm1
	vmulss	.LC28(%rip), %xmm1, %xmm1
	addq	$16, %rsp
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	vcvtss2sd	%xmm1, %xmm1, %xmm1
	jmp	__printf_chk@PLT
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
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movl	$1050253722, %eax
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	vmovdqa	.LC30(%rip), %xmm0
	vpinsrd	$2, %eax, %xmm0, %xmm3
	vmovaps	%xmm3, (%rsp)
	call	clock@PLT
	vmovaps	(%rsp), %xmm2
	movq	%rax, %rbx
	movl	$2147483647, %eax
	.p2align 4,,10
	.p2align 3
.L99:
	vmulps	%xmm2, %xmm2, %xmm0
	vhaddps	%xmm0, %xmm0, %xmm0
	vhaddps	%xmm0, %xmm0, %xmm0
	vsqrtss	%xmm0, %xmm0, %xmm0
	vshufps	$0, %xmm0, %xmm0, %xmm0
	vrcpps	%xmm0, %xmm1
	vmulps	%xmm0, %xmm1, %xmm0
	vmulps	%xmm0, %xmm1, %xmm0
	vaddps	%xmm1, %xmm1, %xmm1
	vsubps	%xmm0, %xmm1, %xmm0
	vmulps	%xmm0, %xmm2, %xmm2
	subq	$1, %rax
	jne	.L99
	vmovaps	%xmm2, (%rsp)
	call	clock@PLT
	vxorps	%xmm1, %xmm1, %xmm1
	vxorps	%xmm0, %xmm0, %xmm0
	vmovaps	(%rsp), %xmm2
	vcvtsi2ssq	%rbx, %xmm0, %xmm0
	leaq	.LC38(%rip), %rsi
	movl	$1, %edi
	vcvtsi2ssq	%rax, %xmm1, %xmm1
	movl	$2, %eax
	vsubss	%xmm0, %xmm1, %xmm1
	vmulss	.LC28(%rip), %xmm1, %xmm1
	addq	$16, %rsp
	.cfi_def_cfa_offset 16
	vxorpd	%xmm0, %xmm0, %xmm0
	popq	%rbx
	.cfi_def_cfa_offset 8
	vcvtss2sd	%xmm2, %xmm0, %xmm0
	vcvtss2sd	%xmm1, %xmm1, %xmm1
	jmp	__printf_chk@PLT
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
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	call	clock@PLT
	movl	m_z(%rip), %ecx
	movl	m_w(%rip), %edx
	movl	$2147483647, %esi
	vmovsd	.LC0(%rip), %xmm3
	vmovsd	.LC1(%rip), %xmm2
	movq	%rax, %rbx
	vxorps	%xmm0, %xmm0, %xmm0
	.p2align 4,,10
	.p2align 3
.L105:
	movzwl	%cx, %eax
	shrl	$16, %ecx
	vxorpd	%xmm1, %xmm1, %xmm1
	imull	$36969, %eax, %eax
	addl	%eax, %ecx
	movzwl	%dx, %eax
	shrl	$16, %edx
	imull	$18000, %eax, %eax
	addl	%eax, %edx
	movl	%ecx, %eax
	sall	$16, %eax
	addl	%edx, %eax
	vcvtsi2sdq	%rax, %xmm1, %xmm1
	vaddsd	%xmm3, %xmm1, %xmm1
	vmulsd	%xmm2, %xmm1, %xmm1
	vcvtsd2ss	%xmm1, %xmm1, %xmm1
	vaddss	%xmm1, %xmm0, %xmm0
	subq	$1, %rsi
	jne	.L105
	vmovss	%xmm0, 12(%rsp)
	movl	%ecx, m_z(%rip)
	movl	%edx, m_w(%rip)
	call	clock@PLT
	vxorps	%xmm1, %xmm1, %xmm1
	vxorps	%xmm2, %xmm2, %xmm2
	vmovss	12(%rsp), %xmm0
	vcvtsi2ssq	%rax, %xmm1, %xmm1
	movl	$1, %edi
	movl	$2, %eax
	vcvtsi2ssq	%rbx, %xmm2, %xmm2
	leaq	.LC39(%rip), %rsi
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vsubss	%xmm2, %xmm1, %xmm1
	vmulss	.LC28(%rip), %xmm1, %xmm1
	addq	$16, %rsp
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	vcvtss2sd	%xmm1, %xmm1, %xmm1
	jmp	__printf_chk@PLT
	.cfi_endproc
.LFE596:
	.size	bench_opRand, .-bench_opRand
	.p2align 4,,15
	.globl	benchOps
	.type	benchOps, @function
benchOps:
.LFB597:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movl	$1050253722, %eax
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$40, %rsp
	.cfi_def_cfa_offset 64
	vmovdqa	.LC30(%rip), %xmm0
	vpinsrd	$2, %eax, %xmm0, %xmm4
	vmovaps	%xmm4, (%rsp)
	call	clock@PLT
	vmovaps	(%rsp), %xmm1
	vxorps	%xmm0, %xmm0, %xmm0
	movq	%rax, %rbx
	movl	$2147483647, %eax
	.p2align 4,,10
	.p2align 3
.L109:
	vaddps	%xmm1, %xmm0, %xmm0
	subq	$1, %rax
	jne	.L109
	vmovaps	%xmm0, (%rsp)
	call	clock@PLT
	vxorps	%xmm1, %xmm1, %xmm1
	vxorps	%xmm2, %xmm2, %xmm2
	vmovaps	(%rsp), %xmm0
	vcvtsi2ssq	%rbx, %xmm2, %xmm2
	leaq	.LC29(%rip), %rsi
	movl	$1, %edi
	vcvtsi2ssq	%rax, %xmm1, %xmm1
	movl	$2, %eax
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vsubss	%xmm2, %xmm1, %xmm1
	vmulss	.LC28(%rip), %xmm1, %xmm1
	vcvtss2sd	%xmm1, %xmm1, %xmm1
	call	__printf_chk@PLT
	movl	$1050253722, %eax
	vmovdqa	.LC33(%rip), %xmm0
	vpinsrd	$2, %eax, %xmm0, %xmm5
	vmovaps	%xmm5, (%rsp)
	call	clock@PLT
	vmovaps	(%rsp), %xmm0
	vmovaps	.LC31(%rip), %xmm1
	movq	%rax, %rbx
	movl	$2147483647, %eax
	.p2align 4,,10
	.p2align 3
.L110:
	vmulps	%xmm1, %xmm0, %xmm0
	subq	$1, %rax
	jne	.L110
	vmovaps	%xmm0, (%rsp)
	movl	$1050253722, %ebp
	call	clock@PLT
	vxorps	%xmm1, %xmm1, %xmm1
	vxorps	%xmm2, %xmm2, %xmm2
	vmovaps	(%rsp), %xmm0
	vcvtsi2ssq	%rbx, %xmm2, %xmm2
	leaq	.LC32(%rip), %rsi
	movl	$1, %edi
	vcvtsi2ssq	%rax, %xmm1, %xmm1
	movl	$2, %eax
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vsubss	%xmm2, %xmm1, %xmm1
	vmulss	.LC28(%rip), %xmm1, %xmm1
	vcvtss2sd	%xmm1, %xmm1, %xmm1
	call	__printf_chk@PLT
	vmovdqa	.LC30(%rip), %xmm2
	vpinsrd	$2, %ebp, %xmm2, %xmm0
	vmovaps	%xmm2, 16(%rsp)
	vmovaps	%xmm0, (%rsp)
	call	clock@PLT
	vmovdqa	(%rsp), %xmm0
	movq	%rax, %rbx
	vmulps	%xmm0, %xmm0, %xmm0
	vhaddps	%xmm0, %xmm0, %xmm0
	vhaddps	%xmm0, %xmm0, %xmm0
	vmulss	.LC34(%rip), %xmm0, %xmm1
	vfmadd132ss	.LC35(%rip), %xmm1, %xmm0
	vmovss	%xmm0, (%rsp)
	call	clock@PLT
	vxorps	%xmm1, %xmm1, %xmm1
	vxorps	%xmm0, %xmm0, %xmm0
	leaq	.LC36(%rip), %rsi
	vcvtsi2ssq	%rbx, %xmm0, %xmm0
	movl	$1, %edi
	vcvtsi2ssq	%rax, %xmm1, %xmm1
	movl	$2, %eax
	vsubss	%xmm0, %xmm1, %xmm1
	vmulss	.LC28(%rip), %xmm1, %xmm1
	vxorpd	%xmm0, %xmm0, %xmm0
	vcvtss2sd	(%rsp), %xmm0, %xmm0
	vcvtss2sd	%xmm1, %xmm1, %xmm1
	call	__printf_chk@PLT
	vmovdqa	16(%rsp), %xmm2
	movq	$0, 8(%rsp)
	vmovq	%xmm2, (%rsp)
	vmovdqa	(%rsp), %xmm6
	vpinsrd	$2, %ebp, %xmm6, %xmm2
	vmovaps	%xmm2, (%rsp)
	call	clock@PLT
	vmovdqa	(%rsp), %xmm2
	movq	%rax, %rbx
	movl	$2147483647, %eax
	vmovaps	%xmm2, %xmm0
	vshufps	$210, %xmm2, %xmm2, %xmm3
	vshufps	$201, %xmm2, %xmm2, %xmm2
	.p2align 4,,10
	.p2align 3
.L111:
	vshufps	$201, %xmm0, %xmm0, %xmm1
	vshufps	$210, %xmm0, %xmm0, %xmm0
	vmulps	%xmm2, %xmm0, %xmm0
	vfmsub231ps	%xmm3, %xmm1, %xmm0
	subq	$1, %rax
	jne	.L111
	vmovaps	%xmm0, (%rsp)
	call	clock@PLT
	vxorps	%xmm1, %xmm1, %xmm1
	vxorps	%xmm2, %xmm2, %xmm2
	vmovaps	(%rsp), %xmm0
	vcvtsi2ssq	%rbx, %xmm2, %xmm2
	leaq	.LC37(%rip), %rsi
	movl	$1, %edi
	vcvtsi2ssq	%rax, %xmm1, %xmm1
	movl	$2, %eax
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vsubss	%xmm2, %xmm1, %xmm1
	vmulss	.LC28(%rip), %xmm1, %xmm1
	vcvtss2sd	%xmm1, %xmm1, %xmm1
	call	__printf_chk@PLT
	movl	$1050253722, %eax
	vmovdqa	.LC30(%rip), %xmm0
	vpinsrd	$2, %eax, %xmm0, %xmm7
	vmovaps	%xmm7, (%rsp)
	call	clock@PLT
	vmovaps	(%rsp), %xmm2
	movq	%rax, %rbx
	movl	$2147483647, %eax
	.p2align 4,,10
	.p2align 3
.L112:
	vmulps	%xmm2, %xmm2, %xmm0
	vhaddps	%xmm0, %xmm0, %xmm0
	vhaddps	%xmm0, %xmm0, %xmm0
	vsqrtss	%xmm0, %xmm0, %xmm0
	vshufps	$0, %xmm0, %xmm0, %xmm0
	vrcpps	%xmm0, %xmm1
	vmulps	%xmm0, %xmm1, %xmm0
	vmulps	%xmm0, %xmm1, %xmm0
	vaddps	%xmm1, %xmm1, %xmm1
	vsubps	%xmm0, %xmm1, %xmm0
	vmulps	%xmm0, %xmm2, %xmm2
	subq	$1, %rax
	jne	.L112
	vmovaps	%xmm2, (%rsp)
	call	clock@PLT
	vxorps	%xmm1, %xmm1, %xmm1
	vxorps	%xmm0, %xmm0, %xmm0
	vmovaps	(%rsp), %xmm2
	vcvtsi2ssq	%rbx, %xmm0, %xmm0
	leaq	.LC38(%rip), %rsi
	movl	$1, %edi
	vcvtsi2ssq	%rax, %xmm1, %xmm1
	movl	$2, %eax
	vsubss	%xmm0, %xmm1, %xmm1
	vmulss	.LC28(%rip), %xmm1, %xmm1
	vxorpd	%xmm0, %xmm0, %xmm0
	vcvtss2sd	%xmm2, %xmm0, %xmm0
	vcvtss2sd	%xmm1, %xmm1, %xmm1
	call	__printf_chk@PLT
	call	clock@PLT
	movl	m_z(%rip), %ecx
	movl	m_w(%rip), %edx
	movl	$2147483647, %esi
	vmovsd	.LC0(%rip), %xmm3
	vmovsd	.LC1(%rip), %xmm2
	movq	%rax, %rbx
	vxorps	%xmm0, %xmm0, %xmm0
	.p2align 4,,10
	.p2align 3
.L115:
	movzwl	%cx, %eax
	shrl	$16, %ecx
	vxorpd	%xmm1, %xmm1, %xmm1
	imull	$36969, %eax, %eax
	addl	%eax, %ecx
	movzwl	%dx, %eax
	shrl	$16, %edx
	imull	$18000, %eax, %eax
	addl	%eax, %edx
	movl	%ecx, %eax
	sall	$16, %eax
	addl	%edx, %eax
	vcvtsi2sdq	%rax, %xmm1, %xmm1
	vaddsd	%xmm3, %xmm1, %xmm1
	vmulsd	%xmm2, %xmm1, %xmm1
	vcvtsd2ss	%xmm1, %xmm1, %xmm1
	vaddss	%xmm1, %xmm0, %xmm0
	subq	$1, %rsi
	jne	.L115
	vmovss	%xmm0, (%rsp)
	movl	%ecx, m_z(%rip)
	movl	%edx, m_w(%rip)
	call	clock@PLT
	vxorps	%xmm1, %xmm1, %xmm1
	vxorps	%xmm2, %xmm2, %xmm2
	vmovss	(%rsp), %xmm0
	vcvtsi2ssq	%rax, %xmm1, %xmm1
	movl	$1, %edi
	movl	$2, %eax
	vcvtsi2ssq	%rbx, %xmm2, %xmm2
	leaq	.LC39(%rip), %rsi
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vsubss	%xmm2, %xmm1, %xmm1
	vmulss	.LC28(%rip), %xmm1, %xmm1
	addq	$40, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	vcvtss2sd	%xmm1, %xmm1, %xmm1
	jmp	__printf_chk@PLT
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
