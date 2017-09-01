//
//  NSString+GBSize.h
//  AppFoundation
//
//  Created by chenguibang on 2017/7/24.
//  Copyright © 2017年 chengb. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString(GBSize)

+ (CGSize)gb_sizeWithString:(NSString*)str andFont:(UIFont*)font  andMaxSize:(CGSize)size;

+ (NSString*)gb_nullCheck:(NSString *)string;
@end
