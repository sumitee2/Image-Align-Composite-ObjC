//
//  ViewController.m
//  ImageComposite
//
//  Created by Sumit Chaudhary on 15/02/22.
//

#import "ViewController.h"
#import "ImageCompositionMethods.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *photoView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSMutableArray *imgArray = [[NSMutableArray alloc] initWithObjects:[UIImage imageNamed:@"1"], [UIImage imageNamed:@"2"]
                                , [UIImage imageNamed:@"3"]
                                , [UIImage imageNamed:@"4"]
                                , [UIImage imageNamed:@"5"]
                                , nil];
    
    _photoView.image = [ImageCompositionMethods compositeImages:imgArray];
    
    /*
     TO WRITE TO GALLERY, IMAGE NEEDS TO BE BACKED BY CGImage. Use thiws code:
     
        CIContext *context = [CIContext context];
        CGImageRef cropColourImage = [context createCGImage:procFilt3.outputImage fromRect:[processedImage extent]];
        UIImage *final = [UIImage imageWithCGImage: cropColourImage];
        UIImageWriteToSavedPhotosAlbum(final, nil, nil, nil);
     */
    
//    SAMPLE CODE IF ALIGNMENT ALSO DONE
//    typeof(self) __weak weakSelf = self;
//    imgArray = [ImageCompositionMethods alignedArrayFrom:imgArray andCompletionHandler:^(NSMutableArray *alignedArray) {
//        typeof(weakSelf) strongSelf = weakSelf;
//            if (strongSelf) {
//               strongSelf.photoView.image = [ImageCompositionMethods compositeImages:alignedArray];
//            }
//    }];
}

@end
