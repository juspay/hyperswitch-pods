# Copyright (c) Meta Platforms, Inc. and affiliates.
#
# This source code is licensed under the MIT license found in the
# LICENSE file in the root directory of this source tree.

require "json"

# react_native_path = "../.."
# require_relative "#{react_native_path}/scripts/react_native_pods.rb"

name = "FBReactNativeSpec"
version = "0.70.5"
source = { :http => "https://raw.githubusercontent.com/juspay/hyperswitch-pods/master/SourceFiles/#{name}/#{version}/#{name}.zip" }

folly_compiler_flags = '-DFOLLY_NO_CONFIG -DFOLLY_MOBILE=1 -DFOLLY_USE_LIBCPP=1 -Wno-comma -Wno-shorten-64-to-32'
folly_version = '2021.07.22.00'

Pod::Spec.new do |s|
  s.name                   = "FBReactNativeSpec"
  s.version                = version
  s.summary                = "-"  # TODO
  s.homepage               = "https://reactnative.dev/"
  s.license                = "MIT"
  s.author                 = "Facebook, Inc. and its affiliates"
  s.platforms              = { :ios => "12.4" }
  s.compiler_flags         = folly_compiler_flags + ' -Wno-nullability-completeness'
  s.source                 = source
  # This podspec is used to trigger the codegen, and built files are generated in a different location.
  # We don't want this pod to actually include any files.
  s.header_dir             = "FBReactNativeSpec"

  s.pod_target_xcconfig    = {
                               "USE_HEADERMAP" => "YES",
                               "CLANG_CXX_LANGUAGE_STANDARD" => "c++17",
                               "HEADER_SEARCH_PATHS" => "\"$(PODS_ROOT)/RCT-Folly\""
                             }

  s.dependency "RCT-Folly", folly_version
  s.dependency "RCTRequired", version
  s.dependency "RCTTypeSafety", version
  s.dependency "React-Core", version
  s.dependency "React-jsi", version
  s.dependency "ReactCommon/turbomodule/core", version

  # use_react_native_codegen!(s, {
  #   :react_native_path => react_native_path,
  #   :js_srcs_dir => "#{react_native_path}/Libraries",
  #   :library_name => "FBReactNativeSpec",
  #   :library_type => "modules",
  # })
end
