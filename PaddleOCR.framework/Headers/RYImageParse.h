//
//  RYImageParse.h
//  PaddleOCR
//
//  Created by Leonard on 2021/5/7.
//

#import <UIKit/UIKit.h>
#import <CoreMedia/CoreMedia.h>
#import <CoreVideo/CoreVideo.h>

NS_ASSUME_NONNULL_BEGIN

@interface RYImageParse : NSObject

/*
 *  处理视频流
 *
 *  @param sampleBuffer  视频buffer
 *  @return 返回生成的图像
 */
+ (UIImage *)toImage:(CMSampleBufferRef)sampleBuffer CF_RETURNS_RETAINED;

@end

NS_ASSUME_NONNULL_END
