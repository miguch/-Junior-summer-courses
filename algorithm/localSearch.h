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