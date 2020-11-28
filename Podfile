
source 'https://github.com/CocoaPods/Specs.git'     #官方仓库地址

platform :ios,'8.0'
use_frameworks!


def pods_for_sogoureader

  #pod 'Masonry', '~> 1.0.2'
  pod 'NerdyUI', '~> 1.1.0'
  pod 'MBProgressHUD', '~> 1.2.0'
  #pod 'YYModel', '~> 1.0.4'
  #pod 'BlocksKit', '~> 2.2.5'
  #pod 'SDWebImage', '4.4.7'
  
end

target 'accompany' do
  pods_for_sogoureader
end



post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['ENABLE_BITCODE'] = 'NO'
    end
  end
end
