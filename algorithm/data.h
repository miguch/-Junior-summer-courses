#ifndef DATA_H
#define DATA_H

#include <iostream> 
#include <fstream>
#include <vector>
#include <string>
#include <sstream>

using namespace std;

struct facility {
    int cap;
    int openCost;
    facility(int c, int o) {
        cap = c;
        openCost = o;
    }
};


struct data {
    int facNum, cusNum;
    vector<facility> facilities;
    vector<int> customers;
    vector<vector<int>> assignmentCost;
};

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

struct cost_t {
    int cost, index;
    bool operator<(const cost_t& ano) const {
        //Implemented reversed so that heap 
        //can output the smallest cost.
        return ano.cost < this->cost;
    }
};


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

string toMarkdownTable(const vector<output>& results, const vector<double>& times) {
    stringstream ssr;
    ssr << "|      |Result|Time(s)|\n| ---- | ---- | ---- |\n";
    for (int i = 0; i < results.size(); i++) {
        ssr << "|p" << i + 1 << "|" << results[i].totalCost << "|" << times[i] << "|\n";
    }
    return ssr.str();
}

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