# Copyright (c) Meta Platforms, Inc. and affiliates.
#
# This source code is licensed under the MIT license found in the
# LICENSE file in the root directory of this source tree.

require "json"

name = "React-rncore"
version = "0.70.5"
source = { :http => "https://raw.githubusercontent.com/juspay/hyperswitch-pods/master/SourceFiles/#{name}/#{version}/#{name}.zip" }

react_native_path = ".."

Pod::Spec.new do |s|
  s.name                   = "React-rncore"
  s.version                = version
  s.summary                = "Fabric for React Native."
  s.homepage               = "https://reactnative.dev/"
  s.license                = "MIT"
  s.author                 = "Facebook, Inc. and its affiliates"
  s.platforms              = { :ios => "12.4" }
  s.source                 = source
  s.source_files           = "dummyFile.cpp"
  s.pod_target_xcconfig = { "USE_HEADERMAP" => "YES",
                            "CLANG_CXX_LANGUAGE_STANDARD" => "c++17" }


  # use_react_native_codegen!(s, {
  #   :react_native_path => react_native_path,
  #   :js_srcs_dir => "#{react_native_path}/Libraries",
  #   :library_name => "rncore",
  #   :library_type => "components",
  # })
end
