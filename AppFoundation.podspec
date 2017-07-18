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
  s.version      = "0.0.1"
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

  # s.resource  = "icon.png"
  # s.resources = "Resources/*.png"

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

  s.dependency "LBXScan", "~> 2.2" 
s.dependency 'FMDB', '~> 2.6.2'
s.dependency 'SVProgressHUD', '~> 2.1.2'
s.dependency 'YBPopupMenu', '~> 0.1.2' 
s.dependency 'IQKeyboardManager', '~> 4.0.9'
s.dependency 'MJExtension', '~> 3.0.13'
s.dependency 'pop' 
s.dependency 'Masonry', '~> 1.0.2'
s.dependency 'TZImagePickerController', '~> 1.8.1'
s.dependency 'ScottAlertController', '~> 0.1.0'
s.dependency 'MJRefresh', '~> 3.1.12'
s.dependency 'RefreshControl', '~> 2.0.5'
s.dependency 'CYLTableViewPlaceHolder', '~> 1.0.8'
s.dependency 'WebViewJavascriptBridge', '~> 6.0.2'
s.dependency 'UIButton-SSEdgeInsets', '~> 0.1.7'
s.dependency 'UIButton+HHAddLayout', '~> 0.0.1'
s.dependency 'NSDate-Escort', '~> 1.8.2'
s.dependency 'RongCloudIM/IMLib', '~> 2.8.3'
s.dependency 'RongCloudIM/IMKit', '~> 2.8.3'
s.dependency 'RKNotificationHub'
s.dependency 'KVOController'
s.dependency 'VIPhotoView'
s.dependency 'SDCycleScrollView'








s.prefix_header_contents = <<-EOS
#ifdef __OBJC__



#pragma mark - 头文件导入
#import "Header.h"


#pragma mark - 通知
#define NOTI_HOMEVCSHOW @"NOTI_HOMEVCSHOW"







#pragma mark - ------------------
#pragma mark - 通用与工具App无关,通用
#pragma mark - ------------------

#pragma mark - 版本相关
#define kAppVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]


#pragma mark - 设备
#define SCREEN_WIDTH   [UIScreen mainScreen].bounds.size.width
#define SCREENH_HEIGHT [UIScreen mainScreen].bounds.size.height

#pragma mark - 颜色
#define UIColorWithRGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define UIColorWithRGB(r,g,b) UIColorWithRGBA(r,g,b,1.0f)
#define UIColorWithString(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define UIColorWithRandom [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1]

#pragma mark - 日志
#ifdef DEBUG
#define NSLog(...) NSLog(@"%s 第%d行 \n %@\n\n",__func__,__LINE__,[NSString stringWithFormat:__VA_ARGS__])
#else
#define NSLog(...)
#endif

#pragma mark - 弱引用/强引用
#define WeakSelf(type)  __weak typeof(type) weak##type = type;
#define StrongSelf(type)  __strong typeof(type) type = weak##type;

#pragma mark - XIB
#define XIB(name) [[NSBundle mainBundle] loadNibNamed:name owner:nil options:nil][0]
#define XIBController(name) [[UIViewController alloc] initWithNibName:name bundle:nil]


#pragma mark - 图片
#define UIImageWithNamed(_pointer) [UIImage imageNamed:_pointer]




#endif /* __OBJC__*/
EOS


end
