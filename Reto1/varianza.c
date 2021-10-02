#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>


extern double ASMvarianza(int N,double *arr);

double Fvarianza(double *arr, int N){
	double media=0;
	for(int i=0;i<N;i++)
		media+=arr[i];
	media=media/(double)N;

	double varianza=0;

	for(int i=0;i<N;i++){
		varianza=varianza+pow(arr[i]-media,2.0);
	}
	varianza=varianza/(double)N;
	return varianza;
}


int main(int argc, char** argv){
    struct timespec time1, time2; 
    int i, N, r1, r2;
    double *arr;

    N = argc - 1; 
    arr = (double*) malloc(N*sizeof(double));
    //printf("%d\n", sizeof(arr));
    if (argc < 2){
        N = 3;
        for (i = 0; i < N; i++) arr[i] = i;
    } else{
        for (i = 1; i < argc; i++) arr[i-1] = (double)atof(argv[i]);
    }
    double varianza;


    clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &time1); 
	varianza=Fvarianza(arr,N);
    clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &time2);  

   double tC = (double)((time2.tv_sec-time1.tv_sec) + (time2.tv_nsec-time1.tv_nsec)/1e9); 

    printf("Varianza C: %lf\n",varianza);
    
	clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &time1); 
	varianza=ASMvarianza(N,arr);
    clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &time2);  
    double tASM = (double)((time2.tv_sec-time1.tv_sec) + (time2.tv_nsec-time1.tv_nsec)/1e9);

	printf("Varianza ASM: %lf\n",varianza); 

    printf("El tiempo de ejecución en C es: %.5f ms\n", tC*1e3);
    printf("El tiempo de ejecución en ASM es: %.5f ms\n", tASM*1e3);
    printf("El speed-up es: %.2f \n", tC/tASM);


    return 0;
}












