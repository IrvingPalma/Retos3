#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <math.h>

extern double limiteBinASM(int N);

double limiteC(int N){
	double limite,lim;
    
        limite=1+1.0/N;

        if(N==0) return 1.0;
        if(N==1) return limite;
        else if(N%2==0){
               lim=pow(limite,N/2);
               limite=lim*lim;
               return limite;
        }else{
               N--;
               lim=pow(limite,N/2);
               limite=lim*lim*limite;
               return limite;
        }
}



int main(int argc, char** argv){
    struct timespec time1, time2;
    int  N;
    double limite;

    N = (int)atoi(argv[1]);

    clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &time1); 
    limite=limiteC(N);
    clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &time2); 
    double tC = (double)((time2.tv_sec-time1.tv_sec) + (time2.tv_nsec-time1.tv_nsec)/1e9); 

    printf("Limite en C: %lf\n",limite);
    
    clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &time1); 
    limite=limiteBinASM(N);
    clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &time2); 
    double tASM = (double)((time2.tv_sec-time1.tv_sec) + (time2.tv_nsec-time1.tv_nsec)/1e9);

    printf("Limite en ASM: %lf\n",limite);
    
    printf("El tiempo de ejecución en C es: %.5f ms\n", tC*1e3);
    printf("El tiempo de ejecución en ASM es: %.5f ms\n", tASM*1e3);
    printf("El speed-up es: %.5f \n", tC/tASM);
  


    return 0;
}



/*

5. Para este caso se obtuvo:

Limite en C: 2.718280
Limite en ASM: 2.718280
El tiempo de ejecución en C es: 0.00935 ms
El tiempo de ejecución en ASM es: 0.60817 ms
El speed-up es: 0.01538 

Comparado con el speedup anterior de 0.00767, este es mayor con respecto al C y el ASM,
destacándo la rapidez del Asm sobre el C.
*/


