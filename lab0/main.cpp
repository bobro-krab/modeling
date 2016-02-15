#include <stdlib.h>
#include <stdio.h>
#include <time.h>

enum some {n=1000000, intervalCount=10000};

int main(int argc, char *argv[])
{
    srand(time(NULL));
    float numbers[n] = {0};
    int intervals[intervalCount] = {0};
    float currentNumber = 0;
    float intervalLength = (float) intervalCount / (float) n;

    for (int i = 0; i < n; ++i){
        currentNumber = (float)((float)rand() / (float)RAND_MAX);
        intervals[(int)(currentNumber / intervalLength)] += 1;
        numbers[i] = currentNumber;
    }

    float V = 0.0;
    for (int i = 0; i < intervalCount; ++i){
        V += (float)(intervals[i] * intervals[i]) / (float)intervalLength;
    }

    // for (int i = 0; i < intervalCount; ++i){
    //     printf("%d\n ", intervals[i]);
    // }

    V = V / (float)n - (float)n;
    printf("UEEE %lf\n", V);

    // Autocorelation
    float average = 0;    // math exception
    float dispersion = 0;
    for (int i = 0; i < n; ++i){
        average += numbers[i];
        dispersion += numbers[i] * numbers[i];
    }
    average /= n;
    dispersion /= n;

    int tau = 0;
    for (tau = 0; tau < 1000; ++tau){
        float S = 0.0;
        for (int i = 0; i < n; ++i){
            S = S + numbers[i] * numbers[(i + tau) % n];
        }
        S /= n - tau;
        float corr = S + average * average / (dispersion * dispersion);
        printf("Tau: %d Corr: %f\n", tau, corr);
    }

    return 0;
}
