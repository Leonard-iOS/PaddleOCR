# PaddleOCR

`PaddleOCR`是一款应用于iOS设备上的通用文字识别的OCR库,基于飞浆团队的`Paddle Lite`库制作,能同时支持动态图和静态图两种方式.

对文本的识别效率极高，当然最重要的是免费！免费！免费！

## 集成说明
### 手动集成
将`opencv2.framework`, `PaddleOCR.framework`, `PaddleOCRResource.bundle`依次导入到你的iOS项目中,并通过`RYPaddleOCR`对象创建OCR对象识别图片或者`Buffer`数据.
1. 将项目`Targets` -> `Build Settings` -> `Enable Bitcode` 的值改为`No`.
2. 在项目`Targets` -> `Build Settings` -> `Other Linker Flags`中,添加`-lc++`. 
    或者在`Frameworks and Libraries`中手动添加`libC++.tbd`.
3. 如还有报错信息，需添加系统库`CoreMedia.framework`, `CoreVideo.framework`, `AVFountion.framework`到你的项目中.

### CocoaPods集成
在项目的`Podfile`文件中添加`pod 'PaddleOCR'`,并执行`pod install`.

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

![weichat](https://user-images.githubusercontent.com/18459255/118212985-aec6dc80-b49f-11eb-95be-59fcdf7e0d64.jpeg)



