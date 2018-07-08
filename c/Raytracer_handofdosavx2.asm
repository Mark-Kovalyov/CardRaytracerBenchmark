	.file	"Raytracer_handofdos_r2.c"
	.text
	.p2align 4,,15
	.globl	opAdd
	.type	opAdd, @function
opAdd:
.LFB578:
	.cfi_startproc
	vmovss	(%rdi), %xmm0
	vaddss	(%rsi), %xmm0, %xmm0
	movq	%rdi, %rax
	vmovss	%xmm0, (%rdi)
	vmovss	4(%rdi), %xmm0
	vaddss	4(%rsi), %xmm0, %xmm0
	vmovss	%xmm0, 4(%rdi)
	vmovss	8(%rdi), %xmm0
	vaddss	8(%rsi), %xmm0, %xmm0
	vmovss	%xmm0, 8(%rdi)
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
	vmulss	(%rdi), %xmm0, %xmm1
	movq	%rdi, %rax
	vmovss	%xmm1, (%rdi)
	vmulss	4(%rdi), %xmm0, %xmm1
	vmulss	8(%rdi), %xmm0, %xmm0
	vmovss	%xmm1, 4(%rdi)
	vmovss	%xmm0, 8(%rdi)
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
	vmovss	4(%rdi), %xmm0
	vmulss	4(%rsi), %xmm0, %xmm0
	vmovss	(%rdi), %xmm1
	vfmadd231ss	(%rsi), %xmm1, %xmm0
	vmovss	8(%rdi), %xmm2
	vfmadd231ss	8(%rsi), %xmm2, %xmm0
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
	vmovss	4(%rdi), %xmm2
	vmovss	(%rdi), %xmm1
	vmovss	8(%rdi), %xmm0
	vmulss	%xmm2, %xmm2, %xmm2
	vfmadd132ss	%xmm1, %xmm2, %xmm1
	vfmadd132ss	%xmm0, %xmm1, %xmm0
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
	vshufps	$177, %xmm0, %xmm0, %xmm1
	vaddps	%xmm1, %xmm0, %xmm0
	vmovhlps	%xmm0, %xmm1, %xmm1
	vaddss	%xmm1, %xmm0, %xmm0
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
	vhaddps	%xmm0, %xmm0, %xmm0
	vhaddps	%xmm0, %xmm0, %xmm0
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
	vmulps	%xmm1, %xmm0, %xmm1
	vhaddps	%xmm1, %xmm1, %xmm1
	vhaddps	%xmm1, %xmm1, %xmm1
	vmovaps	%xmm1, %xmm0
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
	vmulps	%xmm0, %xmm0, %xmm0
	vhaddps	%xmm0, %xmm0, %xmm0
	vhaddps	%xmm0, %xmm0, %xmm0
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
	vmovss	8(%rdi), %xmm2
	vmovss	4(%rsi), %xmm0
	movq	%rdi, %rax
	vmovss	4(%rdi), %xmm1
	vmovss	(%rdi), %xmm5
	vmulss	%xmm0, %xmm2, %xmm4
	vmovss	8(%rsi), %xmm3
	vmovss	(%rsi), %xmm6
	vfmsub231ss	%xmm3, %xmm1, %xmm4
	vmulss	%xmm5, %xmm3, %xmm3
	vmulss	%xmm6, %xmm1, %xmm1
	vmovss	%xmm4, (%rdi)
	vfmsub132ss	%xmm6, %xmm3, %xmm2
	vfmsub132ss	%xmm5, %xmm1, %xmm0
	vmovss	%xmm2, 4(%rdi)
	vmovss	%xmm0, 8(%rdi)
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
	vshufps	$201, %xmm0, %xmm0, %xmm2
	vshufps	$210, %xmm1, %xmm1, %xmm3
	vshufps	$210, %xmm0, %xmm0, %xmm0
	vshufps	$201, %xmm1, %xmm1, %xmm1
	vmulps	%xmm1, %xmm0, %xmm0
	vfmsub231ps	%xmm3, %xmm2, %xmm0
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
	vmovaps	(%rdi), %xmm0
	vmovaps	(%rsi), %xmm1
	movq	%rdi, %rax
	vshufps	$201, %xmm0, %xmm0, %xmm2
	vshufps	$210, %xmm1, %xmm1, %xmm3
	vshufps	$210, %xmm0, %xmm0, %xmm0
	vshufps	$201, %xmm1, %xmm1, %xmm1
	vmulps	%xmm1, %xmm0, %xmm0
	vfmsub231ps	%xmm3, %xmm2, %xmm0
	vmovaps	%xmm0, (%rdi)
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
	vmovss	4(%rdi), %xmm2
	vmovss	(%rdi), %xmm3
	vxorpd	%xmm0, %xmm0, %xmm0
	movq	%rdi, %rax
	vmovss	8(%rdi), %xmm4
	vmulss	%xmm2, %xmm2, %xmm1
	vfmadd231ss	%xmm3, %xmm3, %xmm1
	vfmadd231ss	%xmm4, %xmm4, %xmm1
	vcvtss2sd	%xmm1, %xmm0, %xmm0
	vsqrtsd	%xmm0, %xmm1, %xmm1
	vmovsd	.LC0(%rip), %xmm0
	vdivsd	%xmm1, %xmm0, %xmm0
	vcvtsd2ss	%xmm0, %xmm0, %xmm0
	vmulss	%xmm3, %xmm0, %xmm3
	vmulss	%xmm2, %xmm0, %xmm2
	vmulss	%xmm4, %xmm0, %xmm0
	vmovss	%xmm3, (%rdi)
	vmovss	%xmm2, 4(%rdi)
	vmovss	%xmm0, 8(%rdi)
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
	vmovaps	(%rdi), %xmm2
	vmovss	.LC1(%rip), %xmm1
	movq	%rdi, %rax
	vmulps	%xmm2, %xmm2, %xmm0
	vhaddps	%xmm0, %xmm0, %xmm0
	vhaddps	%xmm0, %xmm0, %xmm0
	vsqrtss	%xmm0, %xmm0, %xmm0
	vdivss	%xmm0, %xmm1, %xmm0
	vshufps	$0, %xmm0, %xmm0, %xmm0
	vmulps	%xmm2, %xmm0, %xmm0
	vmovaps	%xmm0, (%rdi)
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
.LFE591:
	.size	GetUint, .-GetUint
	.p2align 4,,15
	.globl	GetUniform
	.type	GetUniform, @function
GetUniform:
.LFB592:
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
	vmulsd	.LC2(%rip), %xmm0, %xmm0
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
	vmulsd	.LC2(%rip), %xmm0, %xmm0
	vcvtsd2ss	%xmm0, %xmm0, %xmm0
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
	vmovsd	.LC5(%rip), %xmm8
	vxorpd	%xmm1, %xmm1, %xmm1
	xorl	%eax, %eax
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movl	$0x4e6e6b28, (%rdx)
	vmovss	8(%rdi), %xmm0
	vmovss	.LC4(%rip), %xmm7
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	vxorps	%xmm7, %xmm0, %xmm0
	vdivss	8(%rsi), %xmm0, %xmm0
	vcvtss2sd	%xmm0, %xmm1, %xmm1
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	vcomisd	%xmm8, %xmm1
	jbe	.L23
	vmovss	%xmm0, (%rdx)
	vpxor	%xmm0, %xmm0, %xmm0
	movl	$1, %eax
	vmovaps	%xmm0, (%rcx)
	movl	$0x3f800000, 8(%rcx)
.L23:
	movl	$-18, %r11d
	movl	$1, %ebp
	vxorps	%xmm5, %xmm5, %xmm5
	vmovss	.LC1(%rip), %xmm6
	vmovsd	.LC0(%rip), %xmm9
	leaq	G(%rip), %r10
	movl	$-4, %ebx
	.p2align 4,,10
	.p2align 3
.L31:
	vxorps	%xmm11, %xmm11, %xmm11
	movl	%r11d, %r9d
	movl	$8, %r8d
	vcvtsi2ss	%r11d, %xmm11, %xmm11
	negl	%r9d
	shlx	%r9d, %ebp, %r9d
	.p2align 4,,10
	.p2align 3
.L29:
	testl	%r9d, (%r10,%r8,4)
	je	.L25
	vmovss	4(%rdi), %xmm4
	movl	%ebx, %r12d
	vaddss	(%rdi), %xmm11, %xmm10
	vxorps	%xmm3, %xmm3, %xmm3
	vmulss	4(%rsi), %xmm4, %xmm0
	subl	%r8d, %r12d
	vfmadd231ss	(%rsi), %xmm10, %xmm0
	vcvtsi2ss	%r12d, %xmm3, %xmm3
	vaddss	8(%rdi), %xmm3, %xmm3
	vfmadd231ss	8(%rsi), %xmm3, %xmm0
	vmovaps	%xmm4, %xmm2
	vfnmadd132ss	%xmm4, %xmm6, %xmm2
	vmulss	%xmm0, %xmm0, %xmm1
	vfnmadd231ss	%xmm10, %xmm10, %xmm2
	vfnmadd231ss	%xmm3, %xmm3, %xmm1
	vaddss	%xmm1, %xmm2, %xmm1
	vcomiss	%xmm5, %xmm1
	jbe	.L25
	vcvtss2sd	%xmm1, %xmm1, %xmm1
	vsqrtsd	%xmm1, %xmm1, %xmm1
	vxorps	%xmm7, %xmm0, %xmm0
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vsubsd	%xmm1, %xmm0, %xmm0
	vcvtsd2ss	%xmm0, %xmm0, %xmm0
	vcomiss	(%rdx), %xmm0
	jnb	.L25
	vxorpd	%xmm1, %xmm1, %xmm1
	vcvtss2sd	%xmm0, %xmm1, %xmm1
	vcomisd	%xmm8, %xmm1
	ja	.L47
	.p2align 4,,10
	.p2align 3
.L25:
	subq	$1, %r8
	cmpq	$-1, %r8
	jne	.L29
	addl	$1, %r11d
	cmpl	$1, %r11d
	jne	.L31
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L47:
	.cfi_restore_state
	vmovss	%xmm0, (%rdx)
	vmovdqa	(%rsi), %xmm1
	movl	$2, %eax
	vmovaps	%xmm1, (%rcx)
	vfmadd231ss	4(%rcx), %xmm0, %xmm4
	vfmadd231ss	(%rcx), %xmm0, %xmm10
	vfmadd132ss	8(%rcx), %xmm3, %xmm0
	vmulss	%xmm4, %xmm4, %xmm1
	vfmadd231ss	%xmm10, %xmm10, %xmm1
	vfmadd231ss	%xmm0, %xmm0, %xmm1
	vcvtss2sd	%xmm1, %xmm1, %xmm1
	vsqrtsd	%xmm1, %xmm1, %xmm1
	vdivsd	%xmm1, %xmm9, %xmm1
	vcvtsd2ss	%xmm1, %xmm1, %xmm1
	vmulss	%xmm1, %xmm10, %xmm10
	vmulss	%xmm1, %xmm4, %xmm4
	vmulss	%xmm1, %xmm0, %xmm0
	vmovss	%xmm10, (%rcx)
	vmovss	%xmm4, 4(%rcx)
	vmovss	%xmm0, 8(%rcx)
	jmp	.L25
	.cfi_endproc
.LFE594:
	.size	tracer, .-tracer
	.p2align 4,,15
	.globl	sampler
	.type	sampler, @function
sampler:
.LFB595:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	movq	%rsi, %r13
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	subq	$144, %rsp
	.cfi_def_cfa_offset 192
	movq	%fs:40, %rax
	movq	%rax, 136(%rsp)
	xorl	%eax, %eax
	leaq	64(%rsp), %rbp
	leaq	60(%rsp), %rbx
	movq	%rbp, %rcx
	movq	%rbx, %rdx
	call	tracer
	testl	%eax, %eax
	jne	.L49
	vmovss	.LC1(%rip), %xmm0
	vsubss	8(%rsi), %xmm0, %xmm0
	movl	$0, 76(%rsp)
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vmulsd	%xmm0, %xmm0, %xmm0
	vmulsd	%xmm0, %xmm0, %xmm0
	vcvtsd2ss	%xmm0, %xmm0, %xmm0
	vmulss	.LC7(%rip), %xmm0, %xmm1
	vmovss	%xmm0, 72(%rsp)
	vmovss	%xmm1, 64(%rsp)
	vmulss	.LC8(%rip), %xmm0, %xmm1
	vmovss	%xmm1, 68(%rsp)
	vmovdqa	64(%rsp), %xmm7
	vmovaps	%xmm7, (%rsp)
.L50:
	movq	8(%rsp), %rax
	vmovq	(%rsp), %xmm0
	vmovq	%rax, %xmm1
	movq	136(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L67
	addq	$144, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
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
	.p2align 4,,10
	.p2align 3
.L49:
	.cfi_restore_state
	movl	%eax, %r12d
	movl	m_z(%rip), %eax
	vmovdqa	(%rsi), %xmm0
	movl	$0, 108(%rsp)
	movl	m_w(%rip), %edx
	vmovss	60(%rsp), %xmm12
	vxorps	%xmm13, %xmm13, %xmm13
	movzwl	%ax, %esi
	shrl	$16, %eax
	vmovaps	%xmm0, 80(%rsp)
	vxorpd	%xmm0, %xmm0, %xmm0
	imull	$36969, %esi, %esi
	vmovss	80(%rsp), %xmm1
	vmovss	84(%rsp), %xmm5
	vfmadd213ss	(%rdi), %xmm12, %xmm1
	vfmadd213ss	4(%rdi), %xmm12, %xmm5
	vmovss	88(%rsp), %xmm4
	vfmadd213ss	8(%rdi), %xmm12, %xmm4
	addl	%eax, %esi
	movzwl	%dx, %eax
	shrl	$16, %edx
	vmovsd	.LC0(%rip), %xmm3
	imull	$18000, %eax, %eax
	movl	%esi, %ecx
	vmovsd	.LC2(%rip), %xmm6
	vmovss	.LC9(%rip), %xmm2
	shrl	$16, %ecx
	vmovss	.LC10(%rip), %xmm12
	vmovss	72(%rsp), %xmm7
	vmovss	%xmm1, 80(%rsp)
	vmovss	8(%r13), %xmm8
	addl	%edx, %eax
	movzwl	%si, %edx
	sall	$16, %esi
	vmovss	%xmm4, 88(%rsp)
	imull	$36969, %edx, %edx
	movl	%eax, %edi
	vsubss	%xmm4, %xmm12, %xmm4
	vmovss	%xmm5, 84(%rsp)
	shrl	$16, %edi
	addl	%ecx, %edx
	movzwl	%ax, %ecx
	addl	%esi, %eax
	vcvtsi2sdq	%rax, %xmm0, %xmm0
	movl	%edx, m_z(%rip)
	sall	$16, %edx
	imull	$18000, %ecx, %ecx
	vaddsd	%xmm3, %xmm0, %xmm0
	addl	%edi, %ecx
	leal	(%rdx,%rcx), %eax
	movl	%ecx, m_w(%rip)
	vmulsd	%xmm6, %xmm0, %xmm0
	vcvtsd2ss	%xmm0, %xmm0, %xmm0
	vaddss	%xmm2, %xmm0, %xmm0
	vsubss	%xmm1, %xmm0, %xmm0
	vxorpd	%xmm1, %xmm1, %xmm1
	vcvtsi2sdq	%rax, %xmm1, %xmm1
	vaddsd	%xmm3, %xmm1, %xmm1
	vmulsd	%xmm6, %xmm1, %xmm1
	vmovss	0(%r13), %xmm6
	vcvtsd2ss	%xmm1, %xmm1, %xmm1
	vaddss	%xmm2, %xmm1, %xmm2
	vmovdqa	64(%rsp), %xmm1
	vmovaps	%xmm1, 112(%rsp)
	vmovss	64(%rsp), %xmm1
	vsubss	%xmm5, %xmm2, %xmm2
	vmovss	4(%r13), %xmm5
	vmulss	%xmm2, %xmm2, %xmm12
	vfmadd231ss	%xmm0, %xmm0, %xmm12
	vfmadd231ss	%xmm4, %xmm4, %xmm12
	vcvtss2sd	%xmm12, %xmm12, %xmm12
	vsqrtsd	%xmm12, %xmm12, %xmm12
	vdivsd	%xmm12, %xmm3, %xmm12
	vcvtsd2ss	%xmm12, %xmm12, %xmm12
	vmulss	%xmm0, %xmm12, %xmm0
	vmulss	%xmm12, %xmm2, %xmm2
	vmulss	%xmm4, %xmm12, %xmm12
	vmovss	68(%rsp), %xmm4
	vmulss	%xmm5, %xmm4, %xmm3
	vmovss	%xmm0, 96(%rsp)
	vmovss	%xmm2, 100(%rsp)
	vmulss	%xmm2, %xmm4, %xmm2
	vmovss	%xmm12, 104(%rsp)
	vfmadd231ss	%xmm6, %xmm1, %xmm3
	vfmadd231ss	%xmm8, %xmm7, %xmm3
	vmulss	.LC11(%rip), %xmm3, %xmm3
	vfmadd231ss	%xmm1, %xmm3, %xmm6
	vfmadd132ss	%xmm0, %xmm2, %xmm1
	vfmadd231ss	%xmm4, %xmm3, %xmm5
	vfmadd132ss	%xmm7, %xmm8, %xmm3
	vfmadd132ss	%xmm7, %xmm1, %xmm12
	vmovss	%xmm6, 112(%rsp)
	vmovss	%xmm5, 116(%rsp)
	vmovss	%xmm3, 120(%rsp)
	vcomiss	%xmm12, %xmm13
	jbe	.L68
.L55:
	vxorps	%xmm12, %xmm12, %xmm12
.L56:
	andl	$1, %r12d
	je	.L58
	vmovss	.LC12(%rip), %xmm1
	vmulss	80(%rsp), %xmm1, %xmm0
	vcvtss2sd	%xmm12, %xmm12, %xmm12
	vmulss	84(%rsp), %xmm1, %xmm2
	vmovsd	.LC14(%rip), %xmm7
	vfmadd132sd	.LC13(%rip), %xmm7, %xmm12
	vmovss	%xmm0, 80(%rsp)
	vroundss	$10, %xmm0, %xmm0, %xmm0
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vroundss	$10, %xmm2, %xmm2, %xmm2
	vcvtss2sd	%xmm2, %xmm2, %xmm2
	vaddsd	%xmm2, %xmm0, %xmm0
	vcvtsd2ss	%xmm12, %xmm12, %xmm12
	vmulss	.LC15(%rip), %xmm12, %xmm1
	vcvttsd2si	%xmm0, %eax
	andl	$1, %eax
	je	.L59
	vmovd	%xmm12, %eax
	vinsertps	$0xe, %xmm1, %xmm1, %xmm1
	vpinsrd	$1, %eax, %xmm1, %xmm1
	vpinsrd	$2, %eax, %xmm1, %xmm6
	vmovaps	%xmm6, (%rsp)
	jmp	.L50
	.p2align 4,,10
	.p2align 3
.L68:
	leaq	96(%rsp), %rsi
	leaq	80(%rsp), %rdi
	movq	%rbp, %rcx
	movq	%rbx, %rdx
	call	tracer
	testl	%eax, %eax
	jne	.L55
	vcomiss	%xmm13, %xmm12
	vmovss	100(%rsp), %xmm0
	vmovss	96(%rsp), %xmm7
	vmulss	116(%rsp), %xmm0, %xmm0
	vfmadd231ss	112(%rsp), %xmm7, %xmm0
	vmovss	104(%rsp), %xmm7
	vfmadd231ss	120(%rsp), %xmm7, %xmm0
	jbe	.L56
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vmulsd	%xmm0, %xmm0, %xmm13
	vmulsd	%xmm13, %xmm13, %xmm13
	vmulsd	%xmm13, %xmm13, %xmm13
	vmulsd	%xmm13, %xmm13, %xmm13
	vmulsd	%xmm13, %xmm13, %xmm13
	vmulsd	%xmm0, %xmm13, %xmm0
	vmulsd	%xmm0, %xmm0, %xmm13
	vmulsd	%xmm0, %xmm13, %xmm13
	vcvtsd2ss	%xmm13, %xmm13, %xmm13
	jmp	.L56
	.p2align 4,,10
	.p2align 3
.L59:
	vpxor	%xmm0, %xmm0, %xmm0
	vpinsrd	$3, %eax, %xmm0, %xmm2
	vmovd	%xmm1, %eax
	vmovss	%xmm1, %xmm2, %xmm0
	vpinsrd	$1, %eax, %xmm0, %xmm0
	vpinsrd	$2, %eax, %xmm0, %xmm6
	vmovaps	%xmm6, (%rsp)
	jmp	.L50
	.p2align 4,,10
	.p2align 3
.L58:
	vpxor	%xmm2, %xmm2, %xmm2
	leaq	112(%rsp), %rsi
	leaq	80(%rsp), %rdi
	vmovss	%xmm13, 44(%rsp)
	vpinsrd	$3, %r12d, %xmm2, %xmm2
	vmovaps	%xmm2, 16(%rsp)
	call	sampler
	vmovss	.LC16(%rip), %xmm3
	vmovss	44(%rsp), %xmm13
	vmovaps	%xmm0, (%rsp)
	vmovdqa	16(%rsp), %xmm2
	vmovq	%xmm1, 8(%rsp)
	vmovdqa	(%rsp), %xmm6
	vpsrldq	$4, %xmm6, %xmm4
	vmovdqa	%xmm6, %xmm0
	vpsrldq	$8, %xmm6, %xmm1
	vfmadd132ss	%xmm3, %xmm13, %xmm0
	vfmadd132ss	%xmm3, %xmm13, %xmm4
	vfmadd231ss	%xmm3, %xmm1, %xmm13
	vmovd	%xmm4, %eax
	vmovss	%xmm0, %xmm2, %xmm2
	vpinsrd	$1, %eax, %xmm2, %xmm0
	vmovd	%xmm13, %eax
	vpinsrd	$2, %eax, %xmm0, %xmm7
	vmovaps	%xmm7, (%rsp)
	jmp	.L50
.L67:
	call	__stack_chk_fail@PLT
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
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$184, %rsp
	.cfi_def_cfa_offset 240
	movq	%fs:40, %rax
	movq	%rax, 168(%rsp)
	xorl	%eax, %eax
	cmpl	$1, %edi
	je	.L89
	movq	8(%rsi), %rdi
	leaq	.LC19(%rip), %rsi
	leaq	128(%rsp), %r12
	leaq	144(%rsp), %rbp
	leaq	.LC28(%rip), %r15
	call	fopen@PLT
	movl	$512, %r8d
	movl	$512, %ecx
	leaq	.LC20(%rip), %rdx
	movl	$1, %esi
	movq	%rax, %rdi
	movq	%rax, %r14
	xorl	%eax, %eax
	call	__fprintf_chk@PLT
	leaq	80(%rsp), %rdi
	movabsq	$-4503599624136687616, %rax
	movq	$0, 88(%rsp)
	movq	%rax, 80(%rsp)
	call	opNotC
	vmovss	84(%rsp), %xmm0
	vxorps	.LC4(%rip), %xmm0, %xmm0
	leaq	96(%rsp), %rdi
	movl	$0, 108(%rsp)
	vmovss	%xmm0, 96(%rsp)
	vmovss	80(%rsp), %xmm0
	movl	$0x00000000, 104(%rsp)
	vmovss	%xmm0, 100(%rsp)
	call	opNotC
	vmovss	.LC21(%rip), %xmm5
	leaq	112(%rsp), %rdi
	vmulss	(%rax), %xmm5, %xmm0
	vmovss	%xmm0, (%rax)
	vmulss	4(%rax), %xmm5, %xmm0
	vmovss	96(%rsp), %xmm7
	vmovss	%xmm0, 4(%rax)
	vmulss	8(%rax), %xmm5, %xmm0
	vmovss	%xmm0, 8(%rax)
	vmovdqa	80(%rsp), %xmm0
	vmovss	104(%rsp), %xmm3
	vmovaps	%xmm0, 112(%rsp)
	vmovss	100(%rsp), %xmm0
	vmovss	120(%rsp), %xmm2
	vmovss	112(%rsp), %xmm6
	vmovss	116(%rsp), %xmm1
	vmulss	%xmm0, %xmm2, %xmm4
	vfmsub231ss	%xmm3, %xmm1, %xmm4
	vmulss	%xmm6, %xmm3, %xmm3
	vmulss	%xmm7, %xmm1, %xmm1
	vmovss	%xmm4, 112(%rsp)
	vfmsub132ss	%xmm7, %xmm3, %xmm2
	vfmsub132ss	%xmm6, %xmm1, %xmm0
	vmovss	%xmm2, 116(%rsp)
	vmovss	%xmm0, 120(%rsp)
	call	opNotC
	vmovss	.LC22(%rip), %xmm1
	movl	$511, 76(%rsp)
	vmulss	(%rax), %xmm5, %xmm0
	vmovsd	.LC0(%rip), %xmm4
	vmovsd	.LC2(%rip), %xmm6
	vmovss	.LC27(%rip), %xmm7
	vmovss	%xmm0, (%rax)
	vmulss	4(%rax), %xmm5, %xmm0
	vmovss	96(%rsp), %xmm8
	vmovss	112(%rsp), %xmm15
	vmulss	8(%rax), %xmm5, %xmm5
	vmovaps	%xmm8, %xmm3
	vaddss	%xmm15, %xmm8, %xmm2
	vfmadd213ss	80(%rsp), %xmm1, %xmm2
	vmovss	%xmm0, 4(%rax)
	vmovss	116(%rsp), %xmm0
	vmovss	100(%rsp), %xmm13
	vmovss	%xmm5, 8(%rax)
	vmovss	120(%rsp), %xmm11
	vmovss	104(%rsp), %xmm14
	vmovss	.LC10(%rip), %xmm5
	vmovss	%xmm2, 60(%rsp)
	vaddss	%xmm13, %xmm0, %xmm2
	vfmadd213ss	84(%rsp), %xmm1, %xmm2
	vmovss	%xmm2, 64(%rsp)
	vaddss	%xmm14, %xmm11, %xmm2
	vfmadd213ss	88(%rsp), %xmm1, %xmm2
	vmovss	%xmm2, 68(%rsp)
	vmovaps	%xmm11, %xmm2
	vmovaps	%xmm0, %xmm11
	vmovaps	%xmm2, %xmm0
.L72:
	vxorps	%xmm2, %xmm2, %xmm2
	movl	$511, %r13d
	vcvtsi2ss	76(%rsp), %xmm2, %xmm2
	vmovss	%xmm2, 72(%rsp)
	.p2align 4,,10
	.p2align 3
.L85:
	vxorps	%xmm2, %xmm2, %xmm2
	movl	$64, %ebx
	movl	$0x41500000, 20(%rsp)
	vcvtsi2ss	%r13d, %xmm2, %xmm2
	movl	$0x41500000, 24(%rsp)
	movl	$0x41500000, 28(%rsp)
	vmovss	%xmm2, 56(%rsp)
	jmp	.L83
	.p2align 4,,10
	.p2align 3
.L81:
	vmovss	112(%rsp), %xmm15
	vmovss	96(%rsp), %xmm3
	vmovss	100(%rsp), %xmm13
	vmovss	104(%rsp), %xmm14
	vmovss	116(%rsp), %xmm11
	vmovss	120(%rsp), %xmm0
.L83:
	movl	m_z(%rip), %esi
	vxorpd	%xmm10, %xmm10, %xmm10
	vxorpd	%xmm12, %xmm12, %xmm12
	vmovdqa	96(%rsp), %xmm1
	vmovdqa	112(%rsp), %xmm2
	vmovss	%xmm7, 52(%rsp)
	movzwl	%si, %ecx
	shrl	$16, %esi
	vmovaps	%xmm1, 128(%rsp)
	imull	$36969, %ecx, %ecx
	vmovsd	%xmm6, 40(%rsp)
	vmovaps	%xmm2, 144(%rsp)
	vxorpd	%xmm2, %xmm2, %xmm2
	vmovss	%xmm5, 48(%rsp)
	movl	$0, 156(%rsp)
	leal	(%rcx,%rsi), %edi
	movl	m_w(%rip), %esi
	movzwl	%di, %edx
	movzwl	%si, %eax
	shrl	$16, %esi
	imull	$36969, %edx, %edx
	imull	$18000, %eax, %eax
	addl	%eax, %esi
	movl	%edi, %eax
	shrl	$16, %edi
	sall	$16, %eax
	addl	%edi, %edx
	movq	%rbp, %rdi
	leal	(%rax,%rsi), %ecx
	movl	%esi, %eax
	vcvtsi2sdq	%rcx, %xmm10, %xmm10
	movzwl	%si, %ecx
	shrl	$16, %eax
	imull	$18000, %ecx, %ecx
	addl	%eax, %ecx
	movl	%edx, %eax
	vaddsd	%xmm4, %xmm10, %xmm10
	sall	$16, %eax
	addl	%ecx, %eax
	vcvtsi2sdq	%rax, %xmm12, %xmm12
	vmulsd	%xmm6, %xmm10, %xmm10
	movzwl	%dx, %eax
	imull	$36969, %eax, %esi
	movl	%edx, %eax
	movzwl	%cx, %edx
	shrl	$16, %eax
	vaddsd	%xmm4, %xmm12, %xmm12
	addl	%esi, %eax
	vcvtsd2ss	%xmm10, %xmm10, %xmm10
	vcvtss2sd	%xmm10, %xmm10, %xmm10
	vsubsd	.LC23(%rip), %xmm10, %xmm1
	vmulsd	.LC24(%rip), %xmm1, %xmm1
	imull	$18000, %edx, %esi
	movl	%ecx, %edx
	movl	%eax, %ecx
	vmulsd	%xmm6, %xmm12, %xmm12
	shrl	$16, %edx
	sall	$16, %ecx
	addl	%esi, %edx
	movq	%r12, %rsi
	vcvtsd2ss	%xmm1, %xmm1, %xmm1
	addl	%edx, %ecx
	vcvtsd2ss	%xmm12, %xmm12, %xmm12
	vcvtss2sd	%xmm12, %xmm12, %xmm12
	vsubsd	.LC23(%rip), %xmm12, %xmm10
	vmulsd	.LC24(%rip), %xmm10, %xmm10
	vcvtsd2ss	%xmm10, %xmm10, %xmm10
	vmulss	148(%rsp), %xmm10, %xmm12
	vmulss	144(%rsp), %xmm10, %xmm9
	vfmadd231ss	132(%rsp), %xmm1, %xmm12
	vfmadd231ss	128(%rsp), %xmm1, %xmm9
	vmulss	152(%rsp), %xmm10, %xmm10
	vfmadd231ss	136(%rsp), %xmm1, %xmm10
	vaddss	.LC25(%rip), %xmm9, %xmm1
	vmovss	%xmm1, 144(%rsp)
	vaddss	%xmm5, %xmm12, %xmm1
	vmovss	%xmm1, 148(%rsp)
	vaddss	.LC26(%rip), %xmm10, %xmm1
	vmovss	%xmm1, 152(%rsp)
	vxorpd	%xmm1, %xmm1, %xmm1
	vcvtsi2sdq	%rcx, %xmm1, %xmm1
	movzwl	%ax, %ecx
	shrl	$16, %eax
	imull	$36969, %ecx, %ecx
	addl	%ecx, %eax
	movzwl	%dx, %ecx
	shrl	$16, %edx
	vaddsd	%xmm4, %xmm1, %xmm1
	imull	$18000, %ecx, %ecx
	movl	%eax, m_z(%rip)
	sall	$16, %eax
	vmulsd	%xmm6, %xmm1, %xmm1
	addl	%ecx, %edx
	addl	%edx, %eax
	movl	%edx, m_w(%rip)
	vcvtsi2sdq	%rax, %xmm2, %xmm2
	vcvtsd2ss	%xmm1, %xmm1, %xmm1
	vaddss	56(%rsp), %xmm1, %xmm1
	vaddsd	%xmm4, %xmm2, %xmm2
	vmulsd	%xmm6, %xmm2, %xmm2
	vcvtsd2ss	%xmm2, %xmm2, %xmm2
	vaddss	72(%rsp), %xmm2, %xmm2
	vfmadd213ss	64(%rsp), %xmm2, %xmm11
	vfmadd213ss	60(%rsp), %xmm2, %xmm15
	vfmadd213ss	68(%rsp), %xmm0, %xmm2
	vmovsd	%xmm4, 32(%rsp)
	vfmadd132ss	%xmm1, %xmm11, %xmm13
	vfmadd132ss	%xmm1, %xmm15, %xmm3
	vfmadd132ss	%xmm14, %xmm2, %xmm1
	vfmsub231ss	%xmm5, %xmm13, %xmm12
	vfmsub231ss	%xmm5, %xmm3, %xmm9
	vfmsub231ss	%xmm5, %xmm1, %xmm10
	vmulss	%xmm12, %xmm12, %xmm0
	vfmadd231ss	%xmm9, %xmm9, %xmm0
	vfmadd231ss	%xmm10, %xmm10, %xmm0
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vsqrtsd	%xmm0, %xmm0, %xmm0
	vdivsd	%xmm0, %xmm4, %xmm0
	vcvtsd2ss	%xmm0, %xmm0, %xmm0
	vmulss	%xmm0, %xmm9, %xmm9
	vmulss	%xmm0, %xmm12, %xmm8
	vmulss	%xmm0, %xmm10, %xmm0
	vmovss	%xmm9, 128(%rsp)
	vmovss	%xmm8, 132(%rsp)
	vmovss	%xmm0, 136(%rsp)
	call	sampler
	vmovss	52(%rsp), %xmm7
	subl	$1, %ebx
	vmovss	48(%rsp), %xmm5
	vmovaps	%xmm0, (%rsp)
	vmovd	(%rsp), %xmm0
	vmovsd	40(%rsp), %xmm6
	vfmadd213ss	28(%rsp), %xmm7, %xmm0
	vmovq	%xmm1, 8(%rsp)
	vmovdqa	(%rsp), %xmm4
	vmovss	%xmm0, 28(%rsp)
	vpsrldq	$4, %xmm4, %xmm0
	vfmadd213ss	24(%rsp), %xmm7, %xmm0
	vmovss	%xmm0, 24(%rsp)
	vpsrldq	$8, %xmm4, %xmm0
	vfmadd213ss	20(%rsp), %xmm7, %xmm0
	vmovsd	32(%rsp), %xmm4
	vmovss	%xmm0, 20(%rsp)
	jne	.L81
	vcvttss2si	28(%rsp), %ecx
	xorl	%eax, %eax
	movq	%r15, %rdx
	movl	$1, %esi
	vcvttss2si	%xmm0, %r9d
	movq	%r14, %rdi
	subl	$1, %r13d
	vmovsd	%xmm4, (%rsp)
	vcvttss2si	24(%rsp), %r8d
	vmovss	%xmm7, 40(%rsp)
	vmovsd	%xmm6, 32(%rsp)
	call	__fprintf_chk@PLT
	cmpl	$-1, %r13d
	vmovsd	(%rsp), %xmm4
	vmovsd	32(%rsp), %xmm6
	vmovss	48(%rsp), %xmm5
	vmovss	40(%rsp), %xmm7
	je	.L82
	vmovss	112(%rsp), %xmm15
	vmovss	96(%rsp), %xmm3
	vmovss	100(%rsp), %xmm13
	vmovss	116(%rsp), %xmm11
	vmovss	104(%rsp), %xmm14
	vmovss	120(%rsp), %xmm0
	jmp	.L85
.L82:
	subl	$1, 76(%rsp)
	movl	76(%rsp), %eax
	cmpl	$-1, %eax
	je	.L84
	vmovss	112(%rsp), %xmm15
	vmovss	96(%rsp), %xmm3
	vmovss	100(%rsp), %xmm13
	vmovss	116(%rsp), %xmm11
	vmovss	104(%rsp), %xmm14
	vmovss	120(%rsp), %xmm0
	jmp	.L72
.L89:
	movq	stderr(%rip), %rcx
	movl	$39, %edx
	movl	$1, %esi
	leaq	.LC18(%rip), %rdi
	call	fwrite@PLT
	movl	$-1, %eax
.L69:
	movq	168(%rsp), %rbx
	xorq	%fs:40, %rbx
	jne	.L90
	addq	$184, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L84:
	.cfi_restore_state
	movq	%r14, %rdi
	call	fclose@PLT
	xorl	%eax, %eax
	jmp	.L69
.L90:
	call	__stack_chk_fail@PLT
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
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	call	clock@PLT
	movq	%rax, %rbx
	call	clock@PLT
	vxorps	%xmm1, %xmm1, %xmm1
	vxorps	%xmm0, %xmm0, %xmm0
	leaq	.LC31(%rip), %rsi
	vcvtsi2ssq	%rbx, %xmm0, %xmm0
	movl	$1, %edi
	popq	%rbx
	.cfi_def_cfa_offset 8
	vcvtsi2ssq	%rax, %xmm1, %xmm1
	movl	$2, %eax
	vsubss	%xmm0, %xmm1, %xmm1
	vmulss	.LC29(%rip), %xmm1, %xmm1
	vmovsd	.LC30(%rip), %xmm0
	vcvtss2sd	%xmm1, %xmm1, %xmm1
	jmp	__printf_chk@PLT
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
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	leaq	16(%rsp), %r13
	.cfi_def_cfa 13, 0
	andq	$-32, %rsp
	pushq	-8(%r13)
	pushq	%rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp
	pushq	%r13
	.cfi_escape 0xf,0x3,0x76,0x78,0x6
	pushq	%rbx
	subq	$64, %rsp
	.cfi_escape 0x10,0x3,0x2,0x76,0x70
	call	clock@PLT
	vmovaps	.LC32(%rip), %ymm0
	vmovaps	.LC33(%rip), %ymm1
	movq	%rax, %rbx
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L94:
	vmulps	%ymm1, %ymm0, %ymm0
	addl	$1, %eax
	cmpl	$268435455, %eax
	jne	.L94
	vxorps	%xmm1, %xmm1, %xmm1
	vperm2f128	$33, %ymm1, %ymm0, %ymm2
	vmulps	%ymm2, %ymm0, %ymm0
	vperm2f128	$33, %ymm1, %ymm0, %ymm2
	vshufps	$78, %ymm2, %ymm0, %ymm2
	vmulps	%ymm2, %ymm0, %ymm0
	vperm2f128	$33, %ymm1, %ymm0, %ymm1
	vmovaps	%ymm0, -80(%rbp)
	vpalignr	$4, %ymm0, %ymm1, %ymm3
	vmovdqa	%ymm3, -48(%rbp)
	vzeroupper
	call	clock@PLT
	vxorps	%xmm1, %xmm1, %xmm1
	vxorps	%xmm2, %xmm2, %xmm2
	vmovaps	-80(%rbp), %ymm0
	vcvtsi2ssq	%rax, %xmm1, %xmm1
	vmulps	-48(%rbp), %ymm0, %ymm0
	leaq	.LC35(%rip), %rsi
	movl	$1, %edi
	vcvtsi2ssq	%rbx, %xmm2, %xmm2
	vmulss	.LC34(%rip), %xmm0, %xmm0
	movl	$2, %eax
	vsubss	%xmm2, %xmm1, %xmm1
	vmulss	.LC29(%rip), %xmm1, %xmm1
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vcvtss2sd	%xmm1, %xmm1, %xmm1
	vzeroupper
	addq	$64, %rsp
	popq	%rbx
	popq	%r13
	.cfi_def_cfa 13, 0
	popq	%rbp
	leaq	-16(%r13), %rsp
	.cfi_def_cfa 7, 16
	popq	%r13
	.cfi_def_cfa_offset 8
	jmp	__printf_chk@PLT
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
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	call	clock@PLT
	movq	%rax, %rbx
	call	clock@PLT
	vxorps	%xmm1, %xmm1, %xmm1
	vxorps	%xmm0, %xmm0, %xmm0
	leaq	.LC37(%rip), %rsi
	vcvtsi2ssq	%rbx, %xmm0, %xmm0
	movl	$1, %edi
	popq	%rbx
	.cfi_def_cfa_offset 8
	vcvtsi2ssq	%rax, %xmm1, %xmm1
	movl	$2, %eax
	vsubss	%xmm0, %xmm1, %xmm1
	vmulss	.LC29(%rip), %xmm1, %xmm1
	vmovsd	.LC36(%rip), %xmm0
	vcvtss2sd	%xmm1, %xmm1, %xmm1
	jmp	__printf_chk@PLT
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
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	call	clock@PLT
	vmovss	.LC38(%rip), %xmm6
	vmovss	.LC12(%rip), %xmm5
	vmovss	.LC39(%rip), %xmm4
	movq	%rax, %rbx
	movl	$2147483647, %eax
	vmovaps	%xmm6, %xmm1
	vmovaps	%xmm5, %xmm3
	vmovaps	%xmm4, %xmm0
	.p2align 4,,10
	.p2align 3
.L100:
	vmulss	%xmm5, %xmm1, %xmm7
	vmulss	%xmm6, %xmm0, %xmm2
	vfmsub231ss	%xmm4, %xmm1, %xmm2
	vmulss	%xmm4, %xmm3, %xmm1
	vfmsub132ss	%xmm6, %xmm7, %xmm3
	vfmsub231ss	%xmm5, %xmm0, %xmm1
	vmovaps	%xmm3, %xmm0
	vmovaps	%xmm2, %xmm3
	subq	$1, %rax
	jne	.L100
	vmovss	%xmm0, 12(%rsp)
	call	clock@PLT
	vxorps	%xmm1, %xmm1, %xmm1
	vxorps	%xmm2, %xmm2, %xmm2
	vmovss	12(%rsp), %xmm0
	vcvtsi2ssq	%rax, %xmm1, %xmm1
	movl	$1, %edi
	movl	$2, %eax
	vcvtsi2ssq	%rbx, %xmm2, %xmm2
	leaq	.LC40(%rip), %rsi
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vsubss	%xmm2, %xmm1, %xmm1
	vmulss	.LC29(%rip), %xmm1, %xmm1
	addq	$16, %rsp
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	vcvtss2sd	%xmm1, %xmm1, %xmm1
	jmp	__printf_chk@PLT
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
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	call	clock@PLT
	vmovsd	.LC41(%rip), %xmm1
	vmovss	.LC38(%rip), %xmm3
	movq	%rax, %rbx
	vmovss	.LC12(%rip), %xmm2
	movl	$2147483647, %eax
	vmovss	.LC39(%rip), %xmm0
	vmovsd	.LC0(%rip), %xmm4
	jmp	.L105
	.p2align 4,,10
	.p2align 3
.L107:
	vmulss	%xmm2, %xmm2, %xmm1
	vfmadd231ss	%xmm0, %xmm0, %xmm1
	vfmadd231ss	%xmm3, %xmm3, %xmm1
	vcvtss2sd	%xmm1, %xmm1, %xmm1
	vsqrtsd	%xmm1, %xmm1, %xmm1
.L105:
	vdivsd	%xmm1, %xmm4, %xmm1
	vcvtsd2ss	%xmm1, %xmm1, %xmm1
	vmulss	%xmm1, %xmm0, %xmm0
	vmulss	%xmm1, %xmm2, %xmm2
	vmulss	%xmm1, %xmm3, %xmm3
	subq	$1, %rax
	jne	.L107
	vmovss	%xmm0, 12(%rsp)
	call	clock@PLT
	vxorps	%xmm1, %xmm1, %xmm1
	vxorps	%xmm2, %xmm2, %xmm2
	vmovss	12(%rsp), %xmm0
	vcvtsi2ssq	%rax, %xmm1, %xmm1
	movl	$1, %edi
	movl	$2, %eax
	vcvtsi2ssq	%rbx, %xmm2, %xmm2
	leaq	.LC42(%rip), %rsi
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vsubss	%xmm2, %xmm1, %xmm1
	vmulss	.LC29(%rip), %xmm1, %xmm1
	addq	$16, %rsp
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	vcvtss2sd	%xmm1, %xmm1, %xmm1
	jmp	__printf_chk@PLT
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
	vmovsd	.LC2(%rip), %xmm2
	movq	%rax, %rbx
	vxorps	%xmm0, %xmm0, %xmm0
	.p2align 4,,10
	.p2align 3
.L111:
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
	jne	.L111
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
	leaq	.LC43(%rip), %rsi
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vsubss	%xmm2, %xmm1, %xmm1
	vmulss	.LC29(%rip), %xmm1, %xmm1
	addq	$16, %rsp
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	vcvtss2sd	%xmm1, %xmm1, %xmm1
	jmp	__printf_chk@PLT
	.cfi_endproc
.LFE602:
	.size	bench_opRand, .-bench_opRand
	.p2align 4,,15
	.globl	benchOps
	.type	benchOps, @function
benchOps:
.LFB603:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	leaq	16(%rsp), %r13
	.cfi_def_cfa 13, 0
	andq	$-32, %rsp
	pushq	-8(%r13)
	pushq	%rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp
	pushq	%r13
	.cfi_escape 0xf,0x3,0x76,0x78,0x6
	pushq	%rbx
	subq	$96, %rsp
	.cfi_escape 0x10,0x3,0x2,0x76,0x70
	call	clock@PLT
	movq	%rax, %rbx
	call	clock@PLT
	vxorps	%xmm1, %xmm1, %xmm1
	vxorps	%xmm0, %xmm0, %xmm0
	leaq	.LC31(%rip), %rsi
	vcvtsi2ssq	%rbx, %xmm0, %xmm0
	movl	$1, %edi
	vcvtsi2ssq	%rax, %xmm1, %xmm1
	movl	$2, %eax
	vsubss	%xmm0, %xmm1, %xmm1
	vmulss	.LC29(%rip), %xmm1, %xmm1
	vmovsd	.LC30(%rip), %xmm0
	vcvtss2sd	%xmm1, %xmm1, %xmm1
	call	__printf_chk@PLT
	call	clock@PLT
	vmovaps	.LC32(%rip), %ymm0
	vmovaps	.LC33(%rip), %ymm1
	movq	%rax, %rbx
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L115:
	vmulps	%ymm1, %ymm0, %ymm0
	addl	$1, %eax
	cmpl	$268435455, %eax
	jne	.L115
	vxorps	%xmm1, %xmm1, %xmm1
	vperm2f128	$33, %ymm1, %ymm0, %ymm2
	vmulps	%ymm0, %ymm2, %ymm2
	vperm2f128	$33, %ymm1, %ymm2, %ymm0
	vshufps	$78, %ymm0, %ymm2, %ymm0
	vmulps	%ymm2, %ymm0, %ymm0
	vperm2f128	$33, %ymm1, %ymm0, %ymm1
	vmovaps	%ymm0, -80(%rbp)
	vpalignr	$4, %ymm0, %ymm1, %ymm6
	vmovdqa	%ymm6, -48(%rbp)
	vzeroupper
	call	clock@PLT
	vxorps	%xmm1, %xmm1, %xmm1
	vxorps	%xmm2, %xmm2, %xmm2
	vmovaps	-80(%rbp), %ymm0
	vcvtsi2ssq	%rax, %xmm1, %xmm1
	vmulps	-48(%rbp), %ymm0, %ymm0
	leaq	.LC35(%rip), %rsi
	movl	$1, %edi
	vcvtsi2ssq	%rbx, %xmm2, %xmm2
	vmulss	.LC34(%rip), %xmm0, %xmm0
	movl	$2, %eax
	vsubss	%xmm2, %xmm1, %xmm1
	vmulss	.LC29(%rip), %xmm1, %xmm1
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vcvtss2sd	%xmm1, %xmm1, %xmm1
	vzeroupper
	call	__printf_chk@PLT
	call	clock@PLT
	movq	%rax, %rbx
	call	clock@PLT
	vxorps	%xmm1, %xmm1, %xmm1
	vxorps	%xmm0, %xmm0, %xmm0
	leaq	.LC37(%rip), %rsi
	vcvtsi2ssq	%rbx, %xmm0, %xmm0
	movl	$1, %edi
	vcvtsi2ssq	%rax, %xmm1, %xmm1
	movl	$2, %eax
	vsubss	%xmm0, %xmm1, %xmm1
	vmulss	.LC29(%rip), %xmm1, %xmm1
	vmovsd	.LC36(%rip), %xmm0
	vcvtss2sd	%xmm1, %xmm1, %xmm1
	call	__printf_chk@PLT
	call	clock@PLT
	vmovss	.LC39(%rip), %xmm2
	vmovss	.LC38(%rip), %xmm4
	vmovss	.LC12(%rip), %xmm3
	movq	%rax, %rbx
	movl	$2147483647, %eax
	vmovaps	%xmm2, %xmm0
	vmovaps	%xmm4, %xmm7
	vmovaps	%xmm3, %xmm1
	.p2align 4,,10
	.p2align 3
.L116:
	vmulss	%xmm3, %xmm7, %xmm5
	vmulss	%xmm4, %xmm0, %xmm6
	vfmsub231ss	%xmm4, %xmm1, %xmm5
	vmulss	%xmm2, %xmm1, %xmm1
	vfmsub231ss	%xmm2, %xmm7, %xmm6
	vmovaps	%xmm0, %xmm7
	vmovaps	%xmm5, %xmm0
	vfmsub132ss	%xmm3, %xmm1, %xmm7
	vmovaps	%xmm6, %xmm1
	subq	$1, %rax
	jne	.L116
	vmovss	%xmm3, -88(%rbp)
	vmovss	%xmm2, -84(%rbp)
	vmovss	%xmm4, -80(%rbp)
	vmovss	%xmm5, -48(%rbp)
	call	clock@PLT
	vxorps	%xmm1, %xmm1, %xmm1
	vxorps	%xmm5, %xmm5, %xmm5
	vmovss	-48(%rbp), %xmm0
	vcvtsi2ssq	%rbx, %xmm5, %xmm5
	leaq	.LC40(%rip), %rsi
	movl	$1, %edi
	vcvtsi2ssq	%rax, %xmm1, %xmm1
	movl	$2, %eax
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vsubss	%xmm5, %xmm1, %xmm1
	vmulss	.LC29(%rip), %xmm1, %xmm1
	vcvtss2sd	%xmm1, %xmm1, %xmm1
	call	__printf_chk@PLT
	call	clock@PLT
	vmovss	-84(%rbp), %xmm2
	vmovss	-80(%rbp), %xmm4
	movq	%rax, %rbx
	vmovsd	.LC41(%rip), %xmm1
	movl	$2147483647, %eax
	vmovss	-88(%rbp), %xmm3
	vmovaps	%xmm2, %xmm0
	vmovsd	.LC0(%rip), %xmm2
	jmp	.L118
	.p2align 4,,10
	.p2align 3
.L126:
	vmulss	%xmm0, %xmm0, %xmm1
	vfmadd231ss	%xmm4, %xmm4, %xmm1
	vfmadd231ss	%xmm3, %xmm3, %xmm1
	vcvtss2sd	%xmm1, %xmm1, %xmm1
	vsqrtsd	%xmm1, %xmm1, %xmm1
.L118:
	vdivsd	%xmm1, %xmm2, %xmm1
	vcvtsd2ss	%xmm1, %xmm1, %xmm1
	vmulss	%xmm1, %xmm0, %xmm0
	vmulss	%xmm1, %xmm3, %xmm3
	vmulss	%xmm1, %xmm4, %xmm4
	subq	$1, %rax
	jne	.L126
	vmovsd	%xmm2, -80(%rbp)
	vmovss	%xmm0, -48(%rbp)
	call	clock@PLT
	vxorps	%xmm1, %xmm1, %xmm1
	vxorps	%xmm3, %xmm3, %xmm3
	vmovss	-48(%rbp), %xmm0
	vcvtsi2ssq	%rbx, %xmm3, %xmm3
	leaq	.LC42(%rip), %rsi
	movl	$1, %edi
	vcvtsi2ssq	%rax, %xmm1, %xmm1
	movl	$2, %eax
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vsubss	%xmm3, %xmm1, %xmm1
	vmulss	.LC29(%rip), %xmm1, %xmm1
	vcvtss2sd	%xmm1, %xmm1, %xmm1
	call	__printf_chk@PLT
	call	clock@PLT
	movl	m_z(%rip), %ecx
	movl	m_w(%rip), %edx
	movl	$2147483647, %esi
	vmovsd	.LC2(%rip), %xmm3
	vmovsd	-80(%rbp), %xmm2
	movq	%rax, %rbx
	vxorps	%xmm0, %xmm0, %xmm0
	.p2align 4,,10
	.p2align 3
.L121:
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
	vaddsd	%xmm2, %xmm1, %xmm1
	vmulsd	%xmm3, %xmm1, %xmm1
	vcvtsd2ss	%xmm1, %xmm1, %xmm1
	vaddss	%xmm1, %xmm0, %xmm0
	subq	$1, %rsi
	jne	.L121
	vmovss	%xmm0, -48(%rbp)
	movl	%ecx, m_z(%rip)
	movl	%edx, m_w(%rip)
	call	clock@PLT
	vxorps	%xmm1, %xmm1, %xmm1
	vxorps	%xmm2, %xmm2, %xmm2
	vmovss	-48(%rbp), %xmm0
	vcvtsi2ssq	%rax, %xmm1, %xmm1
	movl	$1, %edi
	movl	$2, %eax
	vcvtsi2ssq	%rbx, %xmm2, %xmm2
	leaq	.LC43(%rip), %rsi
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vsubss	%xmm2, %xmm1, %xmm1
	vmulss	.LC29(%rip), %xmm1, %xmm1
	addq	$96, %rsp
	popq	%rbx
	popq	%r13
	.cfi_def_cfa 13, 0
	popq	%rbp
	leaq	-16(%r13), %rsp
	.cfi_def_cfa 7, 16
	popq	%r13
	.cfi_def_cfa_offset 8
	vcvtss2sd	%xmm1, %xmm1, %xmm1
	jmp	__printf_chk@PLT
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
