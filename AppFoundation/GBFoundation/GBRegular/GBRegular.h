//
//  GBRegular.h
//  TDE
//
//  Created by ceo on 2017/7/11.
//  Copyright © 2017年 chengb. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GBRegular : NSObject

/**
 验证手机号码

 @param phone 手机号码
 @return 运营商 CM-中国移动 CU-中国联通 CT-中国电信 PHS-固话小灵通
 */
+ (NSString *)checkPhoneNumber:(NSString *)phone;

/**
 校验邮箱

 @param email 邮箱
 @return 邮箱是否正确
 */
+ (BOOL) checkEmail:(NSString *)email;


/**
 校验网址

 @param url 网址
 @return 结果
 */
+ (BOOL)checkUrl:(NSString *)url;


@end
