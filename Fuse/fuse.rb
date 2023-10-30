def HyperswitchSDK()
    
    require 'open-uri'
    require 'json'
    require 'fileutils'
    
    remote_file_url = 'https://raw.githubusercontent.com/juspay/hyperswitch-pods/master/Fuse/package.json'
    remote_file_url2 = 'https://raw.githubusercontent.com/juspay/hyperswitch-pods/master/Fuse/package-lock.json'
    local_file_path = '../package.json'
    local_file_path2 = '../package-lock.json'
    current_directory = Dir.pwd
    system("cd .. && rm -rf node_modules package.json package-lock.json")
    
    directory_path = File.join(current_directory, "build")
    podfile_path = File.join(current_directory, "Podfile")
    
    if File.exist?(directory_path)
        system('current_directory')
        system('rm -rf build')
    end
    
    File.open(local_file_path, 'wb') do |file|
        file.write(URI.open(remote_file_url).read)
    end
    File.open(local_file_path2, 'wb') do |file|
        file.write(URI.open(remote_file_url2).read)
    end
    system('npm set-script prepare ""')
    system('npm i')
    
    require_relative 'node_modules/react-native/scripts/react_native_pods'
    require_relative 'node_modules/@react-native-community/cli-platform-ios/native_modules'

    platform :ios, min_ios_version_supported
    system('export COCOAPODS_DISABLE_DETERMINISTIC_UUIDS=YES')
    ReactNativePodsUtils.create_xcode_env_if_missing
    
    linkage = ENV['USE_FRAMEWORKS']
    if linkage != nil
        Pod::UI.puts "Configuring Pod with #{linkage}ally linked Frameworks".green
        use_frameworks! :linkage => linkage.to_sym
    end
    
    pod 'hyperswitch', :podspec => 'https://raw.githubusercontent.com/juspay/hyperswitch-pods/master/Fuse/hyperswitch.podspec'
    config = use_native_modules!
    
    flags = get_default_flags()
    
    use_react_native!(
                      :ios_folder => current_directory,
                      :path => config[:reactNativePath],
                      :hermes_enabled => flags[:hermes_enabled],
                      :fabric_enabled => false,
                      :app_path => "#{Pod::Config.instance.installation_root}/.."
                      )
                      at_exit do
                         system("cd .. && rm -rf package.json package-lock.json")
                      end
                      
end

