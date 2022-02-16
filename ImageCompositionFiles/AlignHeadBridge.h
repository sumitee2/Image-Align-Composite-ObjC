//
//  AlignHeadBridge.h
//  ImageComposite
//
//  Created by Sumit Chaudhary on 15/02/22.
//

#ifndef AlignHeadBridge_h
#define AlignHeadBridge_h


#endif /* AlignHeadBridge_h */

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface AlignHeadBridge : NSObject

+ (void) imageByAligningImage: (UIImage *)image1 withImage: (UIImage *)image2 andCompletionHandler:(void (^)(UIImage *alignedImage))completionHandler;

@end
