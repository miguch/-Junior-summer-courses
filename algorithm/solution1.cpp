#include <iostream> 
#include <fstream>
#include <vector>

using namespace std;

struct facility {
    int cap;
    int openCost;
    int assignmentCost;
    facility(int c, int o, int a) {
        cap = c;
        openCost = o;
        assignmentCost = a;
    }
};

struct data {
    int facNum, cusNum;
    vector<facility> facilities;
    vector<int> customers;
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
        result.facilities.push_back(facility(cap, openCost, 0));
    }
    for (int i = 0; i < cusNum; i++) {
        double demand;
        ins >> demand;
        result.customers.push_back(demand);
    }
    for (int i = 0; i < facNum; i++) {
        double assCost;
        ins >> assCost;
        result.facilities[i].assignmentCost = assCost;
    }
    return result;
}

int main(int argc, char** argv) {
    if (argc < 2) {
        cerr << "No input file!" << endl;
        exit(1);
    }
    auto instance = readInstance(argv[1]);
    cout << instance.facNum << " " << instance.cusNum << endl;
    
    for (auto f : instance.facilities) {
        cout << f.cap <<  " " << f.openCost << " " << f.assignmentCost << endl;
    }

    for (auto c : instance.customers) {
        cout << c << " ";
    }
    cout << endl;

    return 0;
}
