#
#  Be sure to run `pod spec lint TJCommons.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
    #名称
  s.name             = 'TJCommons'
  #版本号
  s.version          = '0.0.5'
  #简介
  s.summary          = 'define factory SafeData dataCheck buttonClickInterval image'
  #描述
  s.description      = <<-DESC
  TJCommons 使用 pod 'TJCommons', :tag => 'version', :git=> 'https://github.com/TJProjects/TJCommons.git'
                       DESC
  #项目主页地址
  s.homepage         = 'https://github.com/TJProjects/TJCommons'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  #许可证
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  #作者
  s.author           = { '1047634180@qq.com' => 'yangtj@oaks.cn' }
  #项目的地址
  s.source           = { :git => 'https://github.com/TJProjects/TJCommons.git', :tag => s.version.to_s }
  #社交网址,这里我写的微博默认是Twitter,如果你写Twitter的话,你的
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'
  #支持的pod最低版本
  s.ios.deployment_target = '9.0'
  #需要包含的源文件
  s.source_files = 'TJCommon/**/*'
  #资源文件
  # s.resource_bundles = {
  #   'TJCommons' => ['TJCommons/Assets/*.png']
  # }
  # 是否需要ARC自动管理内存
  s.requires_arc = true
  # s.public_header_files = 'Pod/Classes/**/*.h'
  #用到的系统库
  s.frameworks = 'UIKit'
  #依赖库，不能依赖未发布的库
  # s.dependency 'AFNetworking', '~> 2.3'
  
end

