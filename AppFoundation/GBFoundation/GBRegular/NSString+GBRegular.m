//
//  NSString+GBRegular.m
//  TDE
//
//  Created by ceo on 2017/7/11.
//  Copyright © 2017年 chengb. All rights reserved.
//

#import "NSString+GBRegular.h"
#import "GBRegular.h"
@implementation NSString(GBRegular)


- (NSString *)checkPhone{
    return [GBRegular checkPhoneNumber:self];
}

- (BOOL) checkEmail{
    return [GBRegular checkEmail:self];
}
@end
