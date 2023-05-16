name = "CodePush"
version = "7.0.5"
source = { :http => "https://raw.githubusercontent.com/juspay/hyperswitch-pods/master/SourceFiles/#{name}/#{version}/#{name}.zip" }

Pod::Spec.new do |s|
  s.name           = 'CodePush'
  s.version        = "7.0.5"
  s.summary        = 'description'
  s.author         = 'author'
  s.license        = "MIT"
  s.homepage       = 'homepage'
  s.source       = source
  s.ios.deployment_target = '9.0'
  s.tvos.deployment_target = '9.0'
  s.platform     = :ios, "12.0"
  s.preserve_paths = 'react-native-code-push/*.js'
  s.library        = 'z'
  s.source_files = 'react-native-code-push/ios/CodePush/*.{h,m}'
  s.public_header_files = ['react-native-code-push/ios/CodePush/CodePush.h']

  # Note: Even though there are copy/pasted versions of some of these dependencies in the repo, 
  # we explicitly let CocoaPods pull in the versions below so all dependencies are resolved and 
  # linked properly at a parent workspace level.
  s.dependency 'React-Core'
  s.dependency 'SSZipArchive', '~> 2.2.2'
  s.dependency 'JWT', '~> 3.0.0-beta.12'
  s.dependency 'Base64', '~> 1.1'
end
