
Pod::Spec.new do |s|
  s.name         = "RNCPicker"
  s.version      = "2.4.8"
  s.summary      = "React Native Picker for iOS, Android, macOS, and Windows"
  s.license      = "MIT"

  s.authors      = ""
  s.homepage     = "https://github.com/react-native-picker/picker#readme"
  s.platforms    = { :ios => "9.0", :osx => "10.14" }

  s.source       = { :git => "https://github.com/react-native-picker/picker.git", :tag => "v#{s.version}" }
  s.ios.source_files  = "ios/**/*.{h,m}"
  s.osx.source_files  = "macos/**/*.{h,m}"

  
  s.dependency 'React-Core'
end
