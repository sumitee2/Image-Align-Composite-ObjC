//
//  AlignHeadBridge.m
//  ImageComposite
//
//  Created by Sumit Chaudhary on 15/02/22.
//

#import <opencv2/opencv.hpp>
#import <opencv2/imgcodecs/ios.h>
#import "AlignHeadBridge.h"
#include "AlignImageCV.hpp"
#import <Foundation/Foundation.h>
#import <Vision/Vision.h>

@implementation AlignHeadBridge

+ (void) imageByAligningImage: (UIImage *)image2 withImage: (UIImage *)image1 andCompletionHandler:(void (^)(UIImage *alignedImage))completionHandler {
    // convert UIImage to mat
    cv::Mat opencvImage1;
    UIImageToMat(image1, opencvImage1, true);
    cv::Mat opencvImage2;
    UIImageToMat(image2, opencvImage2, true);
    
    cv::Mat imageAligned = alignImages(opencvImage1 , opencvImage2);

    completionHandler(MatToUIImage(imageAligned));
}

@end
