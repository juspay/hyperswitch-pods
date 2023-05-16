
name = "RNCMaskedView"
version = "0.1.11"
source = { :http => "https://raw.githubusercontent.com/juspay/hyperswitch-pods/master/SourceFiles/#{name}/#{version}/#{name}.zip" }

Pod::Spec.new do |s|
  s.name         = "RNCMaskedView"
  s.version      = "0.1.11"
  s.summary      = 'description'
  s.license      = "MIT"

  s.authors      = 'author'
  s.homepage     = 'homepage'
  s.platforms    = { :ios => "12.4" }

  s.source        = source
  s.source_files  = "@react-native-community/masked-view/ios/*.{h,m}"

  s.dependency 'React'
end
