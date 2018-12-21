#include "data.h"
#include "greedy.h"
#include "localSearch.h"
#include "SA.h"
#include <ctime>
#include <functional>
#include <unordered_map>

unordered_map<int, function<output(const data&)>> methods = {
    {1, greedyMethod},
    {2, localSearch},
    {3, simulatedAnnealing}
};

int main(int argc, char** argv) {

    if (argc <= 1) {
        cerr << "Usage: " << argv[0] << " method" << endl;
        cerr << endl << "Methods: " << endl;
        cerr << "\t1: Greedy Method" << endl;
        cerr << "\t2: Local Search" << endl;
        cerr << "\t3: Simulated Annealing" << endl;
        return 1;
    }

    int methodCode = atoi(argv[1]);

    if (methods.count(methodCode) == 0) {
        cerr << "Unknown command: " << argv[1] << endl;
        return 1;
    }

    vector<output> outs;
    vector<double> times;

    function<output(const data&)> method = methods[methodCode];

    for (int i = 1; i <= 71; i++) {
        char filename[35];
        snprintf(filename, 35, "Instances/Instances/p%d", i);

        cout << filename << endl;

        auto instance = readInstance(filename);

        auto start = clock();
        
        auto greedyResult = method(instance);

        // cout << greedyResult;
        outs.push_back(greedyResult);
        times.push_back(double(clock() - start) / CLOCKS_PER_SEC);
    }

    ofstream resultTable("table.md");
    ofstream resultList("result.md");

    resultTable << toMarkdownTable(outs, times);
    resultList << toMarkdownResultList(outs);
    
    cout << "Result written to markdown file." << endl;
    return 0;
}
