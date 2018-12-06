#include <iostream>
#include <fstream>

using namespace std;

int main(int argc, char** argv) {
    if (argc < 2) {
        cerr << "No filename specified!" << endl;
        return 1;
    }
    bool showDecode = false;
    if (string(argv[1]) == "-d") {
        showDecode = true;
    }
    char* filename = argv[argc - 1];

    ifstream certFile(filename);

    if (!certFile.is_open()) {
        cerr << "Cannot open file " << filename << endl;
        return 1;
    }

    string line;
    //Discard BEGIN header
    getline(line, certFile);

    while (getline(line, certFile)) {
        
    }
}