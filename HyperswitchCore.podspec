Pod::Spec.new do |s|
  s.name                      = 'HyperswitchCore'
  s.version                   = '2.1.9'
  s.summary                   = 'Hyperswitch Core'
  s.description               = 'Core of Hyperswitch SDK an open-source payments switch'
  s.homepage                  = 'https://github.com/juspay/hyperswitch-pods'
  s.author                    = 'Harshit S'
  s.license                   = { type: 'Apache-2.0', file: 'LICENSE' }
  s.platforms                 = { ios: '13.0' }
  s.source                    = {
    http: "https://github.com/juspay/hyperswitch-pods/raw/master/HyperswitchCore.tar.gz"
  }
  s.source_files = "hyperWrapper/**/*.{m,swift,h}"
  s.resources = ["hyperWrapper/Resources/Codepush.plist", "hyperWrapper/Resources/hyperswitch.bundle"]
  s.vendored_frameworks  = 'Frameworks/**/*.xcframework'
  s.dependency 'Hyperswitch-Hermes'
end
