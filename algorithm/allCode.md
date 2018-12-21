# Capacitated Facility Location Problem 算法期末项目代码

本篇博客包含了前两篇博客[Capacitated Facility Location Problem (一) - 贪心算法](https://blog.miguch.com/2018/12/21/capacitated-facility-location-problem-%e4%b8%80-%e8%b4%aa%e5%bf%83%e7%ae%97%e6%b3%95/)和[Capacitated Facility Location Problem (二) - 局部搜索，模拟退火法](https://blog.miguch.com/2018/12/21/capacitated-facility-location-problem-%e4%ba%8c-%e5%b1%80%e9%83%a8%e6%90%9c%e7%b4%a2%ef%bc%8c%e6%a8%a1%e6%8b%9f%e9%80%80%e7%81%ab%e6%b3%95/)中实现的所有代码以及测试使用的主程序。

### data.h

该文件实现了对指定的测试数据文件的读取，定义了在算法过程中会需要使用到的结构体，以及根据最终的结果生成 Markdown 格式的表格的函数。

```cpp
#ifndef DATA_H
#define DATA_H

#include <iostream> 
#include <fstream>
#include <vector>
#include <string>
#include <sstream>

using namespace std;

//设施，包含容量与启用代价
struct facility {
    int cap;
    int openCost;
    facility(int c, int o) {
        cap = c;
        openCost = o;
    }
};

//文件读取的数据，包含所有设施数据，顾客的需求以及顾客对设施的分配费用
struct data {
    int facNum, cusNum;
    vector<facility> facilities;
    vector<int> customers;
    vector<vector<int>> assignmentCost;
};

//算法生成的结果，包含总代价，设施开启状态以及顾客的分配
struct output {
    int totalCost;
    vector<bool> facStatus;
    vector<int> assignments;
    friend ostream& operator<<(ostream& os, const output& self) {
        os << self.totalCost << endl;
        for (int i = 0; i < self.facStatus.size(); i++) {
            os << self.facStatus[i] << " ";
        }
        os << endl;
        for (int i = 0; i < self.assignments.size(); i++) {
            os << self.assignments[i] << " ";
        }
        os << endl;
        return os;
    }
};

//用于贪心算法中排序的代价类型
struct cost_t {
    int cost, index;
    bool operator<(const cost_t& ano) const {
        //Implemented reversed so that heap 
        //can output the smallest cost.
        return ano.cost < this->cost;
    }
};

//从指定的文件中读出数据
data readInstance(const char* filename) {
    ifstream ins(filename);
    if (!ins.is_open()) {
        cerr << "Fail to open file " << filename << endl;
        exit(1);
    }
    int facNum, cusNum;
    ins >> facNum >> cusNum;
    data result = {facNum, cusNum, vector<facility>(), vector<int>()};
    for (int i = 0; i < facNum; i++) {
        int cap, openCost;
        ins >> cap >> openCost;
        result.facilities.push_back(facility(cap, openCost));
    }
    for (int i = 0; i < cusNum; i++) {
        double demand;
        ins >> demand;
        result.customers.push_back(demand);
    }
    result.assignmentCost = vector<vector<int>>(facNum, vector<int>(cusNum, 0));
    for (int i = 0; i < facNum; i++) {
        for (int k = 0; k < cusNum; k++) {
            double cost;
            ins >> cost;
            result.assignmentCost[i][k] = cost;
        }
    }
    return result;
}

//根据获得的结果与时间生成 Markdown 表格
string toMarkdownTable(const vector<output>& results, const vector<double>& times) {
    stringstream ssr;
    ssr << "|      |Result|Time(s)|\n| ---- | ---- | ---- |\n";
    for (int i = 0; i < results.size(); i++) {
        ssr << "|p" << i + 1 << "|" << results[i].totalCost << "|" << times[i] << "|\n";
    }
    return ssr.str();
}

//根据获得的所有结果生成详细结果列表
string toMarkdownResultList(const vector<output>& results) {
    stringstream ssr;
    for (int i = 0; i < results.size(); i++) {
        ssr << "p" << i + 1 << endl << endl;
        ssr << "```" << endl;
        ssr << results[i];
        ssr << "```" << endl;
    }
    return ssr.str();
}

#endif
```



### greedy.h

包含了贪心算法相关的函数

```cpp
#ifndef GREEDY_H
#define GREEDY_H
#include "data.h"
#include <queue>

output greedyMethod(const data& initial) {
    output result = {
            0, 
            vector<bool>(initial.facNum, false),
            vector<int>(initial.cusNum, -1)
    };
    vector<int> facilitySize(initial.facNum, 0);
    for (int i = 0; i < initial.cusNum; i++) {
        priority_queue<cost_t> heap;
        for (int k = 0; k < initial.facNum; k++) {
            heap.push({initial.assignmentCost[k][i], k});

        }
        while (!heap.empty()) {
            cost_t curr = heap.top();
            heap.pop();
            if (facilitySize[curr.index] + initial.customers[i] > initial.facilities[curr.index].cap) {
                continue;
            }
            if (!result.facStatus[curr.index]) {
                result.facStatus[curr.index] = true;
                result.totalCost += initial.facilities[curr.index].openCost;
            }
            result.totalCost += curr.cost;
            facilitySize[curr.index] += initial.customers[i];
            result.assignments[i] = curr.index;
            break;
        }
    }
    return result;
}

#endif

```

### localSearch.h

包含了局部搜索相关的函数

```cpp
#ifndef CLIMBING_H
#define CLIMBING_H
#include "data.h"
#include "greedy.h"
#include <ctime>
#include <cmath>

//Use greedy to try to fit the opened facilities,
//result is written to newOutput
bool setNewOutputResult(const data& initial, output& newOutput) {
    int cost = 0;
    vector<int> facilitySize(initial.facNum, 0);
    for (int i = 0; i < initial.facNum; i++) {
        if (newOutput.facStatus[i]) {
            cost += initial.facilities[i].openCost;
        }
    }
    for (int i = 0; i < initial.cusNum; i++) {
        priority_queue<cost_t> heap;
        for (int k = 0; k < initial.facNum; k++) {
            if (newOutput.facStatus[k]) {
                heap.push({initial.assignmentCost[k][i], k});
            }
        }
        while (!heap.empty()) {
            cost_t curr = heap.top();
            heap.pop();
            if (facilitySize[curr.index] + initial.customers[i] > initial.facilities[curr.index].cap) {
                if (heap.empty()) {
                    //Fail to fit.
                    return false;
                }
                continue;
            }
            cost += curr.cost;
            facilitySize[curr.index] += initial.customers[i];
            newOutput.assignments[i] = curr.index;
            break;
        }
    }
    newOutput.totalCost = cost;
    return true;
}

output searchStep(const data& initial, const output& state) {
    output minState = state;
    //Open a closed facility or close a opened facility
    for (int i = 0; i < initial.facNum; i++) {
        output newState = state;
        newState.facStatus[i] = !newState.facStatus[i];
        if (setNewOutputResult(initial, newState)) {
            if (newState.totalCost < minState.totalCost) {
                minState = newState;
            }
        }
    }

    //Swap facility state
    for (int i = 0; i < initial.facNum - 1; i++) {
        for (int k = i + 1; k < initial.facNum; k++) {
            output newState = state;
            if (state.facStatus[i] == !state.facStatus[k]) {
                swap(newState.facStatus[i], newState.facStatus[k]);
                if (setNewOutputResult(initial, newState)) {
                    if (newState.totalCost < minState.totalCost) {
                        minState = newState;
                    }
                }
            }
        }
    }

    return minState;
}

output generateRandomOutput(const data& initial) {
    srand(time(nullptr));
    output result;
    do {
        result = {
            0, 
            vector<bool>(initial.facNum, false),
            vector<int>(initial.cusNum, -1)
        }; 
        for (int i = 0; i < initial.facNum; i++) {
            result.facStatus[i] = (double)rand() / RAND_MAX > 0.5;
        }
    } while (!setNewOutputResult(initial, result));
    return result;
}

output localSearch(const data& initial) {
    output minState = generateRandomOutput(initial);
    while (true) {
        output newState = searchStep(initial, minState);
        if (newState.totalCost < minState.totalCost) {
            minState = newState;
        } else {
            break;
        }
    }

    return minState;
}

#endif
```

### SA.h

包含了模拟退火相关的函数

```cpp
#ifndef SA_H
#define SA_H
#include "localSearch.h"

const double coolingRate = 0.99;
const double initTemperature = 5000;
const double minTemperature = 0.001;


output generateNeighbor(const data& initial, const output& state) {
    bool toSwap = false;
    output newState;

    //We can only swap if there exists a unconnected facility
    for (int i = 0; i < initial.facNum; i++) {
        if (state.facStatus[i] == 0) {
            toSwap = true;
        }
    }

    toSwap = toSwap && (double)rand() / RAND_MAX > 0.5;

    if (!toSwap) {
        do {
            newState = state;
            int randIndex = rand() % initial.facNum;
            newState.facStatus[randIndex] = !newState.facStatus[randIndex];
        } while (!setNewOutputResult(initial, newState));
    } else {
        do {
            newState = state;
            int rand1 = rand() % initial.facNum;
            int rand2;
            do {
                rand2 = rand() % initial.facNum;
            } while (rand1 == rand2 || state.facStatus[rand1] == state.facStatus[rand2]);
            swap(newState.facStatus[rand1], newState.facStatus[rand2]);
        } while (!setNewOutputResult(initial, newState));
    }
    return newState;
}

output simulatedAnnealing(const data& initial) {
    srand(time(nullptr));
    output minState = generateRandomOutput(initial);
    double currTemperature = initTemperature;

    while (currTemperature > minTemperature) {
        output newState = generateNeighbor(initial, minState);
        double deltaE = newState.totalCost - minState.totalCost;
        if (deltaE < 0) {
            minState = newState;
        } else {
            double probability = exp(-deltaE / currTemperature);
            if ((double)rand() / RAND_MAX < probability) {
                minState = newState;
            }
        }
        currTemperature *= coolingRate;
    }

    return minState;
}


#endif
```



### solution.cpp

程序的主程序，根据用户的命令行参数调用指定的运算方法：

- 1: 贪心算法
- 2: 局部搜索
- 3: 模拟退火

程序将对全部71个测例调用方法，并将结果与时间的表格写入`table.md`。将每个测例的详细结果写入`result.md`。

```cpp
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

```

