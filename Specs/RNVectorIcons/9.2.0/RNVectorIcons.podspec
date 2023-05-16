
name = "RNVectorIcons"
version = "9.2.0"
source = { :http => "https://raw.githubusercontent.com/juspay/hyperswitch-pods/master/SourceFiles/#{name}/#{version}/#{name}.zip" }

Pod::Spec.new do |s|

  s.name           = "RNVectorIcons"
  s.version        = "9.2.0"
  s.summary        = "Customizable Icons for React Native with support for NavBar/TabBar, image source and full styling."
  s.homepage       = "https://github.com/oblador/react-native-vector-icons"
  s.license        = "MIT"
  s.author         = { "Joel Arvidsson" => "joel@oblador.se" }
  s.platforms      = { :ios => "9.0", :tvos => "9.0" }
  s.source         = source
  s.source_files   = 'react-native-vector-icons/RNVectorIconsManager/*.{h,m}'
  s.resources      = "react-native-vector-icons/Fonts/*.ttf"
  s.preserve_paths = "react-native-vector-icons/*.js", "react-native-vector-icons/bin/*.js", "react-native-vector-icons/dist/*.js", "react-native-vector-icons/dist/lib/*.js", "react-native-vector-icons/lib/*.js"
  s.dependency 'React-Core'

end
