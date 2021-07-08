//
//  MLPaddleOCR.h
//  leonard.
//
//  Created by Leonard on 2020/9/28.
//  Copyright © 2020 Ruiyu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MLImageParse.h"
#import "MLOcrData.h"
 
@interface MLPaddleOCR : NSObject

/// Incoming the video stream recognized by the camera, and returns the scanned text
/// sampleBuffer is video stream of the camera
- (void)scanTextFromSampleBuffer:(CMSampleBufferRef)sampleBuffer
             complete:(void(^)(NSArray<MLOcrData *> *ocrDataList))complete;

/// Incoming picture starts scanning, and returns the scanned text
/// image is picture to be recognized of you want
- (void)scanTextFrom:(UIImage *)image
             complete:(void(^)(NSArray<MLOcrData *> *ocrDataList))complete;

/// cancel all scanning task
/// you should use it when your scanning task finish
- (void)cancelScanTask;

@end

