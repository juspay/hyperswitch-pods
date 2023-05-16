# Copyright (c) Meta Platforms, Inc. and affiliates.
#
# This source code is licensed under the MIT license found in the
# LICENSE file in the root directory of this source tree.

require "json"

name = "ReactCommon"
version = "0.70.5"
source = { :http => "https://raw.githubusercontent.com/juspay/hyperswitch-pods/master/SourceFiles/#{name}/#{version}/#{name}.zip" }

folly_compiler_flags = '-DFOLLY_NO_CONFIG -DFOLLY_MOBILE=1 -DFOLLY_USE_LIBCPP=1 -Wno-comma -Wno-shorten-64-to-32'
folly_version = '2021.07.22.00'
boost_compiler_flags = '-Wno-documentation'

Pod::Spec.new do |s|
  s.name                   = "ReactCommon"
  s.module_name            = "ReactCommon"
  s.version                = version
  s.summary                = "-"  # TODO
  s.homepage               = "https://reactnative.dev/"
  s.license                = "MIT"
  s.author                 = "Facebook, Inc. and its affiliates"
  s.platforms              = { :ios => "12.4" }
  s.source                 = source
  s.header_dir             = "ReactCommon" # Use global header_dir for all subspecs for use_frameworks! compatibility
  s.compiler_flags         = folly_compiler_flags + ' ' + boost_compiler_flags
  s.pod_target_xcconfig    = { "HEADER_SEARCH_PATHS" => "\"$(PODS_ROOT)/boost\" \"$(PODS_ROOT)/RCT-Folly\" \"$(PODS_ROOT)/DoubleConversion\" \"$(PODS_ROOT)/Headers/Private/React-Core\" \"$(PODS_ROOT)/Headers/Private/React-bridging/react/bridging\" \"$(PODS_CONFIGURATION_BUILD_DIR)/React-bridging/react_bridging.framework/Headers\"",
                               "USE_HEADERMAP" => "YES",
                               "CLANG_CXX_LANGUAGE_STANDARD" => "c++17" }

  # TODO (T48588859): Restructure this target to align with dir structure: "react/nativemodule/..."
  # Note: Update this only when ready to minimize breaking changes.
  s.subspec "turbomodule" do |ss|
    ss.dependency "React-bridging", version
    ss.dependency "React-callinvoker", version
    ss.dependency "React-perflogger", version
    ss.dependency "React-Core", version
    ss.dependency "React-cxxreact", version
    ss.dependency "React-jsi", version
    ss.dependency "RCT-Folly", folly_version
    s.dependency "React-logger", version
    ss.dependency "DoubleConversion"
    ss.dependency "glog"

    ss.subspec "core" do |sss|
      sss.source_files = "react-native/ReactCommon/react/nativemodule/core/ReactCommon/*.{cpp,h}",
                         "react-native/ReactCommon/react/nativemodule/core/platform/ios/*.{mm,cpp,h}"
    end

    s.subspec "react_debug_core" do |sss|
        sss.source_files = "react-native/ReactCommon/react/debug/*.{cpp,h}"
    end

    ss.subspec "samples" do |sss|
      sss.source_files = "react-native/ReactCommon/react/nativemodule/samples/ReactCommon/*.{cpp,h}",
                         "react-native/ReactCommon/react/nativemodule/samples/platform/ios/*.{mm,cpp,h}"
      sss.dependency "ReactCommon/turbomodule/core", version
    end
  end
end
