//
//  UserInfo.h
//  TDE
//
//  Created by ceo on 2017/7/13.
//  Copyright © 2017年 chengb. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    UserSexMan,
    UserSexwoman,
    UserSexUnkonwn,
} UserSex;


@interface UserInfo : NSObject

@property (nonatomic, copy) NSString *token;

@property (nonatomic, copy) NSString *userId;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *headerImage;

@property (nonatomic, copy) NSString *age;

@property (nonatomic, assign) UserSex sex;
@end
