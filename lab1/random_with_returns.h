#include <iostream>
#include <fstream>
#include <random>
#include <vector>
#include <cstdlib>

float random_standart();

using namespace std;
class random_with_returns
{
    private:
        vector<pair<int, float> > distribution;
    public:
        random_with_returns(vector<pair<int, float> > input) {
            distribution = input;
            for (unsigned long i = 1; i <  distribution.size(); ++i){
                distribution[i].second += distribution[i-1].second;
            }
        }
        random_with_returns(string filename) {
            int line_count;
            ifstream inp;
            inp.open(filename.c_str());
            inp >> line_count;
            cout << "FROM FILELine count is " << line_count << endl;
            distribution.resize(line_count);

            for (int i = 0; i < line_count; ++i){
                int digit;
                float chance;
                inp >> digit >> chance;
                distribution[i] = pair<int, float>(digit, chance);
            }

            for (unsigned long i = 1; i <  distribution.size(); ++i){
                distribution[i].second += distribution[i-1].second;
            }
            inp.close();
        }
        void print_distribution() {
            for (unsigned long i = 0; i <  distribution.size(); ++i){
                cout << distribution[i].first << " " << distribution[i].second << endl;
            }
        }

        int random() {
            float random_number = random_standart();
            unsigned long index = 0;
            while(index < distribution.size() && random_number > distribution[index].second) {
                index++;
            }
            return distribution[index].first;
        }
};
