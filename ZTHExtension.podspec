Pod::Spec.new do |s|

  s.name         = "ZTHExtension"
  s.version      = "1.4.1"
  s.summary      = "常用类的扩展， 方便开发 ！"

  s.homepage     = "https://github.com/huangluloveTing/ZTExtension.git"
  s.license      = 'MIT'
  s.author       = { "Lucky Huang" => "583699255@qq.com" }
  s.platform     = :ios, "8.0"
  s.ios.deployment_target = "8.0"
  s.source       = { :git => "https://github.com/huangluloveTing/ZTExtension.git", :tag => s.version}
 
  s.requires_arc = true
 
  s.resources = "ZTExtension/HZExtension/*.bundle"
  s.resources = 'ZTExtension/ZTPlayer/ZQPlayerImage.bundle'


  # HTTP
  s.subspec 'Extension' do |ex|
    ex.source_files = 'ZTExtension/HZExtension/**.*' 
    ex.dependency 'MBProgressHUD', '~> 1.0.0'

  end

  # toast
  s.subspec 'Toast' do |toast|
    toast.source_files = 'ZTExtension/toast/**.*'
    toast.dependency 'ZTHExtension/Extension'
    toast.dependency 'SDWebImage'
    toast.dependency 'SDWebImage/GIF'

  end

  # pictureScanner
  s.subspec 'PictureScanner' do |ps|
    ps.source_files = 'ZTExtension/Pictures/**.*'
    ps.dependency 'ZTHExtension/Extension'
    ps.dependency 'SDWebImage'
    ps.dependency 'SDWebImage/GIF'

  end
  # encry
  s.subspec 'ZTEncryUtil' do |ps|
    ps.source_files = 'ZTExtension/EncryUtil/**.*'

  end

  # pictureScanner
  s.subspec 'ZTTableView' do |table|
    table.source_files = 'ZTExtension/ZTTableView/**.*'
    table.dependency 'ZTHExtension/Extension'
    table.dependency 'MJRefresh'

  end

    # pictureScanner
  s.subspec 'ZTLoopScrollView' do |ls|
    ls.source_files = 'ZTExtension/ZTLoopScrollView/**.*'
    ls.dependency 'SDWebImage'
    ls.dependency 'YYText'

  end

    # player
  s.subspec 'ZTPlayer' do |pl|
    pl.source_files = 'ZTExtension/ZTPlayer/**.*'
    pl.dependency 'Masonry'
    pl.dependency 'AVFoundation'

  end

  # 提交命令
   # 语法验证
   # pod spec lint ZTHExtension.podspec --use-libraries --allow-warnings --verbose
   # 提交 
   # pod trunk push ZTHExtension.podspec --use-libraries --allow-warnings --verbose

end
