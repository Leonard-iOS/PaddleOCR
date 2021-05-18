//
//  RYPaddleOCR.h
//  leonard.
//
//  Created by Leonard on 2020/9/28.
//  Copyright © 2020 Ruiyu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RYImageParse.h"
#import "OcrData.h"
 
@interface RYPaddleOCR : NSObject

/*
 *  传入相机识别到的视频流，返回扫描到的文本
 *
 *  @param sampleBuffer  视频buffer
 *  @param complete 返回识别后的信息
 */
- (void)scanTextFromSampleBuffer:(CMSampleBufferRef)sampleBuffer
             complete:(void(^)(NSArray<OcrData *> *ocrDataList))complete;

/*
 *  传入图片开始扫描，返回扫描到的文本
 *
 *  @param image  需要扫描的image图片
 *  @param complete 返回识别后的信息
 */
- (void)scanTextFrom:(UIImage *)image
             complete:(void(^)(NSArray<OcrData *> *ocrDataList))complete;

/*
 *  取消扫描任务
 */
- (void)cancelScanTask;

@end

