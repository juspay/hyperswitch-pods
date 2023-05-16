
Pod::Spec.new do |s|
  s.name         = "react-native-klarna-inapp-sdk"
  s.version      = "2.1.10"
  s.summary      = "This library wraps Klarna’s In-App SDK and exposes its functionality as React Native components. It currently supports Klarna Payments via a Payment View component."
  s.description  = <<-DESC
                  react-native-klarna-inapp-sdk
                   DESC
  s.homepage     = "https://github.com/klarna/react-native-klarna-inapp-sdk"
  s.license      = "MIT"
  s.authors      = { "Your Name" => "yourname@email.com" }
  s.platform     = :ios, "12.0"
  s.source       = { :git => "https://github.com/klarna/react-native-klarna-inapp-sdk.git", :tag => "v#{s.version}" }

  s.source_files = "ios/Sources/**/*.{h,m}"
  s.requires_arc = true

  s.test_spec 'KlarnaInAppSDKTests' do |test_spec|
    test_spec.source_files = 'ios/Tests/**/*.{h,m}'
    test_spec.dependency 'OCMock'
  end

  s.dependency "React"
  s.dependency 'KlarnaMobileSDK', '2.4.1'

end
