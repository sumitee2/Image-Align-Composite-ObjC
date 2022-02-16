# Image-Align-Composite-ObjC
Using OpenCV to Align and Blend images

# Installation
- Add OpenCV2.framework to your project. Here I have used version 4.5.2
- Just add the files to the project and build
- Use the functions from 'ImageCompositionMethods.h'

# Features
# 1 Create Action Sequence type composite photos: a moving subject on a still background
- It uses a `CIFilter` to composite 2 pictures one over the other e.g. `CIMinimumCompositing`
- The same method is used to create an Action Sequence type composite out of an Array
- Use the Class method `(UIImage *)compositeImages: (NSMutableArray *)imageArray`

# 2. Align two similar images
- Works best when images are not that different, slightly shaken or rotated
- Uses Image Registration using Enhanced Correlation Coefficient (ECC) Maximization, 
  source: https://learnopencv.com/image-alignment-ecc-in-opencv-c-python/
- Use `(void) align: (UIImage *)image2 with: (UIImage *)image1 andCompletionHandler:(void (^)(UIImage *alignedImage))completionHandler`
- Tweak `const int ITERATIONS` in `AlignImageCV.cpp`

Example (Image rights with respective owners, I'm just demonstrating code. Source: https://blog.ormsdirect.co.za/creating-action-sequences-in-photoshop/):

# Composite Output using CIMinimumCompositing: (Use this filter for DARK subject on LIGHT background

![final](https://user-images.githubusercontent.com/6030638/154338620-15e8aa33-bd21-4f83-8e0a-fe719bddc3a4.png)

# INPUT 

<img src="https://user-images.githubusercontent.com/6030638/154337420-9871cdf2-ce26-46b6-b79c-99171b9ca723.jpeg" style="height: 200px;"/>
<img src="https://user-images.githubusercontent.com/6030638/154337433-f2355dff-71c1-4658-a330-b6a87190335f.jpeg" style="height: 200px;"/>
<img src="https://user-images.githubusercontent.com/6030638/154337436-af9614e9-a05a-4f5d-abe2-a1e033f8cae5.jpeg" style="height: 200px;"/>
<img src="https://user-images.githubusercontent.com/6030638/154337441-dbd7570f-a975-4876-91aa-3806d2802f7d.jpeg" style="height: 200px;"/>
<img src="https://user-images.githubusercontent.com/6030638/154337443-049bbefc-3c53-4ca1-828f-bd6cfdfbe5a2.jpeg" style="height: 200px;"/>


