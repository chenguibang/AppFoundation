//
//  NSString+GBSize.m
//  AppFoundation
//
//  Created by chenguibang on 2017/7/24.
//  Copyright © 2017年 chengb. All rights reserved.
//

#import "NSString+GBSize.h"

@implementation NSString(GBSize)


+ (CGSize)gb_sizeWithString:(NSString*)str andFont:(UIFont*)font  andMaxSize:(CGSize)size{
    NSDictionary*attrs =@{NSFontAttributeName: font};
    return  [str boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs  context:nil].size;
    
}

+ (NSString*)gb_nullCheck:(NSString *)string{
    return string ? string : @"";
}
@end
