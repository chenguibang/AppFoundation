#
#  Be sure to run `pod spec lint AppFoundation.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #

  s.name         = "AppFoundation"
  s.version      = "1.0.6"
  s.summary      = "AppFoundation. for quik development "

  # This description is used to generate tags and improve search results.
  #   * Think: What does it do? Why did you write it? What is the focus?
  #   * Try to keep it short, snappy and to the point.
  #   * Write the description between the DESC delimiters below.
  #   * Finally, don't worry about the indent, CocoaPods strips it!
  s.description  = <<-DESC
AppFoundation. for quik development AppFoundation. for quik development
                   DESC

  s.homepage     = "https://github.com/chenguibang/AppFoundation.git"
  # s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"


  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Licensing your code is important. See http://choosealicense.com for more info.
  #  CocoaPods will detect a license file if there is a named LICENSE*
  #  Popular ones are 'MIT', 'BSD' and 'Apache License, Version 2.0'.
  #

  #s.license      = "MIT"
   s.license      = { :type => "MIT", :file => "FILE_LICENSE" }



  # ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Specify the authors of the library, with email addresses. Email addresses
  #  of the authors are extracted from the SCM log. E.g. $ git log. CocoaPods also
  #  accepts just a name if you'd rather not provide an email address.
  #
  #  Specify a social_media_url where others can refer to, for example a twitter
  #  profile URL.
  #

  s.author             = { "flyBGG" => "735356384@qq.com" }
  # Or just: s.author    = "flyBGG"
  # s.authors            = { "flyBGG" => "735356384@qq.com" }
  # s.social_media_url   = "http://twitter.com/flyBGG"

  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If this Pod runs only on iOS or OS X, then specify the platform and
  #  the deployment target. You can optionally include the target after the platform.
  #

  # s.platform     = :ios
  s.platform     = :ios, "8.0"

  #  When using multiple platforms
  # s.ios.deployment_target = "5.0"
  # s.osx.deployment_target = "10.7"
  # s.watchos.deployment_target = "2.0"
  # s.tvos.deployment_target = "9.0"


  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Specify the location from where the source should be retrieved.
  #  Supports git, hg, bzr, svn and HTTP.
  #

  s.source       = { :git => "https://github.com/chenguibang/AppFoundation.git", :tag => "#{s.version}" }


  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  CocoaPods is smart about how it includes source code. For source files
  #  giving a folder will include any swift, h, m, mm, c & cpp files.
  #  For header files it will include any header in the folder.
  #  Not including the public_header_files will make all headers public.
  #

  s.source_files  = "AppFoundation", "AppFoundation/**/*.{h,m}"
  #s.exclude_files = "Classes/Exclude"

  # s.public_header_files = "Classes/**/*.h"


  # ――― Resources ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  A list of resources included with the Pod. These are copied into the
  #  target bundle with a build phase script. Anything else will be cleaned.
  #  You can preserve files from being cleaned, please don't preserve
  #  non-essential files like tests, examples and documentation.
  #

  #s.resource  = "AppFoundation/**/*.xib"
   s.resources = "AppFoundation/**/*.xib", "AppFoundation/Resource/Media.xcassets/**/*.png","AppFoundation/**/*.bundle"

  # s.preserve_paths = "FilesToSave", "MoreFilesToSave"


  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Link your library with frameworks, or libraries. Libraries do not include
  #  the lib prefix of their name.
  #

  # s.framework  = "UIKit"
  # s.frameworks = "UIKit", "RongIMKit", "ShareSDK", "SinaWeiboConnector", "ShareSDKConnector", "ShareSDKConfigFile", "CopyConnector", "QQConnector", "MOBFoundation", "TencentOpenAPI", "WechatConnector", "ShareSDKUI", "SMSConnector", "MailConnector", "ShareSDK", "ShareSDKExtension"
  s.frameworks = "UIKit", "Foundation"
  s.ios.vendored_frameworks = "AppFoundation/**/*.framework"
  s.ios.vendored_libraries = "AppFoundation/**/*.a"
  #s.vendored_frameworks = "ShareSDK.framework"



  # s.library   = "iconv"
  # s.libraries = "iconv", "xml2"


  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If your library depends on compiler flags you can set them in the xcconfig hash
  #  where they will only apply to your library. If you depend on other Podspecs
  #  you can include multiple dependencies to ensure it works.

  s.requires_arc = true

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.dependency "JSONKit", "~> 1.4"
        
        s.dependency 'FMDB'                     #sqlite
        s.dependency 'SVProgressHUD'           #菊花
        s.dependency 'YBPopupMenu'            #弹出菜单
        s.dependency 'IQKeyboardManager'        #键盘
        s.dependency 'MJExtension'             #模型转换
        s.dependency 'pop'                                   #动画库
        s.dependency 'Masonry'
        s.dependency 'TZImagePickerController'  #照片选择器
        s.dependency 'ScottAlertController'     #弹窗控制器
        s.dependency 'MJRefresh'               #上拉下拉刷新
        s.dependency 'RefreshControl'          #上拉下拉刷新
        s.dependency 'CYLTableViewPlaceHolder'   #占位视图
        s.dependency 'WebViewJavascriptBridge'   #JS库
        s.dependency 'UIButton-SSEdgeInsets'     #按钮上下左右
        #pod 'UIButton+HHAddLayout', '~> 0.0.1'      #按钮上下左右
        s.dependency 'LBXScan'                   #二维码扫描
        
        #时间管理
        #pod 'NSDate+Calendar', '~> 0.0.9'
        s.dependency 'NSDate-Escort'
        #pod 'NSDate_Utils', '~> 1.0.6'
        
        
        
        #    s.dependency 'VOVCManager'                           #页面路由
        s.dependency 'RKNotificationHub'                     #红点提示1
        #pod 'WZLBadge'                             #红点提示2
        s.dependency 'KVOController'
        s.dependency 'VIPhotoView'                           #图片浏览View
        s.dependency 'SDCycleScrollView'                     #图片轮播
        
        s.dependency 'MBProgressHUD'
        s.dependency 'JKCategories'
        s.dependency 'ReactiveObjC'
        s.dependency 'DBCorner'
        s.dependency 'ZYCornerRadius'
        s.dependency 'UIImage+Additions'
        s.dependency 'UITextField+Max'      #UITextField 长度限制
        s.dependency 'AFNetworking'
        s.dependency 'RestKit'
        s.dependency 'AliyunOSSiOS'             #阿里云OOS
        s.dependency 'BlocksKit'
        s.dependency 'UITableView+FDTemplateLayoutCell'
        s.dependency 'YYKit'
        #    s.dependency 'ZJScrollPageView', '~> 0.4.0' #标签
        s.dependency 'QrcodeBuilder'
        
        s.dependency 'GPUImage'
        s.dependency 'KYGooeyMenu'
        s.dependency 'XMLDictionary'
        s.dependency 'FCFileManager'


        s.dependency 'Bugly'                                 #日志记录
        #IM
        s.dependency 'RongCloudIM/IMLib'
        s.dependency 'RongCloudIM/IMKit'
        
        
        # 主模块(必须)
        s.dependency 'mob_sharesdk'
        
        # UI模块(非必须，需要用到ShareSDK提供的分享菜单栏和分享编辑页面需要以下1行)
        s.dependency 'mob_sharesdk/ShareSDKUI'
        
        # 平台SDK模块(对照一下平台，需要的加上。如果只需要QQ、微信、新浪微博，只需要以下3行)
        s.dependency 'mob_sharesdk/ShareSDKPlatforms/QQ'
        s.dependency 'mob_sharesdk/ShareSDKPlatforms/SinaWeibo'
        s.dependency 'mob_sharesdk/ShareSDKPlatforms/WeChat'   #（微信sdk不带支付的命令）
        # s.dependency 'mob_sharesdk/ShareSDKPlatforms/WeChatFull' #（微信sdk带支付的命令，和上面不带支付的不能共存，只能选择一个）
        
        # ShareSDKPlatforms模块其他平台，按需添加
        # 如果需要的平台没有对应的平台语句，有2种情况——1、不需要添加这个平台的语句，如Twitter就是这个情况。2、ShareSDK暂时不支持此平台。
        s.dependency 'mob_sharesdk/ShareSDKPlatforms/RenRen'
        s.dependency 'mob_sharesdk/ShareSDKPlatforms/AliPaySocial'
        s.dependency 'mob_sharesdk/ShareSDKPlatforms/Kakao'
        s.dependency 'mob_sharesdk/ShareSDKPlatforms/Yixin'
        s.dependency 'mob_sharesdk/ShareSDKPlatforms/Facebook'
        s.dependency 'mob_sharesdk/ShareSDKPlatforms/Copy'
        s.dependency 'mob_sharesdk/ShareSDKPlatforms/Evernote'
        s.dependency 'mob_sharesdk/ShareSDKPlatforms/GooglePlus'
        s.dependency 'mob_sharesdk/ShareSDKPlatforms/Instagram'
        s.dependency 'mob_sharesdk/ShareSDKPlatforms/Instapaper'
        s.dependency 'mob_sharesdk/ShareSDKPlatforms/Line'
        s.dependency 'mob_sharesdk/ShareSDKPlatforms/Mail'
        s.dependency 'mob_sharesdk/ShareSDKPlatforms/SMS'
        s.dependency 'mob_sharesdk/ShareSDKPlatforms/WhatsApp'
        s.dependency 'mob_sharesdk/ShareSDKPlatforms/MeiPai'
        s.dependency 'mob_sharesdk/ShareSDKPlatforms/DingTalk'
        s.dependency 'mob_sharesdk/ShareSDKPlatforms/YouTube'
        s.dependency 'mob_sharesdk/ShareSDKPlatforms/Twitter'
        s.dependency 'mob_sharesdk/ShareSDKPlatforms/Dropbox'
        
        # 使用配置文件分享模块（非必需）
        #pod 'mob_sharesdk/ShareSDKConfigurationFile'
        
        # 扩展模块（在调用可以弹出我们UI分享方法的时候是必需的）
        s.dependency 'mob_sharesdk/ShareSDKExtension'
s.prefix_header_contents = <<-EOS
#ifdef __OBJC__

#import "Header.h"



#endif /* __OBJC__*/
EOS


end
