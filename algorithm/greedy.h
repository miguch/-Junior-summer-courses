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
