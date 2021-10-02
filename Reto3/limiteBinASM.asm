section .data

    uno dq 1.0

global limiteBinASM

section	.text

limiteBinASM:
	xorpd	xmm0,	xmm0
	xorpd	xmm1,	xmm1
	xorpd	xmm2,	xmm2
	xorpd	xmm3,	xmm3
    movsd xmm4,QWORD[rel uno]
    movsd xmm10,QWORD[rel uno]
	cmp	rdi, 0
	je	done
    mov rcx,0
    xorpd xmm4, xmm4

dividir:
    cvtsi2sd xmm0,rdi
    movsd xmm1,QWORD[rel uno]
    divsd xmm1, xmm0
suma:
    movsd xmm2,QWORD[rel uno]
    addsd xmm1,xmm2

verificandoExponenteBin:
        mov rax,rdi
        mov rbx,2
        cdq
        idiv rbx
        cmp rdx,rcx
        je potencia
        jmp expoImpar


expoImpar:
    movsd xmm10,xmm1
    dec rdi 
     
      
potencia:
    mov rax,rdi
    mov rbx,2
    cdq
    idiv rbx
    mov rdi,rax
    mov rax,1
    movsd xmm4,xmm1
    cmp rdi,0
    je fin 
    bucle: 
        cmp rax,rdi
        je done
        movsd xmm3,xmm1
        mulsd xmm4,xmm3
        inc rax
        jmp bucle

done:
    mulsd xmm4,xmm4
    mulsd xmm4,xmm10
    fin:
	movsd	xmm0,	xmm4
	ret