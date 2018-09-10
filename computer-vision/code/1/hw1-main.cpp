#include "hw1.h"
#include <iostream>

using namespace std;

int main() {
    hw1* obj;
    int arg;
    cout << "*** Enter 1 for my own methods, 2 for methods using CImg functions.***" << endl;
    cin >> arg;
    if (arg == 1) {
        obj = new hw1();
    } else if (arg == 2) {
        obj = new hw1_CImgImpl();
    } else {
        cerr << "Wrong Input! Exiting..." << endl;
        exit(1);
    }
    //obj.displayImage();
    obj->changeColor();
    obj->drawBlueCircle();
    obj->drawYellowCircle();
    obj->drawBlueLine();
    obj->displayImage();
    obj->saveToFile();
    delete obj;
}