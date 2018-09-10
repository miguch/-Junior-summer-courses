#include <iostream>
#include <cstdlib>
#include <string>

using namespace std;

int main(int argc, char** argv) {
    string base = "g++ -lX11 -L/usr/X11/lib -I/usr/X11/include";
    for (int i = 1; i < argc; i++) {
        base += string(" ") + string(argv[i]);
    }
    system(base.c_str());
}