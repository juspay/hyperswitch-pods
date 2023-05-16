name = "RNInAppBrowser"
version = "3.7.0"
source = { :http => "https://raw.githubusercontent.com/juspay/hyperswitch-pods/master/SourceFiles/#{name}/#{version}/#{name}.zip" }

Pod::Spec.new do |s|
  s.name           = "RNInAppBrowser"
  s.version        = "3.7.0"
  s.summary        = "InAppBrowser for React Native"
  s.license        = "MIT"
  s.author         = { "author" => "email" }
  s.homepage       = "https://github.com/proyecto26/react-native-inappbrowser"
  s.source         = source
  s.requires_arc   = true
  s.platform       = :ios, '9.0'
  s.source_files   = 'react-native-inappbrowser/ios/**/*.{h,m}'
  s.dependency "React-Core"

end