#include "canny.h"
#define reflectXY(img, x, y) img(x + c_scale, y + c_scale)
#define cannyXY(img, x, y) img(x + 2 * scale, y + 2 * scale)
#define nmsXY(img, x, y) img(x+1, y+1)

/* Constructor for Canny */
Canny::Canny(string filename, bool skipNMS, int thresh1, int thresh2, int scale, float sigma) : origin(filename.c_str()) {
    c_skipNMS = skipNMS;
    c_thresh1 = thresh1;
    c_thresh2 = thresh2;
    c_scale = scale;
    c_sigma = sigma;
    createGreyScale();
    gaussSmoothing(c_sigma, c_scale);
}

/* CREATE GREY SCALE */

/*Create a grey scale image from the input image */
/* return the grey scale image */
void Canny::createGreyScale() {
    grey_scale = CImg<unsigned char>(origin.width() + 2 * c_scale, origin.height() + 2 * c_scale);
    cimg_forXY(origin, x, y) {
        auto r = origin(x, y, 0), g = origin(x, y, 1), b = origin(x, y, 2);
        reflectXY(grey_scale, x, y) = 0.299 * r + 0.587 * g + 0.114 * b;
    }
    reflect(grey_scale, origin.height(), origin.width(), c_scale);
    printf("-------------------------------------------------\n");
    printf("Finished processing: Reflected image by %d pixel\n", c_scale);
}

/* GAUSSIAN SMOOTHING */

/* Smooth the grey scale image by a gaussian kernel which depends on the sigma */
/* User driven sigma */
/* Store the result in class member smooth_img */
void Canny::gaussSmoothing(float sigma, int scale) {
    printf("----------------------------------------------------------------\n");
    printf(" Performing Gaussian Smoothing using sigma of %f \n", sigma);

    /* DEFINE A GAUSSIAN FILTER KERNEL */

    printf(" DEFINE A GAUSSIAN KERNEL\n");

    printf(" ALLOCATE MEMORY\n");
    int grows = 4*scale +1, gcols = 4*scale +1,
            nrows = origin.height(), ncols = origin.width();
    CImg<float> gauss_filter(gcols, grows);
    printf("ALLOCATED MEMORY\n");

    int set = -scale, i, j, c, r;
    printf(" ALLOCATE MEMORY FOR GAUSS SMOOTH\n");
    gauss_smooth = CImg<float>(ncols + 4 * scale, nrows + 4 * scale);
    printf("ALLOCATED MEMORY FOR GAUSS SMOOTH\n");

    /* FILL IN THE VALUES FOR THE GAUSSIAN FILTER */
    int sum = 0;
    printf("------------------------------------------------------\n");
    printf(" FILLING UP GAUSS FILTER VALUES\n");
    for( i = -(gcols/2); i <= gcols/2; i++)
    {
        for(j = -(grows/2);j <= grows/2; j++)
        {
            cannyXY(gauss_filter,i,j) = (1/(2*M_PI*sigma*sigma))*exp(-((i*i) + (j*j))/(2*sigma*sigma));
            sum = sum + cannyXY(gauss_filter,i,j);
        }
    }

    printf(" FILLED UP GAUSS FILTER VALUES\n");

    /* INITIALIZE GAUSS SMOOTH*/
    printf("---------------------------------------------------------\n");
    printf("Initializing Gauss smooth matrix\n");
    for(i=0;i<nrows; i++)
    {
        for(j=0;j< ncols; j++)
        {
            cannyXY(gauss_smooth,j,i) =0;
        }
    }

    /* CONVOLVE WITH GAUSSIAN FILTER AND STORE IN GAUSS_SMOOTH */
    printf(" ------------------------------------------------------------\n");
    printf(" CONVOLUTION WITH GAUSS FILTER\n");
    for(i=0;i<nrows; i++)
    {
        for(j=0;j< ncols; j++)
        {
            /* CONVOLUTION*/
            for( c = set; c <= -set; c++)
            {
                for(r = set;r <= -set; r++)
                {
                    cannyXY(gauss_smooth,j,i) = cannyXY(gauss_smooth,j,i) + (float)reflectXY(grey_scale,j+r,i+c) * cannyXY(gauss_filter,r,c);
                }
            }
        }
    }

    /* Write to class member smooth_img with type unsigned char */
    printf(" PURING RESULT\n");
    smooth_img = CImg<unsigned char>(ncols, nrows);
    for(i=0;i<nrows; i++)
    {
        for(j=0;j< ncols; j++)
        {
            smooth_img(j,i) = (unsigned char)cannyXY(gauss_smooth,j,i);
        }
    }

}


/* REFLECT AN IMAGE ACROSS ITS BORDERS */

/* It is assumed that the image was allocated to be of size at least */
/* (nrows+2*scale) by (ncols+2*scale), and that the image was loaded */
/* into the middle portion of the image, with coordinates, */
/*      0 <= row < nrows, 0 <= col < ncols */
/* thereby leaving empty elements along the borders outside the image */
/* The "reflect" function will then fill in those empty */
/*After reflect is called, the start index of the actual image will be (scale, scale) */
template <class T>
void Canny::reflect(CImg<T>& target, int nrows, int ncols, int c_scale) {
    int i, j;
    for(i = -c_scale; i < 0; i++)
    {
        for(j = -c_scale; j < 0; j++)
            reflectXY(target, j, i) = reflectXY(target, -j-1, -i-1);
        for(j = 0; j < ncols; j++)
            reflectXY(target, j, i) = reflectXY(target, j, -i-1);
        for(j = ncols; j < ncols+c_scale; j++)
            reflectXY(target, j, i) = reflectXY(target, ncols+ncols-j-1, -i-1);
    }
    for(i = 0; i < nrows; i++)
    {
        for(j = -c_scale; j < 0; j++)
            reflectXY(target, j, i) = reflectXY(target, -j-1, i);
        for(j = ncols; j < ncols+c_scale; j++)
            reflectXY(target, j, i) = reflectXY(target, ncols+ncols-j-1, i);
    }
    for(i = nrows; i < nrows+c_scale; i++)
    {
        for(j = -c_scale; j < 0; j++)
            reflectXY(target, j, i) = reflectXY(target, -j-1, nrows+nrows-i-1);
        for(j = 0; j < ncols; j++)
            reflectXY(target, j, i) = reflectXY(target, j, nrows+nrows-i-1);
        for(j = ncols; j < ncols+c_scale; j++)
            reflectXY(target, j, i) = reflectXY(target, ncols+ncols-j-1, nrows+nrows-i-1);
    }
}

CImg<unsigned char> Canny::getGreyScale() {
    return grey_scale;
}

CImg<unsigned char> Canny::getSmoothImage() {

    return smooth_img;
}


/* EDGE DETECTION BY CANNY OPERATOR */

CImg<unsigned char> Canny::runCanny() {
    printf(" Edge detection will be performed by Canny method\n");
    printf("-------------------------------------------------------------------\n");

    /* STEP: 1 --- GAUSSIAN SMOOTHING (Already done in constructor) */

    /* ALLOCATING MEM */
    int ncols = origin.width(), nrows = origin.height(), scale = c_scale;
    CImg<float> gradient(ncols+2, nrows+2),
                dir(ncols, nrows);


    reflect(gauss_smooth, nrows, ncols, 2 * c_scale);

    for (int i = 0; i < ncols; i++) {
        for (int j = 0; j < nrows; j++) {
            //Sobel
            float gx = -cannyXY(gauss_smooth, i-1, j-1) - 2 * cannyXY(gauss_smooth, i-1, j) -
                    cannyXY(gauss_smooth, i-1, j+1) + cannyXY(gauss_smooth, i+1, j-1) + 2 * cannyXY(gauss_smooth, i+1, j) +
                    cannyXY(gauss_smooth, i+1, j+1);
            float gy = -cannyXY(gauss_smooth, i-1, j-1) - 2 * cannyXY(gauss_smooth, i, j-1) -
                       cannyXY(gauss_smooth, i+1, j-1) + cannyXY(gauss_smooth, i-1, j+1) + 2 * cannyXY(gauss_smooth, i, j+1) +
                       cannyXY(gauss_smooth, i+1, j+1);
            nmsXY(gradient,i,j) = sqrt(gy * gy + gx * gx);
            dir(i, j) = atan(gy / gx) * (180 / M_PI);
        }
    }
    reflect(gradient, nrows, ncols, 1);

    /*Non-Maximum Suppression */
    auto edges = nms(gradient, dir);
    hysThres(edges, 0);
    cimg_forXY(edges, x, y) {
        if (edges(x, y) != 255) edges(x, y) = 0;
    }
    return edges;
}

/*Non-Maximum Suppression */
/* Returns a unsigned char matrix generated from gradient matrix after nms*/
CImg<unsigned char> Canny::nms(CImg<float> &gradient, CImg<float> &dir) {
    int ncols = origin.width(), nrows = origin.height(),
            edgepoints = 0;

    /*  Init all with value 0 */
    CImg<unsigned char> edgeMap(ncols, nrows, 1, 1, 0);

    printf("============================================================\n");
    printf(" Performing Non_maximum-Supression\n");

    cimg_forXY(origin, x, y) {
        float direction = dir(x, y);
        float val = 0, neg1 = 0, pos1 = 0, neg2, pos2;
        if (direction >= -90 && direction <= -45) {
            neg1 = nmsXY(gradient, x-1, y);
            pos1 = nmsXY(gradient, x-1, y+1);
            neg2 = nmsXY(gradient, x+1, y);
            pos2 = nmsXY(gradient, x+1, y+1);
        } else if (direction > -45 && direction <= 45) {
            neg1 = nmsXY(gradient, x, y-1);
            pos1 = nmsXY(gradient, x+1, y-1);
            neg2 = nmsXY(gradient, x, y+1);
            pos2 = nmsXY(gradient, x+1, y+1);
        }  else {
            neg1 = nmsXY(gradient, x-1, y);
            pos1 = nmsXY(gradient, x-1, y-1);
            neg2 = nmsXY(gradient, x+1, y);
            pos2 = nmsXY(gradient, x+1, y-1);
        }
        if (nmsXY(gradient, x, y) < pos1+(neg1-pos1)*tan(direction * M_PI / 180.0 ) ||
            nmsXY(gradient, x, y) < pos2+(neg2-pos2)*tan(direction * M_PI / 180.0 )) {
            edgeMap(x, y) = 0;
        } else {
            edgepoints++;
            edgeMap(x, y) = nmsXY(gradient, x, y);
        }
    }
    printf(" Number of Edgepoints after nms is %d \n", edgepoints);

    return edgeMap;
}

/* Hysteresis Thresholding */
/* Recursively marks edge pixels */
/* Returns the input reference */
void Canny::hysThres(CImg<unsigned char> &edgeMap, int count) {
    bool changed = false;
    int thresh1 = min(c_thresh2, c_thresh1),
        thresh2 = max(c_thresh2, c_thresh1);

    printf("Run %d\n", count);

    cimg_forXY(edgeMap, x, y) {
        if (edgeMap(x, y) == 255) continue;
        if (edgeMap(x, y) >= thresh2) {
            changed = true;
            edgeMap(x, y) = 255;
        } else if (edgeMap(x, y) <= thresh1) {
            edgeMap(x, y) = 0;
        } else {
            for (int i = x - 1; i <= x + 1; i++) {
                for (int j = y - 1; j <= y + 1; j++) {
                    if (i < 0 || i == edgeMap.width() || j < 0 || j == edgeMap.height())
                        continue;
                    if (edgeMap(i, j) == 255) {
                        changed = true;
                        edgeMap(x, y) = 255;
                        break;
                    }
                }
            }
        }
    }

    if (changed) {
        hysThres(edgeMap, count + 1);
    }

    printf("The lower threshold used = %d \n",thresh1);
    printf("The Upper threshold used = %d \n",thresh2);
    printf("==========================================\n");
}

