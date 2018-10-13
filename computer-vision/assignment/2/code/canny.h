#include <iostream>
#include <string>
#include "CImg.h"

using namespace std;
using namespace cimg_library;

template <typename T>
class canny_matrix {
private:
    T* data;
    int cols, rows;
public:    
    canny_matrix(int r, int c) : cols(c), rows(r) {
        data = new T[r * c];
    }
    ~canny_matrix() {
        delete[]data;
    }
    T& operator()(int row, int col) {
        return data[row * cols + col];
    }
};

class Canny {
private:
    bool c_skipNMS;
    CImg<unsigned char> origin;
    CImg<unsigned char> grey_scale;
    CImg<unsigned char> smooth_img;
    int c_thresh1, c_thresh2, c_scale;
    float c_sigma;
    CImg<unsigned char> createGreyScale();
    bool gaussSmoothing(float sigma, int scale);
public:
    canny_matrix<unsigned char> toGreyScale();
    Canny(string filename, bool skipNMS, int thresh1, int thresh2, int scale, float sigma) {
        origin = CImg<unsigned char>(filename.c_str());
        c_skipNMS = skipNMS;
        c_thresh1 = thresh1;
        c_thresh2 = thresh2;
        c_scale = scale;
        c_sigma = sigma;
        origin.display();
        grey_scale = createGreyScale();
    }
    
};