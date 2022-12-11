#include <stdio.h>
#include <math.h>
int main(){
    int reps = 100; // Numero Maximo de
                    // Iteraciones
    float temp, aux = 1, n = 100, sum_x = 53.71737, epsilon = 0.05;
    for(int i = 0; i < reps; i++){
        temp = aux;
        aux = aux - (n/aux - sum_x)/(-n/pow(aux, 2));
        if(fabs(aux - temp) < epsilon)
            break;
    }
    printf("Raiz por Newton Rhapson: %f\n", aux);
    return 0;
}
