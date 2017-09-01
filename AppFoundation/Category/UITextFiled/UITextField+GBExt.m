//
//  UITextField+GBExt.m
//  AppFoundation
//
//  Created by chenguibang on 2017/7/31.
//  Copyright © 2017年 chengb. All rights reserved.
//

#import "UITextField+GBExt.h"

@implementation UITextField(GBExt)

- (void)setInsets:(UIEdgeInsets)padding{
    [self setValue:[NSNumber numberWithInt:padding.top] forKey:@"paddingTop"];
    [self setValue:[NSNumber numberWithInt:padding.left] forKey:@"paddingLeft"];
    [self setValue:[NSNumber numberWithInt:padding.bottom] forKey:@"paddingBottom"];
    [self setValue:[NSNumber numberWithInt:padding.right] forKey:@"paddingRight"];
    
}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
