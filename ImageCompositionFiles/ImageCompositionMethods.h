//
//  ImageCompositionMethods.h
//  ImageComposite
//
//  Created by Sumit Chaudhary on 16/02/22.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


@interface ImageCompositionMethods : NSObject

+ (UIImage *) addImagesOnly: (NSMutableArray *)images;
+ (void) alignAndAddImages: (NSMutableArray *)images withCompletion: (void (^)(UIImage *alignedImage))completionHandler;
+ (void) align: (UIImage *)image2 with: (UIImage *)image1 andCompletionHandler:(void (^)(UIImage *alignedImage))completionHandler;
+ (NSMutableArray *) alignedArrayFrom: (NSMutableArray *)imageArray andCompletionHandler:(void (^)(NSMutableArray *alignedArray))completionHandler;
+ (UIImage *)compositeImages: (NSMutableArray *)imageArray;

@end

NS_ASSUME_NONNULL_END
