//
//  APPManager.m
//  TDE
//
//  Created by ceo on 2017/7/7.
//  Copyright © 2017年 chengb. All rights reserved.
//

#import "APPManager.h"
#import <Bugly/Bugly.h>
#import <RongIMKit/RongIMKit.h>
#import <RongIMLib/RongIMLib.h>
#import <ShareSDK/ShareSDK.h>
#import <ShareSDKConnector/ShareSDKConnector.h>
#import <WXApi.h>
#import <WeiboSDK.h>
#import <TencentOpenAPI/TencentOAuth.h>
#import <TencentOpenAPI/QQApiInterface.h>
#import "GBSSDKSharePlatform.h"
//新浪微博SDK需要在项目Build Settings中的Other Linker Flags添加”-ObjC”


@implementation APPManager

+ (instancetype)shared{
    static dispatch_once_t onceToken;
    static APPManager *shareInstance = nil;
    dispatch_once(&onceToken, ^{
        shareInstance = [[APPManager alloc]init];
    });
    return shareInstance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (APPTheme *)theme{
    if (!_theme) {
        _theme = [[APPTheme alloc]init];
    }
    return _theme;
}


+ (void)setupRCIM{
    
    
    
    
    
    [[RCIM sharedRCIM] initWithAppKey:@"kj7swf8okhqd2"];
    
    [[RCIM sharedRCIM] connectWithToken:@"iAoMk9BPhj6Qq+JiG5aYZ9gTW3GNsXsX94DeGjEswCnOSbn5Are/jb8E2cb3X3n4kU5SQgla0tBl2+PIFDRnyQ==" success:^(NSString *userId) {
        NSLog(@"登陆成功。当前登录的用户ID：%@", userId);
    } error:^(RCConnectErrorCode status) {
        NSLog(@"登陆的错误码为:%ld", (long)status);
    } tokenIncorrect:^{
        NSLog(@"token错误");
    }];
     
     

}

+ (void)setupShareWith:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
    /**初始化ShareSDK应用
     @param activePlatforms
     使用的分享平台集合
     @param importHandler (onImport)
     导入回调处理，当某个平台的功能需要依赖原平台提供的SDK支持时，需要在此方法中对原平台SDK进行导入操作
     @param configurationHandler (onConfiguration)
     配置回调处理，在此方法中根据设置的platformType来填充应用配置信息
     */
    [ShareSDK registerActivePlatforms:@[
                                        
                                        @(SSDKPlatformTypeWechat),
                                        @(SSDKPlatformTypeQQ),
                                        @(SSDKPlatformSubTypeQZone),
                                        @(SSDKPlatformTypeSinaWeibo),
                                        @(SSDKPlatformTypeMail),
                                        @(SSDKPlatformTypeSMS),
                                        @(SSDKPlatformTypeCopy),
                                        @(SSDKPlatformSubTypeWechatTimeline),
                                        @(GBSSDKSharePlatformSafari)
                                        ]
                             onImport:^(SSDKPlatformType platformType)
     {
         switch (platformType)
         {
             case SSDKPlatformTypeQQ:
                 [ShareSDKConnector connectQQ:[QQApiInterface class] tencentOAuthClass:[TencentOAuth class]];
                 break;
             case SSDKPlatformTypeWechat:
                 [ShareSDKConnector connectWeChat:[WXApi class]];
                 break;
             case SSDKPlatformTypeSinaWeibo:
                 [ShareSDKConnector connectWeibo:[WeiboSDK class]];
                 break;
                 
             case SSDKPlatformTypeMail:
                 
                 break;
             default:
                 break;
         }
     }
                      onConfiguration:^(SSDKPlatformType platformType, NSMutableDictionary *appInfo)
     {
         switch (platformType)
         {
                 
                 
                 
             case SSDKPlatformTypeWechat:
                 [appInfo SSDKSetupWeChatByAppId:@"wx4868b35061f87885"
                                       appSecret:@"64020361b8ec4c99936c0e3999a9f249"];
                
                 break;
             case SSDKPlatformTypeSinaWeibo:
                 //设置新浪微博应用信息,其中authType设置为使用SSO＋Web形式授权
                 
    
                 
                 [appInfo SSDKSetupSinaWeiboByAppKey:@"809026182"
                                           appSecret:@"ef1b6a7b051aae31370f1db5caeecbd4"
                                         redirectUri:@"http://www.baidu.com"
                                            authType:SSDKAuthTypeBoth];
                 break;
                 
             case SSDKPlatformTypeQQ:
                 [appInfo SSDKSetupQQByAppId:@"1105417847"
                                      appKey:@"iOgPgVrZv7BKQR8S"
                                    authType:SSDKAuthTypeBoth];
                 break;
             default:
                 break;
         }
     }];
     

}


+ (void)yt_setupShareWith:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
    /**初始化ShareSDK应用
     @param activePlatforms
     使用的分享平台集合
     @param importHandler (onImport)
     导入回调处理，当某个平台的功能需要依赖原平台提供的SDK支持时，需要在此方法中对原平台SDK进行导入操作
     @param configurationHandler (onConfiguration)
     配置回调处理，在此方法中根据设置的platformType来填充应用配置信息
     */
    [ShareSDK registerActivePlatforms:@[
                                        
                                        @(SSDKPlatformTypeWechat),
//                                        @(SSDKPlatformTypeQQ),
//                                        @(SSDKPlatformSubTypeQZone),
//                                        @(SSDKPlatformTypeSinaWeibo),
                                        @(SSDKPlatformTypeMail),
                                        @(SSDKPlatformTypeSMS),
                                        @(SSDKPlatformTypeCopy),
                                        @(SSDKPlatformSubTypeWechatTimeline),
                                        @(GBSSDKSharePlatformSafari)
                                        ]
                             onImport:^(SSDKPlatformType platformType)
     {
         switch (platformType)
         {
             case SSDKPlatformTypeQQ:
                 [ShareSDKConnector connectQQ:[QQApiInterface class] tencentOAuthClass:[TencentOAuth class]];
                 break;
             case SSDKPlatformTypeWechat:
                 [ShareSDKConnector connectWeChat:[WXApi class]];
                 break;
             case SSDKPlatformTypeSinaWeibo:
                 [ShareSDKConnector connectWeibo:[WeiboSDK class]];
                 break;
                 
             case SSDKPlatformTypeMail:
                 
                 break;
             default:
                 break;
         }
     }
                      onConfiguration:^(SSDKPlatformType platformType, NSMutableDictionary *appInfo)
     {
         switch (platformType)
         {
                 
                 
                 
             case SSDKPlatformTypeWechat:
                 [appInfo SSDKSetupWeChatByAppId:@"wx32f4cc92a6c9cac5"
                                       appSecret:@"364f008d1ee5b43e6ab2ae7d96336125"];
                 
                 break;
             case SSDKPlatformTypeSinaWeibo:
                 //设置新浪微博应用信息,其中authType设置为使用SSO＋Web形式授权
                 
                 
                 
                 [appInfo SSDKSetupSinaWeiboByAppKey:@"809026182"
                                           appSecret:@"ef1b6a7b051aae31370f1db5caeecbd4"
                                         redirectUri:@"http://www.baidu.com"
                                            authType:SSDKAuthTypeBoth];
                 break;
                 
             case SSDKPlatformTypeQQ:
                 [appInfo SSDKSetupQQByAppId:@"1105417847"
                                      appKey:@"iOgPgVrZv7BKQR8S"
                                    authType:SSDKAuthTypeBoth];
                 break;
             default:
                 break;
         }
     }];
    
    
}


+ (void)setupBugly{
    [Bugly startWithAppId:@"i1400036145"];
}


@end
