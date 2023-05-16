# Copyright (c) Meta Platforms, Inc. and affiliates.
#
# This source code is licensed under the MIT license found in the
# LICENSE file in the root directory of this source tree.

require "json"

name = "RCTTypeSafety"
version = "0.70.5"
source = { :http => "https://raw.githubusercontent.com/juspay/hyperswitch-pods/master/SourceFiles/#{name}/#{version}/#{name}.zip" }

Pod::Spec.new do |s|
  s.name                   = "RCTTypeSafety"
  s.version                = version
  s.summary                = "-"  # TODO
  s.homepage               = "https://reactnative.dev/"
  s.license                = "MIT"
  s.author                 = "Facebook, Inc. and its affiliates"
  s.platforms              = { :ios => "12.4" }
  s.source                 = source
  s.source_files           = "react-native/Libraries/TypeSafety/*.{c,h,m,mm,cpp}"
  s.header_dir             = "RCTTypeSafety"
  s.header_mappings_dir    = "react-native/Libraries/TypeSafety"

  s.pod_target_xcconfig    = {
                               "USE_HEADERMAP" => "YES",
                               "CLANG_CXX_LANGUAGE_STANDARD" => "c++17",
                               "HEADER_SEARCH_PATHS" => "\"$(PODS_TARGET_SRCROOT)/Libraries/TypeSafety\""
                             }

  s.dependency "FBLazyVector", version
  s.dependency "RCTRequired", version
  s.dependency "React-Core", version
end
