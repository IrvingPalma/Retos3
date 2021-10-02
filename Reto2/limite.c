#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>

extern double limiteASM(int N);

double limiteC(int N){
	double limite;
    
    limite=pow((1+1.0/N),N);

	return limite;
}


int main(int argc, char** argv){
    struct timespec time1, time2; 
    int  N;
    double limite,limite2;

    N = (int)atoi(argv[1]);

    clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &time1); 
    limite=limiteC(N);
    clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &time2); 
    double tC = (double)((time2.tv_sec-time1.tv_sec) + (time2.tv_nsec-time1.tv_nsec)/1e9); 
    printf("Limite en C: %lf\n",limite);
   

  

    clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &time1); 
    limite2=limiteASM(N);
    clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &time2);
    double tASM = (double)((time2.tv_sec-time1.tv_sec) + (time2.tv_nsec-time1.tv_nsec)/1e9);
    printf("Limite en ASM: %lf\n",limite2);


    printf("El tiempo de ejecución en C es: %.5f ms\n", tC*1e3);
    printf("El tiempo de ejecución en ASM es: %.5f ms\n", tASM*1e3);
    printf("El speed-up es: %.5f \n", tC/tASM);
    
    return 0;
}


/**************************************************************
5. Cuando los valores de n tienden al infinito, el valor
resultante tiende a un número en específico, siendo
este el número de euler de aproximadamente:

2.718280

**************************************************************
*/

/**************************************************************
CASO REGISTRADO EN UNA EJECUCIÓN DEL BASH:

Limite en C: 2.718280
Limite en ASM: 2.718280
El tiempo de ejecución en C es: 0.00859 ms
El tiempo de ejecución en ASM es: 1.12017 ms
El speed-up es: 0.00767 
**************************************************************
*/


