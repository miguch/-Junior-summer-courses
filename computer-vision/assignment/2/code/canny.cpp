#include "canny.h"


/* Constructor for Canny */
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

/* CREATE GREY SCALE */

/*Create a grey scale image from the input image */
/* return the grey scale image */
CImg<unsigned char> Canny::createGreyScale() {
    CImg<unsigned char> res(origin.height(), origin.width());
    cimg_forXY(origin, x, y) {
        auto r = origin(x, y, 0), g = origin(x, y, 1), b = origin(x, y, 2);
        res(x, y) = 0.299 * r + 0.587 * g + 0.114 * b;
    }
    res.display();
    return res;
}

/* GAUSSIAN SMOOTHING */

/* Smooth the grey scale image by a gaussian kernel which depends on the sigma */
/* User driven sigma */
/* return the smoothed image */
CImg<unsigned char> Canny::gaussSmoothing(float sigma, int scale) {
    printf("----------------------------------------------------------------\n");
    printf(" Performing Gaussian Smoothing using sigma of %f \n", sigma);

    /* DEFINE A GAUSSIAN FILTER KERNEL */

    printf(" DEFINE A GAUSSIAN KERNEL\n");
}