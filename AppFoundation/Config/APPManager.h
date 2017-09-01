//
//  APPManager.h
//  TDE
//
//  Created by ceo on 2017/7/7.
//  Copyright © 2017年 chengb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "APPTheme.h"









@interface APPManager : NSObject
@property (nonatomic, strong) APPTheme *theme;

+ (instancetype)shared;



/**
 设置融云
 */
+ (void)setupRCIM;


+ (void)setupShareWith:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions;


+ (void)yt_setupShareWith:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions;


+ (void)setupBugly;

@end
