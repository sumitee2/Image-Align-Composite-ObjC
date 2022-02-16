//
//  AlignImageCV.cpp
//  ImageComposite
//
//  Created by Sumit Chaudhary on 15/02/22.
//

#include "AlignImageCV.hpp"
#include <opencv2/opencv.hpp>

using namespace std;
using namespace cv;

const int ITERATIONS = 20;

Mat alignImages(Mat &im1, Mat &im2)
{
    // Convert images to gray scale;
    Mat im1_gray, im2_gray;
    cvtColor(im1, im1_gray, COLOR_BGR2GRAY);
    cvtColor(im2, im2_gray, COLOR_BGR2GRAY);

    // Define the motion model
    const int warp_mode = MOTION_EUCLIDEAN;

    // Set a 2x3 or 3x3 warp matrix depending on the motion model.
    Mat warp_matrix;

    // Initialize the matrix to identity
    if ( warp_mode == MOTION_HOMOGRAPHY )
    warp_matrix = Mat::eye(3, 3, CV_32F);
    else
    warp_matrix = Mat::eye(2, 3, CV_32F);

    // Specify the number of iterations.
    int number_of_iterations = ITERATIONS;

    // Specify the threshold of the increment
    // in the correlation coefficient between two iterations
    double termination_eps = 1e-10;

    // Define termination criteria
    TermCriteria criteria (TermCriteria::COUNT+TermCriteria::EPS, number_of_iterations, termination_eps);

    // Run the ECC algorithm. The results are stored in warp_matrix.
    findTransformECC(
    im1_gray,
    im2_gray,
    warp_matrix,
    warp_mode,
    criteria
    );

    // Storage for warped image.
    Mat im2_aligned;

    if (warp_mode != MOTION_HOMOGRAPHY)
    // Use warpAffine for Translation, Euclidean and Affine
    warpAffine(im2, im2_aligned, warp_matrix, im1.size(), INTER_LINEAR + WARP_INVERSE_MAP);
    else
    // Use warpPerspective for Homography
    warpPerspective (im2, im2_aligned, warp_matrix, im1.size(),INTER_LINEAR + WARP_INVERSE_MAP);

    return im2_aligned;
}
