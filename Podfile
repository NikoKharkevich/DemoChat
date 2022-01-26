# Uncomment the next line to define a global platform for your project
platform :ios, '15.2'

# Instead of specifying a deployment target in pod post install, you can delete the pod deployment target for each pod, which causes the deployment target to be inherited from the Podfile.
  post_install do |installer|
    installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings.delete 'IPHONEOS_DEPLOYMENT_TARGET'
      end
    end
  end

target 'DemoChat' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  
  # Switch off warnings from pod frameworks
inhibit_all_warnings!
  
  # Pods for DemoChat
pod 'Firebase/Analytics'
pod 'Firebase/Auth'
pod 'Firebase/Firestore'
pod 'GoogleSignIn'
pod 'Firebase/Storage'

end
