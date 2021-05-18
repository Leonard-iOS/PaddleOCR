Pod::Spec.new do |s|

  s.name         = 'PaddleOCR'

  s.version      = '0.2.1'

  s.summary      = 'This is a framework for text recognition with image or camera, you can use this framework in iOS applications.'

  s.description  = 'Your can access PaddleOCR.framework into your applications to recognition text, you can use the device camera or use photos to get some tex.'

  s.homepage     = 'https://github.com/Leonard-iOS/PaddleOCR'

  s.license      = { :type => 'MIT', :file => 'LICENSE' }

  s.author       = { 'Leonard' => '814829208@qq.com' }

  s.platform     = :ios, '9.0'
  
  s.source       = { :git => 'https://github.com/Leonard-iOS/PaddleOCR.git', :tag => s.version }

  s.ios.vendored_frameworks = 'PaddleOCR.framework'

  s.resource = 'PaddleOCRResource.bundle'

  s.frameworks = 'CoreMedia', 'CoreVideo', 'AVFoundation'

  s.dependency 'OpenCV2'

  s.library = 'c++'

  s.pod_target_xcconfig = {
  'VALID_ARCHS' => 'x86_64 armv7 arm64',
  }



end
