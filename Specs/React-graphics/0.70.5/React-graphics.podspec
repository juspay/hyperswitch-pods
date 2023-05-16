# Copyright (c) Meta Platforms, Inc. and affiliates.
#
# This source code is licensed under the MIT license found in the
# LICENSE file in the root directory of this source tree.

require "json"

name = "React-graphics"
version = "0.70.5"
source = { :http => "https://raw.githubusercontent.com/juspay/hyperswitch-pods/master/SourceFiles/#{name}/#{version}/#{name}.zip" }

folly_compiler_flags = '-DFOLLY_NO_CONFIG -DFOLLY_MOBILE=1 -DFOLLY_USE_LIBCPP=1 -Wno-comma -Wno-shorten-64-to-32'
folly_version = '2021.07.22.00'
boost_compiler_flags = '-Wno-documentation'

Pod::Spec.new do |s|
  s.name                   = "React-graphics"
  s.version                = version
  s.summary                = "Fabric for React Native."
  s.homepage               = "https://reactnative.dev/"
  s.license                = "MIT"
  s.author                 = "Facebook, Inc. and its affiliates"
  s.platforms              = { :ios => "12.4", :tvos => "12.4" }
  s.source                 = source
  s.compiler_flags         = folly_compiler_flags + ' ' + boost_compiler_flags
  s.source_files           = "react-native/ReactCommon/react/renderer/graphics/*.{m,mm,cpp,h}", "react-native/ReactCommon/react/renderer/graphics/platform/cxx/react/renderer/graphics/*.{m,mm,cpp,h}", "react-native/ReactCommon/react/renderer/graphics/platform/ios/*.{m,mm,cpp,h}"
  s.exclude_files          = "tests",
                             "platform/android",
                             "platform/cxx"
  s.header_dir             = "react/renderer/graphics"
  s.header_mappings_dir    = "react-native/ReactCommon/react/renderer/graphics"

  s.pod_target_xcconfig  = { "USE_HEADERMAP" => "NO", "HEADER_SEARCH_PATHS" => "\"$(PODS_ROOT)/boost\" \"$(PODS_TARGET_SRCROOT)/../../../\" \"$(PODS_ROOT)/RCT-Folly\"" }

  s.dependency "RCT-Folly/Fabric", folly_version
  s.dependency "React-Core/Default", version
end
