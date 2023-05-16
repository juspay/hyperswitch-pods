# Copyright (c) Meta Platforms, Inc. and affiliates.
#
# This source code is licensed under the MIT license found in the
# LICENSE file in the root directory of this source tree.

require "json"

name = "React-Core"
version = "0.70.5"
source = { :http => "https://raw.githubusercontent.com/juspay/hyperswitch-pods/master/SourceFiles/#{name}/#{version}/#{name}.zip" }

folly_compiler_flags = '-DFOLLY_NO_CONFIG -DFOLLY_MOBILE=1 -DFOLLY_USE_LIBCPP=1 -Wno-comma -Wno-shorten-64-to-32'
folly_version = '2021.07.22.00'
boost_compiler_flags = '-Wno-documentation'

header_subspecs = {
  'CoreModulesHeaders'          => 'react-native/React/CoreModules/*.h',
  'RCTActionSheetHeaders'       => 'react-native/Libraries/ActionSheetIOS/*.h',
  'RCTAnimationHeaders'         => 'react-native/Libraries/NativeAnimation/{Drivers/*,Nodes/*,*}.{h}',
  'RCTBlobHeaders'              => 'react-native/Libraries/Blob/{RCTBlobManager,RCTFileReaderModule}.h',
  'RCTImageHeaders'             => 'react-native/Libraries/Image/*.h',
  'RCTLinkingHeaders'           => 'react-native/Libraries/LinkingIOS/*.h',
  'RCTNetworkHeaders'           => 'react-native/Libraries/Network/*.h',
  'RCTPushNotificationHeaders'  => 'react-native/Libraries/PushNotificationIOS/*.h',
  'RCTSettingsHeaders'          => 'react-native/Libraries/Settings/*.h',
  # 'RCTTextHeaders'              => 'react-native/Libraries/Text/*.h', 'react-native/Libraries/Text/BaseText/*.h', 'react-native/Libraries/Text/RawText/*.h', 'react-native/Libraries/Text/Text/*.h', 'react-native/Libraries/Text/TextInput/*.h', 'react-native/Libraries/Text/VirtualText/*.h',
  'RCTVibrationHeaders'         => 'react-native/Libraries/Vibration/*.h',
}

Pod::Spec.new do |s|
  s.name                   = "React-Core"
  s.version                = version
  s.summary                = "The core of React Native."
  s.homepage               = "https://reactnative.dev/"
  s.license                = "MIT"
  s.author                 = "Facebook, Inc. and its affiliates"
  s.platforms              = { :ios => "12.4" }
  s.source                 = source
  s.resource_bundle        = { "AccessibilityResources" => ["react-native/React/AccessibilityResources/*.lproj"]}
  s.compiler_flags         = folly_compiler_flags + ' ' + boost_compiler_flags
  s.header_dir             = "React"
  s.framework              = "JavaScriptCore"
  s.pod_target_xcconfig    = {
    "HEADER_SEARCH_PATHS" => "\"$(PODS_TARGET_SRCROOT)/ReactCommon\" \"$(PODS_ROOT)/boost\" \"$(PODS_ROOT)/DoubleConversion\" \"$(PODS_ROOT)/RCT-Folly\" \"${PODS_ROOT}/Headers/Public/React-hermes\" \"${PODS_ROOT}/Headers/Public/hermes-engine\" \"${PODS_ROOT}/Headers/Public/FlipperKit\" \"$(PODS_ROOT)/Headers/Public/ReactCommon\" \"$(PODS_ROOT)/Headers/Public/React-RCTFabric\"",
    "FRAMEWORK_SEARCH_PATHS" => "\"${PODS_CONFIGURATION_BUILD_DIR}/React-hermes\"",
    "DEFINES_MODULE" => "YES",
    "GCC_PREPROCESSOR_DEFINITIONS" => "RCT_METRO_PORT=${RCT_METRO_PORT}",
    "CLANG_CXX_LANGUAGE_STANDARD" => "c++17",
  }
  s.user_target_xcconfig   = { "HEADER_SEARCH_PATHS" => "\"$(PODS_ROOT)/Headers/Private/React-Core\""}
  s.default_subspec        = "Default"

  s.subspec "Default" do |ss|
    ss.source_files           = "react-native/React/*.{c,h,m,mm,S,cpp}", "react-native/React/AccessibilityResources/*.{c,h,m,mm,S,cpp}", "react-native/React/AppSetup/*.{c,h,m,mm,S,cpp}", "react-native/React/Base/*.{c,h,m,mm,S,cpp}", "react-native/React/Base/Surface/*.{c,h,m,mm,S,cpp}", "react-native/React/Base/Surface/SurfaceHostingView/*.{c,h,m,mm,S,cpp}", "react-native/React/CxxBridge/*.{c,h,m,mm,S,cpp}", "react-native/React/CxxLogUtils/*.{c,h,m,mm,S,cpp}", "react-native/React/CxxModule/*.{c,h,m,mm,S,cpp}", "react-native/React/CxxUtils/*.{c,h,m,mm,S,cpp}", "react-native/React/Modules/*.{c,h,m,mm,S,cpp}", "react-native/React/Profiler/*.{c,h,m,mm,S,cpp}", "react-native/React/UIUtils/*.{c,h,m,mm,S,cpp}", "react-native/React/Views/*.{c,h,m,mm,S,cpp}", "react-native/React/Views/RefreshControl/*.{c,h,m,mm,S,cpp}", "react-native/React/Views/SafeAreaView/*.{c,h,m,mm,S,cpp}", "react-native/React/Views/ScrollView/*.{c,h,m,mm,S,cpp}"
    ss.exclude_files          = "react-native/React/CoreModules/*",
                                "react-native/React/DevSupport/*",
                                "react-native/React/Fabric/*",
                                "react-native/React/FBReactNativeSpec/*",
                                "react-native/React/Tests/*",
                                "react-native/React/Inspector/*"
    ss.private_header_files   = "react-native/React/CxxBridge/*.h", "react-native/React/CxxLogUtils/*.h", "react-native/React/CxxModule/*.h", "react-native/React/CxxUtils/*.h"

  end

  s.subspec "DevSupport" do |ss|
    ss.source_files = "react-native/React/DevSupport/*.{h,mm,m}",
                      "react-native/React/Inspector/*.{h,mm,m}"

    ss.dependency "React-Core/Default", version
    ss.dependency "React-Core/RCTWebSocket", version
    ss.dependency "React-jsinspector", version
  end

  s.subspec "RCTWebSocket" do |ss|
    ss.source_files = "react-native/Libraries/WebSocket/*.{h,m}"
    ss.dependency "React-Core/Default", version
  end

  s.subspec "RCTTextHeaders" do |ss|
    ss.source_files = 'react-native/Libraries/Text/*.h', 'react-native/Libraries/Text/BaseText/*.h', 'react-native/Libraries/Text/RawText/*.h', 'react-native/Libraries/Text/Text/*.h', 'react-native/Libraries/Text/TextInput/*.h', 'react-native/Libraries/Text/TextInput/Multiline/*.h', 'react-native/Libraries/Text/TextInput/Singleline/*.h', 'react-native/Libraries/Text/VirtualText/*.h'    
    ss.dependency "React-Core/Default"
  end

  # Add a subspec containing just the headers for each
  # pod that should live under <React/*.h>
  header_subspecs.each do |name, headers|
    s.subspec name do |ss|
      ss.source_files = headers      
      ss.dependency "React-Core/Default"
    end
  end

  s.dependency "RCT-Folly", folly_version
  s.dependency "React-cxxreact", version
  s.dependency "React-perflogger", version
  s.dependency "React-jsi", version
  s.dependency "React-jsiexecutor", version
  s.dependency "Yoga"
  s.dependency "glog"
end
