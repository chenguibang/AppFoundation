//
//  AppClient.h
//  TDE
//
//  Created by ceo on 2017/7/13.
//  Copyright © 2017年 chengb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserInfo.h"
@interface AppClient : NSObject
@property (nonatomic ,strong) NSArray<AppClient*> *userInfos; //!< 历史登录过的用户


+ (instancetype)shared;

/**
 注册

 @param name name description
 @param passwd passwd description

 */
- (void)regisetWith:(NSString *)name passwd:(NSString *)passwd;


/**
 登录

 @param name 用户名
 @param passwd 密码
 */
- (void) loginWith:(NSString *)name
            passwd:(NSString *)passwd;


/**
 退出登录 ,退出登录时候应该将相应的 用户信息清除，推送用用相关信息清除，融云聊天相关信息清除
 */
- (void) logout;


/**
 获取当前用户
 @return return value description
 */
- (UserInfo *)getCurrentUserInfo;




@end
