#include <stdlib.h>
#include <stdio.h>
#include <time.h>
#include <iostream>
#include <random>
using namespace std;

enum some {n=1000000, intervalCount=10000, tau_diap=1000};

// Random function to be tested
float random_standart()
{
    return (float)rand() / (float)RAND_MAX;
}

float function(float a, float x) {
    return  std::sin(x) * a;
}

float random_distributed()
{
        float rand = random_standart();
        return std::acos(rand);
}


// Calculate chi-square and autocorrelation
int main()
{

    int histogram[180] = {0};
    for (int i = 0; i < 10000; ++i){
        // cout << random_distributed() << endl;
        histogram[(int)(random_distributed() * 100)] += 1;
    }

    for (int i = 0; i < 150; ++i){
        cout << histogram[i] << endl;
    }
    return 0;
}


