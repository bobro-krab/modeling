#include <stdlib.h>
#include <stdio.h>
#include <time.h>
#include <iostream>
#include <random>
using namespace std;

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


int main()
{

    int histogram[180] = {0};
    for (int i = 0; i < 10000; ++i){
        histogram[(int)(random_distributed() * 100)] += 1;
    }

    for (int i = 0; i < 180; ++i){
        cout << histogram[i] << endl;
    }
    return 0;
}


