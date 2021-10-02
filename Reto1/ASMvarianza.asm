global ASMvarianza

section	.text

ASMvarianza:
	xorpd	xmm0,	xmm0
	xorpd	xmm1,	xmm1
	xorpd	xmm2,	xmm2
	xorpd	xmm3,	xmm3
	xorpd	xmm4,	xmm4
	cmp	rdi,	0
	je	done
    mov rcx,0
    


media:
    cmp rcx,rdi
    je dividir
    movsd xmm0, QWORD[rsi+rcx*8]
    addsd xmm2,xmm0
    inc rcx
    jmp media

dividir:
    cvtsi2sd xmm3,rcx
    divsd xmm2,xmm3

sum_cuadrados:
        mov rcx,0
        bucle1:
           cmp rcx,rdi
           je dividir2
           movsd xmm0, QWORD[rsi+rcx*8]
           movsd xmm5,xmm2
           subsd xmm5, xmm0
           mulsd xmm5,xmm5
           addsd xmm4,xmm5
           inc rcx
           jmp bucle1
 

dividir2:
        divsd xmm4,xmm3



done:
	movsd	xmm0,	xmm4
	ret
















