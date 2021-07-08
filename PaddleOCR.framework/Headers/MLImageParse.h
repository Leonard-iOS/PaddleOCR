//
//  MLImageParse.h
//  PaddleOCR
//
//  Created by Leonard on 2021/5/7.
//

#import <UIKit/UIKit.h>
#import <CoreMedia/CoreMedia.h>
#import <CoreVideo/CoreVideo.h>

@interface MLImageParse : NSObject

/// Convert the video stream output by the camera into an image
+ (UIImage *_Nullable)toImage:(CMSampleBufferRef _Nullable )sampleBuffer CF_RETURNS_RETAINED;

/// rotated image
+ (CGImageRef)createRotatedImage:(CGImageRef)original;

@end

