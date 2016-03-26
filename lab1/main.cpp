#include <stdlib.h>
#include <stdio.h>
#include <time.h>
#include <iostream>
#include <fstream>
#include <random>
#include <vector>
#include <limits.h>

#include "random_with_returns.h"
#include "random_without_returns.h"
using namespace std;
enum some { array_size = 315 }; // size is pi(3.1415 * 100)

float random_standart();
float random_distributed();
void test_distributed(int item_count);

int main(int argc, char **argv)
{
    int item_count = 10000;
    if (argc > 1) {
        item_count = atoi(argv[1]);
    }

    // vector<pair<int, float> > distribution;
    // class random_with_returns returned(distribution);
    class random_without_returns returned("input_without_returns");
    returned.print_distribution();

    try {
        for (int i = 0; i < 10; ++i){
            // cout << returned.random()<<endl;
            cout << returned.random() << "\n";
            // cout << random_int(100) << endl;
        }
    } catch (string s) {
        cout << s << endl;
    }


    return 0;
}


float random_standart()
{
    return (float)rand() / (float)RAND_MAX;
}

int random_int(int max)
{
    return (int)((float)random_standart() * (float)max);
}

float random_distributed()
{
    float rand = random_standart();
    return std::acos(1 - 2 * rand);
}

void test_distributed(int item_count)
{
    int histogram[array_size] = {0};
    for (int i = 0; i < item_count; ++i){
        histogram[(int)(random_distributed() * 100)] += 1;
    }

    for (int i = 0; i < array_size; ++i) {
        cout << histogram[i] << endl;
    }
}
