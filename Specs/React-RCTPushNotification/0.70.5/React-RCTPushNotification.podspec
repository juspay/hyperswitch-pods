# Copyright (c) Meta Platforms, Inc. and affiliates.
#
# This source code is licensed under the MIT license found in the
# LICENSE file in the root directory of this source tree.

require "json"

name = "React-RCTPushNotification"
version = "0.70.5"
source = { :http => "https://raw.githubusercontent.com/juspay/hyperswitch-pods/master/SourceFiles/#{name}/#{version}/#{name}.zip" }

folly_compiler_flags = '-DFOLLY_NO_CONFIG -DFOLLY_MOBILE=1 -DFOLLY_USE_LIBCPP=1 -Wno-comma -Wno-shorten-64-to-32'
folly_version = '2021.07.22.00'

Pod::Spec.new do |s|
  s.name                   = "React-RCTPushNotification"
  s.version                = version
  s.summary                = "A library for handling push notifications for your app, including permission handling and icon badge number."
  s.homepage               = "https://reactnative.dev/"
  s.documentation_url      = "https://reactnative.dev/docs/pushnotificationios"
  s.license                = "MIT"
  s.author                 = "Facebook, Inc. and its affiliates"
  s.platforms              = { :ios => "12.4" }
  s.compiler_flags         = folly_compiler_flags + ' -Wno-nullability-completeness'
  s.source                 = source
  s.source_files           = "react-native/Libraries/PushNotificationIOS/*.{m,mm}"
  s.preserve_paths         = "react-native/package.json", "react-native/LICENSE", "react-native/LICENSE-docs"
  s.header_dir             = "RCTPushNotification"
  s.header_mappings_dir    = "react-native/Libraries/PushNotificationIOS"

  s.pod_target_xcconfig    = {
                               "USE_HEADERMAP" => "YES",
                               "CLANG_CXX_LANGUAGE_STANDARD" => "c++17",
                               "HEADER_SEARCH_PATHS" => "\"$(PODS_ROOT)/RCT-Folly\" \"${PODS_ROOT}/Headers/Public/React-Codegen/react/renderer/components\" \"${PODS_CONFIGURATION_BUILD_DIR}/React-Codegen/React_Codegen.framework/Headers\""
                             }
  s.framework              = "UserNotifications"

  s.dependency "React-Codegen", version
  s.dependency "RCTTypeSafety", version
  s.dependency "React-Core/RCTPushNotificationHeaders", version
  s.dependency "ReactCommon/turbomodule/core", version
  s.dependency "React-jsi", version
end
