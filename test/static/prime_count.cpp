#include <iostream>
#include <vector>
using namespace std;


int main()
{
    int n;
    cin >> n;
    vector<int> primes;
    for (int i = 2; i <= n ; ++i)
    {
        bool is_prime = true;
        for (auto it = primes.begin() ; it != primes.end() ; ++it)
        {
            if (i % *it == 0)
            {
                is_prime = false;
                break;
            }
        }
        if (is_prime) {
            primes.push_back(i);
        }
    }
    cout << primes.size() << endl;
    return 0;
}

