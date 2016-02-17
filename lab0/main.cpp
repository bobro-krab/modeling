#include <stdlib.h>
#include <stdio.h>
#include <time.h>
#include <iostream>
#include <random>

enum some {n=1000000, intervalCount=10000, tau_diap=1000};

// Random function to be tested
float random_standart()
{
    return (float)rand() / (float)RAND_MAX;
}

std::random_device                  rand_dev;
std::mt19937                        generator(rand_dev());
std::uniform_real_distribution<float> distribution(0.0,1.0);

float random_uniform()
{
    return distribution(generator);
}

// Calculate chi-square and autocorrelation
// for given random() function
int standart_test( float(*random)())
{
    srand(time(NULL));
    float numbers[n] = {0};
    int intervals[intervalCount] = {0};
    float currentNumber = 0;
    float intervalLength = (float) intervalCount / (float) n;

    for (int i = 0; i < n; ++i){
        currentNumber = random();
        intervals[(int)(currentNumber / intervalLength)] += 1;
        numbers[i] = currentNumber;
    }

    float V = 0.0;
    for (int i = 0; i < intervalCount; ++i){
        V += (float)(intervals[i] * intervals[i]) / (float)intervalLength;
    }

    V = V / (float)n - (float)n;
    printf("Chi-square %lf\n", V);

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
    float summ = 0.0;
    for (tau = 0; tau < tau_diap; ++tau) {
        float S = 0.0;
        for (int i = 0; i < n; ++i){
            S = S + numbers[i] * numbers[(i + tau) % n];
        }
        S /= n - tau;
        float corr = S + average * average / (dispersion * dispersion);
        summ += corr;
    }
    summ /= tau_diap;
    printf("Autocorrelation: %f\n", summ);

    return 0;
}

int main()
{
    printf("Builtin random: \n");
    standart_test(random_uniform);
    printf("Uniform distribution: \n");
    standart_test(random_standart);
    return 0;
}
