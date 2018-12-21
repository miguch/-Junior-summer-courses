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