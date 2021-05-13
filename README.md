# PaddleOCR
This is a framework for text recognition with image or camera.

## 集成说明
将`opencv2.framework`, `PaddleOCR.framework`, `PaddleOCRResource.bundle`依次导入到你的iOS项目中,并通过`RYPaddleOCR`对象创建OCR对象识别图片或者`Buffer`数据。
1. 将项目`Targets` -> `Build Settings` -> `Enable Bitcode` 的值改为`No`.
2. 在项目`Targets` -> `Build Settings` -> `Other Linker Flags`中，添加`-lc++`.

## 使用说明
1. 使用`SampleBuffer`作为参数进行扫描,可以使用以下方式：
```
/*
 *  传入相机识别到的视频流，返回扫描到的文本
 *
 *  @param sampleBuffer  视频buffer
 *  @param complete 返回识别后的信息
 */
- (void)scanTextFromSampleBuffer:(CMSampleBufferRef)sampleBuffer
             complete:(void(^)(NSArray<OcrData *> *))complete;
```

2. 使用`UIImage`作为参数进行扫描,可以使用以下方式：
```
/*
 *  传入图片开始扫描，返回扫描到的文本
 *
 *  @param image  需要扫描的image图片
 *  @param complete 返回识别后的信息
 */
- (void)scanTextFrom:(UIImage *)image
             complete:(void(^)(NSArray<OcrData *> *))complete;
```

3. 也可以随时通过`cancelScanTask`来结束扫描任务.

## 其他
如果有好的建议或使用中有疑问可以留言,我们共同来讨论.



