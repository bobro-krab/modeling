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
void test_with_returns();
void test_without_returns();

int main(int argc, char **argv)
{
    int item_count = 100000;
    if (argc > 1) {
        item_count = atoi(argv[1]);
    }

    test_distributed(item_count);
    test_without_returns();
    test_with_returns();

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
    ofstream out;
    out.open("distributed.res");
    cout << "Distributed save to 'Distributed.res' file" << endl;
    for (int i = 0; i < item_count; ++i){
        histogram[(int)(random_distributed() * 100)] += 1;
    }

    for (int i = 0; i < array_size; ++i) {
        out << histogram[i] << endl;
    }
    out.close();
}

void test_without_returns()
{
    class random_without_returns returned("input_without_returns");
    returned.print_distribution();

    cout << "without Returns result" << endl;
    try {
        for (int i = 0; i < 10; ++i){
            cout << returned.random() << "\n";
        }
    } catch (string s) {
        cout << s << endl;
    }

}

void test_with_returns()
{
    class random_with_returns returned("input");
    returned.print_distribution();
    int statistics[4] = {0};

    for (int i = 0; i < 10000; ++i){
        statistics[returned.random()]++;
    }

    cout << "With returns histogram" << endl;
    for (int i = 0; i < 3; ++i){
        cout << statistics[i+1] << endl;
    }
}
