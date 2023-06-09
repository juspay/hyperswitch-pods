fabric_enabled = ENV['RCT_NEW_ARCH_ENABLED'] == '1'


name = "RNScreens"
version = "3.18.2"
source = { :http => "https://raw.githubusercontent.com/juspay/hyperswitch-pods/master/SourceFiles/#{name}/#{version}/#{name}.zip" }

folly_compiler_flags = '-DFOLLY_NO_CONFIG -DFOLLY_MOBILE=1 -DFOLLY_USE_LIBCPP=1 -Wno-comma -Wno-shorten-64-to-32'

Pod::Spec.new do |s|
  s.name         = "RNScreens"
  s.version      = "3.18.2"
  s.summary      = "description"
  s.description  = <<-DESC
                  RNScreens - first incomplete navigation solution for your React Native app
                   DESC
  s.homepage     = "https://github.com/software-mansion/react-native-screens"
  s.license      = "MIT"
  # s.license    = { :type => "MIT", :file => "FILE_LICENSE" }
  s.author       = { "author" => "author@domain.cn" }
  s.platforms    = { :ios => "9.0", :tvos => "11.0" }
  s.source         = source

  if fabric_enabled
    s.pod_target_xcconfig = {
      'HEADER_SEARCH_PATHS' => '"$(PODS_ROOT)/boost" "$(PODS_ROOT)/boost-for-react-native"  "$(PODS_ROOT)/RCT-Folly"',
      "CLANG_CXX_LANGUAGE_STANDARD" => "c++17",
    }
    s.platforms       = { ios: '11.0', tvos: '11.0' }
    s.compiler_flags  = folly_compiler_flags + ' ' + '-DRN_FABRIC_ENABLED'
    s.source_files    = 'react-native-screens/ios/*.{h,m,mm,cpp}', 'react-native-screens/ios/utils/*.{h,m,mm,cpp}'
    s.requires_arc    = true
  
    s.dependency "React"
    s.dependency "React-RCTFabric"
    s.dependency "React-Codegen"
    s.dependency "RCT-Folly"
    s.dependency "RCTRequired"
    s.dependency "RCTTypeSafety"
    s.dependency "ReactCommon/turbomodule/core"
  
    s.subspec "common" do |ss|
      ss.source_files         = "react-native-screens/common/cpp/react/renderer/components/rnscreens/*.{cpp,h}"
      ss.header_dir           = "rnscreens"
      ss.pod_target_xcconfig  = { "HEADER_SEARCH_PATHS" => "\"$(PODS_TARGET_SRCROOT)/common/cpp\"" }
    end
  else 
    s.source_files = 'react-native-screens/ios/*.{h,m,mm,cpp}', 'react-native-screens/ios/utils/*.{h,m,mm,cpp}'
    s.requires_arc = true
  
    s.dependency "React-Core"
    s.dependency "React-RCTImage"
  end
end
