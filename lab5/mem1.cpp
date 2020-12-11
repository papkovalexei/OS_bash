#include <iostream>
#include <vector>
#include <fstream>

using namespace std;

int main()
{
    ofstream output("report1.log");

    int count = 0;

    while (true)
    {
	for (int i = 0; i < 100; i++)
		;
        count++;
        malloc(1);

        if (count % 100000 == 0)
            output << count << endl;
    }

    return 0;
}
