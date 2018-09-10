#include <iostream>
#include "CImg.h"
#include <cmath>

using namespace cimg_library;

class hw1 {
public:
    hw1() {
        bmp1 = CImg<unsigned char>("1.bmp");
    }
    void displayImage() {
        bmp1.display();
    }
    void changeColor() {
        cimg_forXY(bmp1, x, y) {
            if (bmp1(x, y, 0) == 255 && bmp1(x, y, 1) == 255 && bmp1(x, y, 2) == 255) {
                bmp1(x, y, 1) = 0;
                bmp1(x, y, 2) = 0;
            } else if (bmp1(x, y, 0) == 0 && bmp1(x, y, 1) == 0 && bmp1(x, y, 2) == 0) {
                bmp1(x, y, 1) = 255;
            }
        }
    }
    virtual void drawBlueCircle() {
        cimg_forXY(bmp1, x, y) {
            if (getLength(50, 50, x, y) <= 30) {
                bmp1(x, y, 0) = 0;
                bmp1(x, y, 1) = 0;
                bmp1(x, y, 2) = 255;
            }
        }
    }
    virtual void drawYellowCircle() {
        cimg_forXY(bmp1, x, y) {
            if (getLength(50, 50, x, y) <= 3) {
                bmp1(x, y, 0) = 255;
                bmp1(x, y, 1) = 255;
                bmp1(x, y, 2) = 0;
            }
        }
    }
    virtual void drawBlueLine() {
        int xLength = cos(35 * cimg_library::cimg::PI / 180) * 100;
        cimg_forX(bmp1, x) {
            if (x > xLength) break;
            int y = tan(35 * cimg_library::cimg::PI / 180) * x;
            bmp1(x, y, 0) = 0;
            bmp1(x, y, 1) = 0;
            bmp1(x, y, 2) = 255;
        }
    }
    void saveToFile() {
        bmp1.save("2.bmp");
    }
protected:
    CImg<unsigned char> bmp1;
    inline double getLength(int x1, int y1, int x2, int y2) {
        return sqrt(pow(x1 - x2, 2) + pow(y1 - y2, 2));
    }
};

class hw1_CImgImpl : public hw1 {
public:
    void drawBlueCircle() {
        unsigned char colorBlue[] = {0, 0, 255};
        bmp1.draw_circle(50, 50, 30, colorBlue);
    }
    void drawYellowCircle() {
        unsigned char colorYellow[] = {255, 255, 0};
        bmp1.draw_circle(50, 50, 3, colorYellow);
    }
    void drawBlueLine() {
        unsigned char colorBlue[] = {0, 0, 255};
        int end_x = cos(35 * cimg_library::cimg::PI / 180) * 100;
        int end_y = sin(35 * cimg_library::cimg::PI / 180) * 100;
        bmp1.draw_line(0, 0, end_x, end_y, colorBlue);
    }
};