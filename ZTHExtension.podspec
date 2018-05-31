Pod::Spec.new do |s|

  s.name         = "ZTHExtension"
  s.version      = "1.2.0"
  s.summary      = "常用类的扩展， 方便开发 ！"

  s.homepage     = "https://github.com/huangluloveTing/ZTExtension.git"
  s.license      = 'MIT'
  s.author       = { "Lucky Huang" => "583699255@qq.com" }
  s.platform     = :ios, "8.0"
  s.ios.deployment_target = "8.0"
  s.source       = { :git => "https://github.com/huangluloveTing/ZTExtension.git", :tag => s.version}
 
  s.requires_arc = true
 
  s.resources = "ZTExtension/HZExtension/*.bundle"


  # HTTP
  s.subspec 'Extension' do |ex|
    ex.source_files = 'ZTExtension/HZExtension/**.*' 
    ex.dependency 'MBProgressHUD', '~> 1.0.0'

  end

  # Serializer
  s.subspec 'Toast' do |toast|

    toast.source_files = 'ZTExtension/toast/**.*'
    toast.dependency 'ZTExtension/Extension'

  end

  # 提交命令
   # 语法验证
   # pod spec lint ZTHExtension.podspec --use-libraries --allow-warnings --verbose
   # 提交 
   # pod trunk push ZTHExtension.podspec --use-libraries --allow-warnings --verbose

end
