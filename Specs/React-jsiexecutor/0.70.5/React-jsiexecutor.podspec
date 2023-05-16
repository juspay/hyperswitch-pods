# Copyright (c) Meta Platforms, Inc. and affiliates.
#
# This source code is licensed under the MIT license found in the
# LICENSE file in the root directory of this source tree.

require "json"

name = "React-jsiexecutor"
version = "0.70.5"
source = { :http => "https://raw.githubusercontent.com/juspay/hyperswitch-pods/master/SourceFiles/#{name}/#{version}/#{name}.zip" }

folly_compiler_flags = '-DFOLLY_NO_CONFIG -DFOLLY_MOBILE=1 -DFOLLY_USE_LIBCPP=1 -Wno-comma -Wno-shorten-64-to-32'
folly_version = '2021.07.22.00'
boost_compiler_flags = '-Wno-documentation'

Pod::Spec.new do |s|
  s.name                   = "React-jsiexecutor"
  s.version                = version
  s.summary                = "-"  # TODO
  s.homepage               = "https://reactnative.dev/"
  s.license                = "MIT"
  s.author                 = "Facebook, Inc. and its affiliates"
  s.platforms              = { :ios => "12.4" }
  s.source                 = source
  s.source_files           = "react-native/ReactCommon/jsiexecutor/jsireact/*.{cpp,h}"
  s.compiler_flags         = folly_compiler_flags + ' ' + boost_compiler_flags
  s.pod_target_xcconfig    = { "HEADER_SEARCH_PATHS" => "\"$(PODS_ROOT)/boost\" \"$(PODS_ROOT)/RCT-Folly\" \"$(PODS_ROOT)/DoubleConversion\"" }
  s.header_dir             = "jsireact"
  s.header_mappings_dir    = "react-native/ReactCommon/jsiexecutor/jsireact"

  s.dependency "React-cxxreact", version
  s.dependency "React-jsi", version
  s.dependency "React-perflogger", version
  s.dependency "RCT-Folly", folly_version
  s.dependency "DoubleConversion"
  s.dependency "glog"
end
