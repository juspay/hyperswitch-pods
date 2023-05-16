
### CocoaPods hosting for Hyperswitch iOS SDK


Add this line to your Podfile:

```ruby
source 'https://github.com/juspay/hyperswitch-pods.git'
source 'https://cdn.cocoapods.org/'

pod 'hyperswitch', '1.0.0-alpha01'
```

Run the following command:

```ruby
pod install
```

Troubleshooting: Base64 and JWT might throw an error which can be fixed by changing their ios deployment target.

