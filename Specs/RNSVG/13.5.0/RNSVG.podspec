fabric_enabled = ENV['RCT_NEW_ARCH_ENABLED'] == '1'

name = "RNSVG"
version = "13.5.0"
source = { :http => "https://raw.githubusercontent.com/juspay/hyperswitch-pods/master/SourceFiles/#{name}/#{version}/#{name}.zip" }

Pod::Spec.new do |s|
  s.name              = 'RNSVG'
  s.version           = "13.5.0"
  s.summary           = 'description'
  s.license           = "MIT"
  s.homepage          = 'homepage'
  s.authors           = 'Horcrux Chen'
  s.platforms         = { :osx => "10.14", :ios => "9.0", :tvos => "9.2" }
  s.source            = source
  if fabric_enabled
    # folly_version must match the version used in React Native
    # See folly_version in react-native/React/FBReactNativeSpec/FBReactNativeSpec.podspec
    folly_compiler_flags = '-DFOLLY_NO_CONFIG -DFOLLY_MOBILE=1 -DFOLLY_USE_LIBCPP=1 -Wno-comma -Wno-shorten-64-to-32'

    s.pod_target_xcconfig = {
      'HEADER_SEARCH_PATHS' => '"$(PODS_ROOT)/boost" "$(PODS_ROOT)/boost-for-react-native"  "$(PODS_ROOT)/RCT-Folly"',
      "CLANG_CXX_LANGUAGE_STANDARD" => "c++17",
    }
    s.platforms       = { ios: '11.0', tvos: '11.0' }
    s.compiler_flags  = folly_compiler_flags + ' -DRN_FABRIC_ENABLED'
    s.source_files    = 'apple/**/*.{h,m,mm,cpp}'
    s.ios.exclude_files = '**/*.macos.{h,m,mm,cpp}'
    s.tvos.exclude_files = '**/*.macos.{h,m,mm,cpp}'
    s.osx.exclude_files = '**/*.ios.{h,m,mm,cpp}'
    s.requires_arc    = true
  
    s.dependency "React"
    s.dependency "React-RCTFabric"
    s.dependency "React-Codegen"
    s.dependency "RCT-Folly"
    s.dependency "RCTRequired"
    s.dependency "RCTTypeSafety"
    s.dependency "ReactCommon/turbomodule/core"
  else 
    s.source_files       = 'react-native-svg/apple/*.{h,m,mm}', 'react-native-svg/apple/Brushes/*.{h,m,mm}', 'react-native-svg/apple/Elements/*.{h,m,mm}', 'react-native-svg/apple/Shapes/*.{h,m,mm}', 'react-native-svg/apple/Text/*.{h,m,mm}', 'react-native-svg/apple/Utils/*.{h,m,mm}', 'react-native-svg/apple/ViewManagers/*.{h,m,mm}'
    s.exclude_files      = 'react-native-svg/apple/Utils/RNSVGFabricConversions.h'
    s.ios.exclude_files  = 'react-native-svg/apple/*.macos.{h,m,mm}', 'react-native-svg/apple/Text/*.macos.{h,m,mm}'
    s.tvos.exclude_files = 'react-native-svg/apple/*.macos.{h,m,mm}', 'react-native-svg/apple/Text/*.macos.{h,m,mm}'
    s.osx.exclude_files  = 'react-native-svg/apple/Text/*.ios.{h,m,mm}'
    s.requires_arc       = true
    s.dependency           'React-Core'
  end
end
