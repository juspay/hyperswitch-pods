require 'json'

name = "RNCAsyncStorage"
version = "1.17.10"
source = { :http => "https://raw.githubusercontent.com/juspay/hyperswitch-pods/master/SourceFiles/#{name}/#{version}/#{name}.zip" }

Pod::Spec.new do |s|
  s.name         = "RNCAsyncStorage"
  s.version      = "1.17.10"
  s.summary      = 'description'
  s.license      = "MIT"

  s.authors      = 'author'
  s.homepage     = 'homepage'
  s.platforms    = { :ios => "9.0", :tvos => "9.2", :osx => "10.14" }

  s.source        = source
  s.source_files  = "@react-native-async-storage/async-storage/ios/*.{h,m}"

  s.dependency 'React-Core'
end
