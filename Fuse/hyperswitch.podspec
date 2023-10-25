name = "hyperswitch"
version = "1.0.0-alpha01"
source = { :http => "https://github.com/juspay/hyperswitch-pods/raw/master/Fuse/hyperswitch.zip" }

Pod::Spec.new do |s|
    s.name         = "hyperswitch"
    s.version      = version
    s.summary      = "The core of Hyperswitch."
    s.homepage     = "https://hyperswitch.io/"
    s.license      = "MIT"
    s.author       = { "Shivam" => "shivam.shashank@juspay.in" }
    s.platforms    = { :ios => "12.4" }
    s.source = source

    s.source_files = "hyperswitch/**/*.{m,swift,h}"

    s.public_header_files = ["hyper-Bridging-Header.h"]

    s.pod_target_xcconfig = { 'ONLY_ACTIVE_ARCH' => 'YES' }

    s.exclude_files = 'hyperswitch/**/ios-arm64_x86_64-simulator/HEADERS/*.h'

    s.resources = ["hyperswitch/**/Codepush.plist", "hyperswitch/**/Resources/hyperswitch.bundle"]

    s.dependency "FBLazyVector"
    s.dependency "FBReactNativeSpec"
    s.dependency "RCTRequired"
    s.dependency "RCTTypeSafety"
    s.dependency "React"
    s.dependency "React-Core"
    s.dependency "React-CoreModules"
    s.dependency "React-RCTActionSheet"
    s.dependency "React-RCTAnimation"
    s.dependency "React-RCTBlob"
    s.dependency "React-RCTImage"
    s.dependency "React-RCTLinking"
    s.dependency "React-RCTNetwork"
    s.dependency "React-RCTSettings"
    s.dependency "React-RCTText"
    s.dependency "React-RCTVibration"
    s.dependency "React-Core/RCTWebSocket"
    s.dependency "React-cxxreact"
    s.dependency "React-jsi"
    s.dependency "React-jsiexecutor"
    s.dependency "React-jsinspector"
    s.dependency "React-callinvoker"
    s.dependency "React-runtimeexecutor"
    s.dependency "React-perflogger"
    s.dependency "React-logger"
    s.dependency "ReactCommon/turbomodule/core"
    s.dependency "Yoga"
    s.dependency "DoubleConversion"
    s.dependency "glog"
    s.dependency "boost"
    s.dependency "RCT-Folly"
    s.dependency "React-Codegen"
    s.dependency 'CodePush'
    s.dependency 'RNGestureHandler'
    s.dependency 'RNInAppBrowser'
    s.dependency 'react-native-pager-view'
    s.dependency 'react-native-safe-area-context'
    s.dependency 'RNSVG'
    s.dependency 'RNScreens'
    s.dependency 'hermes-engine'
    s.dependency 'JWTDecode'
    s.dependency 'RNSentry'
    s.dependency 'React-NativeModulesApple'
    s.dependency 'React-RCTAppDelegate'
    s.dependency 'React-debug'
    s.dependency 'React-hermes'
    s.dependency 'React-rncore'
    s.dependency 'React-runtimescheduler'
    s.dependency 'React-utils'
    s.dependency 'Sentry'
    s.dependency 'SentryPrivate'
    s.dependency 'SocketRocket'
    s.dependency 'SwiftyRSA'
    s.dependency 'libevent'
  end
  