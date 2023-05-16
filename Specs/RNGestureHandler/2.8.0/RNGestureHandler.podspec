fabric_enabled = ENV['RCT_NEW_ARCH_ENABLED'] == '1'


name = "RNGestureHandler"
version = "2.8.0"
source = { :http => "https://raw.githubusercontent.com/juspay/hyperswitch-pods/master/SourceFiles/#{name}/#{version}/#{name}.zip" }


Pod::Spec.new do |s|
  # NPM package specification

  s.name         = "RNGestureHandler"
  s.version      = "2.8.0"
  s.summary      = "description"
  s.homepage     = "https://github.com/software-mansion/react-native-gesture-handler"
  s.license      = "MIT"
  s.author       = { "author" => "email" }
  s.source       = source
  s.source_files = "react-native-gesture-handler/ios/*.{h,m,mm}", "react-native-gesture-handler/ios/Handlers/*.{h,m,mm}"
  s.requires_arc = true

  if fabric_enabled
    folly_compiler_flags = '-DFOLLY_NO_CONFIG -DFOLLY_MOBILE=1 -DFOLLY_USE_LIBCPP=1 -Wno-comma -Wno-shorten-64-to-32'

    s.pod_target_xcconfig = {
      'HEADER_SEARCH_PATHS' => '"$(PODS_ROOT)/boost" "$(PODS_ROOT)/boost-for-react-native" "$(PODS_ROOT)/RCT-Folly"',
      'CLANG_CXX_LANGUAGE_STANDARD' => 'c++17',
    }
    s.platforms       = { ios: '11.0', tvos: '11.0' }
    s.compiler_flags  = folly_compiler_flags + ' -DRN_FABRIC_ENABLED'

    s.dependency "React"
    s.dependency "React-RCTFabric" # This is for fabric component
    s.dependency "React-Codegen"
    s.dependency "RCT-Folly"
    s.dependency "RCTRequired"
    s.dependency "RCTTypeSafety"
    s.dependency "ReactCommon/turbomodule/core"
  else
    s.platforms = { :ios => "9.0", :tvos => "9.0" }

    s.dependency "React-Core"
  end
end
