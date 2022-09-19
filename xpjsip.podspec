#
# Be sure to run `pod lib lint xpjsip.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'xpjsip'
  s.version          = '2.12.1'
  s.summary          = 'pjsip for iOS'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description = <<-DESC
    pjsip for iOS.
  DESC

  s.homepage         = 'https://github.com/fubusili/xpjsip'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'fubusli' => 'fubusili@126.com' }
  s.source           = { :git => 'https://github.com/fubusili/xpjsip.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/fubusili'
  
  s.ios.deployment_target = '10.0'
  s.ios.source_files = "xpjsip/**/*.{h,hpp}"
  # pod附带静态库路径
  s.ios.vendored_libraries = 'xpjsip/lib/**/*.a'
  # 公共文件列表
  s.ios.public_header_files = ['xpjsip/include/*.{h,hpp}', 'xpjsip/include/**/*.{h,hpp}']
  # 下载后不删除的文件
  s.ios.preserve_paths = 'xpjsip/lib/**/*'
  
  s.ios.frameworks = 'AudioToolbox', 'AVFoundation'
  
  header_search_paths = [
  '"$(PODS_ROOT)/Headers/Public/xpjsip/include"'
  ]
  s.xcconfig = {
    'HEADER_SEARCH_PATHS' => header_search_paths.join(' '),
    'GCC_PREPROCESSOR_DEFINITIONS' => 'PJ_AUTOCONF=1'
  }
  s.libraries           = 'stdc++'
  # 保持子目录结构不变
  s.header_mappings_dir = 'xpjsip'
  # 源文件是否支持ARC
  s.requires_arc        = false
  
  # ------
  #xcode 12 以上 pod lib lint 会报错
  s.pod_target_xcconfig = {
      'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'
    }
  s.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
  # ------
  
end
