# PaddleOCR
This is a framework for text recognition with image or camera.

## 集成说明
### 手动集成
将`opencv2.framework`, `PaddleOCR.framework`, `PaddleOCRResource.bundle`依次导入到你的iOS项目中,并通过`RYPaddleOCR`对象创建OCR对象识别图片或者`Buffer`数据.
1. 将项目`Targets` -> `Build Settings` -> `Enable Bitcode` 的值改为`No`.
2. 在项目`Targets` -> `Build Settings` -> `Other Linker Flags`中,添加`-lc++`.
3. 添加系统库`CoreMedia.framework`, `CoreVideo.framework`, `AVFountion.framework`到你的项目中.

### CocoaPods集成
在项目的`Podfile`文件中添加`pod 'PaddleOCR'`,并执行`pod install`.
注意：如果提示`PaddleOCR not found`,你需要在`Podfile`中添加`source 'https://github.com/CocoaPods/Specs.git'`,这个过程可能比较长,需要耐心等待.
目前因为Git FLS流量优先，可能会出现`pod install`提示容量不足的情况,这种情况下需要使用手动导入的方式来集成.

## 使用说明
`PaddleOCR`仅在真机条件下有效,请连接设备后再测试效果.
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
QQ：814829208


