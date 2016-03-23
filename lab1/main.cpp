#include <stdlib.h>
#include <stdio.h>
#include <time.h>
#include <iostream>
#include <random>
using namespace std;
enum some { array_size = 315 }; // size is pi(3.1415 * 100)

float random_standart()
{
    return (float)rand() / (float)RAND_MAX;
}

float random_distributed()
{
        float rand = random_standart();
        return std::acos(1 - 2 * rand);
}


int main(int argc, char **argv)
{
    int item_count = 10000;
    if (argc > 1) {
        item_count = atoi(argv[1]);
    }

    int histogram[array_size] = {0};
    for (int i = 0; i < item_count; ++i){
        histogram[(int)(random_distributed() * 100)] += 1;
    }

    for (int i = 0; i < array_size; ++i) {
        cout << histogram[i] << endl;
    }
    return 0;
}


