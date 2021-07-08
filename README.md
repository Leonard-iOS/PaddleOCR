# PaddleOCR

`PaddleOCR`是一款应用于iOS设备上的通用文字识别的OCR库，基于飞浆团队的`Paddle Lite`库制作，能同时支持动态图和静态图两种方式，对文本的识别效率极高。
部分识别效率不高的场景可以通过调整图片的处理方式来提高识别率，如需要更精确的识别结果，建议前往 [PaddleOCR官方](https://github.com/PaddlePaddle/PaddleOCR)下载更高精度的模型替换本项目内的模型文件来提高识别精确度。

## 集成说明
### CocoaPods集成（*推荐使用*）
在项目的`Podfile`文件中添加`pod 'PaddleOCR'`,并执行`pod install`.
1. 本项目因相关资源过大，使用了`Git LFS`配置，在进行`pod install`前请先安装`Git LFS`，使用说明参考https://git-lfs.github.com/
2. 将项目`Targets` -> `Build Settings` -> `Enable Bitcode` 的值改为`No`.
3. 在项目`Targets` -> `Build Settings` -> `Other Linker Flags`中，用`$(inherited)`代替其他输入项.

### 手动集成（需自行下载`OpenCV`库资源）
将`OpenCV2.framework`, `PaddleOCR.framework`, `PaddleOCRResource.bundle`依次导入到你的iOS项目中.
1. 将项目`Targets` -> `Build Settings` -> `Enable Bitcode` 的值改为`No`.
2. 在项目`Targets` -> `Build Settings` -> `Other Linker Flags`中,添加`-lc++`. 
    或者在`Frameworks and Libraries`中手动添加`libC++.tbd`.
3. 如还有报错信息，需添加系统库`CoreMedia.framework`, `CoreVideo.framework`, `AVFoundation.framework`到你的项目中.


## 使用说明

1. 使用`SampleBuffer`作为参数进行扫描,可以使用以下方式：
```
/// Incoming the video stream recognized by the camera, and returns the scanned text
/// sampleBuffer is video stream of the camera
- (void)scanTextFromSampleBuffer:(CMSampleBufferRef)sampleBuffer
             complete:(void(^)(NSArray<MLOcrData *> *))complete;
```

2. 使用`UIImage`作为参数进行扫描,可以使用以下方式：
```
/// Incoming picture starts scanning, and returns the scanned text
/// image is picture to be recognized of you want
- (void)scanTextFrom:(UIImage *)image
             complete:(void(^)(NSArray<MLOcrData *> *))complete;
```

3. 也可以随时通过`cancelScanTask`来结束扫描任务.

## Demo使用说明
Demo下载后打开`Podfile`中的注释，并执行`pod install`，资源加载完毕后即可查看Demo预览效果。

## Git LFS及其他说明
1. `PaddleOCR`库的部分功能依赖`OpenCV`，在`pod install`时可能会提示网络错误等情况，有条件的开发者可以使用代理解决，或者使用其他开发者提供的`OpenCV`库.
2. 因`PaddleOCR`的相关资源限制，使用了`Git LFS`大文件处理方案，在使用cocopods集成后出现下面的情况，说明`PaddleOCR.framework`文件没有正确下载，请检查`PaddleOCR.framework`文件的大小，正常约为180M左右. 可以按照`cocoapods集成说明`来解决问题，如仍无法解决或是有其他疑问请使用下面的联系方式向我反馈，我会提供对应的解决方案或相关文件资源.
```
undefined symbols for architecture arm64:
"OBJC_CLASS$_OcrData", referenced from:
objc-class-ref in ViewController.o
"OBJC_CLASS$_RYPaddleOCR", referenced from:
objc-class-ref in ViewController.o
ld: symbol(s) not found for architecture arm64
```

## 其他
如果有好的建议或使用中有疑问可以通过下面的联系方式联系我，目前`PaddleOCR iOS开发者交流群`已经创建，有希望入群的开发者可以在邮件中备注自己的加群要求和联系方式，让我们共同来讨论如何做出一个更好的iOS OCR工具.

*邮箱*：moyusword@gmail.com





