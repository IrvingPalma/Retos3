section .data

    uno dq 1.0

global limiteASM

section	.text

limiteASM:
	xorpd	xmm0,	xmm0
	xorpd	xmm1,	xmm1
	xorpd	xmm2,	xmm2
	xorpd	xmm3,	xmm3
	xorpd	xmm4,	xmm4
	cmp	rdi,	0
	je	done
    mov rcx,0
    

 dividir:
    cvtsi2sd xmm0,rdi
    movsd xmm1,QWORD[rel uno]
    divsd xmm1, xmm0
suma:
    movsd xmm2,QWORD[rel uno]
    addsd xmm1,xmm2

    mov rax,1
    movsd xmm4,xmm1
    bucle: 
        cmp rax,rdi
        je done
        movsd xmm3,xmm1
        mulsd xmm4,xmm3
        inc rax
        jmp bucle


done:
	movsd	xmm0,	xmm4
	ret