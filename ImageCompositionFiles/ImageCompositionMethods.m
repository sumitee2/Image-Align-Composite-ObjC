//
//  ImageCompositionMethods.m
//  ImageComposite
//
//  Created by Sumit Chaudhary on 16/02/22.
//

#import "ImageCompositionMethods.h"
#import "AlignHeadBridge.h"

@implementation ImageCompositionMethods
//BLANKET METHODS

//WITHOUT USING ALIGN
+ (UIImage *) addImagesOnly: (NSMutableArray *)images {
    return  [self compositeImages:images];
}

//USING ALIGNING. TAKES TIME, NEEDS COMPLETION BLOCK
+ (void) alignAndAddImages: (NSMutableArray *)images withCompletion: (void (^)(UIImage *alignedImage))completionHandler {
    
}

//UNDERLYING METHODS

//ALIGNS TWO IMAGES
+ (void) align: (UIImage *)image2 with: (UIImage *)image1 andCompletionHandler:(void (^)(UIImage *alignedImage))completionHandler {
    [AlignHeadBridge imageByAligningImage:image2 withImage:image1 andCompletionHandler: completionHandler];
}

//ALIGNS ALL ELEMENTS OF ARRAY ACC TO THE FIRST
+ (NSMutableArray *) alignedArrayFrom: (NSMutableArray *)imageArray andCompletionHandler:(void (^)(NSMutableArray *alignedArray))completionHandler {
    
    NSMutableArray *edited = [[NSMutableArray alloc] init];
    UIImage *first = [imageArray firstObject];
    
    for (UIImage *image in imageArray) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [AlignHeadBridge imageByAligningImage:image withImage:first andCompletionHandler:^(UIImage *alignedImage) {
                [edited addObject:alignedImage];
            }];
        });
    }
    
    dispatch_async(dispatch_get_main_queue(), ^{
        completionHandler(edited);
    });
   
    return edited;
}

//TO COMPOSITE IMAGES ADDITIVELY. DIFFERENT FILTERS GIVE RESULTS ACC TO IMAGE
+ (UIImage *)compositeImages: (NSMutableArray *)imageArray {
    if (imageArray.count == 1) {
        NSLog(@"Array too small");
        return  [imageArray firstObject];
    }
    
    if (imageArray.count == 0) {
        NSLog(@"Array empty");
        return nil;
    }
    
    CIImage *previousElement;
    CIImage *currentElement;
    CIImage *processedImage = [[CIImage alloc] initWithImage:[imageArray firstObject]];
    
    for (UIImage *photo in imageArray) {
        if (previousElement) {
            currentElement = [[CIImage alloc] initWithImage:photo];
            
/* <-----------------IMPORTANT----------------------------->
 CIMaximumCompositing WORKS BEST FOR LIGHT SUBJECT ON DARK BACKGROUND. CIMinimumCompositing FOR THE OPPOSITE CASE.
            FILTERNAME CONSTANTS
            USE THESE 2 MOST COMMONLY ->

            For Dark Subject on Bright Background
            @"CIMinimumCompositing";

            //For Bright Subject on Dark Background
             @"CIMaximumCompositing";
 
            //OTHERS TO TRY
             @"CIAdditionCompositing";
             @"CIOverlayBlendMode";
             @"CIPinLightBlendMode";
             @"CIScreenBlendMode";
             @"CISoftLightBlendMode";
 
 <-----------------IMPORTANT----------------------------->
 
 */
            
            CIFilter *compositeFilter =  [CIFilter filterWithName:@"CIMinimumCompositing"];
            [compositeFilter setValue:previousElement forKey: @"inputBackgroundImage"];
            [compositeFilter setValue:currentElement forKey: @"inputImage"];
            
//            CASCADE FILTERS IF THAT GIVES BETTER RESULTS
//            CIFilter *compositeFilter2 =  [CIFilter filterWithName:@"CIScreenBlendMode"];
//            [compositeFilter2 setValue:previousElement forKey: @"inputBackgroundImage"];
//            [compositeFilter2 setValue:compositeFilter.outputImage forKey: @"inputImage"];
            
        
            processedImage = compositeFilter.outputImage;
            previousElement = processedImage;
        } else {
            previousElement = [[CIImage alloc] initWithImage:photo];
        }
    }
    
    /*
     TO WRITE TO GALLERY, IMAGE NEEDS TO BE BACKED BY CGImage. Use thiws code:
     
        CIContext *context = [CIContext context];
        CGImageRef cropColourImage = [context createCGImage:procFilt3.outputImage fromRect:[processedImage extent]];
        UIImage *final = [UIImage imageWithCGImage: cropColourImage];
        UIImageWriteToSavedPhotosAlbum(final, nil, nil, nil);
     */
    
    return [UIImage imageWithCIImage:processedImage scale:1 orientation:UIImageOrientationUp];
}

@end
