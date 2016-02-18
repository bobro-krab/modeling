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

int main()
{
    return 0;
}
