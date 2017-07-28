//
//  AppClient.m
//  TDE
//
//  Created by ceo on 2017/7/13.
//  Copyright © 2017年 chengb. All rights reserved.
//

#import "AppClient.h"

@implementation AppClient

+ (instancetype)shared{
    
    return nil;
}

/**
 注册
 
 @param name name description
 @param passwd passwd description
 
 */
- (void)regisetWith:(NSString *)name passwd:(NSString *)passwd{
    
}


/**
 登录
 
 @param name 用户名
 @param passwd 密码
 */
- (void) loginWith:(NSString *)name
            passwd:(NSString *)passwd{
    
}


/**
 退出登录 ,退出登录时候应该将相应的 用户信息清除，推送用用相关信息清除，融云聊天相关信息清除
 */
- (void) logout{
    
}


/**
 获取当前用户
 @return return value description
 */
- (UserInfo *)getCurrentUserInfo{
    return nil;
}
@end
