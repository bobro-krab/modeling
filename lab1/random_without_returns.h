#include <iostream>
#include <fstream>
#include <random>
#include <vector>
#include <cstdlib>

float random_standart();

using namespace std;
class random_without_returns
{
    private:
        vector<pair<int, float> > distribution;
        int right_delim;
    public:
        random_without_returns(vector<pair<int, float> > input) {
            distribution = input;
            right_delim = distribution.size() - 1;
            // for (unsigned long i = 1; i <  distribution.size(); ++i){
            //     distribution[i].second += distribution[i-1].second;
            // }
        }
        random_without_returns(string filename) {
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

            // for (unsigned long i = 1; i <  distribution.size(); ++i){
            //     distribution[i].second += distribution[i-1].second;
            // }
            right_delim = distribution.size() - 1;
            inp.close();
        }
        void print_distribution() {
            for (unsigned long i = 0; i <  distribution.size(); ++i){
                cout << distribution[i].first << " " << distribution[i].second << endl;
            }
        }

        int random() {
            srand(time(NULL));
            float coeff = 0;
            if (right_delim < 0) {
                throw string("No more elements");
            }
            for (int i = 0; i < right_delim; ++i){
                coeff += distribution[i].second ;
            }

            float random_number = random_standart() * coeff;
            // cout << "rnum " << random_number << " coef" << coeff << endl;

            long index = 0;
            while(index < right_delim && random_number > distribution[index].second) {
                index++;
            }
            pair<int, float> temp = distribution[index];
            distribution[index] = distribution[right_delim];
            distribution[right_delim] = temp;
            right_delim--;
            return temp.first;
        }
};
