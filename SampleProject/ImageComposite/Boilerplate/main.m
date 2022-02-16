//
//  main.m
//  ImageComposite
//
//  Created by Sumit Chaudhary on 15/02/22.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}


/*
 */


/*
 //
 //  Alignment.hpp
 //  ImageComposite
 //
 //  Created by Sumit Chaudhary on 15/02/22.
 //

 #ifndef Alignment_hpp
 #define Alignment_hpp

 #include <stdio.h>

 #endif

 #include <opencv2/opencv.hpp>

 using namespace cv;
 using namespace std;

 void alignImages(Mat &im1, Mat &im2, Mat &im1Reg, Mat &h);

 */
