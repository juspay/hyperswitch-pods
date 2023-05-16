# Copyright (c) Meta Platforms, Inc. and affiliates.
#
# This source code is licensed under the MIT license found in the
# LICENSE file in the root directory of this source tree.

require "json"

name = "React-RCTActionSheet"
version = "0.70.5"
source = { :http => "https://raw.githubusercontent.com/juspay/hyperswitch-pods/master/SourceFiles/#{name}/#{version}/#{name}.zip" }

Pod::Spec.new do |s|
  s.name                   = "React-RCTActionSheet"
  s.version                = version
  s.summary                = "An API for displaying iOS action sheets and share sheets."
  s.homepage               = "https://reactnative.dev/"
  s.documentation_url      = "https://reactnative.dev/docs/actionsheetios"
  s.license                = "MIT"
  s.author                 = "Facebook, Inc. and its affiliates"
  s.platforms              = { :ios => "12.4" }
  s.source                 = source
  s.source_files           = "react-native/Libraries/ActionSheetIOS/*.{m}"
  s.preserve_paths         = "react-native/package.json", "react-native/LICENSE", "react-native/LICENSE-docs"
  s.header_dir             = "RCTActionSheet"
  s.header_mappings_dir    = "react-native/Libraries/ActionSheetIOS"

  s.dependency "React-Core/RCTActionSheetHeaders", version
end
