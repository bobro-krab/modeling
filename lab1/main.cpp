#include <stdlib.h>
#include <stdio.h>
#include <time.h>
#include <iostream>
#include <random>
#include <vector>
#include <limits.h>
using namespace std;
enum some { array_size = 315 }; // size is pi(3.1415 * 100)

float random_standart()
{
    return (float)rand() / (float)RAND_MAX;
}

int random_int(int max)
{
    return (int)((float)random_standart() * (float)max);
}

class random_with_returns
{
    private:
        vector<pair<int, float> > distrubution;
    public:
        random_with_returns(vector<pair<int, float> > input) {
            distrubution = input;
            for (unsigned long i = 1; i <  distrubution.size(); ++i){
                distrubution[i].second += distrubution[i-1].second;
            }
        }
        void print_distribution() {
            for (unsigned long i = 0; i <  distrubution.size(); ++i){
                cout << distrubution[i].first << " " << distrubution[i].second << endl;
            }
        }

        int random() {
            float random_number = random_standart();
            int index = 0;
            while(random_number > distrubution[index].second) {
                index++;
            }
            return distrubution[index].first;
        }
};

class random_withot_returns
{
private:
    int right_delim; // limit already taken random number, then shift it
    int array_size;
    vector<int> digits;
public:
    random_withot_returns():digits(0){};
    random_withot_returns(vector<int> lol):digits(lol){}

    int random()
    {
        array_size = 10;
        if (digits.size() == 0) {
            digits.resize(array_size);
            right_delim = array_size - 1; // last number
            for (int i = 0; i < array_size; ++i){
                digits[i] = i;
                // cout << digits[i] << "\n";
            }
            // cout << "Lalka" << endl;
        }
        if (right_delim < 0) {
            return - 1;
        }
        int random_index = random_int(right_delim);
        int temp = digits[random_index];
        digits[random_index] = digits[right_delim];
        digits[right_delim] = temp;
        right_delim--;
        return temp;
    }

};

float random_distributed()
{
    float rand = random_standart();
    return std::acos(1 - 2 * rand);
}

int main(int argc, char **argv)
{
    srand(time(NULL));
    int item_count = 10000;
    if (argc > 1) {
        item_count = atoi(argv[1]);
    }

    vector<pair<int, float> > distrubution;
    int line_count;
    // cin >> line_count;
    scanf("%d", &line_count);
    fflush(stdout);
    cout << "Line count is " << line_count << endl;

    distrubution.resize(line_count);
    for (int i = 0; i < line_count; ++i){
        int digit;
        float chance;
        cin >> digit >> chance;
        distrubution[i] = pair<int, float>(digit, chance);
    }

    class random_with_returns returned(distrubution);
    returned.print_distribution();
    int stat[4] = {0};

    for (int i = 0; i < 10000; ++i){
        // cout << returned.random()<<endl;
        stat[returned.random()]++;
        // cout << random_int(100) << endl;
    }

    for (int i = 1; i < 4; ++i){
        cout << stat[i] << endl;
    }



    // int histogram[array_size] = {0};
    // for (int i = 0; i < item_count; ++i){
    //     histogram[(int)(random_distributed() * 100)] += 1;
    // }
    //
    // for (int i = 0; i < array_size; ++i) {
    //     cout << histogram[i] << endl;
    // }
    return 0;
}


