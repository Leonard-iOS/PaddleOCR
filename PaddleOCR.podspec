Pod::Spec.new do |s|

  s.name         = 'PaddleOCR'

  s.version      = '0.1.2'

  s.summary      = 'This is a framework for text recognition with image or camera, you can use this framework in iOS applications.'

  s.description  = 'Your can access PaddleOCR.framework into your applications to recognition text.'

  s.homepage     = 'https://github.com/Leonard-iOS/PaddleOCR'

  s.license      = { :type => 'MIT', :file => 'LICENSE' }

  s.author       = { 'Leonard' => '814829208@qq.com' }

  s.platform     = :ios, '10.0'
  
  s.source       = { :git => 'https://github.com/Leonard-iOS/PaddleOCR.git', :tag => s.version }

  s.ios.vendored_frameworks = 'PaddleOCR.framework', 'opencv2.framework'

  s.resource = 'PaddleOCRResource.bundle'

  s.frameworks = 'CoreMedia', 'CoreVideo', 'CoreGraphics', 'AVFoundation'

  s.library = 'c++'

  s.user_target_xcconfig = { 'OTHER_LDFLAGS' => '-Objc', 'ENABLE_BITCODE' => 'NO' }

  s.pod_target_xcconfig = { 'ONLY_ACTIVE_ARCH' => 'TRUE' }


end
