# Copyright (c) Meta Platforms, Inc. and affiliates.
#
# This source code is licensed under the MIT license found in the
# LICENSE file in the root directory of this source tree.

require "json"

name = "React-RCTText"
version = "0.70.5"
source = { :http => "https://raw.githubusercontent.com/juspay/hyperswitch-pods/master/SourceFiles/#{name}/#{version}/#{name}.zip" }

Pod::Spec.new do |s|
  s.name                   = "React-RCTText"
  s.version                = version
  s.summary                = "A React component for displaying text."
  s.homepage               = "https://reactnative.dev/"
  s.documentation_url      = "https://reactnative.dev/docs/text"
  s.license                = "MIT"
  s.author                 = "Facebook, Inc. and its affiliates"
  s.platforms              = { :ios => "12.4" }
  s.source                 = source
  s.source_files           = "react-native/Libraries/Text/*.{h,m}", "react-native/Libraries/Text/BaseText/*.{h,m}", "react-native/Libraries/Text/RawText/*.{h,m}", "react-native/Libraries/Text/Text/*.{h,m}", "react-native/Libraries/Text/TextInput/*.{h,m}", "react-native/Libraries/Text/TextInput/Multiline/*.{h,m}","react-native/Libraries/Text/TextInput/Singleline/*.{h,m}", "react-native/Libraries/Text/VirtualText/*.{h,m}"
  s.preserve_paths         = "react-native/package.json", "react-native/LICENSE", "react-native/LICENSE-docs"
  s.header_dir             = "RCTText"
  s.header_mappings_dir    = "react-native/Libraries/Text"

  s.dependency "React-Core/RCTTextHeaders", version
end
